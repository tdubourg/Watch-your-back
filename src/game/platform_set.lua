--[[ 
Watch your Back - Nico, Théo, Fred, Piero, Valentin, Anis
]]

require("game.platform")

N = 0 -- No block here
Y = 1 -- Yes block here
sets = {
	{
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,Y,Y,Y,Y,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,Y,Y,Y,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,Y,Y,Y,Y,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y}
	},
	{
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{Y,Y,Y,N,N,N,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,N,N,Y,Y,Y}
	},
	{
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,Y,Y,Y,Y,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N},
		{Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y}
	}
}
ImgDirectory = 'img/'
ImageSet = {
	love.graphics.newImage(ImgDirectory.."plateforme.png")
}



PlatformSet = {}
PlatformSet.__index = PlatformSet

tileSize = 50
tileOffsetX = 0
tileOffsetY = 0
tilesMapHeight = 12

function PlatformSet.new(setnb, scrollOffset)
	local self = {}
	setmetatable(self, PlatformSet)

	self.scrollOffset = scrollOffset
	self.width = tileSize * #sets[setnb][1]
	self.platforms = {}

	
	for y,platformLine in ipairs(sets[setnb]) do
		for x,platform in ipairs(platformLine) do
			if platform ~= N then
				local p = Platform.new(
					self.scrollOffset + (x-1) * tileSize, --minx
					(y-1) * tileSize, -- miny
					tileSize,
					ImageSet[platform]
				)
				if y == tilesMapHeight then 
					p.isGround = true
				else 
					p.isGround = false
				end
				table.insert(self.platforms, p)
			end
		end
	end

	return self
end

function PlatformSet.getNbSets()
	return #sets
end

function PlatformSet:mousePressed(x, y, button)

end

function PlatformSet:mouseReleased(x, y, button)

end

function PlatformSet:keyPressed(key, unicode)
	
end

function PlatformSet:keyReleased(key, unicode)

end

function PlatformSet:getWidth()
	return self.width
end

function PlatformSet:update(dt)
	for i,platform in ipairs(self.platforms) do
		platform:update(dt)
	end

end

function PlatformSet:draw(refIndex)
	for i,platform in ipairs(self.platforms) do
		platform:draw(refIndex)
	end
end

function PlatformSet:destroy()
	for x,platform in ipairs(self.platforms) do
		platform:destroy()
	end
end

