TitleScreenState = {}
TitleScreenState.__index = TitleScreenState

function TitleScreenState:init()
    local this = {}
    setmetatable(this, TitleScreenState)
    
    return this
end

function TitleScreenState:enter()
    SCROLLING = true
end

function TitleScreenState:exit()
    SCROLLING = false
end

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
    love.graphics.push("all")
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setFont(LARGE_FONT)
    love.graphics.printf('Flappy Bird', 0, VIRTUAL_HEIGHT/2 - LARGE_FONT:getHeight() - 10, VIRTUAL_WIDTH, 'center')
    love.graphics.setFont(MEDIUM_FONT)
    love.graphics.printf('Press Enter to begin', 0, VIRTUAL_HEIGHT/2 + 10, VIRTUAL_WIDTH, 'center')
    love.graphics.pop()
end
