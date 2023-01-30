local background = love.graphics.newImage('parallax-forest-back-trees.png')

function love.conf(t)
    t.console = true
end

function love.load()
    love.window.setMode(1024, 576, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
    
    love.window.setTitle('Flappy Bird')
end

function love.update(dt)
    scaleX = love.graphics.getWidth() / background:getWidth()
    scaleY = love.graphics.getHeight() / background:getHeight()
    print(scaleX)
end

function love.draw()
    love.graphics.draw(background, 0, 0, 0, scaleX, scaleY)
end
