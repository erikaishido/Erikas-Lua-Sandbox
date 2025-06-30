-- initializing private modules

-- global modules
stateStack = require("state/stateStack")
menu = require("menu")
home = require("home")
textureAtlas = require("textureAtlas")
player = require("player")
dressup = require("dressup")
util = require("util")

----------------------booting the bad boy up--------------------------

function love.load()
    elapsedTime = 0
    love.graphics.setDefaultFilter("nearest", "nearest")

--[[     font = love.graphics.newImageFont("res/font/Resource-Imagefont.png",
        " abcdefghijklmnopqrstuvwxyz" ..
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
        "123456789.,!?-+/():;%&`'*#=[]\""
    ) ]]
    testFont = love.graphics.newImageFont("res/font/testFont.png",
        " abcdefghijklmnopqrstuvwxyz"
    )
    testFont2 = love.graphics.newImageFont("res/font/testFont2.png",
        " abcdefghijklmnopqrstuvwxyz" ..
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
        "123456789.,!?-+/▷"
    )

    stateStack.push(homeState)
    player.load()
    dressup.load()
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
    love.graphics.setFont(testFont2)
    love.graphics.scale(4) --do i really need this in draw
    --love.graphics.print(elapsedTime, 20, 20)
    stateStack.draw()
end

