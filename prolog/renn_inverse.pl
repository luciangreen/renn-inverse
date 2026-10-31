/*  renn_inverse.pl -- find a RENN network's input from its output, and read the
    network back as exact rules.

    RENN (github.com/luciangreen/renn) writes a dense network as Prolog facts:
    layer/6 in architecture.pl and weights/3, biases/3 in weights.pl. This module
    reads ONLY those facts (as data, with read_term; it never runs RENN's code) and
    offers three methods, chosen per network:

      exact      every layer is linear or relu. Each relu is on (s >= 0) or off
                 (s =< 0), so the net is linear inside each on/off pattern. All
                 arithmetic is in exact rationals (CLP(Q)). The answer is every
                 polytope of inputs that gives the output.

      exact-last as exact, but the LAST layer may be sigmoid, tanh or softmax.
                 These are invertible, so the target output fixes the last
                 layer's pre-activation: sigmoid and tanh give one value per unit
                 (logit / atanh), softmax gives the logits up to a common constant
                 (s_i - s_1 = ln(y_i / y_1)), which is still linear. The only
                 rounding is in the float log of the target.

      certified  any mix of linear, relu, tanh, sigmoid, softmax, in any layer.
                 Branch and bound with interval arithmetic: a box of inputs is
                 dropped only when its output interval provably misses the target
                 (within Tol); the boxes kept therefore contain EVERY solution.
                 A witness point inside a kept box is then refined and checked.

    Main predicates
      load_model(+Dir, -Model)        read <Dir>/architecture.pl and weights.pl
      method(+Model, -Method)         exact | exact_last | certified
      forward(+Model, +X, -Y)         this module's own forward pass (floats)
      invert(+Model, +Y, +Box, +Opts, -Answer)
            Box = Lo-Hi (the same range for every input)
            Answer = regions(Rs)  (exact, exact_last; Rs = [region(Pattern, Constraints, Witness)])
                   | boxes(Bs, Witnesses)   (certified)
      rules(+Model, +Box, -Rules)     exact if-then rules, one per feasible relu pattern
      class_rules(+Model, +Box, -Rules)   for a softmax classifier: class(C) rules
      superposition(+Model, +Box, -Report) which relu units serve more than one class
      split_units(+Model, +Box, -Clauses)  one predicate per (unit, class): the
                                       polysemantic units separated by class
*/
:- module(renn_inverse,
          [ load_model/2, method/2, forward/3, invert/5, rules/3, class_rules/3,
            superposition/3, split_units/3, in_region/2, in_boxes/2 ]).
:- use_module(library(clpq)).
:- use_module(library(lists)).
:- use_module(library(apply)).
:- use_module(library(yall)).

:- dynamic m_layer/5.            % m_layer(Model, Index, Act, Weights, Bias)

% ---------------------------------------------------------------- loading (data only)
load_model(Dir, Model) :-
    atom_concat(Dir, '/architecture.pl', AF), atom_concat(Dir, '/weights.pl', WF),
    read_terms(AF, ATs), read_terms(WF, WTs),
    once(member(layer(Model, 1, _, _, _, _), ATs)),
    retractall(m_layer(Model, _, _, _, _)),
    forall(member(layer(Model, I, _, _, _, Act), ATs),
           ( memberchk(weights(Model, I, W), WTs), memberchk(biases(Model, I, B), WTs),
             assertz(m_layer(Model, I, Act, W, B)) )).

read_terms(File, Ts) :-
    setup_call_cleanup(open(File, read, S), read_all(S, Ts), close(S)).
read_all(S, Ts) :-
    read_term(S, T, []),
    (   T == end_of_file -> Ts = []
    ;   T = (:- _) -> read_all(S, Ts)
    ;   Ts = [T|R], read_all(S, R)
    ).

layers(Model, Ls) :- findall(I-Act-W-B, m_layer(Model, I, Act, W, B), L0), msort(L0, Ls).
input_size(Model, N) :- m_layer(Model, 1, _, [Row|_], _), length(Row, N).

method(Model, M) :-
    layers(Model, Ls), append(Front, [_-Last-_-_], Ls),
    (   forall(member(_-A-_-_, Ls), pl(A)) -> M = exact
    ;   forall(member(_-A-_-_, Front), pl(A)), memberchk(Last, [sigmoid, tanh, softmax]) -> M = exact_last
    ;   M = certified
    ).
pl(linear). pl(relu).

% ---------------------------------------------------------------- float forward pass
forward(Model, X, Y) :- layers(Model, Ls), foldl(fwd_layer, Ls, X, Y).
fwd_layer(_-Act-W-B, X, Y) :- maplist({X}/[Row, Bi, S]>>(dot(Row, X, Bi, S)), W, B, Ss), act_f(Act, Ss, Y).
dot([], [], S, S).
dot([W|Ws], [X|Xs], A, S) :- A1 is A + W*X, dot(Ws, Xs, A1, S).
act_f(softmax, Ss, Ys) :- !, max_list(Ss, M), maplist({M}/[S, E]>>(E is exp(S - M)), Ss, Es),
    sum_list(Es, T), maplist({T}/[E, Y]>>(Y is E / T), Es, Ys).
act_f(A, Ss, Ys) :- maplist(act1(A), Ss, Ys).
act1(linear, S, S).
act1(relu, S, Y) :- Y is max(0.0, S).
act1(tanh, S, Y) :- Y is tanh(S).
act1(sigmoid, S, Y) :- ( S >= 0 -> Y is 1/(1+exp(-S)) ; E is exp(S), Y is E/(1+E) ).

% ---------------------------------------------------------------- exact (CLP(Q)) part
q(F, Q) :- Q is rationalize(F).

% sym(+Layers, +In, -Out, -Pattern): piecewise-linear layers over CLP(Q) variables
sym([], X, X, []).
sym([_-Act-W-B|Ls], X, Y, [P|Ps]) :-
    maplist(sym_unit(Act, X), W, B, Mid, P),
    sym(Ls, Mid, Y, Ps).
sym_unit(Act, X, Row, Bias, Y, C) :- lin(Row, X, Bias, S), sym_act(Act, S, Y, C).
lin(Row, X, Bias, S) :- q(Bias, QB), foldl([W, Xi, A0, A]>>(q(W, QW), A = A0 + QW*Xi), Row, X, QB, E), { S = E }.
sym_act(linear, S, S, lin).
sym_act(relu, S, Y, on)  :- { S >= 0, Y = S }.
sym_act(relu, S, Y, off) :- { S =< 0, Y = 0 }.

box(Lo-Hi, Xs) :- q(Lo, L), q(Hi, H), maplist({L, H}/[X]>>({X >= L, X =< H}), Xs).

invert(Model, Target, Box, Opts, Answer) :-
    method(Model, M),
    (   M == certified
    ->  certified(Model, Target, Box, Opts, Answer)
    ;   option_(tol(Tol), Opts, 1.0e-9),
        exact_invert(Model, M, Target, Box, Tol, Answer)
    ).

% a target that came out of float arithmetic is only known to ~1e-16; with two or more
% outputs an exact equality can then be inconsistent (e.g. y2 = 2*y1 + c up to rounding),
% so every output is matched within Tol * max(1, |y|)
near_q(Tol, Y, T) :- E is Tol*max(1.0, abs(T)), q(T, QT), q(E, QE), { Y >= QT - QE, Y =< QT + QE }.

exact_invert(Model, M, Target, Box, Tol, regions(Rs)) :-
    input_size(Model, N), layers(Model, Ls),
    findall(region(Pattern, Cons, Witness),
            ( length(Xs, N), box(Box, Xs),
              (   M == exact
              ->  sym(Ls, Xs, Ys, Pattern), maplist(near_q(Tol), Ys, Target)
              ;   append(Front, [_-Last-W-B], Ls),
                  sym(Front, Xs, Hs, P0),
                  maplist(lin_row(Hs), W, B, Ss),
                  last_preimage(Last, Tol, Ss, Target), append(P0, [Last], Pattern)
              ),
              region_constraints(Xs, Cons),
              witness(Xs, Witness) ),
            Rs).
lin_row(Hs, Row, Bias, S) :- lin(Row, Hs, Bias, S).

% the target fixes the pre-activation of an invertible last layer
% the pre-activation interval that maps into [y - e, y + e], e = Tol*max(1,|y|), for a
% monotone last activation (sigmoid, tanh); softmax: s_i - s_1 lies between the logs of
% the extreme ratios
last_preimage(sigmoid, Tol, Ss, Ys) :- maplist({Tol}/[S, Y]>>(pre_iv(logit, Tol, Y, L, H), {S >= L, S =< H}), Ss, Ys).
last_preimage(tanh, Tol, Ss, Ys)    :- maplist({Tol}/[S, Y]>>(pre_iv(atanh, Tol, Y, L, H), {S >= L, S =< H}), Ss, Ys).
% probabilities are matched RELATIVELY (e = Tol*y): an absolute band would let a tiny
% probability such as 1e-12 range over [0, 1e-9] and the logits over a huge interval
last_preimage(softmax, Tol, [S1|Ss], [Y1|Ys]) :-
    Y1 > 0, E1 is Tol*Y1, Y1L is Y1 - E1, Y1H is Y1 + E1,
    maplist({S1, Y1L, Y1H, Tol}/[S, Y]>>( Y > 0, E is Tol*Y, YL is Y - E, YH is Y + E,
                                         DL is log(YL/Y1H), DH is log(YH/Y1L), q(DL, QL), q(DH, QH),
                                         { S - S1 >= QL, S - S1 =< QH } ), Ss, Ys).
% the band is relative to the distance from the saturation ends, for the same reason
pre_iv(F, Tol, Y, QL, QH) :-
    lim(F, Lo0, Hi0), E is Tol*min(Y - Lo0, Hi0 - Y), E > 0,
    YL is max(Lo0, Y - E), YH is min(Hi0, Y + E), YL < YH,
    inv(F, YL, L), inv(F, YH, H), q(L, QL), q(H, QH).
lim(logit, 0.0, 1.0).
lim(atanh, -1.0, 1.0).
inv(logit, Y, L) :- L is log(Y/(1-Y)).
inv(atanh, Y, L) :- L is atanh(Y).

region_constraints(Xs, Cons) :-
    length(Xs, N), numlist(1, N, Is), maplist([I, V]>>format(atom(V), 'x~w', [I]), Is, Names),
    safe_dump(Xs, Names, Cons).

% a point inside the region: fix each input in turn to the middle of its remaining range
witness([], []).
witness([X|Xs], [V|Vs]) :-
    ( inf(X, L) -> true ; L = -1000 ), ( sup(X, H) -> true ; H = 1000 ),
    M is (L + H) / 2, { X = M }, V is float(M), witness(Xs, Vs).

% in_region(+Point, +Constraints): the point satisfies the region (exactly, in Q)
in_region(P, Cons) :-
    length(P, N), numlist(1, N, Is),
    maplist([I, V, A-QV]>>(format(atom(A), 'x~w', [I]), q(V, QV)), Is, P, Map),
    \+ \+ ( maplist(subst_con(Map), Cons, Cs), maplist([C]>>({C}), Cs) ).
subst_con(Map, C0, C) :- C0 =.. [Op, L, R], subst_t(Map, L, L1), subst_t(Map, R, R1), C =.. [Op, L1, R1].
subst_t(Map, T, V) :- atom(T), memberchk(T-V, Map), !.
subst_t(Map, T, T1) :- compound(T), !, T =.. [F|As], maplist(subst_t(Map), As, Bs), T1 =.. [F|Bs].
subst_t(_, T, T).

% ---------------------------------------------------------------- exact rules
rules(Model, Box, Rules) :-
    method(Model, exact), input_size(Model, N), layers(Model, Ls),
    findall(rule(Pattern, Cons),
            ( length(Xs, N), box(Box, Xs), sym(Ls, Xs, Ys, Pattern),
              length(Ys, M), numlist(1, M, Js),
              maplist([J, Y, Yv]>>(format(atom(_), 'y~w', [J]), { Yv = Y }), Js, Ys, Yvs),
              append(Xs, Yvs, Vars),
              numlist(1, N, Is), maplist([I, A]>>format(atom(A), 'x~w', [I]), Is, XN),
              maplist([J, A]>>format(atom(A), 'y~w', [J]), Js, YN), append(XN, YN, Names),
              safe_dump(Vars, Names, Cons) ),
            Rules).

% ---------------------------------------------------------------- classifiers: rules per class
% Model = relu ... -> softmax. The class is the arg max of the logits, which is linear.
class_rules(Model, Box, Rules) :-
    layers(Model, Ls), append(Front, [_-softmax-W-B], Ls),
    forall(member(_-A-_-_, Front), pl(A)),
    input_size(Model, N), length(W, K), numlist(1, K, Ks),
    findall(class(C, Pattern, Cons),
            ( member(C, Ks), length(Xs, N), box(Box, Xs),
              sym(Front, Xs, Hs, Pattern), maplist(lin_row(Hs), W, B, Ss),
              nth1(C, Ss, SC),
              % not forall/2: it would undo the constraints it posts
              foldl({C, SC, Ss}/[J, _, _]>>( J == C -> true ; nth1(J, Ss, SJ), { SC >= SJ } ), Ks, Ks, _),
              numlist(1, N, Is), maplist([I, A]>>format(atom(A), 'x~w', [I]), Is, Names),
              safe_dump(Xs, Names, Cons) ),
            Rules).

% ---------------------------------------------------------------- superposition
% A first-layer relu unit is polysemantic over Box when it is on in regions of two
% or more different classes. (Deeper units are reported by their pattern position.)
superposition(Model, Box, Report) :-
    class_rules(Model, Box, Rules),
    findall(unit(L, U), ( member(class(_, P, _), Rules), nth1(L, P, LP), nth1(U, LP, _) ), Us0), sort(Us0, Us),
    findall(unit(L, U)-Classes,
            ( member(unit(L, U), Us),
              findall(C, ( member(class(C, P, _), Rules), nth1(L, P, LP), nth1(U, LP, on) ), C0), sort(C0, Classes) ),
            Report).

% split_units: separate a polysemantic unit into one predicate per class it serves:
%   unit_L_U_class_C(X1,..,Xn) :- constraints of a region of class C in which the unit is on.
split_units(Model, Box, Clauses) :-
    class_rules(Model, Box, Rules), input_size(Model, N),
    findall((Head :- Cons),
            ( member(class(C, P, Cons), Rules), nth1(L, P, LP), nth1(U, LP, on),
              format(atom(F), 'unit_~w_~w_class_~w', [L, U, C]),
              numlist(1, N, Is), maplist([I, A]>>format(atom(A), 'x~w', [I]), Is, Names),
              Head =.. [F|Names] ),
            Clauses).

% ---------------------------------------------------------------- certified (interval) inversion
% Options: tol(T) (default 1.0e-9), width(W) smallest box side (default 1/64 of the box),
% max_boxes(N) (default 200000).
certified(Model, Target, Lo-Hi, Opts, boxes(Kept, Witnesses)) :-
    option_(tol(Tol), Opts, 1.0e-9),
    D is (Hi - Lo) / 64, option_(width(Wd), Opts, D),
    option_(max_boxes(MaxB), Opts, 200000),
    input_size(Model, N), length(B0, N), maplist(=(Lo-Hi), B0),
    layers(Model, Ls),
    bb([B0], Ls, Target, Tol, Wd, MaxB, 0, [], Kept),
    % witnesses: refine from (at most) witnesses(K) kept boxes spread evenly through the list
    option_(witnesses(K), Opts, 30), length(Kept, NK),
    ( NK =:= 0 -> Picks = [] ; Stride is max(1, NK // K), findall(Bx, (nth0(I, Kept, Bx), I mod Stride =:= 0), Picks) ),
    findall(W, ( member(Bx, Picks), refine(Model, Target, Tol, Bx, W) ), W0),
    sort(W0, Witnesses).

option_(O, Opts, D) :- ( memberchk(O, Opts) -> true ; arg(1, O, D) ).

bb([], _, _, _, _, _, _, Kept, Kept).
bb([B|Q], Ls, T, Tol, Wd, MaxB, Seen, Acc, Kept) :-
    Seen1 is Seen + 1,
    ( Seen1 > MaxB -> throw(too_many_boxes(MaxB)) ; true ),
    (   \+ may_hit(Ls, B, T, Tol)
    ->  bb(Q, Ls, T, Tol, Wd, MaxB, Seen1, Acc, Kept)
    ;   widest(B, _, L-H), H - L =< Wd
    ->  bb(Q, Ls, T, Tol, Wd, MaxB, Seen1, [B|Acc], Kept)
    ;   widest(B, I, L-H), M is (L + H) / 2,
        replace_nth(I, B, L-M, B1), replace_nth(I, B, M-H, B2),
        bb([B1, B2|Q], Ls, T, Tol, Wd, MaxB, Seen1, Acc, Kept)
    ).

may_hit(Ls, Box, T, Tol) :-
    foldl(iv_layer, Ls, Box, Out),
    maplist({Tol}/[L-H, Y]>>(L =< Y + Tol, H >= Y - Tol), Out, T).

widest(B, I, Iv) :-
    findall(W-J-(L-H), ( nth1(J, B, L-H), W is H - L ), Ws), max_member(_-I-Iv, Ws).
replace_nth(1, [_|T], X, [X|T]) :- !.
replace_nth(N, [H|T], X, [H|T1]) :- N1 is N - 1, replace_nth(N1, T, X, T1).

% interval arithmetic, widened by a relative 1e-12 after every operation so float
% rounding (including libm's exp/tanh, accurate to ~1e-16) cannot make a bound unsound
widen(L-H, L1-H1) :- L1 is L - 1.0e-12*max(1.0, abs(L)), H1 is H + 1.0e-12*max(1.0, abs(H)).
iv_layer(_-Act-W-B, X, Y) :- maplist(iv_dot(X), W, B, Ss), iv_act(Act, Ss, Y).
iv_dot(X, Row, Bias, S) :-
    foldl([Wt, L-H, A0-B0, A-Bx]>>( P1 is Wt*L, P2 is Wt*H, A is A0 + min(P1, P2), Bx is B0 + max(P1, P2) ),
          Row, X, Bias-Bias, S0), widen(S0, S).
iv_act(softmax, Ss, Ys) :- !,
    findall(Y, ( nth1(I, Ss, LI-HI),
                 findall(E, ( nth1(J, Ss, _-HJ), J \== I, E is exp(HJ - LI) ), EsL), sum_list(EsL, SL),
                 findall(E, ( nth1(J, Ss, LJ-_), J \== I, E is exp(LJ - HI) ), EsH), sum_list(EsH, SH),
                 Lo is 1/(1 + SL), Hi is 1/(1 + SH), widen(Lo-Hi, Y) ), Ys).
iv_act(A, Ss, Ys) :- maplist({A}/[L-H, Y]>>(act1(A, L, L1), act1(A, H, H1), widen(L1-H1, Y)), Ss, Ys).

% a witness: start at the box centre, take damped Newton/least-squares steps on |f(x)-y|^2
% with a numerical Jacobian, clamp to the box, and accept only if forward/3 hits the target
refine(Model, T, Tol, Box, W) :-
    maplist([L-H, C]>>(C is (L + H)/2), Box, X0),
    newton(Model, T, Box, X0, 60, X),
    forward(Model, X, Y), maplist({Tol}/[A, B]>>(abs(A - B) =< Tol), Y, T),
    W = X.
newton(_, _, _, X, 0, X) :- !.
newton(Model, T, Box, X, K, Xn) :-
    forward(Model, X, Y), maplist([A, B, R]>>(R is A - B), Y, T, Rs),
    sum_list_sq(Rs, E),
    (   E < 1.0e-24 -> Xn = X
    ;   jac(Model, X, Y, J),
        % gradient step on the residual, scaled by Gauss-Newton for one output:
        % dx = - J^T r * (r.r) / |J^T r|^2 ... the minimum-norm step for each output
        transpose_(J, JT), maplist({Rs}/[Col, G]>>(dotp(Col, Rs, G)), JT, Gr),
        sum_list_sq(Gr, GG),
        (   GG < 1.0e-30 -> Xn = X
        ;   Step is E / GG,
            maplist({Step}/[Xi, Gi, L-H, Xo]>>(X1 is Xi - Step*Gi, Xo is max(L, min(H, X1))), X, Gr, Box, X2),
            K1 is K - 1, newton(Model, T, Box, X2, K1, Xn)
        )
    ).
jac(Model, X, Y, J) :-
    length(X, N), numlist(1, N, Is),
    findall(Row, ( member(I, Is), nth1(I, X, Xi), H is 1.0e-7*max(1.0, abs(Xi)), X1i is Xi + H,
                   replace_nth(I, X, X1i, X1), forward(Model, X1, Y1),
                   maplist({H}/[A, B, D]>>(D is (A - B)/H), Y1, Y, Row) ), Cols),
    transpose_(Cols, J).
sum_list_sq(L, S) :- foldl([X, A0, A]>>(A is A0 + X*X), L, 0.0, S).
dotp(A, B, S) :- foldl([X, Y, S0, S1]>>(S1 is S0 + X*Y), A, B, 0.0, S).
transpose_([], []).
transpose_([[]|_], []) :- !.
transpose_(M, [Col|Cols]) :- maplist([[H|T], H, T]>>true, M, Col, Rest), transpose_(Rest, Cols).

in_boxes(P, Boxes) :- member(B, Boxes), maplist([V, L-H]>>(V >= L, V =< H), P, B), !.

% near_in_region(+Point, +Constraints, +Eps): some point within Eps (max norm) of Point
% satisfies the region. Used because a target that came out of float arithmetic puts the
% true input on the region's equalities only up to rounding.
near_in_region(P, Cons, Eps) :-
    length(P, N), numlist(1, N, Is), q(Eps, QE),
    maplist([I, V, A-X]>>(format(atom(A), 'x~w', [I]), q(V, QV), {X >= QV - QE, X =< QV + QE}), Is, P, Map),
    \+ \+ ( maplist(subst_con(Map), Cons, Cs), maplist([C]>>({C}), Cs) ).

% solve_outputs(+Point, +N, +RuleConstraints, -Y): the outputs y1..ym a rule gives at Point
solve_outputs(P, N, Cons, Y) :-
    numlist(1, N, Is),
    maplist([I, V, A-QV]>>(format(atom(A), 'x~w', [I]), q(V, QV)), Is, P, XMap),
    findall(A, ( member(C, Cons), sub_term(A, C), atom(A), sub_atom(A, 0, 1, _, y) ), Ys0), sort(Ys0, YNames),
    length(YNames, M), length(YVs, M), pairs_keys_values(YMap, YNames, YVs),
    append(XMap, YMap, Map),
    maplist(subst_con(Map), Cons, Cs), maplist([C]>>({C}), Cs),
    maplist([V, F]>>(inf(V, L), sup(V, H), L =:= H, F is float(L)), YVs, Y).

% dump/3 needs unbound variables; one the constraints fixed to a number becomes Name = Value
safe_dump(Vars, Names, Cons) :-
    foldl([V, N, Fs-FNs-Eqs, Fs1-FNs1-Eqs1]>>( var(V) -> Fs1 = [V|Fs], FNs1 = [N|FNs], Eqs1 = Eqs
                                             ; Fs1 = Fs, FNs1 = FNs, Eqs1 = [N = V|Eqs] ),
          Vars, Names, []-[]-[], Fs-FNs-Eqs),
    dump(Fs, FNs, C0), append(C0, Eqs, Cons).
