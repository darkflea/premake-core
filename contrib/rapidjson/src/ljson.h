#pragma once

struct lua_State;

#if __cplusplus
extern "C" {
#endif

				int register_rapidjson(lua_State* L);

#if __cplusplus
}
#endif
