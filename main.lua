require("player")
require("map")

function love.load()
	-- Windfield physics library
	wf = require("libraries/Windfield")
	world = wf.newWorld(0, 0)

	-- Camera library
	camera = require("libraries/camera")

	-- Map
	Map:load()

	-- Camera
	cam = camera()

	-- Calculate scale to fit the screen
	local screenWidth, screenHeight = love.graphics.getDimensions()
	local mapWidth = Map.gameMap.width * Map.gameMap.tilewidth
	local mapHeight = Map.gameMap.height * Map.gameMap.tileheight

	local scaleX = screenWidth / mapWidth
	local scaleY = screenHeight / mapHeight

	-- Set the scale to the smaller of the two to maintain aspect ratio
	cam.scale = math.min(scaleX, scaleY)

	-- Player
	Player:load()
end

function love.update(dt)
	-- Map
	Map:update(dt)

	-- Player
	Player:update(dt)

	-- Update world
	world:update(dt)

	-- Camera is set to the center of the map
	cam:lookAt(Map.x, Map.y)
end

function love.draw()
	-- Draw from the camera's perspective
	cam:attach()

	-- Map
	Map:draw()

	-- Player
	Player:draw()

	-- Draw world colliders
	-- world:draw()

	-- Detach camera
	cam:detach()
end
