local player = {}

function player.load()
    player.atlas = love.graphics.newImage("res/png/test2.png")
    player.quad = textureAtlas.getFirstQuad(player.atlas, 27, 43)
end

-----------------------------game loop--------------------------------

function player.draw()
    love.graphics.draw(player.atlas, player.quad, 280, 200, 0, 2)
    --love.graphics.print(tostring(player.quad), 20, 370)
end

-------------------------getters & setters----------------------------

function player.setNewOutfit()
end

return player