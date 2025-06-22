local portrait = {}

local xorigin = 140
local yorigin = 250

-- -------------------------game loop--------------------------

function portrait.update()
end

function portrait.draw()
    love.graphics.rectangle("line", xorigin, yorigin, 120, 120)
end

-- ------------------------------------------------------------

return portrait