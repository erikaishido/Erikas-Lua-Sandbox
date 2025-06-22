-- this thing will run if you rename it into main.lua

function love.load()
    x = 200
    y = 120
    colorIndex = 1
    previousIndex = nil

    COLORS = {
        {1, 0, 0},
        {0, 1, 1},
        {1, 1, 0},
        {0, 1, 0},
        {0, 0, 1},
        {1, 0, 1}
    }
    SPEED = 3
    vector = {1, 1}
end

function love.update()
    x = x + (vector[1] * SPEED)
    y = y + (vector[2] * SPEED)
    checkCollision()
end

function checkCollision()
    if x <= 0 or x >= 700 then
        vector[1] = vector[1] * -1
        pickRandomColor()
    end
    if y <= -10 or y >= 550 then
        vector[2] = vector[2] * -1
        pickRandomColor()
    end
end

function pickRandomColor()
    previousIndex = colorIndex
    colorIndex = math.random(#COLORS)
    if previousIndex == colorIndex then
        pickRandomColor()
    end
end

function love.draw()
    love.graphics.setColor(COLORS[colorIndex])
    love.graphics.print("DVD", x, y, 0, 4)
end