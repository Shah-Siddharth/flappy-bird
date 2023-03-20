require("components.BackgroundImage")
require("components.Bird")

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

local sx = WINDOW_WIDTH / VIRTUAL_WIDTH
local sy = WINDOW_HEIGHT / VIRTUAL_HEIGHT

local bgLayer1 = BackgroundImage:init('assets/background-layer-1.png', 0, 0, 30)
local bgLayer2 = BackgroundImage:init('assets/background-layer-2.png', 0, 0, 45)
local bgLayer3 = BackgroundImage:init('assets/background-layer-3.png', 0, 0, 60)

local bird = Bird:init('assets/bird.png', VIRTUAL_WIDTH, VIRTUAL_HEIGHT)

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = 1
    })

    love.window.setTitle('Flappy Bird')

    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.update(dt)
    bgLayer1:update(dt)
    bgLayer2:update(dt)
    bgLayer3:update(dt)
    bird:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    love.graphics.scale(sx, sy)
    
    bgLayer1:draw()
    bgLayer2:draw()
    bgLayer3:draw()
    bird:draw()
end
