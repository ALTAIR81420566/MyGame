

local composer = require( "composer" )
 
-- Hide status bar
display.setStatusBar( display.HiddenStatusBar )
 
-- Seed the random number generator
math.randomseed( os.time() )
 
warExp = 1
warPlusHp = 0 
warPlusMp = 0 
warPlusDam = 0 

archExp = 1
archPlusHp = 0 
archPlusMp = 0 
archPlusDam = 0 

magExp = 1
magPlusHp = 0 
magPlusMp = 0 
magPlusDam = 0 
-- Go to the menu screen
composer.gotoScene( "menu" )

