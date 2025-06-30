local home = {}

-------------------------game loop-----------------------------

function home.load()
    test1 = love.graphics.newImage("res/png/test1.png")
end

function home.keyPressed(key)

end

function home.update(dt)
    
end

function home.draw()
    love.graphics.rectangle("line", 40, 40, 480, 300)
    if stateStack.top() == homeState then
        love.graphics.rectangle("line", 30, 30, 500, 320)
    end

    love.graphics.draw(test1, 0, 0, 0, 2)
end

---------------------------------------------------------------

return home