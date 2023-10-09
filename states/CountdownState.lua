COUNTDOWN_TIME = 1    --interval at which count is decreased

CountdownState = {}
CountdownState.__index = CountdownState

function CountdownState:init()
    local this = {}
    setmetatable(this, CountdownState)

    this.count = 3
    this.timer = 0
    
    return this
end

function CountdownState:update(dt)
    self.timer = self.timer + dt
    
    if self.timer > COUNTDOWN_TIME then
        self.timer = 0
        self.count = self.count - 1
        
        if self.count == 0 then
            gStateMachine:change('play')
        end
    end
end

function CountdownState:render()
    -- to do
end
