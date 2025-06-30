-- initializing private modules

-- global modules
stateStack = require("state/stateStack")
menu = require("menu")
home = require("home")

----------------------loading the bad boy up--------------------------

function love.load()
    elapsedTime = 0
    love.graphics.setDefaultFilter("nearest", "nearest")

    stateStack.push(homeState)

    home.load()
end

-----------------------------game loop--------------------------------

function love.keypressed(key)
    stateStack.keyPressed(key)
end

function love.update(dt)
    elapsedTime = elapsedTime + dt
    stateStack.update(dt)
end

function love.draw()
    love.graphics.print(elapsedTime, 20, 20)
    stateStack.draw()
end

