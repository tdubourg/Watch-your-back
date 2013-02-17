--[[
Watch your Back - Nico, Théo, Fred, Piero, Valentin, Anis et Nechepso

This class handles everything related to current state of the player: hp, number of lifes 
]]

require('strict')


PLAYERSTATE_LIFES = 3        -- Number of lifes remaining at the beginning of a new game (integer)
PLAYERSTATE_MAX_HP = 100     -- Maximum health of the player (integer)


PlayerState = {}
PlayerState.__index = PlayerState

function PlayerState:new(gameplay)
    local self = {}
    setmetatable(self, PlayerState)

	self.gp = gameplay
	self.currentPowerUp = nil
	self.dangerLevel = nil
	self.hp = PLAYERSTATE_LIFES
	self.lifes = PLAYERSTATE_MAX_HP
	self.score = 0
	self.lastScrolledDist = 0

	return self
end


function PlayerState:getScore()
	return math.floor(self.score)
end


function PlayerState:killPlayer()
	self.currentPowerUp = nil
	self.hp = 0
end


function PlayerState:useNextLife()
	self.lifes = self.lifes - 1
	self.hp = 100 -- TODO: Use the conf variable `t.gameplay.max_hp' instead
end


function PlayerState:updateDangerLevel()
	local x = p:getPos() - self.gp.scrolledDistance
	if x < 0 then
		x = 0
	elseif x > love.graphics.getWidth() then
		x = love.graphics.getWidth()
	end
	self.dangerLevel = 100 - x/love.graphics.getWidth()*100
end

function PlayerState:updateScore()
	local xSpeed, _ = p:getSpeed()
	local speedBonus = 0
	if xSpeed > 0 and xSpeed < 1/0 then -- Check if player speed is not infinite (you can't be sure with floats...)
		speedBonus = xSpeed / 100
	end
	self.score = self.score + (1+speedBonus) * (self.gp.scrolledDistance-self.lastScrolledDist) / 100
	self.lastScrolledDist = self.gp.scrolledDistance
end

function PlayerState:update()
	self:updateDangerLevel()
	self:updateScore()
end