display.setStatusBar(display.HiddenStatusBar)

--ultimote = require "Ultimote";ultimote.connect();
--ultimote.autoScreenCapture()
--ultimote.connect()


local ancho = display.contentWidth
local alto = display.contentHeight

local widget = require ("widget")
local sprite = require("sprite")
local soundTrack = audio.loadStream("mus/sound.mp3")
audio.setMinVolume( 10, { channel=1 } )

--local GA = require "plugin.gameanalytics"
--GA.isDebug = true
--GA.runInSimulator = true
--GA.submitSystemInfo = true
--GA.sumbitAverageFps = true
--GA.sbmitAverageFpsInterval = 10 
--GA.init ({
--		game_key = '30276abaf2f000996d41ac231b510c72',
--		secret_key = 'ac4f602681b310e2c4aad922acf58b4472b550aa',
--		build_name = "0.1",
--})


local menuPrincipal = require "menuPrincipal"
local menuSecundario = require "menuSecundario"
local multi = require "multi"
local solo = require "arcade"

solo.grupo.alpha = 0
menuPrincipal.cuadrados.alpha = 1
menuPrincipal.grupo.alpha = 1
menuSecundario.grupo.alpha = 0


--------------------------
-------------------MENU---------------------------
---------------------------------------------

function juego(event)
	transition.to(menuSecundario.solo1,{xScale = 1,yScale = 1,time =400})
	transition.to(menuSecundario.multi1,{xScale = 1,yScale =1,time = 400})	 
	transition.to(menuSecundario.multi1, { alpha=1, time=500 } )
	transition.to(menuSecundario.solo1, { alpha=1, time=500 } )
	transition.to(menuPrincipal.grupo, { alpha=0, time=500 } )
	transition.to(menuSecundario.grupo, { alpha=1, time=500 } )
return true
end

-----------------------------------------------------------
------------------------------------------solo-----------
----------------------------------------------------

function goSolo(event)
	menuPrincipal.cuadrado1:removeEventListener("touch",menuPrincipal.cambio)
	menuPrincipal.cuadrado2:removeEventListener("touch",menuPrincipal.cambio2)
	menuPrincipal.cuadrado3:removeEventListener("touch",menuPrincipal.cambio3)
	menuPrincipal.cuadrado4:removeEventListener("touch",menuPrincipal.cambio4)
	menuPrincipal.cuadrado5:removeEventListener("touch",menuPrincipal.cambio5)
	menuPrincipal.cuadrado6:removeEventListener("touch",menuPrincipal.cambio6)
	transition.to(menuPrincipal.cuadrados, { alpha=0, time=100 } )
	transition.to(menuSecundario.grupo, { alpha=0, time=100 } )
	transition.to(solo.grupo, { alpha=1, time=20 } )
	--arcade.start()
end

----------------------------
-------------------------------------------Reg
--------------------------------------------------


function reg(event)
		transition.to(menuSecundario.grupo,{alpha = 0, time = 300})
		transition.to(menuPrincipal.grupo,{alpha = 1, time = 1000})
	return true
end
------------
-------------MOSTR-----------
-----------------

function endd(event)
	menuPrincipal.conf:removeEventListener("touch",mostr)
	menuPrincipal.conf:addEventListener("touch",cerr)
end

function endd2(event)
	menuPrincipal.conf:removeEventListener("touch",cerr)
	menuPrincipal.conf:addEventListener("touch",mostr)
end

function mostr(event)
if event.phase == "began" then
	transition.to(menuPrincipal.son, {alpha = 1,50})
	transition.to(menuPrincipal.fx, {alpha = 1, 50})
	transition.to(menuPrincipal.bar, {alpha = 1, 50})
	timer.performWithDelay( 50, endd )
	menuPrincipal.son:addEventListener("touch",offMus)
end
return true
end

function cerr(event)
	if event.phase == "began" then
	transition.to(menuPrincipal.son, {alpha = 0,50})
	transition.to(menuPrincipal.fx, {alpha = 0, 50})
	transition.to(menuPrincipal.menuPrincipal.bar, {alpha = 0, 50})
	timer.performWithDelay( 50, endd2 )
	end
	return true
end

-----Music--------------
-----------------

function offMusE2(event)
menuPrincipal.son:removeEventListener("touch",playMus)
menuPrincipal.son:addEventListener("touch",offMus)
end



function playMusE(event)
menuPrincipal.son:removeEventListener("touch",offMus)
menuPrincipal.son:addEventListener("touch",playMus)
print("IS OF DDDD:")
end

function playMus(event)
if event.phase == "began" then
local backgroundMusicChannel2 = audio.resume(soundTrack, { channel=1, loops=-1, fadein=3000 }  )
timer.performWithDelay( 5, offMusE2)
end
return true
end

function offMus(event)
if event.phase == "began" then
audio.pause(soundTrack)
timer.performWithDelay( 5, playMusE)
end
return true
end

function offMusE()
menuPrincipal.son:addEventListener("touch",offMus)
end

-------------END-----------
------------------------


function openURL(event)
	system.openURL("www.facebook.com")
end


---------Butons..---------
-----------

button1 = widget.newButton
{
	defaultFile = "rec/boton.png",
	overFile = "rec/botonP.png",
	onRelease = juego
}
button1.x = ancho/2
button1.y = 800
menuPrincipal.grupo:insert(button1)

fb = widget.newButton
{
defaultFile = "rec/fb.png",
overFile = "rec/fbP.png",
onRelease = openURL
}
fb.x = 100
fb.y = ancho/2+550
menuPrincipal.grupo:insert(fb)

reg = widget.newButton
{
    defaultFile = "rec/reg.png",
    overFile = "rec/regP.png",
    onRelease = reg
}
reg.x = ancho/2 - 260
reg.y = alto/2 + 400
menuSecundario.grupo:insert(reg)

solo1 = widget.newButton
{
    defaultFile = "rec/solo.png",
    overFile = "rec/soloP.png",
    onRelease = goSolo
}
solo1.x = ancho/2
solo1.y = alto/2 - 250
solo1.xScale = 0.5
solo1.yScale = 0.5
solo1.alpha = 0
menuSecundario.grupo:insert(solo1)

multi1 = widget.newButton
{
    defaultFile = "rec/multi.png",
    overFile = "rec/multiP.png",
    onEvent = goMulti
}
multi1.x = ancho/2
multi1.y = alto/2 + 200
multi1.xScale = 0.5
multi1.yScale = 0.5
multi1.alpha = 0
menuSecundario.grupo:insert(multi1)


menuPrincipal.conf:addEventListener("touch",mostr)


