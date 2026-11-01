/*  generate.pl -- 200 input/output pairs for renn-inverse, each produced by running the code
    on the seven RENN models (built by build_models.sh into build/). From the root:
        swipl -q -g main -t halt io_pairs/generate.pl
    writes io_pairs/pairs.jsonl and io_pairs/io_pairs.md. Points come from a fixed seed. */
:- prolog_load_context(directory, D), assertz(user:io_dir(D)), atom_concat(D, '/..', R0), absolute_file_name(R0, R), assertz(user:root(R)).
:- use_module(harness).
:- use_module(to_markdown).
:- use_module('../prolog/renn_inverse').
:- style_check(-singleton).

dir(M, D) :- root(R), atomic_list_concat([R, '/build/', M], D).
load(M) :- dir(M, D), load_model(D, M).
layers_text(M, T) :- dir(M, D), atom_concat(D, '/architecture.pl', F), read_file_to_terms(F, Ts, []),
    with_output_to(string(T), ( format("% RENN model ~w: layers (weights.pl holds the weights)~n", [M]),
                                forall(member(L, Ts), ( L = layer(_, _, _, _, _, _) -> portray_clause(L) ; true )) )).
width(M, W) :- renn_inverse:input_size(M, N), ( N =< 3 -> W = 0.2 ; W = 0.5 ).
r6(X, Y) :- Y is round(X * 1.0e6) / 1.0e6.

fwd(M, P) :- load(M), method(M, Me), forward(M, P, Y), maplist(r6, Y, Yr), format("method: ~w~nforward(~w) = ~w~n", [Me, P, Yr]).

inv(M, P) :-
    load(M), method(M, Me), forward(M, P, T), maplist(r6, T, Tr),
    format("method: ~w~ntarget output (from input ~w): ~w~n", [Me, P, Tr]),
    (   Me == certified -> width(M, W), invert(M, T, -3.0-3.0, [tol(1.0e-9), width(W), max_boxes(3000000)], A)
    ;   invert(M, T, -3.0-3.0, [], A) ),
    (   A = regions(Rs)
    ->  length(Rs, N), format("~w region(s) of inputs give this output~n", [N]),
        ( member(region(_, C, _), Rs), ( in_region(P, C) ; renn_inverse:near_in_region(P, C, 1.0e-6) ) -> In = yes ; In = no ),
        format("the original input lies in a region: ~w~n", [In]),
        forall(( nth1(I, Rs, region(Pat, _, Wt)), I =< 3 ),
               ( maplist(r6, Wt, Wr), forward(M, Wt, Yw), maplist(r6, Yw, Ywr),
                 format("  region ~w, relu pattern ~w: witness ~w -> ~w~n", [I, Pat, Wr, Ywr]) ))
    ;   A = boxes(Bs, Ws)
    ->  length(Bs, NB), length(Ws, NW), format("~w box(es) kept, which contain every solution; ~w witness(es)~n", [NB, NW]),
        ( in_boxes(P, Bs) -> In = yes ; In = no ), format("the original input lies in a kept box: ~w~n", [In]),
        forall(( nth1(I, Ws, Wt), I =< 3 ), ( maplist(r6, Wt, Wr), forward(M, Wt, Yw), maplist(r6, Yw, Ywr),
                                             format("  witness ~w -> ~w~n", [Wr, Ywr]) ))
    ).

unreach(M) :-
    load(M), method(M, Me), renn_inverse:layers(M, Ls), last(Ls, _-Act-Wt-_), length(Wt, K),
    (   Act == softmax -> length(T, K), T = [0.999999|Rest], K1 is K - 1, length(Rest, K1), Small is 0.000001/K1, maplist(=(Small), Rest)
    ;   memberchk(Act, [sigmoid, tanh]) -> length(T, K), maplist(=(0.9999999999), T)
    ;   length(T, K), maplist(=(1.0e6), T) ),
    format("method: ~w~ntarget output: ~w (out of reach for inputs in [-3,3])~n", [Me, T]),
    (   Me == certified -> width(M, W), invert(M, T, -3.0-3.0, [width(W), max_boxes(3000000)], A)
    ;   invert(M, T, -3.0-3.0, [], A) ),
    ( A = regions(Rs) -> length(Rs, N), format("regions found: ~w~n", [N]) ; A = boxes(Bs, Ws), length(Ws, N), length(Bs, NB), format("witnesses found: ~w (boxes left: ~w)~n", [N, NB]) ).

show_rules(M, Max) :-
    load(M), rules(M, -3.0-3.0, Rs), length(Rs, N), format("~w exact rule(s), one per feasible relu pattern; the first ~w:~n", [N, Max]),
    forall(( nth1(I, Rs, rule(Pat, Cons)), I =< Max ), ( copy_term(Cons, C), numbervars(C, 0, _), format("  pattern ~w: ~p~n", [Pat, C]) )).

rpoint(N, P) :- length(P, N), maplist([V]>>( random(R), V0 is -2.5 + 5.0 * R, V is round(V0 * 100) / 100 ), P).
show_rules_box(M, B, Max) :-
    load(M), rules(M, B, Rs), length(Rs, N), format("~w exact rule(s) on the box ~w; the first ~w:~n", [N, B, Max]),
    forall(( nth1(I, Rs, rule(Pat, Cons)), I =< Max ), ( copy_term(Cons, C), numbervars(C, 0, _), format("  pattern ~w: ~p~n", [Pat, C]) )).
class_box(M, B) :- load(M), class_rules(M, B, Rs), length(Rs, N), format("~w class rule(s) on the box ~w~n", [N, B]),
    forall(member(class(C, Pat, _), Rs), format("  class ~w for relu pattern ~w~n", [C, Pat])).
super_box(M, B) :- load(M), superposition(M, B, R), format("units serving more than one class on ~w: ~w~n", [B, R]).
split_box(M, B) :- load(M), split_units(M, B, Cls), length(Cls, N), format("~w clause(s), one predicate per (unit, class):~n", [N]),
    findall(F, ( member((H :- _), Cls), functor(H, F, _) ), Fs), msort(Fs, S), clumped_pairs(S, P), forall(member(X-K, P), format("  ~w: ~w clause(s)~n", [X, K])).
clumped_pairs(S, P) :- clumped(S, P).

main :-
    set_random(seed(7)), set_limit(300),
    io_dir(IO), atom_concat(IO, '/pairs.jsonl', PF), open_pairs(PF),
    Ms = ['tiny-mlp', 'relu-wide', 'relu-deep', 'relu-sigmoid', 'softmax-classifier', 'smooth-mlp', 'deep-mixed'],
    Exact = ['tiny-mlp', 'relu-wide', 'relu-deep', 'relu-sigmoid', 'softmax-classifier'],
    forall(member(M, Ms), ( load(M), renn_inverse:input_size(M, N), layers_text(M, T),
                            forall(between(1, 12, _), ( rpoint(N, P), format(string(Q), "fwd(~q, ~q)", [M, P]),
                                                         format(string(Ti), "~w: forward pass at ~w", [M, P]), pair('renn-inverse/forward', Ti, T, Q) )) )),
    forall(member(M, Exact), ( load(M), renn_inverse:input_size(M, N), layers_text(M, T),
                               forall(between(1, 16, _), ( rpoint(N, P), format(string(Q), "inv(~q, ~q)", [M, P]),
                                                            format(string(Ti), "~w: every input that gives the output of ~w", [M, P]), pair('renn-inverse/invert', Ti, T, Q) )) )),
    forall(member(M, ['smooth-mlp', 'deep-mixed']), ( load(M), renn_inverse:input_size(M, N), layers_text(M, T),
                               forall(between(1, 6, _), ( rpoint(N, P), format(string(Q), "inv(~q, ~q)", [M, P]),
                                                           format(string(Ti), "~w: certified boxes for the output of ~w", [M, P]), pair('renn-inverse/invert-certified', Ti, T, Q) )) )),
    forall(member(M, Ms), ( layers_text(M, T), format(string(Q), "unreach(~q)", [M]),
                            format(string(Ti), "~w: an output no input can give", [M]), pair('renn-inverse/unreachable', Ti, T, Q) )),
    forall(( member(M, ['tiny-mlp', 'relu-wide', 'relu-deep']), member(B, [-1.0-1.0, -2.0-2.0, -3.0-3.0]) ),
           ( layers_text(M, T), format(string(Q), "show_rules_box(~q, ~q, 3)", [M, B]),
             format(string(Ti), "~w: exact if-then rules for inputs in ~w", [M, B]), pair('renn-inverse/rules', Ti, T, Q) )),
    layers_text('softmax-classifier', ST),
    forall(member(B, [-1.0-1.0, -2.0-2.0, -3.0-3.0]), ( format(string(Q), "class_box('softmax-classifier', ~q)", [B]),
           format(string(Ti), "softmax-classifier: class rules for inputs in ~w", [B]), pair('renn-inverse/classes', Ti, ST, Q) )),
    forall(member(B, [-1.0-1.0, -2.0-2.0, -3.0-3.0]), ( format(string(Q), "super_box('softmax-classifier', ~q)", [B]),
           format(string(Ti), "softmax-classifier: units serving more than one class, inputs in ~w", [B]), pair('renn-inverse/classes', Ti, ST, Q) )),
    forall(member(B, [-2.0-2.0, -3.0-3.0]), ( format(string(Q), "split_box('softmax-classifier', ~q)", [B]),
           format(string(Ti), "softmax-classifier: polysemantic units split by class, inputs in ~w", [B]), pair('renn-inverse/classes', Ti, ST, Q) )),
    close_pairs,
    atom_concat(IO, '/io_pairs.md', MF),
    to_markdown(PF, MF, "renn-inverse",
        "Each pair is a query to renn-inverse about one of the seven RENN models in build/: a forward pass, every input that gives an output (exact regions, or certified boxes that contain every solution), an output no input can give, exact if-then rules, and class rules. The input shows the model's layers (weights.pl holds the weights). Every output was produced by running this repository's code with `io_pairs/generate.pl`, with points from a fixed seed; nothing was written by hand. Numbers are rounded to 6 decimal places.").
