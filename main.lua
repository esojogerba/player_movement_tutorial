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
	Player = {}
	-- Position
	Player.x = 400
	Player.y = 200
	-- Speed
	Player.speed = 5
	-- Sprite and grid
	Player.spriteSheet = love.graphics.newImage("sprites/player-sheet.png")
	Player.grid = anim8.newGrid(12, 18, Player.spriteSheet:getWidth(), Player.spriteSheet:getHeight())
	-- Animations
	Player.animations = {}
	Player.animations.down = anim8.newAnimation(Player.grid("1-4", 1), 0.2)
	Player.animations.left = anim8.newAnimation(Player.grid("1-4", 2), 0.2)
	Player.animations.right = anim8.newAnimation(Player.grid("1-4", 3), 0.2)
	Player.animations.up = anim8.newAnimation(Player.grid("1-4", 4), 0.2)
	-- Player's current animation
	Player.anim = Player.animations.left

	-- Background image
	Background = love.graphics.newImage("sprites/background.png")
end

function love.update(dt)
	-- Check if no keys are pressed
	local isMoving = false

	-- Player moves right
	if love.keyboard.isDown("right") then
		Player.x = Player.x + Player.speed
		Player.anim = Player.animations.right
		isMoving = true
	end
	-- Player moves left
	if love.keyboard.isDown("left") then
		Player.x = Player.x - Player.speed
		Player.anim = Player.animations.left
		isMoving = true
	end
	-- Player moves up
	if love.keyboard.isDown("up") then
		Player.y = Player.y - Player.speed
		Player.anim = Player.animations.up
		isMoving = true
	end
	-- Player moves down
	if love.keyboard.isDown("down") then
		Player.y = Player.y + Player.speed
		Player.anim = Player.animations.down
		isMoving = true
	end

	-- If player is standing still, use still frame
	if isMoving == false then
		Player.anim:gotoFrame(2)
	end

	Player.anim:update(dt)
end

function love.draw()
	-- Draw from the camera's perspective
	cam:attach()
	-- Draw map in layers
	gameMap:drawLayer(gameMap.layers["Ground"])
	gameMap:drawLayer(gameMap.layers["Trees"])
	-- Draw player sprite
	Player.anim:draw(Player.spriteSheet, Player.x, Player.y, nil, 5)
	cam:detach()
end
