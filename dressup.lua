local dressup = {}

-- outfit variables
-- should be able to house multiple outfit categories
local allDresses = {} --this is a list of quads
local dressIndex = 0

-- for display
local heightOffset = 60

function dressup.load()
    dressup.atlas = love.graphics.newImage("res/png/test2.png")
    allDresses = textureAtlas.getRow(dressup.atlas, 27, 43, 2)
end

-----------------------------game loop--------------------------------

function dressup.draw()
    for i=1, #allDresses do
        local quad = allDresses[i]
        love.graphics.draw(dressup.atlas, quad, 460, (360 + (i-1)*heightOffset), 0, 2)
    end

    --love.graphics.print("dressup debug text:", 400, 400)
    --love.graphics.print(#allDresses, 400, 420)
end

----------------------------------------------------------------------


-------------------------getters & setters----------------------------

function dressup.getDressIndex()
    return dressIndex
end

return dressup