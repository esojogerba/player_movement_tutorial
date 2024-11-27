Map = {}

function Map:load()
	-- STI library
	sti = require("libraries/sti")

	-- Map
	self.gameMap = sti("maps/testMap.lua")

	-- Wall layer
	walls = {}
	if self.gameMap.layers["Walls"] then
		for i, obj in pairs(self.gameMap.layers["Walls"].objects) do
			local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
			wall:setType("static")
			table.insert(walls, wall)
		end
	end
end

function Map:update(dt) end

function Map:draw()
	-- Draw map in layers
	self.gameMap:drawLayer(self.gameMap.layers["Ground"])
	self.gameMap:drawLayer(self.gameMap.layers["Trees"])
end
