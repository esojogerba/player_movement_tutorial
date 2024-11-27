require("player")
require("map")

function love.load()
	-- Windfield physics library
	wf = require("libraries/Windfield")
	world = wf.newWorld(0, 0)

	-- Camera library
	camera = require("libraries/camera")
	cam = camera()

	-- Map
	Map:load()

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

	-- Camera follows player
	cam:lookAt(Player.x, Player.y)

	-- Prevent camera from going out of bounds
	cameraBounds()
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

-- Prevent camera from going out of bounds
function cameraBounds()
	-- Game screen dimmensions
	local w = love.graphics.getWidth()
	local h = love.graphics.getHeight()

	-- Left border
	if cam.x < w / 2 then
		cam.x = w / 2
	end
	-- Top border
	if cam.y < h / 2 then
		cam.y = h / 2
	end

	-- Game map dimmensions
	local mapW = Map.gameMap.width * Map.gameMap.tilewidth
	local mapH = Map.gameMap.height * Map.gameMap.tileheight

	-- Right border
	if cam.x > (mapW - w / 2) then
		cam.x = (mapW - w / 2)
	end

	--Bottom border
	if cam.y > (mapH - h / 2) then
		cam.y = (mapH - h / 2)
	end
end
