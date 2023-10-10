ScoreState = {}
ScoreState.__index = ScoreState

function ScoreState:init()
    local this = {}
    setmetatable(this, ScoreState)

    return this
end

function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- to do
end