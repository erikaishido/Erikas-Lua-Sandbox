local homeState = {}

-------------------------game loop-----------------------------

function homeState.keyPressed(key)
    if key == "m" then
        stateStack.push(menuState)
    end
end

function homeState.update(dt)
end

function homeState.draw()
    home.draw()
    menu.draw()
end

---------------------------------------------------------------

function homeState.enter()
end

function homeState.exit()
end

--------------------------debug idk----------------------------

function homeState.getName()
    return "homeState"
end

return homeState