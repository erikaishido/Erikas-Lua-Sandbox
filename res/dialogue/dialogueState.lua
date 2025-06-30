local dialogueState = {}

-------------------------game loop-----------------------------

function dialogueState.keyPressed(key)
    if key == "space" then
        --dialogueManager.next()
    elseif key == "m" then
        stateStack.push(menuState)
    end
end

function dialogueState.update(dt)
    --dialogueManager.update(dt)
end

function dialogueState.draw()
    --dialogueManager.draw()
end

---------------------------------------------------------------

function dialogueState.enter()
    --dialogueManager.start()
end

function dialogueState.exit()
    stateStack.pop()
end

--------------------------debug idk----------------------------

function dialogueState.getName()
    return "dialogueState"
end

return dialogueState