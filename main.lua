function love.load()
	-- Anim8 Library
	anim8 = require("libraries/anim8")

	-- Player
	Player = {}
	-- Position
	Player.x = 400
	Player.y = 200
	-- Speed
	Player.speed = 3

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
end

function love.draw()
	-- Draw background
	love.graphics.draw(Background, 0, 0)
	-- Draw player sprite
	love.graphics.draw(Player.sprite, Player.x, Player.y)
end
