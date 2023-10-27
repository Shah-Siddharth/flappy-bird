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
        print("enter pressed!")
    end
end

function TitleScreenState:render()
    love.graphics.printf('Flappy Bird', 0, 25, VIRTUAL_WIDTH, 'center')
    love.graphics.printf('Press Enter to begin', 0, 50, VIRTUAL_WIDTH, 'center')
end
