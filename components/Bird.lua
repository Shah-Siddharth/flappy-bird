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

    if love.keyboard.keysPressed['space'] then
        self.dy = -5
        SOUNDS['jump']:play()
    end

    self.y = self.y + self.dy
end

function Bird:collides(pipe)
    if (self.x + self.img:getWidth() >= pipe.x) and (self.x <= pipe.x + PIPE_WIDTH) then
        if (pipe.position == 'top') then
            if self.y <= pipe.y then return true end
        elseif (pipe.position == 'bottom') then
            if (self.y + self.img:getHeight()) >= pipe.y then return true end
        end
    end

    return false
end

function Bird:draw()
    love.graphics.draw(self.img, self.x, self.y)
end
