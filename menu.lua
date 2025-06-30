local menu = {}

local xorigin = 150
local yorigin = 26
-- origin for submenus
local subx = xorigin + 10
local suby = yorigin + 14
-- vertical distance between each submenu
local subMargin = 14

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
    --fill rectangle
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", xorigin, yorigin, 80, 80)
    love.graphics.setColor(255,255,255)

    if stateStack.top() == menuState then
        love.graphics.rectangle("line", xorigin-5, yorigin-5, 90, 90)
    end
    love.graphics.rectangle("line", xorigin, yorigin, 80, 80)

    --love.graphics.print(debug, xorigin+20, yorigin-30)

    for i=1, #subMenus do
        if i == menuIndex and stateStack.top() == menuState then
            love.graphics.print("▷ "..subMenus[i][1], subx, suby + ((i-1) * subMargin))
        else
            love.graphics.print(subMenus[i][1], subx, suby + ((i-1) * subMargin))
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
    if subMenus[menuIndex][2] == 0 then
        return
    end
    stateStack.push(subMenus[menuIndex][2])
end

return menu