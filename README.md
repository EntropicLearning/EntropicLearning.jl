# EntropicLearning.jl

[![Build Status](https://github.com/m-groom/EntropicLearning.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/m-groom/EntropicLearning.jl/actions/workflows/CI.yml?query=branch%3Amain)

**EntropicLearning.jl** is an umbrella package providing a unified interface to the EntropicLearning ecosystem for machine learning in Julia.

## Overview

This package re-exports functionality from the following component packages:

| Package | Description |
|---------|-------------|
| [EntropicLearningBase.jl](https://github.com/m-groom/EntropicLearningBase.jl) | Core utilities, solvers, and base functions |
| [eSPA.jl](https://github.com/m-groom/eSPA.jl) | entropy-optimal Sparse Probabilistic Approximation classifier, described in [[1]](#1), [[2]](#2) |
| [EOS.jl](https://github.com/m-groom/EOS.jl) | Entropic Outlier Sparsification wrapper, described in [[3]](#3) |

## Installation

```julia
using Pkg
Pkg.add("EntropicLearning")
```

Or for development:

```julia
using Pkg
Pkg.develop(path="/path/to/EntropicLearning.jl")
```

## Quick Start

```julia
using EntropicLearning
using MLJBase

# Load some data
X, y = @load_iris

# Create and train an eSPA classifier
model = eSPAClassifier()
mach = machine(model, X, y)
fit!(mach)

# Make predictions
ŷ = predict(mach, X)
```

### Using EOS Wrapper

The EOS (Entropic Outlier Sparsification) wrapper can be applied to any MLJ-compatible classifier to improve robustness to outliers:

```julia
using EntropicLearning
using MLJBase

# Wrap any classifier with EOS
base_model = eSPAClassifier()
eos_model = EOSWrapper(model=base_model)

mach = machine(eos_model, X, y)
fit!(mach)
```

## Organisation

```
EntropicLearning.jl (umbrella package)
├── EntropicLearningBase.jl   # Core utilities and solvers
├── eSPA.jl                   # eSPA classifier
└── EOS.jl                    # EOS wrapper
```

## Exported Functions

### From EntropicLearningBase

**Core Functions:**
- `safelog`, `entropy`, `cross_entropy`
- `assign_closest!`, `left_stochastic!`, `normalise!`, `softmax!`
- `effective_dimension`, `get_rng`, `get_promoted_eltype`

**Mutual Information:**
- `compute_mi_cd`, `mi_continuous_discrete`, `get_eff`, `get_eps`

**Solvers:**
- `configure_hsl_ipopt_options`, `vec2mat!`, `mat2vec!`, `setup_ipopt_problem`, `interpret_ipopt_status`
- `spgqp!`, `spgqp`

**EOS Utilities:**
- `eos_distances`, `eos_loss`, `calc_eos_weights`, `eos_outlier_scores`

### From eSPA

- `eSPAClassifier` - entropy-optimal Sparse Probabilistic Approximation classifier

### From EOS

- `EOSWrapper` - Entropic Outlier Sparsification wrapper for classifiers

## License

This software is distributed under the Academic Software License (ASL), which is included in the LICENSE file. Please familiarise yourself with this license before using the code.

## References

<a id="1">[1]</a> Horenko, I. (2020). On a scalable entropic breaching of the overfitting barrier for small data problems in machine learning. Neural Computation, 32(8), 1563-1579.

<a id="2">[2]</a> Vecchi, E., Pospíšil, L., Albrecht, S., O'Kane, T. J., & Horenko, I. (2022). eSPA+: Scalable entropy-optimal machine learning classification for small data problems. Neural Computation, 34(5), 1220-1255.

<a id="1">[1]</a> Horenko, I. (2022). Cheap robust learning of data anomalies with analytically solvable entropic outlier sparsification. Proceedings of the National Academy of Sciences, 119(9), e2119659119.
