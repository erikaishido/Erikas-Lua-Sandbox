local textureAtlas = {}
-- how is textureAtlas different from spriteSheet? you may ask...
-- i use spriteSheets for animations
-- and textureAtlases for a bunch of static images

---------------------------------------------------------------

function textureAtlas.getFirstQuad(image, width, height)
    local quad = love.graphics.newQuad(0, 0, width, height, image:getDimensions())
    return quad
end

-- returns a table of quads, from given atlas row
function textureAtlas.getRow(image, width, height, row)
    local quads = {}

    for x = 0, image:getWidth() - width, width do
        table.insert(quads, love.graphics.newQuad(x, (height * (row-1)), width, height, image:getDimensions()))
    end

    return quads
end


return textureAtlas