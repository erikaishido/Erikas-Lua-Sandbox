local menu = {}

local xorigin = 500
local yorigin = 180

-------------------------game loop---------------------------

function menu.keyPressed(key)
end

function menu.draw()
    love.graphics.rectangle("line", xorigin, yorigin, 200, 250)
    love.graphics.print("menu", xorigin+20, yorigin+20)
end

-------------------------------------------------------------

function menu.next()
end

function menu.close()
end

return menu