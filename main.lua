require("player")

function love.load()
	-- Camera library
	camera = require("libraries/camera")
	cam = camera()

	-- Anim8 library
	anim8 = require("libraries/anim8")

	-- STI library
	sti = require("libraries/sti")

	-- Map
	gameMap = sti("maps/testMap.lua")

	-- Smooth scaling
	love.graphics.setDefaultFilter("nearest", "nearest")

	-- Player
	Player:load()

	-- Background image
	Background = love.graphics.newImage("sprites/background.png")
end

function love.update(dt)
	-- Player
	Player:update(dt)

	-- Camera follows player
	cam:lookAt(Player.x, Player.y)

	-- Prevent camera from going out of bounds

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
	local mapW = gameMap.width * gameMap.tilewidth
	local mapH = gameMap.height * gameMap.tileheight

	-- Right border
	if cam.x > (mapW - w / 2) then
		cam.x = (mapW - w / 2)
	end

	--Bottom border
	if cam.y > (mapH - h / 2) then
		cam.y = (mapH - h / 2)
	end
end

function love.draw()
	-- Draw from the camera's perspective
	cam:attach()
	-- Draw map in layers
	gameMap:drawLayer(gameMap.layers["Ground"])
	gameMap:drawLayer(gameMap.layers["Trees"])
	-- Draw player sprite
	Player.anim:draw(Player.spriteSheet, Player.x, Player.y, nil, 5, nil, 6, 9)
	cam:detach()
end
