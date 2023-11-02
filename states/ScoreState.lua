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
    local gameOverPos = VIRTUAL_HEIGHT/2 - (2 * MEDIUM_FONT:getHeight()) - 5
    local scorePos = gameOverPos + MEDIUM_FONT:getHeight() + 5
    local restartGamePos = scorePos + MEDIUM_FONT:getHeight() + 5
    love.graphics.push("all")
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(MEDIUM_FONT)
    love.graphics.printf('Game Over!', 0, gameOverPos, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Score: ' .. tostring(self.score), 0, scorePos, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(SMALL_FONT)
    love.graphics.printf('Press enter to restart the game', 0, restartGamePos, VIRTUAL_WIDTH, 'center')
    love.graphics.pop()
end
