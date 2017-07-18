local composer = require( "composer" )

local scene = composer.newScene()

function gotoGame()
  backgroundmap.alpha = 0
  playButton.alpha = 0
	composer.gotoScene( "game", {effect="crossFade" } )
end
print(win)

function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

  backgroundmap = display.newImageRect( "Карта.png", 1050, 580 )
	backgroundmap.x = display.contentCenterX
	backgroundmap.y = display.contentCenterY

--	local title = display.newImageRect( sceneGroup, "title.png", 500, 80 )
--	title.x = display.contentCenterX
--	title.y = 200

	 playButton = display.newImageRect(  "level.png", 100, 100 )
  playButton.x = display.contentCenterX - 300
  playButton.y = display.contentCenterY - 75
	

	playButton:addEventListener( "tap", gotoGame )
  
    
      playButton2 = display.newImageRect("level2.png", 100, 100 )
      playButton2.x = display.contentCenterX - 230
      playButton2.y = display.contentCenterY + 30
	

      playButton2:addEventListener( "tap", gotoGame )
      playButton2.alpha = 0
   
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
  
	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view
  display.remove(backgroundmap)
  display.remove(playButton2)
  display.remove(playButton)
  composer.removeScene( "map" )
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