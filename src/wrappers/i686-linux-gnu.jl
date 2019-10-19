# Autogenerated wrapper script for at_spi2_core_jll for i686-linux-gnu
export libatspi

using Dbus_jll
using Glib_jll
using Xorg_libXtst_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libatspi`
const libatspi_splitpath = ["lib", "libatspi.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libatspi_path = ""

# libatspi-specific global declaration
# This will be filled out by __init__()
libatspi_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libatspi = "libatspi.so.0"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    append!.(Ref(PATH_list), (Dbus_jll.PATH_list, Glib_jll.PATH_list, Xorg_libXtst_jll.PATH_list,))
    append!.(Ref(LIBPATH_list), (Dbus_jll.LIBPATH_list, Glib_jll.LIBPATH_list, Xorg_libXtst_jll.LIBPATH_list,))

    global libatspi_path = abspath(joinpath(artifact"at_spi2_core", libatspi_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libatspi_handle = dlopen(libatspi_path)
    push!(LIBPATH_list, dirname(libatspi_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()
