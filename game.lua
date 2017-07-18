-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )

local scene = composer.newScene()

local physics = require( "physics" )
physics.start()
physics.setGravity( 0, 0 )


local attack = display.newImageRect( "attack.png", 110, 110 )
attack.damage = function()
                  return 40 + math.random( 20 )
                end


function removeMenu()
  display.remove(attack)
  display.remove(super)
end

function enemyListener(event)
  if bool == false then
  return
  end
  pers = event.target
  ---------------
  ---------------
 currentPerson.twist(event.target)

  -----------------------------------------------
  pers.hp = pers.hp - damage
  playerTap = true
  enemyTap = enemyTap + 1
  if pers.hp > 0 then
  pers.text.text = "HP = " .. pers.hp
else
  table.remove(pers)
  display.remove(pers.text)
  display.remove(pers)
  kill = kill + 1
  end
  bool = false
end

function action(event)
  gameLog.text = "Выберете цель"
  removeMenu()
  bool = true
  damage = event.target.action()
end

function superAction(event)
  gameLog.text = "Выберите цель"
  removeMenu()
  bool = true
  damage = event.target.action()
  event.target.pers.textMP.text = "MP = "..event.target.pers.mp
end

function noMana()
  gameLog.text = "Нехватает MP для этого действия"
  end


function personFactory(personClass, side)
  local person
  if side == "H" then
    
    if personClass == "W" then
        person = display.newImageRect( "мечница 1.png", 160, 175 )
        person.hp = 250 + warPlusHp
        person.mp = 30 + warPlusMp
        person.damage = 40 + warPlusDam
        person.red = display.newImageRect( "краснМечн.png", 150, 180 );
        
        
        person.twist = function(enemy)
           person.attackPicture = display.newImageRect( "мечница.png", 180, 200 )
           person.alpha = 0
           enemy.red.alpha = 100
           person.text.alpha = 0
           person.textMP.alpha = 0
           person.attackPicture.x = enemy.x + 150
           person.attackPicture.y = enemy.y - 20
           timer.performWithDelay(800, 
            function() 
              display.remove(person.attackPicture) 
              person.alpha = 100
              person.text.alpha = 100
              person.textMP.alpha = 100
              enemy.red.alpha = 0
            end
            , 1)
           
          end 
        
    end
    if personClass == "A" then
        person = display.newImageRect( "лучница.png", 150, 180 )
        person.hp = 150  + archPlusHp
        person.mp = 30 + archPlusMp
        person.damage = 60 + archPlusDam
        person.red = display.newImageRect( "краснЛучн.png", 150, 180 );
        
        person.twist = function(enemy)
           person.attackPicture = display.newImageRect( "лучница 1.png", 200, 200 )
           person.alpha = 0
           person.attackPicture.x = person.x
           person.attackPicture.y = person.y
           enemy.red.alpha = 100
           local fireBall = display.newImageRect( "Arrow.png", 100, 50 )
          physics.addBody( fireBall, "dynamic", {isSensor=true} )
          fireBall.isBullet = true
          fireBall.myName = "laser"

          fireBall.x = person.x - 70
          fireBall.y = person.y
          --fireBall:toBack()

          transition.to( fireBall, { x=enemy.x + 120, y = enemy.y, time=600,
            onComplete = function() display.remove( fireBall ) end
          } )
           
          timer.performWithDelay(800, 
            function() 
              display.remove(person.attackPicture) 
              person.alpha = 100
              enemy.red.alpha = 0
            end
            , 1)
           
          end 
        
        
    end
    if personClass == "M" then
      
        person = display.newImageRect( "маг 1.png", 150, 180 )
        person.hp = 100 + magPlusHp
        person.mp = 30 + magPlusMp
        person.damage = 80 + magPlusDam
        person.red = display.newImageRect( "краснМаг.png", 150, 180 );
        
        ---------------------------------------------------------------------------
        
        ---------------------------------------------------------------------------
        
        person.twist = function(enemy)
          person.attackPicture = display.newImageRect( "маг 2.png", 150, 180 )
           person.alpha = 0
           person.attackPicture.x = person.x
           person.attackPicture.y = person.y

           enemy.red.alpha = 100
          local fireBall = display.newImageRect( "fireball.png", 100, 50 )
          physics.addBody( fireBall, "dynamic", {isSensor=true} )
          fireBall.isBullet = true
          fireBall.myName = "laser"

          fireBall.x = person.x - 30
          fireBall.y = person.y
          --fireBall:toBack()

          transition.to( fireBall, { x=enemy.x + 120, y = enemy.y, time=800,
            onComplete = function() display.remove( fireBall ) end
          } )
          
          timer.performWithDelay(800, 
            function() 
              display.remove(person.attackPicture) 
              person.alpha = 100
              enemy.red.alpha = 0
            end
            , 1)
        end
        
    end
    
    person.action = function()
                  return person.damage + math.random( person.damage / 2 )
                end
    person.super = function()
                  person.mp = person.mp - 10
                  return person.damage * 1.5 + math.random( person.damage / 2 ) * 1.5
                end
    person.x = display.contentCenterX+400
    person.y = display.contentCenterY+(200-(persCount*180))
    person.red.x = person.x
        person.red.y = person.y
        person.red.alpha = 0
    ---------------------------------
    
    ---------------------------------
    person.text = display.newText( "HP = "..person.hp, display.contentCenterX, 20, "Comic Sans MS", 18 )
    person.text:setFillColor( 0, 0, 9 )
    person.text.x = person.x - 35
    person.text.y = person.y - 90
    
    person.textMP = display.newText( "MP = "..person.mp, display.contentCenterX, 20, "Comic Sans MS", 18 )
    person.textMP:setFillColor( 9, 0, 1 )
    person.textMP.x = person.x + 45
    person.textMP.y = person.y - 90
    
    table.insert(personList, person)
    persCount = persCount + 1
     
    
  else if side == "E" then
    if personClass == "1" then
        person = display.newImageRect( "1.png", 180, 160 )
        person.hp = 250
        person.mp = 100
        person.red = display.newImageRect( "красн1.png", 180, 160 );
        
    end
    if personClass == "7" then
        person = display.newImageRect( "7.png", 180, 160 )
        person.hp = 250
        person.mp = 100
        person.red = display.newImageRect( "красн2.png", 180, 160 );
        
    end
    if personClass == "8" then
        person = display.newImageRect( "8.png", 180, 160 )
        person.hp = 250
        person.mp = 100
        person.red = display.newImageRect( "красн3.png", 180, 160 );
        
    end
    
    person.x = display.contentCenterX-400
    person.y = display.contentCenterY+(210-(enemyCount*180))
    
    person.red.x = person.x
    person.red.y = person.y
    person.red.alpha = 0
    
    person.text = display.newText( "HP = "..person.hp, display.contentCenterX, 20, "Comic Sans MS", 20 )
    person.text:setFillColor( 1, 0, 0 )
    person.text.x = person.x
    person.text.y = person.y - 90
    person:addEventListener("tap", enemyListener)
    table.insert(enemyList, person)
    person.twist = function(hero) 
              person.x = person.x + 200
              hero.alpha = 0
              hero.red.alpha = 100
               timer.performWithDelay(1000, 
                  function() 
                      person.x = person.x - 200
                      hero.alpha = 100
                      hero.red.alpha = 0
                  end
              , 1)
              
              
          end
    enemyCount = enemyCount + 1
    
  end
  
end
    
end

function isFinal()
  local personAlive = false
  local enemyAlive = false
  for i = 1 , #personList do
      if personList[i].hp > 0 then
       personAlive = true
      end
  end
  for i = 1 , #enemyList do
      if enemyList[i].hp > 0 then
       enemyAlive = true
      end
  end
      if enemyAlive == false then
        win = true
        return "Hero win"
      end 
       if personAlive == false then
        return "Enemy win"
      end 
      
end


function createMenu(heroNum)
  win = false
  gameLog.text = "Выберите действие"
  attack = display.newImageRect( "attack.png", 60, 60 )
  attack:addEventListener("tap",action)
  currentPerson = personList[heroNum]
  attack.action = personList[heroNum].action 
  attack.x = personList[heroNum].x - 150
  attack.y = personList[heroNum].y + 30
  attack.type = "A"
  
  super = display.newImageRect( "super.png", 70, 70 )
  super.type = "S"
  super.pers = personList[heroNum]
  if personList[heroNum].mp > 9 then
  super:addEventListener("tap",superAction)
  else
  super:addEventListener("tap", noMana)
  end
  super.action = personList[heroNum].super 
  super.x = personList[heroNum].x - 150
  super.y = personList[heroNum].y - 50
end

local function endGame()
	composer.gotoScene( "levelUp", { time=800, effect="crossFade" } )
  
end

function gameLoop()
  if side == "H"  then
    if playerTap and heroNum < 4 then
      if personList[heroNum].hp > 0 then
      createMenu(heroNum)
      playerTap = false
    end
    heroNum = heroNum + 1
    
      
     end 
    
    if heroNum > persCount and enemyTap == persCount   then
        
        enemyCount = enemyCount - kill
        kill = 0
        heroNum = 1
        enemyTap = 0
        side = "E"

    end
     ----------------------------------------------------------------------------------------
    
  elseif side == "E" then
     if enemyList[enemyNum].hp > 0 then
        randPers = math.random( #personList)
        local  pers = personList[randPers]
        
        while pers.hp < 0 do
          randPers = math.random( #personList)
          pers = personList[randPers]
        end
        pers.hp =  pers.hp - (50 + math.random( 20))
        
        if pers.hp > 0 then
            pers.text.text = "HP = " .. pers.hp
        else
          persCount = persCount - 1
        pers.text.text = "Dead"
        end
        enemyList[enemyNum].twist(pers)
        display.remove(personList[randPers].foo)
      end
      
      enemyNum = enemyNum + 1
      if enemyNum > #enemyList then
        
          enemyNum = 1
          side = "H"
        
      end
      
  end
  if isFinal() == "Hero win" then
    cycle = 1
    gameLog.text = "Победа!"
    timer.performWithDelay( 2500, endGame )
  end 
  if isFinal() == "Enemy win" then
    cycle = 1
    gameLog.text = "Проиграл"
    timer.performWithDelay( 2500, endGame )
  end
  
end

function scene:create( event )

	local sceneGroup = self.view
  
  
   personList = {}
   enemyList = {}
   persCount = 0
   enemyCount = 0
   damage = 0
   bool = false
   side = "H"
   playerTap = true
   final = false
   cycle = 0
   currentPerson = nil
   enemyTap = 0
   kill = 0
 
  background = display.newImageRect( "Фон.jpg", 1024, 668 )
  background.x = display.contentCenterX
  background.y = display.contentCenterY
  
  gameLog = display.newText( "", display.contentCenterX, 20, "Comic Sans MS", 35 )
  gameLog:setFillColor( 0, 0, 0 )
  gameLog.x = display.contentCenterX 
  gameLog.y = display.contentCenterY - 250
  
  attack:addEventListener("tap",action)
  
   heroNum = 1
   enemyNum = 1
  
  personFactory("W","H")
  personFactory("A","H")
  personFactory("M","H")

  personFactory("1","E")
  personFactory("7","E")
  personFactory("8","E")
end

function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)
      
	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen
	--	physics.start()
    
		myTimer = timer.performWithDelay(500, gameLoop, cycle)
	end
end

function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)
		timer.cancel( myTimer )
    --display.remove(background)
    background.alpha = 0
    display.remove(gameLog)
    
   removeMenu()
    for i = 1 , #personList do
     display.remove(personList[i])
     display.remove(personList[i].text)
     display.remove(personList[i].textMP)
     table.remove(personList[i])
     
    end
   
    for i = 1 , #enemyList do
      display.remove(enemyList[i])
      display.remove(enemyList[i].text)
      table.remove(enemyList[i])
      
    end
    
	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
		
		-- physics.pause()
    
		composer.removeScene( "game" )
	end
end
 
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
  print("destroy")
end


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene



