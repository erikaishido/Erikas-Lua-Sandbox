local dressup = {}

-- outfit variables (should be able to house multiple outfit categories)
local allDresses = {} --list of quads
local dressIndex = 1

-- for display
local xorigin = 140
local yorigin = 200
local yoffset = 60

function dressup.load()
    dressup.atlas = love.graphics.newImage("res/png/test2.png")
    allDresses = textureAtlas.getRow(dressup.atlas, 27, 43, 2)
end

-----------------------------game loop--------------------------------

function dressup.draw()
    -- fill background
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getDimensions())

    love.graphics.setColor(255,255,255)
    for i=1, #allDresses do
        local quad = allDresses[i]
        love.graphics.draw(dressup.atlas, quad, xorigin, (yorigin + (i-1)*yoffset), 0, 2)
        if i == dressIndex then
            love.graphics.rectangle("line", xorigin-4, (yorigin + 13 + (i-1)*yoffset), 60, 60)
        end
    end
    player.draw()

    --love.graphics.print("dressup debug text:", 400, 400)
    --love.graphics.print(#allDresses, 400, 420)
end

----------------------------------------------------------------------

function dressup.move(key)
    if util.isValidDir(key, dressIndex, allDresses) == false then
        return
    end
    dressIndex = dressIndex + util.keyToDir(key)
end

function dressup.select()
end

-------------------------getters & setters----------------------------

function dressup.getDressIndex()
    return dressIndex
end

return dressup