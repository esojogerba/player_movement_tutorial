Player = {}

function Player:load()
	-- Position
	Player.x = 400
	Player.y = 200
	-- Speed
	Player.speed = 5
	-- Sprite and grid
	Player.spriteSheet = love.graphics.newImage("sprites/1_blue_girl.png")
	Player.grid = anim8.newGrid(18, 22, Player.spriteSheet:getWidth(), Player.spriteSheet:getHeight())
	-- Animations
	Player.animations = {}
	Player.animations.down = anim8.newAnimation(Player.grid("1-4", 1), 0.2)
	Player.animations.left = anim8.newAnimation(Player.grid("1-4", 2), 0.2)
	Player.animations.right = anim8.newAnimation(Player.grid("1-4", 3), 0.2)
	Player.animations.up = anim8.newAnimation(Player.grid("1-4", 4), 0.2)
	-- Player's current animation
	Player.anim = Player.animations.down
end

function Player:update(dt) end

function Player:draw() end
