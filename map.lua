Map = {}

function Map:load()
	-- STI library
	sti = require("libraries/sti")

	-- Map
	gameMap = sti("maps/testMap.lua")

	-- Wall layer
	walls = {}
	if gameMap.layers["Walls"] then
		for i, obj in pairs(gameMap.layers["Walls"].objects) do
			local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
			wall:setType("static")
			table.insert(walls, wall)
		end
	end
end

function Map:update(dt) end

function Map:draw()
	-- Draw map in layers
	gameMap:drawLayer(gameMap.layers["Ground"])
	gameMap:drawLayer(gameMap.layers["Trees"])
end
