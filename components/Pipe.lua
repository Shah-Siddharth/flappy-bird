local PIPE_IMAGE = love.graphics.newImage('assets/pipe.png')
local PIPE_SCROLL_SPEED = 60

Pipe = {}
Pipe.__index = Pipe

function Pipe:init()
    local this = {}     --new instance
    setmetatable(this, Pipe)
    
    this.x = VIRTUAL_WIDTH + 50
    this.y = math.random( VIRTUAL_HEIGHT/4, VIRTUAL_HEIGHT - 25)
    this.width = PIPE_IMAGE:getWidth()

    return this
end

function Pipe:update(dt)
    self.x = self.x - PIPE_SCROLL_SPEED * dt
end

function Pipe:draw()
    love.graphics.draw(PIPE_IMAGE, self.x, self.y)
end
