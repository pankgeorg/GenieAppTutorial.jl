ENV["HOST"] = "0.0.0.0"

push!(LOAD_PATH, abspath(normpath(joinpath(@__DIR__, "../src/"))))
push!(LOAD_PATH, abspath(normpath(joinpath(@__DIR__, ".."))))
@info "LOAD_PATH: " LOAD_PATH

ENV["STARTSERVER"] = true
ENV["GENIE_ENV"] = "prod"
ENV["EARLYBIND"] = true


@info "haskey EARLYBIND" haskey(ENV, "EARLYBIND")
@info "EARLYBIND" ENV["EARLYBIND"]
cd(@__DIR__)
run(`cd .. && HOST=0.0.0.0 PORT=8000 julia --project bootstrap.jl`)
# include("../bootstrap.jl")