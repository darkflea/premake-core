project "json-lib"
	language    "C++"
	kind        "StaticLib"
	warnings    "off"

    links "lua-lib"

	includedirs {
        "../lua/src",
        "rapidjson/include",
        "src/",
    }
	files {
		"src/**.cpp"
	}