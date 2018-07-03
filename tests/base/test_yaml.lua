--
-- tests/base/test_yaml.lua
-- Tests the yaml API
--
-- taken from https://github.com/lubyk/yaml/blob/master/test/yaml_test.lua

	local p = premake

	local suite = test.declare("premake_yaml")

	function suite.auto_decode()
		test.isnotnil(yaml.decode)
	end

    function suite.parse_multiple_values()
        local a, b, c = yaml.decode [[
--- 3
--- 4
--- 5
...
]]
        test.isequal(3, a)
        test.isequal(4, b)
        test.isequal(5, c)
    end

    function suite.decode()
        local data = yaml.decode [[
hey: June
ok: true
]]
        test.isequal('June', data.hey)
        test.isequal(true, data.ok)
    end

    function suite.disable_anchors()
        local l = { x = 1 }
        l.y = l
        -- true == safe decodeing
        local res = yaml.decode(yaml.encode(l), true)
        test.isnil(res.y)
    end
    
    function suite.configure()
        yaml.configure {
            load_set_metatables = false,
        }
    end

    function suite.encode_sorted()
        yaml.configure {
            sort_table_keys = true,
        }
        local x = {
            dom     = 1,
            anna    = 2,
            louis   = 3,
            bernard = 4,
            armand  = 5,
            simon   = 6
        }
        test.isequal([[
---
anna: 2
armand: 5
bernard: 4
dom: 1
louis: 3
simon: 6
]], yaml.encode(x))

        yaml.configure {
            sort_table_keys = false,
        }
    end