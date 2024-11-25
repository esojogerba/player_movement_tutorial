Player = {}

function Player:load()
	-- Collider
	Player.collider = world:newBSGRectangleCollider(400, 450, 50, 84, 10)
	Player.collider:setFixedRotation(true)

	-- Position
	Player.x = 400
	Player.y = 450

	-- Speed
	Player.speed = 300

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
	Player.anim = Player.animations.down
end

function Player:update(dt)
	-- Player movement with arrow keys
	self:move(dt)
end

-- Player movement with arrow keys
function Player:move(dt)
	-- Check if no keys are pressed
	local isMoving = false

	-- Velocities
	local vx = 0
	local vy = 0

	-- Player moves right
	if love.keyboard.isDown("right") then
		vx = Player.speed
		Player.anim = Player.animations.right
		isMoving = true
	end
	-- Player moves left
	if love.keyboard.isDown("left") then
		vx = Player.speed * -1
		Player.anim = Player.animations.left
		isMoving = true
	end
	-- Player moves up
	if love.keyboard.isDown("up") then
		vy = Player.speed * -1
		Player.anim = Player.animations.up
		isMoving = true
	end
	-- Player moves down
	if love.keyboard.isDown("down") then
		vy = Player.speed
		Player.anim = Player.animations.down
		isMoving = true
	end

	-- Update linear velocity of collider depending on key pressed
	Player.collider:setLinearVelocity(vx, vy)

	-- If player is standing still, use still frame
	if isMoving == false then
		Player.anim:gotoFrame(2)
	end

	Player.anim:update(dt)
end

function Player:draw()
	Player.anim:draw(Player.spriteSheet, Player.x, Player.y, nil, 5, nil, 6, 9)
end
