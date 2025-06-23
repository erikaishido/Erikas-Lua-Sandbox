local menuState = {}

-------------------------game loop-----------------------------

function menuState.keyPressed(key)
    if key == "m" then
        menuState.exit()
    end
end

function menuState.update(dt)
    
end

function menuState.draw()
    --menu.draw()
end

---------------------------------------------------------------

function menuState.enter()
end

function menuState.exit()
    stateStack.pop()
end

--------------------------debug idk----------------------------

function menuState.getName()
    return "menuState"
end

return menuState