-- Kyle Boulay
-- Grade 3's App
-- App Development
-- This Program's Idea Was Done All By The Grade 3's




GameScene = class()


local listOfLetters = {}
local moveToPause
local startTime
local theWord
local listOfLettersInTheWord = {}
local buttonLettersToFall = {}

local aButton
local bButton
local cButton
local dButton
local eButton
local fButton
local gButton
local hButton
local iButton
local jButton
local kButton
local lButton
local mButton
local nButton
local oButton
local pButton
local qButton 
local rButton
local sButton
local tButton
local uButton
local vButton
local wButton
local xButton
local yButton
local zButton
    
function GameScene:init()
    
    print("This is the: " .. #wordWallWordList)
    
    aButton = SpriteObject("Documents:A Button", vec2(50, 1024))
    listOfLetters["a"] = aButton
    bButton = SpriteObject("Documents:B Button", vec2(100, 1024))
    listOfLetters["b"] = bButton
    cButton = SpriteObject("Documents:C Button", vec2(150, 1024))
    listOfLetters["c"] = cButton
    dButton = SpriteObject("Documents:D Button", vec2(200, 1024))
    listOfLetters["d"] = dButton
    eButton = SpriteObject("Documents:E Button", vec2(250, 1024))
    listOfLetters["e"] = eButton
    fButton = SpriteObject("Documents:F Button", vec2(300, 1024))
    listOfLetters["f"] = fButton
    gButton = SpriteObject("Documents:G Button", vec2(350, 1024))
    listOfLetters["g"] = gButton
    hButton = SpriteObject("Documents:H Button", vec2(400, 1024))
    listOfLetters["h"] = hButton
    iButton = SpriteObject("Documents:I Button", vec2(450, 1024))
    listOfLetters["i"] = iButton
    jButton = SpriteObject("Documents:J Button", vec2(500, 1024))
    listOfLetters["j"] = jButton
    kButton = SpriteObject("Documents:K Button", vec2(550, 1024))
    listOfLetters["k"] = kButton
    lButton = SpriteObject("Documents:L Button", vec2(600, 1024))
    listOfLetters["l"] = lButton
    mButton = SpriteObject("Documents:M Button", vec2(650, 1024))
    listOfLetters["m"] = mButton
    nButton = SpriteObject("Documents:N Button", vec2(700, 1024))
    listOfLetters["n"] = nButton
    oButton = SpriteObject("Documents:O Button", vec2(750, 1024))
    listOfLetters["o"] = oButton
    pButton = SpriteObject("Documents:P Button", vec2(75, 1024))
    listOfLetters["p"] = pButton
    qButton = SpriteObject("Documents:Q Button", vec2(125, 1024))
    listOfLetters["q"] = qButton
    rButton = SpriteObject("Documents:R Button", vec2(175, 1024))
    listOfLetters["r"] = rButton
    sButton = SpriteObject("Documents:S Button", vec2(225, 1024))
    listOfLetters["s"] = sButton
    tButton = SpriteObject("Documents:T Button", vec2(275, 1024))
    listOfLetters["t"] = tButton
    uButton = SpriteObject("Documents:U Button", vec2(325, 1024))
    listOfLetters["u"] = uButton
    vButton = SpriteObject("Documents:V Button", vec2(375, 1024))
    listOfLetters["v"] = vButton
    wButton = SpriteObject("Documents:W Button", vec2(425, 1024))
    listOfLetters["w"] = wButton
    xButton = SpriteObject("Documents:X Button", vec2(475, 1024))
    listOfLetters["x"] = xButton
    yButton = SpriteObject("Documents:Y Button", vec2(525, 1024))
    listOfLetters["y"] = yButton
    zButton = SpriteObject("Documents:Z Button", vec2(575, 1024))
    listOfLetters["z"] = zButton
    
    
    
    print ("This is the: " .. #listOfLetters)
    local lengthOfWordWallList = #wordWallWordList
    local theWordNumberToPick = math.random(1, lengthOfWordWallList)
    theWord = wordWallWordList[theWordNumberToPick]
    print ("the word is " ..theWord)
    
    local letterCounter = 1
    print("the length of the word is " .. #theWord)
    while (letterCounter <= #theWord) do
        
        listOfLettersInTheWord[letterCounter] = string.sub(theWord, letterCounter, letterCounter)
        
        --print (string.sub(theWord, letterCounter, letterCounter))
        print(listOfLettersInTheWord[letterCounter])      
        print(listOfLetters[listOfLettersInTheWord[letterCounter]])
        table.insert(buttonLettersToFall, listOfLetters[listOfLettersInTheWord[letterCounter]])
        letterCounter = letterCounter + 1
    end
    
    -- add letter of the word to the list
    
    
    --print(listOfLettersInTheWord)
    
    moveToPause = Button("Dropbox:Blue Pause Button", vec2(WIDTH/2 -300, HEIGHT/2 +425))
    
    startTime = ElapsedTime    
    
end

function GameScene:draw()
    
    sprite("Documents:Grade 3 Game Background", 384, 512, 768, 1024)
    fill(0, 255, 0, 255)
    rect(0, 0, 768, 50)
    fill(0, 0, 255, 255)
    rect(2, 2, 763, 45)
    fill(0, 255, 0, 255)
    rect(70, 0, 3, 50)
    rect(140, 0, 3, 50)
    rect(210, 0, 3, 50)
    rect(280, 0, 3, 50)
    rect(350, 0, 3, 50)
    rect(420, 0, 3, 50)
    rect(490, 0, 3, 50)
    rect(560, 0, 3, 50)
    rect(630, 0, 3, 50)
    rect(700, 0, 3, 50)
    rect(770, 0, 3, 50)
    --sprite((listOfLetters[#theWord]), 384, 1000, 50, 50)
    --listOfLetters = ["aButton"] = sprite("Documents:A Button")
    

    -- draw buttons in table buttonLettersToFall
    
    local letterCounter = 1
        while (letterCounter <= #listOfLettersInTheWord) do
            buttonLettersToFall[letterCounter]:draw()
    end
        
    moveToPause:draw()
    
    listOfLetters.y = listOfLetters.y - 10
    
    fill(255, 0, 0, 255)
    fontSize(75)
    font("ArialRoundedMTBold")
    text(ElapsedTime, 890, 950)
    
    
    
    if(startTime + 30 < ElapsedTime) then
        Scene.Change("timeup")
    end
    
end

function GameScene:touched(touch)
    moveToPause:touched(touch)

    
    if(moveToPause.selected == true) then
        Scene.Change("pause")
    end
end