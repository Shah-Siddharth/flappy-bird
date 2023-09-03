GAP_HEIGHT = 100
PIPE_SCROLL_SPEED = 60

PipePair = {}
PipePair.__index = PipePair

function PipePair:init(y)
    local this = {}
    setmetatable(this, PipePair)

    this.x = VIRTUAL_WIDTH + 50
    this.y = y

    this.pipes = {
        ['upper'] = Pipe:init('top', this.y + PIPE_HEIGHT),
        ['lower'] = Pipe:init('bottom', this.y + PIPE_HEIGHT + GAP_HEIGHT)
    }

    this.remove = false

    return this
end


function PipePair:update(dt)
    if self.x < -PIPE_WIDTH then
        self.remove = true
    else
        self.x = self.x - PIPE_SCROLL_SPEED * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    end
end


function PipePair:draw()
    for k, pipe in pairs(self.pipes) do
        pipe:draw()
    end
end