Bird = {}
Bird.__index = Bird

function Bird:init(imagePath, screenWidth, screenHeight)
    local this = {}
    setmetatable(this, Bird)

    this.img = love.graphics.newImage(imagePath)
    this.x = screenWidth/2 - this.img:getWidth()/2
    this.y = screenHeight/2 - this.img:getHeight()/2
    this.gravity = 20
    this.dy = 0
    
    return this
end

function Bird:update(dt)
    self.dy = self.dy + self.gravity * dt
    self.y = self.y + self.dy
end

function Bird:draw()
    love.graphics.draw(self.img, self.x, self.y)
end
