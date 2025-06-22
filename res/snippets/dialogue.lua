-- broken apart into dialogueManager & textbox
-- kept for reference

local dialogue = {}

local textx = 140
local texty = 400

currentLine = "currentLine"
text = {
    "my old swiss army knife",
    "stem cells, nothing is direct",
    "everything is love, everything is love",
    "take the leap, welcome to the plant cell bath"
}

-- for typing out characters
isTyping = false
lineToChars = {}
typeProgress = {}
-- timer stuff
timer = 0
timerDuration = 0.05

-- ------------------------------------------------------

function dialogue.update(dt)

    -- call typeChars every n secs, until you reach end of line
    if isTyping == true then
        timer = timer - dt
        if timer < 0 then
            typeChars()
            timer = timerDuration
        end
    end

end

-- ---------------------iterate dialogue-----------------

function dialogue.iterate()
    if #text <= 0 then
        dialogue.exit()
    else
        dialogue.moveToNextLine()
    end
end

function dialogue.moveToNextLine()
    currentLine = text[1]
    table.remove(text, 1)
    prepChars()
end

function dialogue.exit()
end

-- -------------type out characters-----------------------

function prepChars()
    typeProgress = {}
    lineToChars = {}
    -- prep chars
    for i=1, #currentLine, 3 do
        thisBlock = string.sub(currentLine, i, i+2)
        table.insert(lineToChars, thisBlock)
    end
    index = 1
    timer = timerDuration
    isTyping = true
end

-- runs every x seconds, called in update
function typeChars()
    table.insert(typeProgress, lineToChars[index])
    if index >= #lineToChars then
        isTyping = false
    end
    index = index + 1
end

-- -------------------------------------------------------

function dialogue.draw()
    love.graphics.rectangle("line", textx, texty, 500, 80)
    love.graphics.print(typeProgress, textx+40, texty+20)
    love.graphics.print(timer, 20, 60)
end

return dialogue