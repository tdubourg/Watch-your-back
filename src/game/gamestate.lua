--[[ 
Watch your Back - Nico, Théo, Fred, Piero, Valentin, Anis
]]


require("game.menu")
require("game.gameplay")
require("game.gameover")
require("game.tutorial")
require("game.highscore")

GameState = {}
GameState.__index = GameState

function GameState:new()
    local self = {}
    setmetatable(self, GameState)
	self.menu= Menu.new{}
	self.gameover= GameOver.new{}
	self.gameplay = Gameplay.new{}
	self.tutorial= Tutorial.new{}
	self.Highscore = HighScore.new{}
	state={Menu=0, Tutorial=1, Gameplay=2, GameOver=3, HighScore=4}
	currentState=state.Menu
	return self
end

function GameState:mousePressed(x, y, button)
	if currentState == state.Menu then
		menu:mousePressed(x, y, button)
    elseif currentState == state.Gameplay then
        gameplay:mousePressed(x, y, button)
    elseif currentState == state.GameOver then
        gameover:mousePressed(x, y, button)
    elseif currentState == state.Tutorial then
        tutorial:mousePressed(x, y, button)
    elseif currentState == state.HighScore then
        highscore:mousePressed(x, y, button)
	end
end

function GameState:mouseReleased(x, y, button)
	if currentState == state.Menu then
		menu:mouseReleased(x, y, button)
    elseif currentState == state.Gameplay then
        gameplay:mouseReleased(x, y, button)
    elseif currentState == state.GameOver then
        gameover:mouseReleased(x, y, button)
    elseif currentState == state.Tutorial then
        tutorial:mouseReleased(x, y, button)
    elseif currentState == state.HighScore then
        highscore:mouseReleased(x, y, button)
	end
end

function GameState:keyPressed(key, unicode)
	if currentState == state.Menu then
		menu:keyPressed(key, unicode)
    elseif currentState == state.Gameplay then
        gameplay:keyPressed(key, unicode)
    elseif currentState == state.GameOver then
        gameover:keyPressed(key, unicode)
    elseif currentState == state.Tutorial then
        tutorial:keyPressed(key, unicode)
    elseif currentState == state.HighScore then
        highscore:keyPressed(key, unicode)
	end	
end

function GameState:keyReleased(key, unicode)
	if currentState == state.Menu then
		menu:keyReleased(key, unicode)
    elseif currentState == state.Gameplay then
        gameplay:keyReleased(key, unicode)
    elseif currentState == state.GameOver then
        gameover:keyReleased(key, unicode)
    elseif currentState == state.Tutorial then
        tutorial:keyReleased(key, unicode)
    elseif currentState == state.HighScore then
        highscore:keyReleased(key, unicode)
	end
end

function GameState:update(dt)
	if currentState == state.Menu then
		menu:update(dt)
    elseif currentState == state.Gameplay then
        gameplay:update(dt)
    elseif currentState == state.GameOver then
        gameover:update(dt)
    elseif currentState == state.Tutorial then
        tutorial:update(dt)
    elseif currentState == state.HighScore then
        highscore:update(dt)
	end	

end

function GameState:draw()
	if currentState == state.Menu then
		self.menu:draw()
    elseif currentState == state.Gameplay then
        gameplay:draw()
    elseif currentState == state.GameOver then
        gameover:draw()
    elseif currentState == state.Tutorial then
        tutorial:draw()
    elseif currentState == state.HighScore then
        highscore:draw()
	end
end
