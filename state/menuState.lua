local menuState = {}

-------------------------game loop-----------------------------

function menuState.keyPressed(key)
    if key == "m" or key == "backspace" then
        menuState.exit()
    elseif key == "w" or key == "s" then
        menu.move(key)
    elseif key == "space" then
        menu.select()
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