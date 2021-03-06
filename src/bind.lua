--[=[
	Binds an instance method so that it can be called like a function.

	Usage:

	```lua
	local Class = {}
	Class.__index = Class

	function Class.new()
		local self = {}
		self.value = "foo"
		return setmetatable(self, Class)
	end

	function Class:getValue()
		return self.value
	end

	local instance = Class.new()
	local getValue = bind(instance, instance.getValue)

	print(getValue()) -- "foo"
	```

	@within ModuleLoader
	@private
]=]
local function bind<T>(self: T, callback: (self: T, ...any) -> any)
	return function(...)
		return callback(self, ...)
	end
end

return bind
