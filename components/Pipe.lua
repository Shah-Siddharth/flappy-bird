local PIPE_IMAGE = love.graphics.newImage('assets/pipe.png')

-- global variables
PIPE_WIDTH = PIPE_IMAGE:getWidth()
PIPE_HEIGHT = PIPE_IMAGE:getHeight()

Pipe = {}
Pipe.__index = Pipe

function Pipe:init(position, y)
    local this = {}     --new instance
    setmetatable(this, Pipe)
    
    this.x = VIRTUAL_WIDTH + 50
    this.y = y
    this.position = position

    return this
end

function Pipe:update(dt)

end

function Pipe:draw()
    local scaleY = self.position == 'top' and -1 or 1

    love.graphics.draw(
        PIPE_IMAGE,
        self.x,
        self.y,
        0,
        1,
        scaleY
    )
end
