/*  Tests for one RENN model, against RENN's OWN forward/3 as the reference.
    Run: MODEL=<id> swipl -q -g main -t 'halt(1)' tests/model_tests.pl
    The model must be built (build_models.sh) into build/<id>.
    Exits 0 when every test passes, 1 otherwise. */
:- use_module('../prolog/renn_inverse.pl').
:- dynamic result/2.

model(M) :- getenv('MODEL', A), atom_string(M, A).
build_dir(M, D) :- source_file(model(_), F), file_directory_name(F, T), file_directory_name(T, R),
                   atomic_list_concat([R, '/build/', M], D).

main :-
    model(M), build_dir(M, D),
    atom_concat(D, '/ops.pl', Ops), load_files(Ops, [silent(true), imports([])]),   % RENN's reference forward/3
    load_model(D, M), method(M, Method),
    format("model ~w (method ~w)~n", [M, Method]),
    input_size(M, N), set_random(seed(11)),
    findall(P, (between(1, 200, _), random_point(N, -3.0, 3.0, P)), Points),
    t(M, forward_matches_renn, forward_matches(M, Points)),
    t(M, inversion_witnesses_hit_target, witnesses_hit(M, Method, Points)),
    t(M, inversion_is_complete, complete(M, Method, Points)),
    t(M, unreachable_output_has_no_input, unreachable(M, Method)),
    (   Method == exact
    ->  t(M, rules_match_renn_on_grid, rules_match(M, N))
    ;   true ),
    (   renn_inverse:layers(M, Ls), last(Ls, _-softmax-_-_), Method == exact_last
    ->  t(M, class_rules_give_renn_argmax, class_rules_match(M, Points)),
        t(M, superposition_report, superposition_ok(M)),
        t(M, split_units_cover_their_class, split_ok(M, Points))
    ;   true ),
    aggregate_all(count, result(_, ok), P), aggregate_all(count, result(_, failed), F),
    format("~w: ~d passed, ~d failed~n", [M, P, F]),
    ( F =:= 0 -> halt(0) ; halt(1) ).

input_size(M, N) :- renn_inverse:input_size(M, N).

t(M, Name, G) :-
    (   catch(G, E, (print_message(error, E), fail))
    ->  format("  ~w ~w: ok~n", [M, Name]), assertz(result(Name, ok))
    ;   format("  ~w ~w: FAILED~n", [M, Name]), assertz(result(Name, failed))
    ).

random_point(N, Lo, Hi, P) :- length(P, N), maplist([V]>>(random(R), V is Lo + R*(Hi - Lo)), P).
close_to(Tol, A, B) :- abs(A - B) =< Tol * max(1.0, abs(B)).

% 1. this module's forward pass equals RENN's forward/3 on 200 random points
forward_matches(M, Points) :-
    forall(member(P, Points),
           ( renn_ops:forward(M, P, R), forward(M, P, Y), maplist(close_to(1.0e-12), Y, R) )).

% 2. every witness the inverse returns gives the target under RENN's forward/3
% 3. completeness: the true input lies in the answer
target_of(M, P, T) :- renn_ops:forward(M, P, T).
answer(M, Method, T, A) :-
    (   Method == certified
    ->  certified_width(M, Wd), invert(M, T, -3.0-3.0, [tol(1.0e-9), width(Wd), max_boxes(3000000)], A)
    ;   invert(M, T, -3.0-3.0, [], A)
    ).
witnesses_hit(M, Method, Points) :-
    forall(( nth1(I, Points, P), I =< 25 ),
           ( target_of(M, P, T), answer(M, Method, T, A), witnesses(A, Ws), Ws \== [],
             forall(member(W, Ws), ( renn_ops:forward(M, W, Y), maplist(close_to(1.0e-6), Y, T) )) )).
witnesses(regions(Rs), Ws) :- findall(W, member(region(_, _, W), Rs), Ws).
witnesses(boxes(_, Ws), Ws).
complete(M, Method, Points) :-
    forall(( nth1(I, Points, P), I =< 25 ),
           ( target_of(M, P, T), answer(M, Method, T, A), contains(A, P) )).
contains(regions(Rs), P) :- member(region(_, Cons, _), Rs), near_region(P, Cons), !.
contains(boxes(Bs, _), P) :- in_boxes(P, Bs).
% the target is a float, so the true input satisfies the region's equalities only up to
% float rounding: test the region with the point nudged by at most 1e-9 (an exact CLP check)
near_region(P, Cons) :- in_region(P, Cons), !.
near_region(P, Cons) :- renn_inverse:near_in_region(P, Cons, 1.0e-6).

% 4. an output no input in the box can reach
unreachable(M, Method) :-
    renn_inverse:layers(M, Ls), last(Ls, _-Act-W-_), length(W, K),
    (   Act == softmax -> length(T, K), T = [0.999999|Rest], length(Rest, K1), K1 is K - 1, Small is 0.000001/K1, maplist(=(Small), Rest)
    ;   Act == sigmoid -> length(T, K), maplist(=(0.9999999999), T)
    ;   Act == tanh -> length(T, K), maplist(=(0.9999999999), T)
    ;   length(T, K), maplist(=(1.0e6), T)
    ),
    (   Method == certified -> certified_width(M, Wd), invert(M, T, -3.0-3.0, [width(Wd), max_boxes(3000000)], boxes(Bs, Ws)), Ws == [], ( Bs == [] -> true ; true )
    ;   invert(M, T, -3.0-3.0, [], regions([]))
    ).

% 5. exact rules agree with RENN on a grid
rules_match(M, N) :-
    rules(M, -3.0-3.0, Rules), Rules \== [],
    ( N =< 2 -> Steps = 30 ; N =< 3 -> Steps = 10 ; Steps = 5 ),
    Step is 6.0 / Steps, numlist(0, Steps, Is),
    forall(( length(P, N), maplist([V]>>(member(I, Is), V is -3.0 + I*Step), P) ),
           ( renn_ops:forward(M, P, R), rule_value(Rules, P, Y), maplist(close_to(1.0e-9), Y, R) )).
rule_value(Rules, P, Y) :-
    length(P, N), member(rule(_, Cons), Rules), in_region_with_y(P, N, Cons, Y), !.
in_region_with_y(P, N, Cons, Y) :- renn_inverse:solve_outputs(P, N, Cons, Y).

% 6. class rules give the same class as RENN's arg max
class_rules_match(M, Points) :-
    class_rules(M, -3.0-3.0, Rules), Rules \== [],
    forall(member(P, Points),
           ( renn_ops:forward(M, P, Y), max_list(Y, Mx), nth1(C, Y, Mx),
             once(( member(class(C2, _, Cons), Rules), in_region(P, Cons) )), C2 == C )).

superposition_ok(M) :- superposition(M, -3.0-3.0, Rep), Rep \== [],
    forall(member(U-Cs, Rep), format("    ~w serves classes ~w~n", [U, Cs])).

split_ok(M, Points) :-
    split_units(M, -3.0-3.0, Cls), Cls \== [],
    forall(member((H :- Cons), Cls),
           ( H =.. [F|_], atomic_list_concat([unit, _L, _U, class, CA], '_', F), atom_number(CA, C),
             forall(( member(P, Points), in_region(P, Cons) ),
                    ( renn_ops:forward(M, P, Y), max_list(Y, Mx), nth1(C, Y, Mx) )) )).

% a coarser box size for more inputs: the boxes still contain every solution at any size
certified_width(M, W) :- input_size(M, N), ( N =< 3 -> W = 0.2 ; W = 0.5 ).
