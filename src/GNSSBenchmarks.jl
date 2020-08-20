module GNSSBenchmarks
    using
        CUDA,
        CSV,
        StructArrays,
        BenchmarkTools,
        LoopVectorization,
        Tracking,
        TrackingLoopFilters,
        GNSSSignals,
        DataFrames

    using Unitful: upreferred, Hz, dBHz, ms
    
    import
        LinearAlgebra.dot,
        Base.length,
        Tracking.TrackingState,
        Tracking.NumAnts,
        Tracking.MomentsCN0Estimator,
        Tracking.AbstractCN0Estimator,
        Tracking.AbstractCorrelator,
        Tracking.EarlyPromptLateCorrelator,
        Tracking.SecondaryCodeOrBitDetector,
        Tracking.GainControlledSignal,
        Tracking.found,
        TrackingLoopFilters.AbstractLoopFilter

    export
        main,
        benchmark_downconvert,
        benchmark_carrier_replica,
        benchmark_code_replica,
        benchmark_correlate

    include("main.jl")
    include("gpu_downconvert.jl")
    include("gpu_carrier_replica.jl")
    include("gpu_code_replica.jl")
    include("gpu_correlate.jl")
    include("gpu_tracking_loop.jl")
    include("gpu_tracking_state.jl")

    const MAX_NUM_SAMPLES = 5000
    const SAMPLES = StepRange(2500,2500,MAX_NUM_SAMPLES)
end
