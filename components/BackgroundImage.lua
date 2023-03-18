BackgroundImage = {}
BackgroundImage.__index = BackgroundImage

function BackgroundImage:init(imagePath, x, y, scrollSpeed)
    local this = {}     --'this' is a new instance
    setmetatable(this, BackgroundImage)
    
    this.img = love.graphics.newImage(imagePath)
    this.x = x
    this.y = y
    this.scrollSpeed = scrollSpeed
    
    return this
end

function BackgroundImage:update(dt)
    if self.x + self.img:getWidth() <= 0 then
        self.x = 0
    end

    self.x = self.x - (self.scrollSpeed * dt)
end

function BackgroundImage:draw()
    love.graphics.draw(self.img, self.x, self.y)
    love.graphics.draw(self.img, self.x + self.img:getWidth(), self.y)
end
