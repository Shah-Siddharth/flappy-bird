require("components.BackgroundImage")
require("components.Bird")
require("components.Pipe")
require("components.PipePair")
require("StateMachine")
require("states.TitleScreenState")
require("states.CountdownState")
require("states.PlayState")
require("states.ScoreState")

-- global constants
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

BIRD_IMAGE = 'assets/bird.png'

SCROLLING = true

local sx = WINDOW_WIDTH / VIRTUAL_WIDTH
local sy = WINDOW_HEIGHT / VIRTUAL_HEIGHT

local bgLayer1 = BackgroundImage:init('assets/background-layer-1.png', 0, 0, 30)
local bgLayer2 = BackgroundImage:init('assets/background-layer-2.png', 0, 0, 45)
local bgLayer3 = BackgroundImage:init('assets/background-layer-3.png', 0, 0, 60)

local bird = Bird:init('assets/bird.png', VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

local pipePairs = {}

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = 1
    })

    love.window.setTitle('Flappy Bird')

    math.randomseed(os.time())
    love.keyboard.keysPressed = {}

    gStateMachine = StateMachine:init({
        ['title'] = TitleScreenState,
        ['countdown'] = CountdownState,
        ['play'] = PlayState,
        ['score'] = ScoreState
    })

    gStateMachine:change('title')
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key]
end

function love.update(dt)
    if SCROLLING then
        bgLayer1:update(dt)
        bgLayer2:update(dt)
        bgLayer3:update(dt)

        gStateMachine:update(dt)
    --     timer = timer + dt
    --     if timer > 2 then
    --         local y = lastY + math.random(-20, 20)
    --         y = clamp(-PIPE_HEIGHT+10, y, VIRTUAL_HEIGHT-PIPE_HEIGHT-GAP_HEIGHT)
    --         lastY = y
    --         table.insert(pipePairs, PipePair:init(y))
    --         timer = 0
    --     end

    --     for k, pair in pairs(pipePairs) do
    --         pair:update(dt)

    --         -- check if bird collides with the pipe pair
    --         for l, pipe in pairs(pair.pipes) do
    --             if bird:collides(pipe) then
    --                 scrolling = false   -- pause game
    --             end
    --         end
    --     end

    --     local i = 1
    --     while i <= #pipes do
    --         if pipePairs[i].remove then
    --             table.remove( pipes, i )
    --         else
    --             i = i+1
    --         end
    --     end
    end

    love.keyboard.keysPressed = {}
end

function love.draw()
    love.graphics.scale(sx, sy)
    
    bgLayer1:draw()
    bgLayer2:draw()
    
    -- for _, pair in pairs(pipePairs) do
    --     pair:draw()
    -- end

    gStateMachine:render()
    
    bgLayer3:draw()
    -- bird:draw()

end
