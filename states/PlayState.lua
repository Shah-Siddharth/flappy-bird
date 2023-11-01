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

function PlayState:enter()
    SCROLLING = true
end

function PlayState:exit()
    SCROLLING = false
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

    self.bird:update(dt)

    -- bird dies if it falls to the ground
    if self.bird.y > VIRTUAL_HEIGHT then
    	SOUNDS['die']:play()
    	gStateMachine:change('score', {score = self.score})
    end

    for _, pair in pairs(self.pipePairs) do
        if not pair.scored then
            if pair.x + PIPE_WIDTH < self.bird.x then
            	self.score = self.score + 1
            	pair.scored = true
            	SOUNDS['score']:play()
            end
        end

        pair:update(dt)
    end

    for k, pair in pairs(self.pipePairs) do
        -- check if bird collides with the pipe pair
        for l, pipe in pairs(pair.pipes) do
            if self.bird:collides(pipe) then
                SOUNDS['die']:play()
                gStateMachine:change('score', {score = self.score})
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

function PlayState:render()
	for _, pair in pairs(self.pipePairs) do
        pair:draw()
    end

    self.bird:draw()
end
