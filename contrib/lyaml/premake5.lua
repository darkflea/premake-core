project "lyaml-lib"
	language "C"
	kind "StaticLib"
	warnings "off"

    links "lua-lib"

	files {
		"src/**.c"
	}

    includedirs { "../lua/src", "src" }
	excludes {
		"src/lyaml.c",
	}