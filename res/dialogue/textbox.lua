local textbox = {}

local xorigin = 140
local yorigin = 400

-- for typing out characters
local isTyping = false
local lineToChars = {}
local typeProgress = ""
-- typing timer
local typeTimer = 0
local typeDuration = 0.05

-- for toggling next line cursor
local cursor = ">"
local cursorTimer = 0
local cursorDuration = 0.4

-- --------------------------------------------------------

function textbox.update(dt)

    if isTyping == true then
        -- toggle cursor
        cursor = ""
        -- type characters
        typeTimer = typeTimer - dt
        if typeTimer < 0 then
            typeChars()
            typeTimer = typeDuration
        end
    end

    if isTyping == false then
        -- blinking cursor
        cursorTimer = cursorTimer - dt
        if cursorTimer < 0 then
            if cursor == ">" then
                cursor = ""
            elseif cursor == "" then
                cursor = ">"
            end
            cursorTimer = cursorDuration
        end
    end

end

function textbox.draw()
    love.graphics.rectangle("line", xorigin, yorigin, 500, 80)
    love.graphics.print(typeProgress, xorigin+40, yorigin+20)
    love.graphics.print(cursor, xorigin+460, yorigin+50)
    love.graphics.print(typeTimer, 20, 60)

end

-- ---------------------------------------------------------

function textbox.prepCharsForType(currentLine)
    typeProgress = ""
    lineToChars = {}
    index = 1
    timer = timerDuration
    for i=1, #currentLine, 3 do
        thisBlock = string.sub(currentLine, i, i+2)
        table.insert(lineToChars, thisBlock)
    end
    isTyping = true
end

function typeChars()
    typeProgress = typeProgress .. lineToChars[index]
    if index >= #lineToChars then
        isTyping = false
    end
    index = index + 1
end

function textbox.skipToEndOfLine(currentLine)
    typeProgress = currentLine
    isTyping = false
end

-----------------------getters & setters---------------------------

function textbox.getIsTyping()
    return isTyping
end

return textbox