using EntropicLearning
using Test
using Aqua
using Random

@testset "EntropicLearning.jl" begin

    @testset "Code quality (Aqua.jl)" begin
        # Skip ambiguities check as subpackages may have their own
        Aqua.test_all(EntropicLearning; ambiguities=false)
    end

    @testset "Re-exports from EntropicLearningBase" begin
        # Test that core functions are accessible
        @test safelog(0.5) ≈ log(0.5)
        @test safelog(0.0) ≈ log(eps(Float64))  # safelog clamps to eps(Float64)
        
        # Test entropy function
        p = [0.25, 0.25, 0.25, 0.25]
        @test entropy(p) ≈ log(4)
        
        # Test get_rng
        rng = get_rng(42)
        @test rng isa Random.AbstractRNG
    end

    @testset "Re-exports from eSPA" begin
        # Test that eSPAClassifier is accessible
        @test eSPAClassifier <: Any
        @test hasmethod(eSPAClassifier, Tuple{})
    end

    @testset "Re-exports from EOS" begin
        # Test that EOSWrapper is accessible
        @test EOSWrapper <: Any
    end

    @testset "Version information" begin
        @test entropic_learning_version() isa VersionNumber
        @test entropic_learning_version() == v"0.1.0"
    end

end
