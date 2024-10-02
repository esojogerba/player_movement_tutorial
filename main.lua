function love.load()
	Player = {}
	Player.x = 400
	Player.y = 200
	Player.speed = 3
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
	love.graphics.circle("fill", Player.x, Player.y, 100)
end
