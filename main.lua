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

LARGE_FONT = love.graphics.newFont('fonts/AtlantisInternational.ttf', 40)
MEDIUM_FONT = love.graphics.newFont('fonts/AtlantisInternational.ttf', 25)
SMALL_FONT = love.graphics.newFont('fonts/AtlantisInternational.ttf', 15)

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = 1
    })

    love.window.setTitle('Flappy Bird')

    math.randomseed(os.time())
    love.keyboard.keysPressed = {}

    SOUNDS = {
        ['jump'] = love.audio.newSource('sounds/jump.wav', 'static'),
        ['score'] = love.audio.newSource('sounds/score.wav', 'static'),
        ['die'] = love.audio.newSource('sounds/die.wav', 'static')
    }

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
    end

    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.draw()
    love.graphics.scale(sx, sy)
    bgLayer1:draw()
    bgLayer2:draw()
    gStateMachine:render() 
    bgLayer3:draw()
end
