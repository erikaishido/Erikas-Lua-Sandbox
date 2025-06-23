local dialogueManager = {}

-- cronies
local textbox = require("dialogue/textbox")
local portrait = require("dialogue/portrait")

local dialogue = {
    "my old swiss army knife",
    "stem cells, nothing is direct",
    "everything is love, everything is love",
    "take the leap, welcome to the plant cell bath"
}
local currentIndex = 1
local currentLine = "current line"

-------------------------game loop---------------------------

function dialogueManager.update(dt)
    textbox.update(dt)
end

function dialogueManager.draw()
    textbox.draw()
    --portrait.draw()
end

---------------user input: move to next dialogue-------------

function dialogueManager.start()
    currentIndex = 1
    moveToNextLine()
end

function moveToNextLine()
    currentLine = dialogue[currentIndex]
    textbox.prepCharsForType(currentLine)
    currentIndex = currentIndex + 1
end

-- called from main
function dialogueManager.next()
    if textbox.getIsTyping() == true then
        textbox.skipToEndOfLine(currentLine)
    elseif currentIndex > #dialogue then
        endDialogue()
    else
        moveToNextLine()
    end
end

function endDialogue()
    --dialogueState.exit()
end

-------------------------------------------------------------

return dialogueManager