local home = {}

-------------------------game loop-----------------------------

function home.keyPressed(key)
end

function home.update(dt)
end

function home.draw()
    love.graphics.rectangle("line", 10, 10, 160, 110)
    if stateStack.top() == homeState then
        love.graphics.rectangle("line", 5, 5, 170, 120)
    end

    player.draw()
end

---------------------------------------------------------------

return home