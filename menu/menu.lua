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
    "dressup",
    "interior",
    "screenshot",
    "config"
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
            love.graphics.print("> "..subMenus[i], subx, suby + (i * subMargin))
        else
            love.graphics.print(subMenus[i], subx, suby + (i * subMargin))
        end
    end

end

---------------------input processing------------------------

function menu.move(key)
    if isValidDir(key) == false then
        return
    end
    menuIndex = menuIndex + keyToDir(key)
    debug = tostring(menuIndex)
end

function menu.select()
end

--------------------------utilities--------------------------

function keyToDir(key)
    assert(key == "w" or key == "s", "why are you reading this key")
    if key == "w" then
        return -1
    elseif key == "s" then
        return 1
    end
end

function isValidDir(key)
    if menuIndex + keyToDir(key) <= 0 then
        return false
    elseif menuIndex + keyToDir(key) > #subMenus then
        return false
    end
    return true
end

return menu