require("BaseState")

TitleScreenState = {}
TitleScreenState.__index = TitleScreenState

function TitleScreenState:init()
    local this = {}
    setmetatable(this, TitleScreenState)
    
    return this
end

function TitleScreenState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function TitleScreenState:render()
    -- to do
end
