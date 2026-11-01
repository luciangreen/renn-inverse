# renn-inverse: program requirements

## Purpose

Given a RENN network (its `architecture.pl` and `weights.pl`) and an observed output, return every input that produces that output, with a proof that none is missed. Also rewrite the network as exact if-then rules, and separate units that serve more than one class.

## Functional requirements

| Id | Requirement | Status |
| --- | --- | --- |
| R1 | Read RENN facts as data (`read_term`), never execute RENN code | done |
| R2 | Own forward pass equal to RENN's `forward/3` (relative 10^-12) | done, tested on 7 models × 200 inputs |
| R3 | Exact inverse for linear/relu networks (CLP(Q) regions) | done |
| R4 | Exact inverse when only the last layer is sigmoid, tanh or softmax | done |
| R5 | Sound and complete enclosure for any mix of linear, relu, tanh, sigmoid and softmax | done (interval branch and bound) |
| R6 | Witness points that RENN's `forward/3` confirms | done |
| R7 | Report "no input" when the output cannot be reached | done |
| R8 | Exact rules (one per relu pattern) agreeing with RENN | done |
| R9 | Class rules for softmax classifiers agreeing with RENN's arg max | done |
| R10 | Superposition report and per-class split predicates | done for first-layer units of relu → softmax networks |
| R11 | 200 input/output pairs produced by running the code | done (`io_pairs/`) |

## Non-functional requirements

- Pure SWI-Prolog, no foreign code.
- Every test compares against RENN's own `forward/3`, not this module's.
- Tolerances are explicit options and are reported with results.

## Work remaining

1. **Speed.** Exact pattern enumeration is exponential in the number of relu units. Add bound propagation (interval pre-pass) to prune patterns before CLP(Q).
2. **Exact regions for smooth hidden layers.** Today a network with a tanh or sigmoid hidden layer gets certified boxes, not exact regions. A monotone-bounding (Taylor or McCormick) relaxation would give tighter sets.
3. **Superposition beyond the first layer.** The report covers the units of every layer through the pattern list, but splitting into per-class predicates is only checked for relu → softmax networks.
4. **Convolution, attention and normalisation layers.** RENN itself supports only dense layers today.
5. **Larger fixtures.** The renn-200-pairs set (tiny-mlp, smooth-mlp, softmax-classifier, deep-mixed) should be added as fixtures once it is in the RENN repository.
