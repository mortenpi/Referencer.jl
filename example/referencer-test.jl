#!/usr/bin/env julia
using JSON
using Referencer

ref = Referencer.reference(Base)
open("test.json", "w") do io
    JSON.print(io, ref)
end
