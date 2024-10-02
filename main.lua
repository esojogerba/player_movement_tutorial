function love.load()
	Player = {}
	Player.x = 400
	Player.y = 200
end

function love.update(dt)
	-- Player moves right
	if love.keyboard.isDown("right") then
		Player.x = Player.x + 3
	end
	-- Player moves left
	if love.keyboard.isDown("left") then
		Player.x = Player.x - 3
	end
	-- Player moves up
	if love.keyboard.isDown("up") then
		Player.y = Player.y - 3
	end
	-- Player moves down
	if love.keyboard.isDown("down") then
		Player.y = Player.y + 3
	end
end

function love.draw()
	love.graphics.circle("fill", Player.x, Player.y, 100)
end
