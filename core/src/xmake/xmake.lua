-- add target
target("xmake")

    -- make as a static library
    set_kind("static")

    -- add deps
    add_deps("lcurses", "sv", "luajit", "tbox")

    -- add defines
    add_defines("__tb_prefix__=\"xmake\"")

    -- set the auto-generated config.h
    set_configdir("$(buildir)/$(plat)/$(arch)/$(mode)")
    add_configfiles("xmake.config.h.in")

    -- add includes directory
    add_includedirs("$(projectdir)", "$(buildir)/luajit")
    add_includedirs("$(buildir)/$(plat)/$(arch)/$(mode)")

    -- add the common source files
    add_files("**.c|winos/*.c")
    if is_plat("windows") then
        add_files("winos/*.c")
    end
  
    -- add readline
    add_options("readline")      
    if is_plat("windows") or has_config("curses") then
        add_defines("XM_CONFIG_API_HAVE_CURSES")
    end
 

