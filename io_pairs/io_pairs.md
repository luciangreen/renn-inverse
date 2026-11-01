# renn-inverse: 200 input/output pairs

Each pair is a query to renn-inverse about one of the seven RENN models in build/: a forward pass, every input that gives an output (exact regions, or certified boxes that contain every solution), an output no input can give, exact if-then rules, and class rules. The input shows the model's layers (weights.pl holds the weights). Every output was produced by running this repository's code with `io_pairs/generate.pl`, with points from a fixed seed; nothing was written by hand. Numbers are rounded to 6 decimal places.

| Category | Pairs |
|---|---|
| `renn-inverse/forward` | 84 |
| `renn-inverse/invert` | 80 |
| `renn-inverse/invert-certified` | 12 |
| `renn-inverse/unreachable` | 7 |
| `renn-inverse/rules` | 9 |
| `renn-inverse/classes` | 8 |

## 1. tiny-mlp: forward pass at [-0.28,-1.74]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [-0.28,-1.74]).
```

**Output**

```text
method: exact
forward([-0.28,-1.74]) = [3.42]
```

## 2. tiny-mlp: forward pass at [-1.02,1.03]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [-1.02,1.03]).
```

**Output**

```text
method: exact
forward([-1.02,1.03]) = [0.245]
```

## 3. tiny-mlp: forward pass at [-0.15,1.11]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [-0.15,1.11]).
```

**Output**

```text
method: exact
forward([-0.15,1.11]) = [-0.23]
```

## 4. tiny-mlp: forward pass at [-2.45,1.8]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [-2.45,1.8]).
```

**Output**

```text
method: exact
forward([-2.45,1.8]) = [0.5]
```

## 5. tiny-mlp: forward pass at [-0.39,1.56]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [-0.39,1.56]).
```

**Output**

```text
method: exact
forward([-0.39,1.56]) = [-0.335]
```

## 6. tiny-mlp: forward pass at [0.73,0.41]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [0.73,0.41]).
```

**Output**

```text
method: exact
forward([0.73,0.41]) = [0.32]
```

## 7. tiny-mlp: forward pass at [0.89,-1.59]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [0.89,-1.59]).
```

**Output**

```text
method: exact
forward([0.89,-1.59]) = [5.46]
```

## 8. tiny-mlp: forward pass at [-2.42,-1.87]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [-2.42,-1.87]).
```

**Output**

```text
method: exact
forward([-2.42,-1.87]) = [0.5]
```

## 9. tiny-mlp: forward pass at [-1.36,1.34]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [-1.36,1.34]).
```

**Output**

```text
method: exact
forward([-1.36,1.34]) = [0.26]
```

## 10. tiny-mlp: forward pass at [0.15,-1.66]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [0.15,-1.66]).
```

**Output**

```text
method: exact
forward([0.15,-1.66]) = [4.12]
```

## 11. tiny-mlp: forward pass at [-1.13,0.96]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [-1.13,0.96]).
```

**Output**

```text
method: exact
forward([-1.13,0.96]) = [0.335]
```

## 12. tiny-mlp: forward pass at [1.94,-2.3]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- fwd('tiny-mlp', [1.94,-2.3]).
```

**Output**

```text
method: exact
forward([1.94,-2.3]) = [8.91]
```

## 13. relu-wide: forward pass at [-1.47,-0.7,-1.99]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [-1.47,-0.7,-1.99]).
```

**Output**

```text
method: exact
forward([-1.47,-0.7,-1.99]) = [-13.59,8.61]
```

## 14. relu-wide: forward pass at [-0.67,-1.39,1.19]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [-0.67,-1.39,1.19]).
```

**Output**

```text
method: exact
forward([-0.67,-1.39,1.19]) = [-1.775,-8.185]
```

## 15. relu-wide: forward pass at [1.23,2.26,1.85]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [1.23,2.26,1.85]).
```

**Output**

```text
method: exact
forward([1.23,2.26,1.85]) = [1.9925,-3.49]
```

## 16. relu-wide: forward pass at [1.37,-1.11,-0.09]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [1.37,-1.11,-0.09]).
```

**Output**

```text
method: exact
forward([1.37,-1.11,-0.09]) = [-1.81,-10.96]
```

## 17. relu-wide: forward pass at [0.35,-1.29,1.7]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [0.35,-1.29,1.7]).
```

**Output**

```text
method: exact
forward([0.35,-1.29,1.7]) = [1.8975,-12.9325]
```

## 18. relu-wide: forward pass at [-0.85,2.22,-1.03]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [-0.85,2.22,-1.03]).
```

**Output**

```text
method: exact
forward([-0.85,2.22,-1.03]) = [-1.0,0.5]
```

## 19. relu-wide: forward pass at [-1.43,-0.94,-1.39]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [-1.43,-0.94,-1.39]).
```

**Output**

```text
method: exact
forward([-1.43,-0.94,-1.39]) = [-13.27,6.65]
```

## 20. relu-wide: forward pass at [1.85,0.23,-2.03]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [1.85,0.23,-2.03]).
```

**Output**

```text
method: exact
forward([1.85,0.23,-2.03]) = [-3.8575,-3.31]
```

## 21. relu-wide: forward pass at [0.64,-1.63,2.36]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [0.64,-1.63,2.36]).
```

**Output**

```text
method: exact
forward([0.64,-1.63,2.36]) = [2.9075,-17.9125]
```

## 22. relu-wide: forward pass at [0.14,-1.83,1.56]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [0.14,-1.83,1.56]).
```

**Output**

```text
method: exact
forward([0.14,-1.83,1.56]) = [0.1575,-15.5625]
```

## 23. relu-wide: forward pass at [-0.64,0.82,-0.12]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [-0.64,0.82,-0.12]).
```

**Output**

```text
method: exact
forward([-0.64,0.82,-0.12]) = [-1.0,0.5]
```

## 24. relu-wide: forward pass at [1.9,-0.27,-1.55]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- fwd('relu-wide', [1.9,-0.27,-1.55]).
```

**Output**

```text
method: exact
forward([1.9,-0.27,-1.55]) = [-4.93,-5.12]
```

## 25. relu-deep: forward pass at [1.06,-0.45]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [1.06,-0.45]).
```

**Output**

```text
method: exact
forward([1.06,-0.45]) = [2.79]
```

## 26. relu-deep: forward pass at [-2.26,1.87]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [-2.26,1.87]).
```

**Output**

```text
method: exact
forward([-2.26,1.87]) = [1.695]
```

## 27. relu-deep: forward pass at [-1.8,2.08]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [-1.8,2.08]).
```

**Output**

```text
method: exact
forward([-1.8,2.08]) = [1.345]
```

## 28. relu-deep: forward pass at [-0.81,0.13]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [-0.81,0.13]).
```

**Output**

```text
method: exact
forward([-0.81,0.13]) = [-0.00875]
```

## 29. relu-deep: forward pass at [2.32,-0.47]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [2.32,-0.47]).
```

**Output**

```text
method: exact
forward([2.32,-0.47]) = [4.7]
```

## 30. relu-deep: forward pass at [2.16,-0.78]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [2.16,-0.78]).
```

**Output**

```text
method: exact
forward([2.16,-0.78]) = [4.77]
```

## 31. relu-deep: forward pass at [-2.3,1.21]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [-2.3,1.21]).
```

**Output**

```text
method: exact
forward([-2.3,1.21]) = [1.565]
```

## 32. relu-deep: forward pass at [-0.72,-0.49]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [-0.72,-0.49]).
```

**Output**

```text
method: exact
forward([-0.72,-0.49]) = [0.1675]
```

## 33. relu-deep: forward pass at [0.95,0.68]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [0.95,0.68]).
```

**Output**

```text
method: exact
forward([0.95,0.68]) = [1.495]
```

## 34. relu-deep: forward pass at [-1.5,0.85]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [-1.5,0.85]).
```

**Output**

```text
method: exact
forward([-1.5,0.85]) = [0.775]
```

## 35. relu-deep: forward pass at [-0.94,-1.33]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [-0.94,-1.33]).
```

**Output**

```text
method: exact
forward([-0.94,-1.33]) = [0.66]
```

## 36. relu-deep: forward pass at [0.76,0.31]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- fwd('relu-deep', [0.76,0.31]).
```

**Output**

```text
method: exact
forward([0.76,0.31]) = [1.58]
```

## 37. relu-sigmoid: forward pass at [1.15,0.62]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [1.15,0.62]).
```

**Output**

```text
method: exact_last
forward([1.15,0.62]) = [0.015906]
```

## 38. relu-sigmoid: forward pass at [1.39,1.57]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [1.39,1.57]).
```

**Output**

```text
method: exact_last
forward([1.39,1.57]) = [2.3e-05]
```

## 39. relu-sigmoid: forward pass at [-1.35,-1.21]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [-1.35,-1.21]).
```

**Output**

```text
method: exact_last
forward([-1.35,-1.21]) = [0.731059]
```

## 40. relu-sigmoid: forward pass at [-0.53,-1.23]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [-0.53,-1.23]).
```

**Output**

```text
method: exact_last
forward([-0.53,-1.23]) = [0.82017]
```

## 41. relu-sigmoid: forward pass at [-0.42,0.32]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [-0.42,0.32]).
```

**Output**

```text
method: exact_last
forward([-0.42,0.32]) = [0.636453]
```

## 42. relu-sigmoid: forward pass at [-0.33,-1.75]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [-0.33,-1.75]).
```

**Output**

```text
method: exact_last
forward([-0.33,-1.75]) = [0.89163]
```

## 43. relu-sigmoid: forward pass at [1.14,-0.12]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [1.14,-0.12]).
```

**Output**

```text
method: exact_last
forward([1.14,-0.12]) = [0.628316]
```

## 44. relu-sigmoid: forward pass at [-2.45,-2.44]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [-2.45,-2.44]).
```

**Output**

```text
method: exact_last
forward([-2.45,-2.44]) = [0.731059]
```

## 45. relu-sigmoid: forward pass at [-2.45,1.01]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [-2.45,1.01]).
```

**Output**

```text
method: exact_last
forward([-2.45,1.01]) = [0.731059]
```

## 46. relu-sigmoid: forward pass at [1.3,1.57]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [1.3,1.57]).
```

**Output**

```text
method: exact_last
forward([1.3,1.57]) = [2.9e-05]
```

## 47. relu-sigmoid: forward pass at [-1.39,1.09]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [-1.39,1.09]).
```

**Output**

```text
method: exact_last
forward([-1.39,1.09]) = [0.358933]
```

## 48. relu-sigmoid: forward pass at [-0.33,-1.43]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- fwd('relu-sigmoid', [-0.33,-1.43]).
```

**Output**

```text
method: exact_last
forward([-0.33,-1.43]) = [0.866169]
```

## 49. softmax-classifier: forward pass at [1.23,2.45]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [1.23,2.45]).
```

**Output**

```text
method: exact_last
forward([1.23,2.45]) = [0.999999,1.0e-06,0.0]
```

## 50. softmax-classifier: forward pass at [2.21,1.51]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [2.21,1.51]).
```

**Output**

```text
method: exact_last
forward([2.21,1.51]) = [1.0,0.0,0.0]
```

## 51. softmax-classifier: forward pass at [2.08,-1.01]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [2.08,-1.01]).
```

**Output**

```text
method: exact_last
forward([2.08,-1.01]) = [0.999939,5.1e-05,1.0e-05]
```

## 52. softmax-classifier: forward pass at [-2.1,0.8]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [-2.1,0.8]).
```

**Output**

```text
method: exact_last
forward([-2.1,0.8]) = [0.0,1.0e-05,0.99999]
```

## 53. softmax-classifier: forward pass at [1.67,-0.24]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [1.67,-0.24]).
```

**Output**

```text
method: exact_last
forward([1.67,-0.24]) = [0.99993,5.8e-05,1.2e-05]
```

## 54. softmax-classifier: forward pass at [-1.95,-0.92]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [-1.95,-0.92]).
```

**Output**

```text
method: exact_last
forward([-1.95,-0.92]) = [0.0,2.0e-06,0.999998]
```

## 55. softmax-classifier: forward pass at [1.77,1.05]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [1.77,1.05]).
```

**Output**

```text
method: exact_last
forward([1.77,1.05]) = [0.999999,1.0e-06,0.0]
```

## 56. softmax-classifier: forward pass at [-1.32,2.17]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [-1.32,2.17]).
```

**Output**

```text
method: exact_last
forward([-1.32,2.17]) = [1.0e-06,0.001045,0.998954]
```

## 57. softmax-classifier: forward pass at [1.45,1.03]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [1.45,1.03]).
```

**Output**

```text
method: exact_last
forward([1.45,1.03]) = [0.999992,7.0e-06,1.0e-06]
```

## 58. softmax-classifier: forward pass at [-2.07,-0.09]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [-2.07,-0.09]).
```

**Output**

```text
method: exact_last
forward([-2.07,-0.09]) = [0.0,4.0e-06,0.999996]
```

## 59. softmax-classifier: forward pass at [-1.78,1.82]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [-1.78,1.82]).
```

**Output**

```text
method: exact_last
forward([-1.78,1.82]) = [0.0,0.00012,0.99988]
```

## 60. softmax-classifier: forward pass at [-0.52,0.65]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- fwd('softmax-classifier', [-0.52,0.65]).
```

**Output**

```text
method: exact_last
forward([-0.52,0.65]) = [0.00043,0.003132,0.996438]
```

## 61. smooth-mlp: forward pass at [1,-2.18,-2.34]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [1,-2.18,-2.34]).
```

**Output**

```text
method: certified
forward([1,-2.18,-2.34]) = [0.393774]
```

## 62. smooth-mlp: forward pass at [-1.65,-0.96,-1.81]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [-1.65,-0.96,-1.81]).
```

**Output**

```text
method: certified
forward([-1.65,-0.96,-1.81]) = [0.573192]
```

## 63. smooth-mlp: forward pass at [-0.98,-2.45,1.94]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [-0.98,-2.45,1.94]).
```

**Output**

```text
method: certified
forward([-0.98,-2.45,1.94]) = [0.429785]
```

## 64. smooth-mlp: forward pass at [-1,-2.39,0.4]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [-1,-2.39,0.4]).
```

**Output**

```text
method: certified
forward([-1,-2.39,0.4]) = [0.200943]
```

## 65. smooth-mlp: forward pass at [-1.7,1.13,0.64]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [-1.7,1.13,0.64]).
```

**Output**

```text
method: certified
forward([-1.7,1.13,0.64]) = [0.783447]
```

## 66. smooth-mlp: forward pass at [-2.48,0.29,-0.8]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [-2.48,0.29,-0.8]).
```

**Output**

```text
method: certified
forward([-2.48,0.29,-0.8]) = [0.774572]
```

## 67. smooth-mlp: forward pass at [-0.1,-1.8,1.49]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [-0.1,-1.8,1.49]).
```

**Output**

```text
method: certified
forward([-0.1,-1.8,1.49]) = [0.519745]
```

## 68. smooth-mlp: forward pass at [1.99,-0.16,-2.42]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [1.99,-0.16,-2.42]).
```

**Output**

```text
method: certified
forward([1.99,-0.16,-2.42]) = [0.728527]
```

## 69. smooth-mlp: forward pass at [-1.17,-1.23,0.84]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [-1.17,-1.23,0.84]).
```

**Output**

```text
method: certified
forward([-1.17,-1.23,0.84]) = [0.333701]
```

## 70. smooth-mlp: forward pass at [1.16,2.12,-0.4]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [1.16,2.12,-0.4]).
```

**Output**

```text
method: certified
forward([1.16,2.12,-0.4]) = [0.890483]
```

## 71. smooth-mlp: forward pass at [-1.01,0.45,1.4]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [-1.01,0.45,1.4]).
```

**Output**

```text
method: certified
forward([-1.01,0.45,1.4]) = [0.752388]
```

## 72. smooth-mlp: forward pass at [0.54,0.77,-0.41]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- fwd('smooth-mlp', [0.54,0.77,-0.41]).
```

**Output**

```text
method: certified
forward([0.54,0.77,-0.41]) = [0.845589]
```

## 73. deep-mixed: forward pass at [-2.19,-0.64,0.86,-1.33]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [-2.19,-0.64,0.86,-1.33]).
```

**Output**

```text
method: certified
forward([-2.19,-0.64,0.86,-1.33]) = [2.200857]
```

## 74. deep-mixed: forward pass at [-1.59,1.37,2.32,2.27]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [-1.59,1.37,2.32,2.27]).
```

**Output**

```text
method: certified
forward([-1.59,1.37,2.32,2.27]) = [2.030983]
```

## 75. deep-mixed: forward pass at [2.37,2.03,-1.5,-1.43]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [2.37,2.03,-1.5,-1.43]).
```

**Output**

```text
method: certified
forward([2.37,2.03,-1.5,-1.43]) = [2.012911]
```

## 76. deep-mixed: forward pass at [-1.38,0,-0.38,-0.37]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [-1.38,0,-0.38,-0.37]).
```

**Output**

```text
method: certified
forward([-1.38,0,-0.38,-0.37]) = [2.200857]
```

## 77. deep-mixed: forward pass at [0.3,1.4,-0.41,-1.53]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [0.3,1.4,-0.41,-1.53]).
```

**Output**

```text
method: certified
forward([0.3,1.4,-0.41,-1.53]) = [2.012918]
```

## 78. deep-mixed: forward pass at [-1.67,-0.17,2.07,0.05]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [-1.67,-0.17,2.07,0.05]).
```

**Output**

```text
method: certified
forward([-1.67,-0.17,2.07,0.05]) = [2.199414]
```

## 79. deep-mixed: forward pass at [-1.19,-0.89,0.42,0.42]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [-1.19,-0.89,0.42,0.42]).
```

**Output**

```text
method: certified
forward([-1.19,-0.89,0.42,0.42]) = [2.200857]
```

## 80. deep-mixed: forward pass at [0.56,-1.11,0.88,1.61]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [0.56,-1.11,0.88,1.61]).
```

**Output**

```text
method: certified
forward([0.56,-1.11,0.88,1.61]) = [2.053182]
```

## 81. deep-mixed: forward pass at [2.11,0.86,0.33,1.3]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [2.11,0.86,0.33,1.3]).
```

**Output**

```text
method: certified
forward([2.11,0.86,0.33,1.3]) = [2.012928]
```

## 82. deep-mixed: forward pass at [1.94,2.33,2.02,1.41]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [1.94,2.33,2.02,1.41]).
```

**Output**

```text
method: certified
forward([1.94,2.33,2.02,1.41]) = [2.013779]
```

## 83. deep-mixed: forward pass at [-2.46,1.83,-1.01,2.05]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [-2.46,1.83,-1.01,2.05]).
```

**Output**

```text
method: certified
forward([-2.46,1.83,-1.01,2.05]) = [2.10331]
```

## 84. deep-mixed: forward pass at [-2.33,1.58,1.12,2.23]

*Category:* `renn-inverse/forward`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- fwd('deep-mixed', [-2.33,1.58,1.12,2.23]).
```

**Output**

```text
method: certified
forward([-2.33,1.58,1.12,2.23]) = [2.18279]
```

## 85. tiny-mlp: every input that gives the output of [0.7,1.7]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [0.7,1.7]).
```

**Output**

```text
method: exact
target output (from input [0.7,1.7]): [-0.95]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [2.1,1.74] -> [-0.95]
  region 2, relu pattern [[off,on],[lin]]: witness [0.3,2.1] -> [-0.95]
```

## 86. tiny-mlp: every input that gives the output of [0.22,0.92]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [0.22,0.92]).
```

**Output**

```text
method: exact
target output (from input [0.22,0.92]): [-0.32]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [1.785,1.299] -> [-0.32]
  region 2, relu pattern [[off,on],[lin]]: witness [-0.645,1.785] -> [-0.32]
```

## 87. tiny-mlp: every input that gives the output of [1.36,1.89]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [1.36,1.89]).
```

**Output**

```text
method: exact
target output (from input [1.36,1.89]): [-1.375]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [2.3125,2.0375] -> [-1.375]
  region 2, relu pattern [[off,on],[lin]]: witness [0.9375,2.3125] -> [-1.375]
```

## 88. tiny-mlp: every input that gives the output of [-1.01,-0.53]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [-1.01,-0.53]).
```

**Output**

```text
method: exact
target output (from input [-1.01,-0.53]): [0.5]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [1.375,0.725] -> [0.5]
  region 2, relu pattern [[on,off],[lin]]: witness [-1.625,-1.625] -> [0.5]
  region 3, relu pattern [[off,on],[lin]]: witness [-1.625,1.125] -> [0.5]
```

## 89. tiny-mlp: every input that gives the output of [2.02,-2.22]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [2.02,-2.22]).
```

**Output**

```text
method: exact
target output (from input [2.02,-2.22]): [8.83]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [2.41625,-1.98225] -> [8.83]
  region 2, relu pattern [[on,off],[lin]]: witness [1.49875,-2.66625] -> [8.83]
```

## 90. tiny-mlp: every input that gives the output of [1.1,2.4]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [1.1,2.4]).
```

**Output**

```text
method: exact
target output (from input [1.1,2.4]): [-1.5]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [2.375,2.125] -> [-1.5]
  region 2, relu pattern [[off,on],[lin]]: witness [1.125,2.375] -> [-1.5]
```

## 91. tiny-mlp: every input that gives the output of [-2.5,-1.22]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [-2.5,-1.22]).
```

**Output**

```text
method: exact
target output (from input [-2.5,-1.22]): [0.5]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [1.375,0.725] -> [0.5]
  region 2, relu pattern [[on,off],[lin]]: witness [-1.625,-1.625] -> [0.5]
  region 3, relu pattern [[off,on],[lin]]: witness [-1.625,1.125] -> [0.5]
```

## 92. tiny-mlp: every input that gives the output of [-2.16,1.83]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [-2.16,1.83]).
```

**Output**

```text
method: exact
target output (from input [-2.16,1.83]): [0.415]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [1.4175,0.7845] -> [0.415]
  region 2, relu pattern [[off,on],[lin]]: witness [-1.5825,1.2525] -> [0.415]
```

## 93. tiny-mlp: every input that gives the output of [0.68,-1.56]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [0.68,-1.56]).
```

**Output**

```text
method: exact
target output (from input [0.68,-1.56]): [4.98]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [1.935,-0.731] -> [4.98]
  region 2, relu pattern [[on,off],[lin]]: witness [0.055,-2.185] -> [4.98]
```

## 94. tiny-mlp: every input that gives the output of [2.24,1.87]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [2.24,1.87]).
```

**Output**

```text
method: exact
target output (from input [2.24,1.87]): [-1.065]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [2.1575,1.8205] -> [-1.065]
  region 2, relu pattern [[off,on],[lin]]: witness [0.4725,2.1575] -> [-1.065]
```

## 95. tiny-mlp: every input that gives the output of [-1.4,-0.42]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [-1.4,-0.42]).
```

**Output**

```text
method: exact
target output (from input [-1.4,-0.42]): [0.5]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [1.375,0.725] -> [0.5]
  region 2, relu pattern [[on,off],[lin]]: witness [-1.625,-1.625] -> [0.5]
  region 3, relu pattern [[off,on],[lin]]: witness [-1.625,1.125] -> [0.5]
```

## 96. tiny-mlp: every input that gives the output of [-1.22,1.8]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [-1.22,1.8]).
```

**Output**

```text
method: exact
target output (from input [-1.22,1.8]): [-0.04]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [1.645,1.103] -> [-0.04]
  region 2, relu pattern [[off,on],[lin]]: witness [-1.065,1.645] -> [-0.04]
```

## 97. tiny-mlp: every input that gives the output of [-2.24,2.17]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [-2.24,2.17]).
```

**Output**

```text
method: exact
target output (from input [-2.24,2.17]): [0.285]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [1.4825,0.8755] -> [0.285]
  region 2, relu pattern [[off,on],[lin]]: witness [-1.5175,1.4475] -> [0.285]
```

## 98. tiny-mlp: every input that gives the output of [-0.1,-1.63]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [-0.1,-1.63]).
```

**Output**

```text
method: exact
target output (from input [-0.1,-1.63]): [3.56]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [1.7575,-0.2695] -> [3.56]
  region 2, relu pattern [[on,off],[lin]]: witness [-0.4775,-2.0075] -> [3.56]
```

## 99. tiny-mlp: every input that gives the output of [1.22,1.65]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [1.22,1.65]).
```

**Output**

```text
method: exact
target output (from input [1.22,1.65]): [-1.185]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [2.2175,1.9045] -> [-1.185]
  region 2, relu pattern [[off,on],[lin]]: witness [0.6525,2.2175] -> [-1.185]
```

## 100. tiny-mlp: every input that gives the output of [1.95,-1.11]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- inv('tiny-mlp', [1.95,-1.11]).
```

**Output**

```text
method: exact
target output (from input [1.95,-1.11]): [5.95]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on],[lin]]: witness [2.05625,-1.04625] -> [5.95]
  region 2, relu pattern [[on,off],[lin]]: witness [0.41875,-2.30625] -> [5.95]
```

## 101. relu-wide: every input that gives the output of [0.55,1.09,0.2]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [0.55,1.09,0.2]).
```

**Output**

```text
method: exact
target output (from input [0.55,1.09,0.2]): [-0.985,0.48]
6 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on,off],[lin,lin]]: witness [-0.127647,-0.252941,-0.243529] -> [-0.985,0.48]
  region 2, relu pattern [[on,on,off,on],[lin,lin]]: witness [-0.388571,-0.148571,0.0] -> [-0.985,0.48]
  region 3, relu pattern [[on,on,off,off],[lin,lin]]: witness [-0.258109,-0.200756,-0.121765] -> [-0.985,0.48]
```

## 102. relu-wide: every input that gives the output of [1.68,0.18,-1.14]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [1.68,0.18,-1.14]).
```

**Output**

```text
method: exact
target output (from input [1.68,0.18,-1.14]): [-3.025,-2.36]
5 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on,on],[lin,lin]]: witness [-0.514279,-0.881861,0.29546] -> [-3.025,-2.36]
  region 2, relu pattern [[on,on,on,off],[lin,lin]]: witness [0.216599,-0.663844,-0.504849] -> [-3.025,-2.36]
  region 3, relu pattern [[on,on,off,on],[lin,lin]]: witness [-1.488381,-0.27073,1.19636] -> [-3.025,-2.36]
```

## 103. relu-wide: every input that gives the output of [0.29,-0.71,-0.44]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [0.29,-0.71,-0.44]).
```

**Output**

```text
method: exact
target output (from input [0.29,-0.71,-0.44]): [-2.55,-3.3225]
5 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on,on],[lin,lin]]: witness [-0.48921,-0.932291,0.412491] -> [-2.55,-3.3225]
  region 2, relu pattern [[on,on,on,off],[lin,lin]]: witness [0.220802,-0.751561,-0.362697] -> [-2.55,-3.3225]
  region 3, relu pattern [[on,on,off,on],[lin,lin]]: witness [-1.464538,-0.396568,1.330395] -> [-2.55,-3.3225]
```

## 104. relu-wide: every input that gives the output of [2.09,1.22,1.84]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [2.09,1.22,1.84]).
```

**Output**

```text
method: exact
target output (from input [2.09,1.22,1.84]): [4.82,-7.26]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,off,on,on],[lin,lin]]: witness [0.911957,-0.211739,1.67087] -> [4.82,-7.26]
  region 2, relu pattern [[on,off,on,off],[lin,lin]]: witness [1.955978,0.384845,1.372578] -> [4.82,-7.26]
  region 3, relu pattern [[on,off,off,on],[lin,lin]]: witness [0.76955,0.642702,2.335435] -> [4.82,-7.26]
```

## 105. relu-wide: every input that gives the output of [1.52,1.06,2.29]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [1.52,1.06,2.29]).
```

**Output**

```text
method: exact
target output (from input [1.52,1.06,2.29]): [5.2175,-7.79]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,off,on,on],[lin,lin]]: witness [0.99837,-0.200217,1.797609] -> [5.2175,-7.79]
  region 2, relu pattern [[on,off,on,off],[lin,lin]]: witness [1.999185,0.371677,1.511661] -> [5.2175,-7.79]
  region 3, relu pattern [[on,off,off,on],[lin,lin]]: witness [0.869542,0.572748,2.398804] -> [5.2175,-7.79]
```

## 106. relu-wide: every input that gives the output of [-1.23,1.14,-1.57]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [-1.23,1.14,-1.57]).
```

**Output**

```text
method: exact
target output (from input [-1.23,1.14,-1.57]): [-5.21,3.6575]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,on,on],[lin,lin]]: witness [-0.705682,-0.427424,-0.701667] -> [-5.21,3.6575]
  region 2, relu pattern [[off,on,on,off],[lin,lin]]: witness [-0.235568,0.094924,-1.850833] -> [-5.21,3.6575]
  region 3, relu pattern [[off,on,off,on],[lin,lin]]: witness [-1.852841,1.102121,-0.701667] -> [-5.21,3.6575]
```

## 107. relu-wide: every input that gives the output of [1.1,-1.83,2.33]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [1.1,-1.83,2.33]).
```

**Output**

```text
method: exact
target output (from input [1.1,-1.83,2.33]): [2.85,-20.56]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,off,on,on],[lin,lin]]: witness [1.040453,-1.841143,2.367609] -> [2.85,-20.56]
  region 2, relu pattern [[on,off,on,off],[lin,lin]]: witness [2.52087,-1.379979,1.598323] -> [2.85,-20.56]
```

## 108. relu-wide: every input that gives the output of [0.3,1.76,0.04]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [0.3,1.76,0.04]).
```

**Output**

```text
method: exact
target output (from input [0.3,1.76,0.04]): [-1.0,0.5]
12 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on,off],[lin,lin]]: witness [-0.125,-0.25,-0.25] -> [-1.0,0.5]
  region 2, relu pattern [[on,on,off,on],[lin,lin]]: witness [-0.392857,-0.142857,0.0] -> [-1.0,0.5]
  region 3, relu pattern [[on,on,off,off],[lin,lin]]: witness [-0.258929,-0.196429,-0.125] -> [-1.0,0.5]
```

## 109. relu-wide: every input that gives the output of [-2.1,-1.2,-0.05]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [-2.1,-1.2,-0.05]).
```

**Output**

```text
method: exact
target output (from input [-2.1,-1.2,-0.05]): [-13.6125,5.65]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,on,on],[lin,lin]]: witness [-1.550818,-1.144242,-0.903667] -> [-13.6125,5.65]
  region 2, relu pattern [[off,on,on,off],[lin,lin]]: witness [-0.795182,-0.742424,-2.378667] -> [-13.6125,5.65]
  region 3, relu pattern [[off,on,off,on],[lin,lin]]: witness [-2.526136,-0.631818,-0.05] -> [-13.6125,5.65]
```

## 110. relu-wide: every input that gives the output of [1.09,1.83,-1.82]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [1.09,1.83,-1.82]).
```

**Output**

```text
method: exact
target output (from input [1.09,1.83,-1.82]): [-1.0,0.5]
12 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on,off],[lin,lin]]: witness [-0.125,-0.25,-0.25] -> [-1.0,0.5]
  region 2, relu pattern [[on,on,off,on],[lin,lin]]: witness [-0.392857,-0.142857,0.0] -> [-1.0,0.5]
  region 3, relu pattern [[on,on,off,off],[lin,lin]]: witness [-0.258929,-0.196429,-0.125] -> [-1.0,0.5]
```

## 111. relu-wide: every input that gives the output of [1.43,2.02,-1.12]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [1.43,2.02,-1.12]).
```

**Output**

```text
method: exact
target output (from input [1.43,2.02,-1.12]): [-1.0,0.5]
12 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on,off],[lin,lin]]: witness [-0.125,-0.25,-0.25] -> [-1.0,0.5]
  region 2, relu pattern [[on,on,off,on],[lin,lin]]: witness [-0.392857,-0.142857,0.0] -> [-1.0,0.5]
  region 3, relu pattern [[on,on,off,off],[lin,lin]]: witness [-0.258929,-0.196429,-0.125] -> [-1.0,0.5]
```

## 112. relu-wide: every input that gives the output of [1.57,1.15,1.32]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [1.57,1.15,1.32]).
```

**Output**

```text
method: exact
target output (from input [1.57,1.15,1.32]): [2.975,-4.8]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,off,on,on],[lin,lin]]: witness [0.51087,-0.265217,1.082609] -> [2.975,-4.8]
  region 2, relu pattern [[on,off,on,off],[lin,lin]]: witness [1.755435,0.445963,0.727019] -> [2.975,-4.8]
  region 3, relu pattern [[on,off,off,on],[lin,lin]]: witness [0.305435,0.967391,2.041304] -> [2.975,-4.8]
```

## 113. relu-wide: every input that gives the output of [0.47,0.24,0.36]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [0.47,0.24,0.36]).
```

**Output**

```text
method: exact
target output (from input [0.47,0.24,0.36]): [0.53,-1.54]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,off,on,on],[lin,lin]]: witness [-0.020652,-0.336087,0.303043] -> [0.53,-1.54]
  region 2, relu pattern [[on,off,on,off],[lin,lin]]: witness [1.489674,0.526957,-0.128478] -> [0.53,-1.54]
  region 3, relu pattern [[on,off,off,on],[lin,lin]]: witness [-0.298659,1.331957,1.600411] -> [0.53,-1.54]
```

## 114. relu-wide: every input that gives the output of [1.63,-2.49,2.29]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [1.63,-2.49,2.29]).
```

**Output**

```text
method: exact
target output (from input [1.63,-2.49,2.29]): [1.805,-26.495]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,off,on,on],[lin,lin]]: witness [1.51865,-2.510837,2.360326] -> [1.805,-26.495]
  region 2, relu pattern [[on,off,on,off],[lin,lin]]: witness [2.765734,-2.187438,1.653719] -> [1.805,-26.495]
```

## 115. relu-wide: every input that gives the output of [-2.04,0.33,-0.62]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [-2.04,0.33,-0.62]).
```

**Output**

```text
method: exact
target output (from input [-2.04,0.33,-0.62]): [-8.8575,4.945]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,on,on],[lin,lin]]: witness [-1.083309,-0.680788,-0.906867] -> [-8.8575,4.945]
  region 2, relu pattern [[off,on,on,off],[lin,lin]]: witness [-0.545336,-0.230152,-2.096867] -> [-8.8575,4.945]
  region 3, relu pattern [[off,on,off,on],[lin,lin]]: witness [-2.125909,0.444545,-0.62] -> [-8.8575,4.945]
```

## 116. relu-wide: every input that gives the output of [2.49,-1.43,-0.94]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- inv('relu-wide', [2.49,-1.43,-0.94]).
```

**Output**

```text
method: exact
target output (from input [2.49,-1.43,-0.94]): [-4.84,-15.66]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on,on],[lin,lin]]: witness [-0.404057,-2.449451,1.412362] -> [-4.84,-15.66]
  region 2, relu pattern [[on,on,on,off],[lin,lin]]: witness [1.276887,-2.129467,-0.414991] -> [-4.84,-15.66]
  region 3, relu pattern [[on,off,on,off],[lin,lin]]: witness [2.245735,-1.56958,-0.87021] -> [-4.84,-15.66]
```

## 117. relu-deep: every input that gives the output of [1.27,-1.18]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [1.27,-1.18]).
```

**Output**

```text
method: exact
target output (from input [1.27,-1.18]): [3.835]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,off],[off,off,on],[lin]]: witness [1.528333,-0.7925] -> [3.835]
```

## 118. relu-deep: every input that gives the output of [1.31,1.1]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [1.31,1.1]).
```

**Output**

```text
method: exact
target output (from input [1.31,1.1]): [1.615]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],[off,off,on],[lin]]: witness [-1.358769,-2.952308] -> [1.615]
  region 2, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [-0.515769,-1.682308] -> [1.615]
  region 3, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-2.422857,0.98] -> [1.615]
```

## 119. relu-deep: every input that gives the output of [-0.96,-1.42]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [-0.96,-1.42]).
```

**Output**

```text
method: exact
target output (from input [-0.96,-1.42]): [0.715]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],[off,off,on],[lin]]: witness [-1.588846,-1.944038] -> [0.715]
  region 2, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [0.616154,0.878462] -> [0.715]
  region 3, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-1.623571,0.1775] -> [0.715]
```

## 120. relu-deep: every input that gives the output of [-1.03,-0.59]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [-1.03,-0.59]).
```

**Output**

```text
method: exact
target output (from input [-1.03,-0.59]): [0.04875]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],[off,off,on],[lin]]: witness [-0.717596,-0.329663] -> [0.04875]
  region 2, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [0.630797,1.493462] -> [0.04875]
  region 3, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-0.576607,1.176875] -> [0.04875]
```

## 121. relu-deep: every input that gives the output of [-1.21,-2.01]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [-1.21,-2.01]).
```

**Output**

```text
method: exact
target output (from input [-1.21,-2.01]): [1.00125]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],[off,off,on],[lin]]: witness [-1.660923,-2.385769] -> [1.00125]
  region 2, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [0.286827,0.111731] -> [1.00125]
  region 3, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-2.001429,0.0] -> [1.00125]
```

## 122. relu-deep: every input that gives the output of [2.31,0.82]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [2.31,0.82]).
```

**Output**

```text
method: exact
target output (from input [2.31,0.82]): [3.395]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,off],[off,off,on],[lin]]: witness [1.381667,-0.5725] -> [3.395]
```

## 123. relu-deep: every input that gives the output of [-1.62,1.37]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [-1.62,1.37]).
```

**Output**

```text
method: exact
target output (from input [-1.62,1.37]): [1.01]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],[off,off,on],[lin]]: witness [-1.656615,-2.393846] -> [1.01]
  region 2, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [0.275385,0.086154] -> [1.01]
  region 3, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-2.011429,0.0] -> [1.01]
```

## 124. relu-deep: every input that gives the output of [-0.9,0.61]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [-0.9,0.61]).
```

**Output**

```text
method: exact
target output (from input [-0.9,0.61]): [0.19]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],[off,off,on],[lin]]: witness [-0.902308,-0.671923] -> [0.19]
  region 2, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [0.627692,1.363077] -> [0.19]
  region 3, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-0.798571,0.965] -> [0.19]
```

## 125. relu-deep: every input that gives the output of [-0.6,-1.84]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [-0.6,-1.84]).
```

**Output**

```text
method: exact
target output (from input [-0.6,-1.84]): [1.645]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],[off,off,on],[lin]]: witness [-1.344,-2.98] -> [1.645]
  region 2, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [-0.555,-1.77] -> [1.645]
  region 3, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-2.44,1.04] -> [1.645]
```

## 126. relu-deep: every input that gives the output of [1.59,1.08]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [1.59,1.08]).
```

**Output**

```text
method: exact
target output (from input [1.59,1.08]): [2.055]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [-0.860714,-2.61] -> [2.055]
  region 2, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-2.674286,1.86] -> [2.055]
  region 3, relu pattern [[off,on,off],[off,off,on],[lin]]: witness [1.13,0.39] -> [2.055]
```

## 127. relu-deep: every input that gives the output of [2.12,0.29]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [2.12,0.29]).
```

**Output**

```text
method: exact
target output (from input [2.12,0.29]): [3.64]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,off],[off,off,on],[lin]]: witness [1.463333,-0.695] -> [3.64]
```

## 128. relu-deep: every input that gives the output of [-1.81,-2.21]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [-1.81,-2.21]).
```

**Output**

```text
method: exact
target output (from input [-1.81,-2.21]): [0.77625]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],[off,off,on],[lin]]: witness [-1.668942,-2.092452] -> [0.77625]
  region 2, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [0.581058,0.769423] -> [0.77625]
  region 3, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-1.719821,0.085625] -> [0.77625]
```

## 129. relu-deep: every input that gives the output of [-1.34,-2.48]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [-1.34,-2.48]).
```

**Output**

```text
method: exact
target output (from input [-1.34,-2.48]): [1.2725]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],[off,off,on],[lin]]: witness [-1.527385,-2.636154] -> [1.2725]
  region 2, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [-0.067885,-0.681154] -> [1.2725]
  region 3, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-2.227143,0.295] -> [1.2725]
```

## 130. relu-deep: every input that gives the output of [2.28,-1.02]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [2.28,-1.02]).
```

**Output**

```text
method: exact
target output (from input [2.28,-1.02]): [5.19]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,off],[off,off,on],[lin]]: witness [1.98,-1.47] -> [5.19]
```

## 131. relu-deep: every input that gives the output of [1.5,-2.02]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [1.5,-2.02]).
```

**Output**

```text
method: exact
target output (from input [1.5,-2.02]): [5.02]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,off],[off,off,on],[lin]]: witness [1.923333,-1.385] -> [5.02]
```

## 132. relu-deep: every input that gives the output of [1.1,1.57]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- inv('relu-deep', [1.1,1.57]).
```

**Output**

```text
method: exact
target output (from input [1.1,1.57]): [0.78375]
4 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],[off,off,on],[lin]]: witness [-1.67875,-2.110625] -> [0.78375]
  region 2, relu pattern [[on,on,off],[off,off,on],[lin]]: witness [0.57125,0.7475] -> [0.78375]
  region 3, relu pattern [[on,off,on],[off,off,on],[lin]]: witness [-1.731607,0.074375] -> [0.78375]
```

## 133. relu-sigmoid: every input that gives the output of [2.2,1.97]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [2.2,1.97]).
```

**Output**

```text
method: exact_last
target output (from input [2.2,1.97]): [0.0]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [2.274038,1.940385] -> [0.0]
  region 2, relu pattern [[on,on,off],sigmoid]: witness [0.943681,2.615385] -> [0.0]
```

## 134. relu-sigmoid: every input that gives the output of [0.77,-1.67]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [0.77,-1.67]).
```

**Output**

```text
method: exact_last
target output (from input [0.77,-1.67]): [0.95881]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [2.403,-1.0448] -> [0.95881]
  region 2, relu pattern [[off,on,on],sigmoid]: witness [1.638455,-0.770727] -> [0.95881]
  region 3, relu pattern [[off,off,on],sigmoid]: witness [0.621705,-1.867727] -> [0.95881]
```

## 135. relu-sigmoid: every input that gives the output of [-0.9,1.85]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-0.9,1.85]).
```

**Output**

```text
method: exact_last
target output (from input [-0.9,1.85]): [0.009952]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [1.785385,0.441846] -> [0.009952]
  region 2, relu pattern [[on,on,off],sigmoid]: witness [-0.114615,1.363846] -> [0.009952]
  region 3, relu pattern [[off,on,off],sigmoid]: witness [-1.9,2.35] -> [0.009952]
```

## 136. relu-sigmoid: every input that gives the output of [-1.76,-1.4]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-1.76,-1.4]).
```

**Output**

```text
method: exact_last
target output (from input [-1.76,-1.4]): [0.731059]
5 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [2.116667,-0.586667] -> [0.731059]
  region 2, relu pattern [[off,on,on],sigmoid]: witness [0.571212,-0.093939] -> [0.731059]
  region 3, relu pattern [[off,on,off],sigmoid]: witness [-1.545455,0.772727] -> [0.731059]
```

## 137. relu-sigmoid: every input that gives the output of [0.53,2.43]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [0.53,2.43]).
```

**Output**

```text
method: exact_last
target output (from input [0.53,2.43]): [3.0e-06]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [2.160154,1.591138] -> [3.0e-06]
  region 2, relu pattern [[on,on,off],sigmoid]: witness [0.477297,2.463538] -> [3.0e-06]
```

## 138. relu-sigmoid: every input that gives the output of [-0.28,-1.68]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-0.28,-1.68]).
```

**Output**

```text
method: exact_last
target output (from input [-0.28,-1.68]): [0.891388]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [2.264,-0.8224] -> [0.891388]
  region 2, relu pattern [[off,on,on],sigmoid]: witness [1.120364,-0.442182] -> [0.891388]
  region 3, relu pattern [[off,off,on],sigmoid]: witness [-0.278636,-1.678182] -> [0.891388]
```

## 139. relu-sigmoid: every input that gives the output of [0.34,-1.02]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [0.34,-1.02]).
```

**Output**

```text
method: exact_last
target output (from input [0.34,-1.02]): [0.902911]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [2.280667,-0.849067] -> [0.902911]
  region 2, relu pattern [[off,on,on],sigmoid]: witness [1.182485,-0.481576] -> [0.902911]
  region 3, relu pattern [[off,off,on],sigmoid]: witness [-0.170682,-1.700909] -> [0.902911]
```

## 140. relu-sigmoid: every input that gives the output of [1.87,0.92]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [1.87,0.92]).
```

**Output**

```text
method: exact_last
target output (from input [1.87,0.92]): [0.00041]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [1.933077,0.894769] -> [0.00041]
  region 2, relu pattern [[on,on,off],sigmoid]: witness [-0.452637,2.160769] -> [0.00041]
```

## 141. relu-sigmoid: every input that gives the output of [-0.06,1.59]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-0.06,1.59]).
```

**Output**

```text
method: exact_last
target output (from input [-0.06,1.59]): [0.002388]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [1.851615,0.644954] -> [0.002388]
  region 2, relu pattern [[on,on,off],sigmoid]: witness [-0.407135,1.810904] -> [0.002388]
  region 3, relu pattern [[off,on,off],sigmoid]: witness [-2.0,2.75875] -> [0.002388]
```

## 142. relu-sigmoid: every input that gives the output of [-1.95,1.87]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-1.95,1.87]).
```

**Output**

```text
method: exact_last
target output (from input [-1.95,1.87]): [0.070437]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [1.692154,0.155938] -> [0.070437]
  region 2, relu pattern [[on,on,off],sigmoid]: witness [0.297154,0.734538] -> [0.070437]
  region 3, relu pattern [[off,on,off],sigmoid]: witness [-1.395,1.5925] -> [0.070437]
```

## 143. relu-sigmoid: every input that gives the output of [-0.08,0.34]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-0.08,0.34]).
```

**Output**

```text
method: exact_last
target output (from input [-0.08,0.34]): [0.450166]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [1.956667,-0.330667] -> [0.450166]
  region 2, relu pattern [[off,on,on],sigmoid]: witness [0.49303,0.175152] -> [0.450166]
  region 3, relu pattern [[off,on,off],sigmoid]: witness [-1.463636,1.031818] -> [0.450166]
```

## 144. relu-sigmoid: every input that gives the output of [-0.06,-1.36]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-0.06,-1.36]).
```

**Output**

```text
method: exact_last
target output (from input [-0.06,-1.36]): [0.889437]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [2.261333,-0.818133] -> [0.889437]
  region 2, relu pattern [[off,on,on],sigmoid]: witness [1.110424,-0.435879] -> [0.889437]
  region 3, relu pattern [[off,off,on],sigmoid]: witness [-0.295909,-1.674545] -> [0.889437]
```

## 145. relu-sigmoid: every input that gives the output of [-1.65,2.07]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-1.65,2.07]).
```

**Output**

```text
method: exact_last
target output (from input [-1.65,2.07]): [0.018343]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [1.756769,0.354092] -> [0.018343]
  region 2, relu pattern [[on,on,off],sigmoid]: witness [0.011769,1.170692] -> [0.018343]
  region 3, relu pattern [[off,on,off],sigmoid]: witness [-1.745,2.1175] -> [0.018343]
```

## 146. relu-sigmoid: every input that gives the output of [-0.04,-0.92]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-0.04,-0.92]).
```

**Output**

```text
method: exact_last
target output (from input [-0.04,-0.92]): [0.855078]
3 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [2.22,-0.752] -> [0.855078]
  region 2, relu pattern [[off,on,on],sigmoid]: witness [0.956364,-0.338182] -> [0.855078]
  region 3, relu pattern [[off,off,on],sigmoid]: witness [-0.563636,-1.618182] -> [0.855078]
```

## 147. relu-sigmoid: every input that gives the output of [-1.95,0.24]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-1.95,0.24]).
```

**Output**

```text
method: exact_last
target output (from input [-1.95,0.24]): [0.731059]
5 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [2.116667,-0.586667] -> [0.731059]
  region 2, relu pattern [[off,on,on],sigmoid]: witness [0.571212,-0.093939] -> [0.731059]
  region 3, relu pattern [[off,on,off],sigmoid]: witness [-1.545455,0.772727] -> [0.731059]
```

## 148. relu-sigmoid: every input that gives the output of [-1.68,-1.38]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- inv('relu-sigmoid', [-1.68,-1.38]).
```

**Output**

```text
method: exact_last
target output (from input [-1.68,-1.38]): [0.731059]
5 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],sigmoid]: witness [2.116667,-0.586667] -> [0.731059]
  region 2, relu pattern [[off,on,on],sigmoid]: witness [0.571212,-0.093939] -> [0.731059]
  region 3, relu pattern [[off,on,off],sigmoid]: witness [-1.545455,0.772727] -> [0.731059]
```

## 149. softmax-classifier: every input that gives the output of [1.71,2.01]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [1.71,2.01]).
```

**Output**

```text
method: exact_last
target output (from input [1.71,2.01]): [1.0,0.0,0.0]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,off,on],softmax]: witness [2.1075,1.215] -> [1.0,0.0,0.0]
```

## 150. softmax-classifier: every input that gives the output of [-0.9,2.28]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [-0.9,2.28]).
```

**Output**

```text
method: exact_last
target output (from input [-0.9,2.28]): [0.000165,0.009284,0.990551]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],softmax]: witness [-0.9,2.28] -> [0.000165,0.009284,0.990551]
```

## 151. softmax-classifier: every input that gives the output of [-0.58,0.47]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [-0.58,0.47]).
```

**Output**

```text
method: exact_last
target output (from input [-0.58,0.47]): [0.000255,0.002,0.997745]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,off],softmax]: witness [-0.58,0.47] -> [0.000255,0.002,0.997745]
```

## 152. softmax-classifier: every input that gives the output of [-0.75,1.15]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [-0.75,1.15]).
```

**Output**

```text
method: exact_last
target output (from input [-0.75,1.15]): [7.8e-05,0.002472,0.99745]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,off],softmax]: witness [-0.75,1.15] -> [7.8e-05,0.002472,0.99745]
```

## 153. softmax-classifier: every input that gives the output of [0.46,-2.49]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [0.46,-2.49]).
```

**Output**

```text
method: exact_last
target output (from input [0.46,-2.49]): [0.003177,0.00105,0.995773]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,off],softmax]: witness [-0.214,-1.142] -> [0.003177,0.00105,0.995773]
  region 2, relu pattern [[on,off,off],softmax]: witness [0.2505,-2.071] -> [0.003177,0.00105,0.995773]
```

## 154. softmax-classifier: every input that gives the output of [-0.07,0.73]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [-0.07,0.73]).
```

**Output**

```text
method: exact_last
target output (from input [-0.07,0.73]): [0.109504,0.029179,0.861317]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],softmax]: witness [-0.07,0.73] -> [0.109504,0.029179,0.861317]
```

## 155. softmax-classifier: every input that gives the output of [-2.33,-2.06]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [-2.33,-2.06]).
```

**Output**

```text
method: exact_last
target output (from input [-2.33,-2.06]): [0.0,0.0,1.0]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,off],softmax]: witness [-2.33,-2.06] -> [0.0,0.0,1.0]
```

## 156. softmax-classifier: every input that gives the output of [2.2,0.85]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [2.2,0.85]).
```

**Output**

```text
method: exact_last
target output (from input [2.2,0.85]): [1.0,0.0,0.0]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,on],softmax]: witness [1.15,2.95] -> [1.0,0.0,0.0]
  region 2, relu pattern [[off,off,on],softmax]: witness [2.075,1.1] -> [1.0,0.0,0.0]
```

## 157. softmax-classifier: every input that gives the output of [0.8,-0.6]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [0.8,-0.6]).
```

**Output**

```text
method: exact_last
target output (from input [0.8,-0.6]): [0.893126,0.01274,0.094135]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],softmax]: witness [0.3,0.4] -> [0.893126,0.01274,0.094135]
  region 2, relu pattern [[on,off,on],softmax]: witness [1.15,-1.3] -> [0.893126,0.01274,0.094135]
```

## 158. softmax-classifier: every input that gives the output of [1.68,1.3]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [1.68,1.3]).
```

**Output**

```text
method: exact_last
target output (from input [1.68,1.3]): [0.999999,1.0e-06,0.0]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,on],softmax]: witness [1.032,2.596] -> [0.999999,1.0e-06,0.0]
  region 2, relu pattern [[off,off,on],softmax]: witness [2.016,0.628] -> [0.999999,1.0e-06,0.0]
```

## 159. softmax-classifier: every input that gives the output of [1.4,-1.12]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [1.4,-1.12]).
```

**Output**

```text
method: exact_last
target output (from input [1.4,-1.12]): [0.99486,0.002187,0.002952]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],softmax]: witness [0.436,0.808] -> [0.99486,0.002187,0.002952]
  region 2, relu pattern [[on,off,on],softmax]: witness [1.388,-1.096] -> [0.99486,0.002187,0.002952]
```

## 160. softmax-classifier: every input that gives the output of [-0.47,0.96]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [-0.47,0.96]).
```

**Output**

```text
method: exact_last
target output (from input [-0.47,0.96]): [0.000742,0.005662,0.993596]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],softmax]: witness [-0.47,0.96] -> [0.000742,0.005662,0.993596]
```

## 161. softmax-classifier: every input that gives the output of [1.65,1]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [1.65,1]).
```

**Output**

```text
method: exact_last
target output (from input [1.65,1]): [0.999997,3.0e-06,0.0]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,on],softmax]: witness [0.96,2.38] -> [0.999997,3.0e-06,0.0]
  region 2, relu pattern [[off,off,on],softmax]: witness [1.98,0.34] -> [0.999997,3.0e-06,0.0]
```

## 162. softmax-classifier: every input that gives the output of [2.49,-0.53]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [2.49,-0.53]).
```

**Output**

```text
method: exact_last
target output (from input [2.49,-0.53]): [0.999998,2.0e-06,0.0]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[off,on,on],softmax]: witness [0.99,2.47] -> [0.999998,2.0e-06,0.0]
  region 2, relu pattern [[off,off,on],softmax]: witness [1.995,0.46] -> [0.999998,2.0e-06,0.0]
```

## 163. softmax-classifier: every input that gives the output of [-0.45,1.18]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [-0.45,1.18]).
```

**Output**

```text
method: exact_last
target output (from input [-0.45,1.18]): [0.002271,0.010356,0.987374]
1 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],softmax]: witness [-0.45,1.18] -> [0.002271,0.010356,0.987374]
```

## 164. softmax-classifier: every input that gives the output of [0.84,-0.83]

*Category:* `renn-inverse/invert`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- inv('softmax-classifier', [0.84,-0.83]).
```

**Output**

```text
method: exact_last
target output (from input [0.84,-0.83]): [0.797955,0.017194,0.184851]
2 region(s) of inputs give this output
the original input lies in a region: yes
  region 1, relu pattern [[on,on,on],softmax]: witness [0.27,0.31] -> [0.797955,0.017194,0.184851]
  region 2, relu pattern [[on,off,on],softmax]: witness [1.0975,-1.345] -> [0.797955,0.017194,0.184851]
```

## 165. smooth-mlp: certified boxes for the output of [-0.85,-0.79,-0.06]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- inv('smooth-mlp', [-0.85,-0.79,-0.06]).
```

**Output**

```text
method: certified
target output (from input [-0.85,-0.79,-0.06]): [0.589256]
3165 box(es) kept, which contain every solution; 21 witness(es)
the original input lies in a kept box: yes
  witness [-2.946059,-1.702933,0.206194] -> [0.589256]
  witness [-2.842774,-1.845504,-1.686238] -> [0.589256]
  witness [-2.733726,-0.062988,1.750849] -> [0.589256]
```

## 166. smooth-mlp: certified boxes for the output of [-1.35,0.62,0.22]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- inv('smooth-mlp', [-1.35,0.62,0.22]).
```

**Output**

```text
method: certified
target output (from input [-1.35,0.62,0.22]): [0.780526]
2430 box(es) kept, which contain every solution; 20 witness(es)
the original input lies in a kept box: yes
  witness [-2.092102,2.359839,0.516926] -> [0.780526]
  witness [-1.962232,0.876321,1.95645] -> [0.780526]
  witness [-1.943013,1.525432,2.967081] -> [0.780526]
```

## 167. smooth-mlp: certified boxes for the output of [2.26,0.98,-0.4]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- inv('smooth-mlp', [2.26,0.98,-0.4]).
```

**Output**

```text
method: certified
target output (from input [2.26,0.98,-0.4]): [0.771109]
2942 box(es) kept, which contain every solution; 28 witness(es)
the original input lies in a kept box: yes
  witness [-2.968205,-0.406688,-0.938683] -> [0.771109]
  witness [-2.94575,1.07075,-1.9095] -> [0.771109]
  witness [-2.537885,0.928689,1.915664] -> [0.771109]
```

## 168. smooth-mlp: certified boxes for the output of [-0.63,0.95,1.04]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- inv('smooth-mlp', [-0.63,0.95,1.04]).
```

**Output**

```text
method: certified
target output (from input [-0.63,0.95,1.04]): [0.884009]
1404 box(es) kept, which contain every solution; 26 witness(es)
the original input lies in a kept box: yes
  witness [-2.180459,2.524893,2.325763] -> [0.884009]
  witness [-2.15282,2.907112,2.15882] -> [0.884009]
  witness [-1.802437,1.845748,2.664085] -> [0.884009]
```

## 169. smooth-mlp: certified boxes for the output of [2.5,-1.12,-2.5]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- inv('smooth-mlp', [2.5,-1.12,-2.5]).
```

**Output**

```text
method: certified
target output (from input [2.5,-1.12,-2.5]): [0.724856]
3052 box(es) kept, which contain every solution; 25 witness(es)
the original input lies in a kept box: yes
  witness [-2.947775,-0.573139,0.948231] -> [0.724856]
  witness [-2.697201,0.419259,1.827898] -> [0.724856]
  witness [-2.369536,-0.067963,-1.555072] -> [0.724856]
```

## 170. smooth-mlp: certified boxes for the output of [-1.21,2.23,-0.16]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- inv('smooth-mlp', [-1.21,2.23,-0.16]).
```

**Output**

```text
method: certified
target output (from input [-1.21,2.23,-0.16]): [0.789044]
2241 box(es) kept, which contain every solution; 25 witness(es)
the original input lies in a kept box: yes
  witness [-2.812154,1.548368,2.285936] -> [0.789044]
  witness [-1.854053,1.950467,0.789174] -> [0.789044]
  witness [-1.814018,1.48189,2.835101] -> [0.789044]
```

## 171. deep-mixed: certified boxes for the output of [0,-0.98,-0.88,-0.33]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- inv('deep-mixed', [0,-0.98,-0.88,-0.33]).
```

**Output**

```text
method: certified
target output (from input [0,-0.98,-0.88,-0.33]): [2.070567]
33851 box(es) kept, which contain every solution; 6 witness(es)
the original input lies in a kept box: yes
  witness [-1.353727,1.626281,0.992119,-0.15823] -> [2.070567]
  witness [-0.681742,0.897753,1.193258,1.608005] -> [2.070567]
  witness [-0.552237,-1.673816,-2.447763,-0.194342] -> [2.070567]
```

## 172. deep-mixed: certified boxes for the output of [-0.73,-0.86,0.98,-2.43]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- inv('deep-mixed', [-0.73,-0.86,0.98,-2.43]).
```

**Output**

```text
method: certified
target output (from input [-0.73,-0.86,0.98,-2.43]): [2.21245]
30163 box(es) kept, which contain every solution; 2 witness(es)
the original input lies in a kept box: yes
  witness [-2.167167,0.859,2.411333,-2.010167] -> [2.21245]
  witness [-2.114089,2.05519,1.607357,-0.545672] -> [2.21245]
```

## 173. deep-mixed: certified boxes for the output of [-1.69,0.67,2.44,0.11]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- inv('deep-mixed', [-1.69,0.67,2.44,0.11]).
```

**Output**

```text
method: certified
target output (from input [-1.69,0.67,2.44,0.11]): [2.159916]
31078 box(es) kept, which contain every solution; 5 witness(es)
the original input lies in a kept box: yes
  witness [-2.861281,2.625,1.5,-0.441952] -> [2.159916]
  witness [-2.76597,1.714322,1.716436,-2.458458] -> [2.159916]
  witness [-2.447702,1.334476,1.246463,-2.065864] -> [2.159916]
```

## 174. deep-mixed: certified boxes for the output of [-1.46,-0.57,-1.51,-1.17]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- inv('deep-mixed', [-1.46,-0.57,-1.51,-1.17]).
```

**Output**

```text
method: certified
target output (from input [-1.46,-0.57,-1.51,-1.17]): [2.039731]
36406 box(es) kept, which contain every solution; 12 witness(es)
the original input lies in a kept box: yes
  witness [-2.926246,2.305315,2.503144,-1.536876] -> [2.039731]
  witness [-2.509737,1.216184,-0.865263,-0.139342] -> [2.039731]
  witness [-2.3025,-1.8825,-2.9475,-2.9025] -> [2.039731]
```

## 175. deep-mixed: certified boxes for the output of [-2.35,2.41,-0.32,-1.87]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- inv('deep-mixed', [-2.35,2.41,-0.32,-1.87]).
```

**Output**

```text
method: certified
target output (from input [-2.35,2.41,-0.32,-1.87]): [2.012934]
47495 box(es) kept, which contain every solution; 8 witness(es)
the original input lies in a kept box: yes
  witness [-2.626162,1.5,-1.12384,-2.936727] -> [2.012934]
  witness [-1.448389,1.916433,2.495582,-0.033434] -> [2.012934]
  witness [-1.143645,0.293825,1.02386,-2.141217] -> [2.012934]
```

## 176. deep-mixed: certified boxes for the output of [-2.15,-1.99,-0.43,-2.02]

*Category:* `renn-inverse/invert-certified`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- inv('deep-mixed', [-2.15,-1.99,-0.43,-2.02]).
```

**Output**

```text
method: certified
target output (from input [-2.15,-1.99,-0.43,-2.02]): [2.200857]
40596 box(es) kept, which contain every solution; 14 witness(es)
the original input lies in a kept box: yes
  witness [-2.585713,-2.111904,2.289287,1.963691] -> [2.200857]
  witness [-2.4375,-2.8125,-2.4375,-2.8125] -> [2.200857]
  witness [-2.4375,-2.0625,-0.5625,2.0625] -> [2.200857]
```

## 177. tiny-mlp: an output no input can give

*Category:* `renn-inverse/unreachable`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- unreach('tiny-mlp').
```

**Output**

```text
method: exact
target output: [1.0e+06] (out of reach for inputs in [-3,3])
regions found: 0
```

## 178. relu-wide: an output no input can give

*Category:* `renn-inverse/unreachable`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- unreach('relu-wide').
```

**Output**

```text
method: exact
target output: [1.0e+06,1.0e+06] (out of reach for inputs in [-3,3])
regions found: 0
```

## 179. relu-deep: an output no input can give

*Category:* `renn-inverse/unreachable`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- unreach('relu-deep').
```

**Output**

```text
method: exact
target output: [1.0e+06] (out of reach for inputs in [-3,3])
regions found: 0
```

## 180. relu-sigmoid: an output no input can give

*Category:* `renn-inverse/unreachable`

**Input**

```prolog
% RENN model relu-sigmoid: layers (weights.pl holds the weights)
layer('relu-sigmoid', 1, h1, 2, 3, relu).
layer('relu-sigmoid', 2, out, 3, 1, sigmoid).

?- unreach('relu-sigmoid').
```

**Output**

```text
method: exact_last
target output: [0.9999999999] (out of reach for inputs in [-3,3])
regions found: 0
```

## 181. softmax-classifier: an output no input can give

*Category:* `renn-inverse/unreachable`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- unreach('softmax-classifier').
```

**Output**

```text
method: exact_last
target output: [0.999999,5.0e-07,5.0e-07] (out of reach for inputs in [-3,3])
regions found: 0
```

## 182. smooth-mlp: an output no input can give

*Category:* `renn-inverse/unreachable`

**Input**

```prolog
% RENN model smooth-mlp: layers (weights.pl holds the weights)
layer('smooth-mlp', 1, h1, 3, 3, tanh).
layer('smooth-mlp', 2, out, 3, 1, sigmoid).

?- unreach('smooth-mlp').
```

**Output**

```text
method: certified
target output: [0.9999999999] (out of reach for inputs in [-3,3])
witnesses found: 0 (boxes left: 0)
```

## 183. deep-mixed: an output no input can give

*Category:* `renn-inverse/unreachable`

**Input**

```prolog
% RENN model deep-mixed: layers (weights.pl holds the weights)
layer('deep-mixed', 1, h1, 4, 3, relu).
layer('deep-mixed', 2, h2, 3, 3, tanh).
layer('deep-mixed', 3, h3, 3, 2, sigmoid).
layer('deep-mixed', 4, out, 2, 1, linear).

?- unreach('deep-mixed').
```

**Output**

```text
method: certified
target output: [1.0e+06] (out of reach for inputs in [-3,3])
witnesses found: 0 (boxes left: 0)
```

## 184. tiny-mlp: exact if-then rules for inputs in -1.0-1.0

*Category:* `renn-inverse/rules`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- show_rules_box('tiny-mlp', -1.0-1.0, 3).
```

**Output**

```text
4 exact rule(s) on the box -1.0-1.0; the first 3:
  pattern [[on,on],[lin]]: [y1=1r4+3r2*x1-5r2*x2,x1+x2>= -1r2,x2>= -1,x1-x2>=0,x1=<1]
  pattern [[on,off],[lin]]: [y1=1r2+2*x1-2*x2,x1+x2=< -1r2,x2>= -1,x1-x2>=0,x1>= -1]
  pattern [[off,on],[lin]]: [y1=1r4-1r2*x1-1r2*x2,x1+x2>= -1r2,x2=<1,x1-x2=<0,x1>= -1]
```

## 185. tiny-mlp: exact if-then rules for inputs in -2.0-2.0

*Category:* `renn-inverse/rules`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- show_rules_box('tiny-mlp', -2.0-2.0, 3).
```

**Output**

```text
4 exact rule(s) on the box -2.0-2.0; the first 3:
  pattern [[on,on],[lin]]: [y1=1r4+3r2*x1-5r2*x2,x1+x2>= -1r2,x2>= -2,x1-x2>=0,x1=<2]
  pattern [[on,off],[lin]]: [y1=1r2+2*x1-2*x2,x1+x2=< -1r2,x2>= -2,x1-x2>=0,x1>= -2]
  pattern [[off,on],[lin]]: [y1=1r4-1r2*x1-1r2*x2,x1+x2>= -1r2,x2=<2,x1-x2=<0,x1>= -2]
```

## 186. tiny-mlp: exact if-then rules for inputs in -3.0-3.0

*Category:* `renn-inverse/rules`

**Input**

```prolog
% RENN model tiny-mlp: layers (weights.pl holds the weights)
layer('tiny-mlp', 1, hidden, 2, 2, relu).
layer('tiny-mlp', 2, output, 2, 1, linear).

?- show_rules_box('tiny-mlp', -3.0-3.0, 3).
```

**Output**

```text
4 exact rule(s) on the box -3.0-3.0; the first 3:
  pattern [[on,on],[lin]]: [y1=1r4+3r2*x1-5r2*x2,x1+x2>= -1r2,x2>= -3,x1-x2>=0,x1=<3]
  pattern [[on,off],[lin]]: [y1=1r2+2*x1-2*x2,x1+x2=< -1r2,x2>= -3,x1-x2>=0,x1>= -3]
  pattern [[off,on],[lin]]: [y1=1r4-1r2*x1-1r2*x2,x1+x2>= -1r2,x2=<3,x1-x2=<0,x1>= -3]
```

## 187. relu-wide: exact if-then rules for inputs in -1.0-1.0

*Category:* `renn-inverse/rules`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- show_rules_box('relu-wide', -1.0-1.0, 3).
```

**Output**

```text
15 exact rule(s) on the box -1.0-1.0; the first 3:
  pattern [[on,on,on,on],[lin,lin]]: [y2= -6*x1+9r2*x2-5*x3,y1=21r8+5*x1+21r4*x2+21r4*x3,x1+3r4*x2-3r4*x3=< -1r2,x1-2*x2-1r2*x3>=1r2,x1+3r4*x2+3r4*x3=< -1r2,x3=<1,x2>= -1,x1-x2+3r2*x3>= -1r4,x1>= -1]
  pattern [[on,on,on,off],[lin,lin]]: [y2= -1r2-7*x1+15r4*x2-17r4*x3,y1=17r8+4*x1+9r2*x2+6*x3,x1+3r4*x2-3r4*x3>= -1r2,x1-2*x2-1r2*x3>=1r2,x1+3r4*x2+3r4*x3=< -1r2,x3>= -1,x2>= -1,x1-x2+3r2*x3>= -1r4]
  pattern [[on,on,off,on],[lin,lin]]: [y2= -1-4*x1+1r2*x2-6*x3,y1=15r8+13r2*x1+9r4*x2+9r2*x3,x1+3r4*x2-3r4*x3=< -1r2,x1-2*x2-1r2*x3=<1r2,x1+3r4*x2+3r4*x3=< -1r2,x3=<1,x1-x2+3r2*x3>= -1r4,x1>= -1]
```

## 188. relu-wide: exact if-then rules for inputs in -2.0-2.0

*Category:* `renn-inverse/rules`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- show_rules_box('relu-wide', -2.0-2.0, 3).
```

**Output**

```text
15 exact rule(s) on the box -2.0-2.0; the first 3:
  pattern [[on,on,on,on],[lin,lin]]: [y2= -6*x1+9r2*x2-5*x3,y1=21r8+5*x1+21r4*x2+21r4*x3,x1+3r4*x2-3r4*x3=< -1r2,x1-2*x2-1r2*x3>=1r2,x1+3r4*x2+3r4*x3=< -1r2,x3=<2,x2>= -2,x1-x2+3r2*x3>= -1r4,x1>= -2]
  pattern [[on,on,on,off],[lin,lin]]: [y2= -1r2-7*x1+15r4*x2-17r4*x3,y1=17r8+4*x1+9r2*x2+6*x3,x1+3r4*x2-3r4*x3>= -1r2,x1-2*x2-1r2*x3>=1r2,x1+3r4*x2+3r4*x3=< -1r2,x3>= -2,x2>= -2,x1-x2+3r2*x3>= -1r4,x1=<2]
  pattern [[on,on,off,on],[lin,lin]]: [y2= -1-4*x1+1r2*x2-6*x3,y1=15r8+13r2*x1+9r4*x2+9r2*x3,x1+3r4*x2-3r4*x3=< -1r2,x1-2*x2-1r2*x3=<1r2,x1+3r4*x2+3r4*x3=< -1r2,x3=<2,x1-x2+3r2*x3>= -1r4,x1>= -2]
```

## 189. relu-wide: exact if-then rules for inputs in -3.0-3.0

*Category:* `renn-inverse/rules`

**Input**

```prolog
% RENN model relu-wide: layers (weights.pl holds the weights)
layer('relu-wide', 1, h1, 3, 4, relu).
layer('relu-wide', 2, out, 4, 2, linear).

?- show_rules_box('relu-wide', -3.0-3.0, 3).
```

**Output**

```text
15 exact rule(s) on the box -3.0-3.0; the first 3:
  pattern [[on,on,on,on],[lin,lin]]: [y2= -6*x1+9r2*x2-5*x3,y1=21r8+5*x1+21r4*x2+21r4*x3,x1+3r4*x2-3r4*x3=< -1r2,x1-2*x2-1r2*x3>=1r2,x1+3r4*x2+3r4*x3=< -1r2,x3=<3,x2>= -3,x1-x2+3r2*x3>= -1r4,x1>= -3]
  pattern [[on,on,on,off],[lin,lin]]: [y2= -1r2-7*x1+15r4*x2-17r4*x3,y1=17r8+4*x1+9r2*x2+6*x3,x1+3r4*x2-3r4*x3>= -1r2,x1-2*x2-1r2*x3>=1r2,x1+3r4*x2+3r4*x3=< -1r2,x3>= -3,x2>= -3,x1-x2+3r2*x3>= -1r4,x1=<3]
  pattern [[on,on,off,on],[lin,lin]]: [y2= -1-4*x1+1r2*x2-6*x3,y1=15r8+13r2*x1+9r4*x2+9r2*x3,x1+3r4*x2-3r4*x3=< -1r2,x1-2*x2-1r2*x3=<1r2,x1+3r4*x2+3r4*x3=< -1r2,x3=<3,x1-x2+3r2*x3>= -1r4,x1>= -3]
```

## 190. relu-deep: exact if-then rules for inputs in -1.0-1.0

*Category:* `renn-inverse/rules`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- show_rules_box('relu-deep', -1.0-1.0, 3).
```

**Output**

```text
9 exact rule(s) on the box -1.0-1.0; the first 3:
  pattern [[on,on,on],[off,off,on],[lin]]: [y1=1r4+5r8*x1-3r4*x2,x1-1r3*x2=< -1r3,x1-2r3*x2>= -2r3,x2>= -1,x1>= -1]
  pattern [[on,on,on],[off,off,off],[lin]]: [y1= -1r2,x2=1,x1=0]
  pattern [[on,on,off],[off,off,on],[lin]]: [y1=5r8+7r4*x1-9r8*x2,x1-1r3*x2>= -1r3,x2>= -1,x2=<1,x1-1r2*x2=<1r2]
```

## 191. relu-deep: exact if-then rules for inputs in -2.0-2.0

*Category:* `renn-inverse/rules`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- show_rules_box('relu-deep', -2.0-2.0, 3).
```

**Output**

```text
9 exact rule(s) on the box -2.0-2.0; the first 3:
  pattern [[on,on,on],[off,off,on],[lin]]: [y1=1r4+5r8*x1-3r4*x2,x1-1r3*x2=< -1r3,x1-2r3*x2>= -2r3,x2>= -2,x1>= -2]
  pattern [[on,on,on],[off,off,off],[lin]]: [y1= -1r2,x2=1,x1=0]
  pattern [[on,on,off],[off,off,on],[lin]]: [y1=5r8+7r4*x1-9r8*x2,x1-1r3*x2>= -1r3,x1-2r3*x2>= -2r3,x2>= -2,x2=<2,x1-1r2*x2=<1r2]
```

## 192. relu-deep: exact if-then rules for inputs in -3.0-3.0

*Category:* `renn-inverse/rules`

**Input**

```prolog
% RENN model relu-deep: layers (weights.pl holds the weights)
layer('relu-deep', 1, h1, 2, 3, relu).
layer('relu-deep', 2, h2, 3, 3, relu).
layer('relu-deep', 3, out, 3, 1, linear).

?- show_rules_box('relu-deep', -3.0-3.0, 3).
```

**Output**

```text
9 exact rule(s) on the box -3.0-3.0; the first 3:
  pattern [[on,on,on],[off,off,on],[lin]]: [y1=1r4+5r8*x1-3r4*x2,x1-1r3*x2=< -1r3,x1-2r3*x2>= -2r3,x2>= -3]
  pattern [[on,on,on],[off,off,off],[lin]]: [y1= -1r2,x2=1,x1=0]
  pattern [[on,on,off],[off,off,on],[lin]]: [y1=5r8+7r4*x1-9r8*x2,x1-1r3*x2>= -1r3,x1-2r3*x2>= -2r3,x2>= -3,x2=<3,x1-1r2*x2=<1r2]
```

## 193. softmax-classifier: class rules for inputs in -1.0-1.0

*Category:* `renn-inverse/classes`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- class_box('softmax-classifier', -1.0-1.0).
```

**Output**

```text
8 class rule(s) on the box -1.0-1.0
  class 1 for relu pattern [[on,on,on]]
  class 1 for relu pattern [[on,off,on]]
  class 1 for relu pattern [[off,on,on]]
  class 1 for relu pattern [[off,off,on]]
  class 3 for relu pattern [[on,on,on]]
  class 3 for relu pattern [[on,on,off]]
  class 3 for relu pattern [[on,off,on]]
  class 3 for relu pattern [[on,off,off]]
```

## 194. softmax-classifier: class rules for inputs in -2.0-2.0

*Category:* `renn-inverse/classes`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- class_box('softmax-classifier', -2.0-2.0).
```

**Output**

```text
8 class rule(s) on the box -2.0-2.0
  class 1 for relu pattern [[on,on,on]]
  class 1 for relu pattern [[on,off,on]]
  class 1 for relu pattern [[off,on,on]]
  class 1 for relu pattern [[off,off,on]]
  class 3 for relu pattern [[on,on,on]]
  class 3 for relu pattern [[on,on,off]]
  class 3 for relu pattern [[on,off,on]]
  class 3 for relu pattern [[on,off,off]]
```

## 195. softmax-classifier: class rules for inputs in -3.0-3.0

*Category:* `renn-inverse/classes`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- class_box('softmax-classifier', -3.0-3.0).
```

**Output**

```text
9 class rule(s) on the box -3.0-3.0
  class 1 for relu pattern [[on,on,on]]
  class 1 for relu pattern [[on,off,on]]
  class 1 for relu pattern [[off,on,on]]
  class 1 for relu pattern [[off,off,on]]
  class 3 for relu pattern [[on,on,on]]
  class 3 for relu pattern [[on,on,off]]
  class 3 for relu pattern [[on,off,on]]
  class 3 for relu pattern [[on,off,off]]
  class 3 for relu pattern [[off,on,on]]
```

## 196. softmax-classifier: units serving more than one class, inputs in -1.0-1.0

*Category:* `renn-inverse/classes`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- super_box('softmax-classifier', -1.0-1.0).
```

**Output**

```text
units serving more than one class on -1.0-1.0: [unit(1,1)-[1,3],unit(1,2)-[1,3],unit(1,3)-[1,3]]
```

## 197. softmax-classifier: units serving more than one class, inputs in -2.0-2.0

*Category:* `renn-inverse/classes`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- super_box('softmax-classifier', -2.0-2.0).
```

**Output**

```text
units serving more than one class on -2.0-2.0: [unit(1,1)-[1,3],unit(1,2)-[1,3],unit(1,3)-[1,3]]
```

## 198. softmax-classifier: units serving more than one class, inputs in -3.0-3.0

*Category:* `renn-inverse/classes`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- super_box('softmax-classifier', -3.0-3.0).
```

**Output**

```text
units serving more than one class on -3.0-3.0: [unit(1,1)-[1,3],unit(1,2)-[1,3],unit(1,3)-[1,3]]
```

## 199. softmax-classifier: polysemantic units split by class, inputs in -2.0-2.0

*Category:* `renn-inverse/classes`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- split_box('softmax-classifier', -2.0-2.0).
```

**Output**

```text
16 clause(s), one predicate per (unit, class):
  unit_1_1_class_1: 2 clause(s)
  unit_1_1_class_3: 4 clause(s)
  unit_1_2_class_1: 2 clause(s)
  unit_1_2_class_3: 2 clause(s)
  unit_1_3_class_1: 4 clause(s)
  unit_1_3_class_3: 2 clause(s)
```

## 200. softmax-classifier: polysemantic units split by class, inputs in -3.0-3.0

*Category:* `renn-inverse/classes`

**Input**

```prolog
% RENN model softmax-classifier: layers (weights.pl holds the weights)
layer('softmax-classifier', 1, h1, 2, 3, relu).
layer('softmax-classifier', 2, out, 3, 3, softmax).

?- split_box('softmax-classifier', -3.0-3.0).
```

**Output**

```text
18 clause(s), one predicate per (unit, class):
  unit_1_1_class_1: 2 clause(s)
  unit_1_1_class_3: 4 clause(s)
  unit_1_2_class_1: 2 clause(s)
  unit_1_2_class_3: 3 clause(s)
  unit_1_3_class_1: 4 clause(s)
  unit_1_3_class_3: 3 clause(s)
```

