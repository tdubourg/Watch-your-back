--[[
Watch your Back - Nico, Théo, Fred, Piero, Valentin, Anis
]]

require('strict') -- JS strict mode emulation!
require("game.environment")
require("game.background")
require("game.proxbackground")
require("game.hud")
require("game.pedobear")
Gameplay = {}
Gameplay.__index = Gameplay

function Gameplay:new()
	local self = {}
	setmetatable(self, Gameplay)

	--the background for our scene
	self.scene = love.graphics.newImage("bg.png")
	-- the character we will be moving around
	self.person = love.graphics.newImage("dude.jpg")
	-- an object to move around
	self.object = love.graphics.newImage("ball.jpg")


	-- the character position
	self.character = {400,400} -- x,y

	-- a bunch of objects, each with a position
	self.objects = {}
	self.objects[1] = {550,370}
	self.objects[2] = {220,390}
	self.objects[3] = {600,410}
	self.objects[4] = {300,450}
	self.objects[5] = {400,530}

	-- Background --
	self.scrolledDistance=0
	self.speed=100
	self.timeelapsed=0
	self.background = Background:new(self)
	self.proxbackground = ProxBackground:new(self)
	self.environment = Environment:new(self)

	-- Character -- 
	-- self.boy = Boy
	
	
	-- HUD --
	self.hud = Hud:new(self)

	-- PEDO
	self.pedobear = Pedobear:new()

	return self
end

function Gameplay:mousePressed(x, y, button)

end

function Gameplay:mouseReleased(x, y, button)

end

function Gameplay:keyPressed(key, unicode)

end

function Gameplay:keyReleased(key, unicode)

end

function Gameplay:update(dt)
	if dt > 0.1 then
		dt = 0.1
	end
	p:update(dt)
	world:update(dt) --this puts the world into motion

	--here we are going to create some keyboard events
	if love.keyboard.isDown("right") then --press the right arrow key to push the ball to the right
		p:right()
	end
	if love.keyboard.isDown("left") then --press the left arrow key to push the ball to the left
		p:left()
	end
	if love.keyboard.isDown(" ") then --press the left arrow key to push the ball to the left
		p:jump()
	end
	self.timeelapsed=self.timeelapsed +dt
	self.environment:update(dt)
	self.scrolledDistance=self.scrolledDistance+dt*200+self.timeelapsed/100
	self.background:update(dt)
	self.proxbackground:update(dt)

end

function Gameplay:draw()
	self.background:draw()
	self.proxbackground:draw()
	self.environment:draw()

	-- Draw the HUD (obviously at the end)
	self.hud:draw()
	p:draw()
	self.pedobear:draw()
end
