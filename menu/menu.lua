local menu = {}

local xorigin = 500
local yorigin = 180

-------------------------game loop---------------------------

function menu.keyPressed(key)
end

function menu.draw()
    if stateStack.top() == menuState then
        love.graphics.rectangle("line", xorigin-10, yorigin-10, 220, 270)
    else
        love.graphics.rectangle("line", xorigin, yorigin, 200, 250)
    end

    love.graphics.print("menu", xorigin+20, yorigin+20)
end

---------------------input processing------------------------



-------------------------------------------------------------

function menu.next()
end

function menu.close()
end

return menu