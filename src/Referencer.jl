module Referencer

import Compat: String

"""
Name in a module.
"""
type ModuleName
    name::String
    exported::Bool
    objtype::String
end

"""
A whole reference of a module.
"""
type ModuleReference
    name::String
    names::Vector{ModuleName}
end

"""
    reference(m::Module)

Build a reference of an imported module.
"""
function reference(m::Module)
    exported_names = names(m)
    module_names = map(names(m,true)) do name
        typestring = try
            string(typeof(m.eval(name)))
        catch
            "undefined"
        end
        ModuleName(
            string(name),
            (name in exported_names),
            typestring
        )
    end
    ModuleReference(string(m), module_names)
end

end # module
