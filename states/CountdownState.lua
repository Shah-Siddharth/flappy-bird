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

function CountdownState:enter()
    SCROLLING = false
end

function CountdownState:exit()
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
    love.graphics.push("all")
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(LARGE_FONT)
    love.graphics.printf(tostring(self.count), 0, VIRTUAL_HEIGHT/2 - LARGE_FONT:getHeight()/2, VIRTUAL_WIDTH, 'center')
    love.graphics.pop()
end
