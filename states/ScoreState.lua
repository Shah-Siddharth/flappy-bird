ScoreState = {}
ScoreState.__index = ScoreState

function ScoreState:init()
    local this = {}
    setmetatable(this, ScoreState)

    return this
end

function ScoreState:enter(params)
    SCROLLING = false
    self.score = params.score
end

function ScoreState:exit()
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 25, VIRTUAL_WIDTH, 'center')
end
