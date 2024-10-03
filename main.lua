function love.load()
	-- Anim8 Library
	anim8 = require("libraries/anim8")

	-- Smooth scaling
	love.graphics.setDefaultFilter("nearest", "nearest")

	-- Player
	Player = {}
	-- Position
	Player.x = 400
	Player.y = 200
	-- Speed
	Player.speed = 3
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
	-- Player moves right
	if love.keyboard.isDown("right") then
		Player.x = Player.x + Player.speed
	end
	-- Player moves left
	if love.keyboard.isDown("left") then
		Player.x = Player.x - Player.speed
	end
	-- Player moves up
	if love.keyboard.isDown("up") then
		Player.y = Player.y - Player.speed
	end
	-- Player moves down
	if love.keyboard.isDown("down") then
		Player.y = Player.y + Player.speed
	end

	Player.anim:update(dt)
end

function love.draw()
	-- Draw background
	love.graphics.draw(Background, 0, 0)
	-- Draw player sprite
	Player.anim:draw(Player.spriteSheet, Player.x, Player.y, nil, 10)
end
