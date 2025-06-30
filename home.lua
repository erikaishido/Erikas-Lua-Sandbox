local home = {}

-------------------------game loop-----------------------------

function home.keyPressed(key)
end

function home.update(dt)
end

function home.draw()
    love.graphics.rectangle("line", 40, 40, 480, 300)
    if stateStack.top() == homeState then
        love.graphics.rectangle("line", 30, 30, 500, 320)
    end

    player.draw()
    dressup.draw()
end

---------------------------------------------------------------

return home