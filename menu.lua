local menu = {}

local xorigin = 550
local yorigin = 200
-- origin for submenus
local subx = xorigin + 20
local suby = yorigin + 40
-- vertical distance between each submenu
local subMargin = 20

local menuIndex = 1
local subMenus = {
    {"dressup", dressupState},
    {"interior", 0},
    {"screenshot", 0},
    {"config", 0}
}

local debug = "menu debug message"

-------------------------game loop---------------------------

function menu.draw()
    if stateStack.top() == menuState then
        love.graphics.rectangle("line", xorigin-10, yorigin-10, 220, 270)
    end

    love.graphics.rectangle("line", xorigin, yorigin, 200, 250)
    love.graphics.print(debug, xorigin+20, yorigin-30)

    for i=1, #subMenus do
        if i == menuIndex and stateStack.top() == menuState then
            love.graphics.print("> "..subMenus[i][1], subx, suby + (i * subMargin))
        else
            love.graphics.print(subMenus[i][1], subx, suby + (i * subMargin))
        end
    end

end

---------------------input processing------------------------

function menu.move(key)
    if util.isValidDir(key, menuIndex, subMenus) == false then
        return
    end
    menuIndex = menuIndex + util.keyToDir(key)
    debug = tostring(menuIndex)
end

function menu.select()
    if subMenus[menuIndex] == 0 then
        return
    end
    stateStack.push(subMenus[menuIndex][2])
end

return menu