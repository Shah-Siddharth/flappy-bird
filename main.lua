require("components.BackgroundImage")

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

local sx = WINDOW_WIDTH / VIRTUAL_WIDTH
local sy = WINDOW_HEIGHT / VIRTUAL_HEIGHT

local bgLayer1 = BackgroundImage:init('assets/background-layer-1.png', 0, 0, 30)
local bgLayer2 = BackgroundImage:init('assets/background-layer-2.png', 0, 0, 45)

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = 1
    })

    love.window.setTitle('Flappy Bird')
end

function love.update(dt)
    bgLayer1:update(dt)
    bgLayer2:update(dt)
end

function love.draw()
    love.graphics.scale(sx, sy)
    bgLayer1:draw()
    bgLayer2:draw()
end
