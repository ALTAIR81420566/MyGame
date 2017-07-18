local composer = require( "composer" )

local scene = composer.newScene()

function goToMap()
  playButton2.alpha = 100
  backgroundmap.alpha = 100
  playButton.alpha = 100
  print("map")
	composer.gotoScene( "map", { time=800, effect="crossFade" } )
end

function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
  background1 = display.newImageRect(sceneGroup, "back.jpg", 1050, 580 )
	background1.x = display.contentCenterX
	background1.y = display.contentCenterY
  
  mapButton = display.newImageRect(sceneGroup,  "goMap.gif", 200, 100 )
  mapButton.x = display.contentCenterX + 350
  mapButton.y = display.contentCenterY 
 ----------------------------------------------------- 
  warHpUpBtn = display.newImageRect(sceneGroup,  "upBut.gif", 30, 30 )
  warHpUpBtn.x = display.contentCenterX + 130
  warHpUpBtn.y = display.contentCenterY + 190
  warHpUpBtn:addEventListener( "tap", warHpUp )
  
  warMpUpBtn = display.newImageRect(sceneGroup,  "upBut.gif", 30, 30 )
  warMpUpBtn.x = display.contentCenterX + 130
  warMpUpBtn.y = display.contentCenterY + 220
  warMpUpBtn:addEventListener( "tap", warMpUp )
  
  warDamUpBtn = display.newImageRect(sceneGroup,  "upBut.gif", 30, 30 )
  warDamUpBtn.x = display.contentCenterX + 130
  warDamUpBtn.y = display.contentCenterY + 160
  warDamUpBtn:addEventListener( "tap", warDamUp )
  ---------------------------------------------------
  magHpUpBtn = display.newImageRect(sceneGroup,  "upBut.gif", 30, 30 )
  magHpUpBtn.x = display.contentCenterX + 130
  magHpUpBtn.y = display.contentCenterY + 10
  magHpUpBtn:addEventListener( "tap", magHpUp )
  
  magMpUpBtn = display.newImageRect(sceneGroup,  "upBut.gif", 30, 30 )
  magMpUpBtn.x = display.contentCenterX + 130
  magMpUpBtn.y = display.contentCenterY + 40
  magMpUpBtn:addEventListener( "tap", magMpUp )
  
  magDamUpBtn = display.newImageRect(sceneGroup,  "upBut.gif", 30, 30 )
  magDamUpBtn.x = display.contentCenterX + 130
  magDamUpBtn.y = display.contentCenterY - 20
  magDamUpBtn:addEventListener( "tap", magDamUp )
  
  
  
  archHpUpBtn = display.newImageRect(sceneGroup,  "upBut.gif", 30, 30 )
  archHpUpBtn.x = display.contentCenterX + 130
  archHpUpBtn.y = display.contentCenterY - 165
  archHpUpBtn:addEventListener( "tap", archHpUp) 
  
  archMpUpBtn = display.newImageRect(sceneGroup,  "upBut.gif", 30, 30 )
  archMpUpBtn.x = display.contentCenterX + 130
  archMpUpBtn.y = display.contentCenterY - 135
  archMpUpBtn:addEventListener( "tap", archMpUp) 
  
  archDamUpBtn = display.newImageRect(sceneGroup,  "upBut.gif", 30, 30 )
  archDamUpBtn.x = display.contentCenterX + 130
  archDamUpBtn.y = display.contentCenterY - 195
  archDamUpBtn:addEventListener( "tap", archDamUp )
  --------------------------------------------	
  
  warHP = display.newText( sceneGroup,250, display.contentCenterX, 20, "Comic Sans MS", 30 )
  warHP:setFillColor( 0, 0, 0 )
  warHP.x = display.contentCenterX + 80
  warHP.y = display.contentCenterY + 190
  
  warMp = display.newText(sceneGroup, 30, display.contentCenterX, 20, "Comic Sans MS", 30 )
  warMp:setFillColor( 0, 0, 0 )
  warMp.x = display.contentCenterX + 80
  warMp.y = display.contentCenterY + 220
  
  warDam = display.newText( sceneGroup,40, display.contentCenterX, 20, "Comic Sans MS", 30 )
  warDam:setFillColor( 0, 0, 0 )
  warDam.x = display.contentCenterX + 80
  warDam.y = display.contentCenterY + 160
  
  warExpT = display.newText(sceneGroup, 1, display.contentCenterX, 20, "Comic Sans MS", 30 )
  warExpT:setFillColor( 0, 0, 0 )
  warExpT.x = display.contentCenterX + 80
  warExpT.y = display.contentCenterY + 130
  ---------------------------------------------------------------------------
  magHP = display.newText(sceneGroup, 100, display.contentCenterX, 20, "Comic Sans MS", 30 )
  magHP:setFillColor( 0, 0, 0 )
  magHP.x = display.contentCenterX + 80
  magHP.y = display.contentCenterY + 10
  
  magMp = display.newText( sceneGroup,30, display.contentCenterX, 20, "Comic Sans MS", 30 )
  magMp:setFillColor( 0, 0, 0 )
  magMp.x = display.contentCenterX + 80
  magMp.y = display.contentCenterY + 40
  
  magDam = display.newText(sceneGroup, 80, display.contentCenterX, 20, "Comic Sans MS", 30 )
  magDam:setFillColor( 0, 0, 0 )
  magDam.x = display.contentCenterX + 80
  magDam.y = display.contentCenterY - 20
  
  magExpT = display.newText(sceneGroup, 1, display.contentCenterX, 20, "Comic Sans MS", 30 )
  magExpT:setFillColor( 0, 0, 0 )
  magExpT.x = display.contentCenterX + 80
  magExpT.y = display.contentCenterY - 50
  ----------------------------------------
  archHP = display.newText(sceneGroup, "150" , display.contentCenterX, 20, "Comic Sans MS", 30 )
  archHP:setFillColor( 0, 0, 0 )
  archHP.x = display.contentCenterX + 80
  archHP.y = display.contentCenterY - 165
  
  archMp = display.newText(sceneGroup, 30 , display.contentCenterX, 20, "Comic Sans MS", 30 )
  archMp:setFillColor( 0, 0, 0 )
  archMp.x = display.contentCenterX + 80
  archMp.y = display.contentCenterY - 135
  
  archDam = display.newText(sceneGroup, 60 , display.contentCenterX, 20, "Comic Sans MS", 30 )
  archDam:setFillColor( 0, 0, 0 )
  archDam.x = display.contentCenterX + 80
  archDam.y = display.contentCenterY - 195
  
  
  archExpT = display.newText(sceneGroup, 1 , display.contentCenterX, 20, "Comic Sans MS", 30 )
  archExpT:setFillColor( 0, 0, 0 )
  archExpT.x = display.contentCenterX + 80
  archExpT.y = display.contentCenterY - 225
  
	mapButton:addEventListener( "tap", goToMap )

end



function magHpUp() 
  if magExp > 0 then
    magPlusHp = magPlusHp + 10
    magHP.text = 100 + magPlusHp
    magExp = magExp - 1
    magExpT.text = magExp
    print("HP")
  end
  
end

function magMpUp() 
  if magExp > 0 then
    magPlusMp = magPlusMp + 10
    magMp.text = 30 + magPlusMp
    magExp = magExp - 1
    magExpT.text = magExp
  end
end

function magDamUp() 
  if magExp > 0 then
    magPlusDam = magPlusDam + 10
    magDam.text = 80 + magPlusDam
    magExp = magExp - 1
    magExpT.text = magExp
  end
end
-----------------------------------------------
function warHpUp() 
  if warExp > 0 then
    warPlusHp = warPlusHp + 10
    warHP.text = 250 + warPlusHp
    warExp = warExp - 1
    warExpT.text = warExp
  end
end

function warMpUp() 
  if warExp > 0 then
    warPlusMp = warPlusMp + 10
    warMp.text = 30 + warPlusMp
    warExp = warExp - 1
    warExpT.text = warExp
  end
end

function warDamUp() 
  if warExp > 0 then
    warPlusDam = warPlusDam + 10
    warDam.text = 40 + warPlusDam
    warExp = warExp - 1
    warExpT.text = warExp
  end
end
------------------------------------------------

function archHpUp() 
  if archExp > 0 then
    archPlusHp = archPlusHp + 10
    archHP.text = 150 + archPlusHp
    archExp = archExp - 1
    archExpT.text = archExp
  end
end

function archMpUp() 
  if archExp > 0 then
    archPlusMp = archPlusMp + 10
    archMp.text = 30 + archPlusMp
    archExp = archExp - 1
    archExpT.text = archExp
  end
end

function archDamUp() 
  if archExp > 0 then
    archPlusDam = archPlusDam + 10
    archDam.text = 60 + archPlusDam
    archExp = archExp - 1
    archExpT.text = archExp
  end
end
-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
    composer.removeScene( "levelUp" )
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
  
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
