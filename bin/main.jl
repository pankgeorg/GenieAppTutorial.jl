@info "@__DIR__: " @__DIR__
@info "pwd(): " pwd()

push!(LOAD_PATH, abspath(normpath(joinpath(@__DIR__, "../src/"))))
@info "LOAD_PATH: " LOAD_PATH

ENV["STARTSERVER"] = true
ENV["GENIE_ENV"] = "prod"
ENV["EARLYBIND"] = true

include("../bootstrap.jl")