project "json-lib"
	language    "C++11"
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