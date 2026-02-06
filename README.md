# EntropicLearning.jl

[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/JuliaDiff/BlueStyle)
[![Aqua QA](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)
[![CI](https://github.com/EntropicLearning/EntropicLearning.jl/actions/workflows/CI.yaml/badge.svg)](https://github.com/EntropicLearning/EntropicLearning.jl/actions/workflows/CI.yaml)
[![Julia](https://img.shields.io/badge/julia-1.9%20%7C%201.10%20%7C%201.11-9558B2.svg)](https://julialang.org)

**EntropicLearning.jl** is an umbrella package providing a unified interface to the Entropic Learning ecosystem for machine learning in Julia.

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

The EOS (Entropic Outlier Sparsification) wrapper can be applied to any MLJ-compatible model that accepts observation weights to improve robustness to outliers:

```julia
# Wrap a model with EOS
base_model = eSPAClassifier()
eos_model = EOSWrapper(model=base_model)

mach = machine(eos_model, X, y)
fit!(mach)
```

## License

This software is distributed under the Academic Software License (ASL), which is included in the LICENSE file. Please familiarise yourself with this license before using the code.

## References

<a id="1">[1]</a> Horenko, I. (2020). On a scalable entropic breaching of the overfitting barrier for small data problems in machine learning. Neural Computation, 32(8), 1563-1579.

<a id="2">[2]</a> Vecchi, E., Pospíšil, L., Albrecht, S., O'Kane, T. J., & Horenko, I. (2022). eSPA+: Scalable entropy-optimal machine learning classification for small data problems. Neural Computation, 34(5), 1220-1255.

<a id="1">[1]</a> Horenko, I. (2022). Cheap robust learning of data anomalies with analytically solvable entropic outlier sparsification. Proceedings of the National Academy of Sciences, 119(9), e2119659119.
