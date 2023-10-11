PlayState = {}
PlayState.__index = PlayState

local function clamp(n, min, max)
    if n < min then
        n = min
    elseif n > max then
        n = max
    end

    return n
end


function PlayState:init()
    local this = {}
    setmetatable(this, PlayState)

    this.score = 0
    this.timer = 0    --for spawning pipes
    this.bird = Bird:init(BIRD_IMAGE, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
    this.pipePairs = {}

    -- for pipepair gaps
    this.lastY = -PIPE_HEIGHT + math.random(80) + 20

    return this
end

function PlayState:update(dt)
    self.timer = self.timer + dt
    if self.timer > 2 then
        local y = self.lastY + math.random(-20, 20)
        y = clamp(-PIPE_HEIGHT+10, y, VIRTUAL_HEIGHT-PIPE_HEIGHT-GAP_HEIGHT)
        self.lastY = y
        table.insert(self.pipePairs, PipePair:init(y))
        self.timer = 0
    end

    for k, pair in pairs(self.pipePairs) do
        pair:update(dt)

        -- check if bird collides with the pipe pair
        for l, pipe in pairs(pair.pipes) do
            if self.bird:collides(pipe) then
                gStateMachine:change('score')
            end
        end
    end

    local i = 1
    while i <= #self.pipePairs do
        if self.pipePairs[i].remove then
            table.remove(self.pipePairs, i)
        else
            i = i+1
        end
    end
end

function PlayState:enter()
    SCROLLING = true
end

function PlayState:exit()
    SCROLLING = false
end