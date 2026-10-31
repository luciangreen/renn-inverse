# renn-inverse

Find a [RENN](https://github.com/luciangreen/renn) network's input from its output, and read the network back as exact if-then rules. Part of the Manual Neuronets pipeline: Prolog → pl2ann network → **input from output** → learned code → optimisation algorithm, with a prover checking every step.

RENN writes a dense network as Prolog facts (`layer/6` in `architecture.pl`, `weights/3` and `biases/3` in `weights.pl`). renn-inverse reads only those facts, as data. It never runs RENN's code. RENN's own `forward/3` is used only as the independent reference in the tests.

## What it does

| Predicate | What it gives |
| --- | --- |
| `load_model(+BuildDir, -Model)` | reads a RENN build folder |
| `method(+Model, -M)` | `exact`, `exact_last` or `certified` (below) |
| `invert(+Model, +Output, +Lo-Hi, +Options, -Answer)` | every input in the box [Lo, Hi]^n whose output is Output |
| `rules(+Model, +Lo-Hi, -Rules)` | the whole network as exact rules, one per relu on/off pattern |
| `class_rules(+Model, +Lo-Hi, -Rules)` | for a softmax classifier: one rule per (class, pattern) |
| `superposition(+Model, +Lo-Hi, -Report)` | which relu units are switched on for more than one class |
| `split_units(+Model, +Lo-Hi, -Clauses)` | a polysemantic unit separated into one predicate per class |

## The three methods

- **exact**: every layer is linear or relu. Each relu is on (s ≥ 0, output s) or off (s ≤ 0, output 0), so inside each on/off pattern the network is linear. Each pattern is solved in exact rational arithmetic (SWI-Prolog CLP(Q)). The answer is a list of regions, each a set of linear constraints on x1…xn, with a witness point.
- **exact_last**: as exact, but the last layer may be sigmoid, tanh or softmax. These can be inverted, so the target fixes the last layer's pre-activation: logit(y) for sigmoid, atanh(y) for tanh, and for softmax the logits up to a shared constant (s_i − s_1 = ln(y_i / y_1)). These are still linear constraints.
- **certified**: any layers, including tanh or sigmoid in the middle. Branch and bound with interval arithmetic. A box of inputs is discarded only when its output interval provably misses the target. Every bound is widened by a relative 10^-12 so float rounding can't make it unsound. The kept boxes therefore contain every solution, and witnesses are found by damped least-squares steps and checked.

Targets come from float arithmetic, so outputs are matched within a tolerance (`tol`, default 10^-9). The tolerance is absolute for linear outputs and relative near saturation for sigmoid, tanh and softmax. Without it, two outputs that depend on the same combination of inputs could give an inconsistent pair of exact equations.

## Tests

`run_tests.sh` builds the seven fixture models in `models/` with RENN, then tests each one against RENN's own `forward/3`:

1. this module's forward pass equals RENN's on 200 random inputs;
2. every witness returned by the inverse gives the target under RENN's `forward/3`;
3. completeness: for 25 random inputs x, the inverse of f(x) contains x;
4. an output no input in the box can produce gives no input;
5. (exact models) the rules give RENN's outputs on a grid;
6. (softmax) the class rules give RENN's arg max on 200 inputs, and every split unit predicate covers only inputs of its class.

```
RENN_DIR=/path/to/renn ./run_tests.sh
```

Requires SWI-Prolog 9 or later and Python 3 (to build the models with RENN).

## Limits

- `exact` enumerates relu patterns, which can number up to 2^(number of relu units). Infeasible patterns are pruned as soon as their constraints conflict, but very wide networks will be slow.
- `certified` boxes shrink to the `width` option. The guarantee (every solution is inside a kept box) holds at any width, but small widths in many dimensions need many boxes.
- The box `Lo-Hi` bounds every input. An input outside it is not searched.
