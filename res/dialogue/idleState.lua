local idleState = {}

-------------------------game loop-----------------------------

function idleState.keyPressed(key)
    if key == "space" then
        --stateStack.push(dialogueState)
    elseif key == "m" then
        stateStack.push(menuState)
    end
end

function idleState.update(dt)
end

function idleState.draw()
    home.draw()
    menu.draw()
end

---------------------------------------------------------------

function idleState.enter()
end

function idleState.exit()
end

--------------------------debug idk----------------------------

function idleState.getName()
    return "idleState"
end


return idleState