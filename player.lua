Player = {}

function Player:load()
	-- Anim8 library
	anim8 = require("libraries/anim8")

	-- Smooth scaling
	love.graphics.setDefaultFilter("nearest", "nearest")

	-- Collider
	self.collider = world:newBSGRectangleCollider(0, 0, 25, 42, 5)
	self.collider:setCollisionClass("Player")
	self.collider:setFixedRotation(true)

	-- Position
	self.x = 0
	self.y = 0

	-- Speed
	self.speed = 100

	-- Sprite and grid
	self.spriteSheet = love.graphics.newImage("sprites/player-sheet.png")
	self.grid = anim8.newGrid(12, 18, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())

	-- Animations
	self.animations = {}
	self.animations.down = anim8.newAnimation(self.grid("1-4", 1), 0.2)
	self.animations.left = anim8.newAnimation(self.grid("1-4", 2), 0.2)
	self.animations.right = anim8.newAnimation(self.grid("1-4", 3), 0.2)
	self.animations.up = anim8.newAnimation(self.grid("1-4", 4), 0.2)

	-- Player's current animation
	self.anim = self.animations.down
end

function Player:update(dt)
	-- Player movement with arrow keys
	self:move(dt)

	-- Match player position with collider position
	self.x = self.collider:getX()
	self.y = self.collider:getY()
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
		vx = self.speed
		self.anim = self.animations.right
		isMoving = true
	end
	-- Player moves left
	if love.keyboard.isDown("left") then
		vx = self.speed * -1
		self.anim = self.animations.left
		isMoving = true
	end
	-- Player moves up
	if love.keyboard.isDown("up") then
		vy = self.speed * -1
		self.anim = self.animations.up
		isMoving = true
	end
	-- Player moves down
	if love.keyboard.isDown("down") then
		vy = self.speed
		self.anim = self.animations.down
		isMoving = true
	end
	-- Player moves in a diagonal direction
	if vx ~= 0 and vy ~= 0 then
		local magnitude = math.sqrt(vx * vx + vy * vy)
		vx = (vx / magnitude) * self.speed
		vy = (vy / magnitude) * self.speed
	end

	-- Update linear velocity of collider depending on key pressed
	self.collider:setLinearVelocity(vx, vy)

	-- If player is standing still, use still frame
	if isMoving == false then
		self.anim:gotoFrame(2)
	end

	self.anim:update(dt)
end

function Player:draw()
	self.anim:draw(self.spriteSheet, self.x, self.y, nil, 2, nil, 6, 9)
end
