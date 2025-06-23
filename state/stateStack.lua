local stateStack = {}

-- states (global!!!!!?????? fucked up man)
-- each "state" is just a group of functions w/ identical names
homeState = require("state/homeState")
menuState = require("state/menuState")

-- ye olde stack
local stack = {}

-----------------------------game loop--------------------------------

function stateStack.keyPressed(key)
    stack[#stack].keyPressed(key)
end

function stateStack.update(dt)
    for i=1, #stack do
        stack[i].update(dt)
    end
end

function stateStack.draw()
    for i=1, #stack do
        stack[i].draw()
    end
    love.graphics.print(getEntireStack(), 20, 120)
end

------------------------stack manipulation----------------------------

function stateStack.push(newState)
    table.insert(stack, newState)
    stack[#stack].enter()
end

function stateStack.pop()
    table.remove(stack, #stack)
end

function stateStack.top()
    return stack[#stack]
end

--------------------------debug idk----------------------------

function getEntireStack()
    stackForPrint = ""
    for i=1, #stack do
        thisStack = stack[i].getName()
        stackForPrint = stackForPrint .. " / " .. thisStack
    end
    return stackForPrint
end

return stateStack