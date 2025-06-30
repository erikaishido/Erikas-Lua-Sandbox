local dressupState = {}

-------------------------game loop-----------------------------

function dressupState.keyPressed(key)
    if key == "backspace" then
        dressupState.exit()
    elseif key == "w" or key == "s" then
        dressup.move(key)
    elseif key == "space" then
        dressup.select()
    end
end

function dressupState.update(dt)
end

function dressupState.draw()
    dressup.draw()
end

---------------------------------------------------------------

function dressupState.enter()
end

function dressupState.exit()
    stateStack.pop()
end

--------------------------debug idk----------------------------

function dressupState.getName()
    return "dressupState"
end

return dressupState