"""
    EntropicLearning

An umbrella package providing a unified interface to the Entropic Learning ecosystem.

This package re-exports functionality from:
- [`EntropicLearningBase`](@ref): Core utilities, solvers, and base functions
- [`eSPA`](@ref): entropy-optimal Sparse Probabilistic Approximation classifier
- [`EOS`](@ref): Entropic Outlier Sparsification wrapper

# Quick Start

```julia
using EntropicLearning

# Access eSPA classifier
model = eSPAClassifier()

# Access EOS wrapper
eos_model = EOSWrapper(model=some_classifier)

# Base utilities are also available
x = safelog(0.5)
```

See the documentation for each subpackage for detailed usage.
"""
module EntropicLearning

# Import and re-export EntropicLearningBase
using EntropicLearningBase
# Core functions
export safelog,
    entropy,
    cross_entropy,
    assign_closest!,
    left_stochastic!,
    normalise!,
    softmax!,
    effective_dimension,
    get_rng,
    get_promoted_eltype
# Mutual information utilities
export compute_mi_cd, mi_continuous_discrete, get_eff, get_eps
# Solver utilities
export configure_hsl_ipopt_options,
    vec2mat!, mat2vec!, setup_ipopt_problem, interpret_ipopt_status
export spgqp!, spgqp
# EOS utilities from base
export eos_distances, eos_loss, calc_eos_weights, eos_outlier_scores

# Import and re-export eSPA
using eSPA
export eSPAClassifier

# Import and re-export EOS
using EOS
export EOSWrapper

# Version information
const ENTROPIC_LEARNING_VERSION = v"0.1.0"

"""
    entropic_learning_version()

Return the version of the EntropicLearning umbrella package.
"""
entropic_learning_version() = ENTROPIC_LEARNING_VERSION

export entropic_learning_version

end # module EntropicLearning
