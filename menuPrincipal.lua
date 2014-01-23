module(...,package.seeall)

local widget = require "widget"

local ancho = display.contentWidth
local alto = display.contentHeight
sprite = require("sprite")

 cuadrados = display.newGroup()
 grupo = display.newGroup()


--Gráficos, fondo: 

cuadrado1 = display.newRect(0,0,410,410)
cuadrado2 = display.newRect(0,0,410,410)
cuadrado3 = display.newRect(0,0,410,380)
cuadrado4 = display.newRect(0,0,410,380)
cuadrado5 = display.newRect(0,0,410,380)
cuadrado6 = display.newRect(0,0,410,380)
cuadrado1.x = 160
cuadrado1.y = 150
cuadrado2.x = 565
cuadrado2.y = 150
cuadrado3.x = 155
cuadrado3.y = 540
cuadrado4.x = 565
cuadrado4.y = 540
cuadrado5.x = 155
cuadrado5.y = 890
cuadrado6.x = 565
cuadrado6.y = 890
cuadrado1:setFillColor(1, 0.2, 0.2)
cuadrado2:setFillColor(0.2, 0.2, 1)
cuadrado3:setFillColor(0.2, 1, 0.2)
cuadrado4:setFillColor(2, 1, 0.2)
cuadrado5:setFillColor(0.2,0.2,0.2)
cuadrado6:setFillColor(0.2,1,2)
cuadrados:insert(cuadrado1)
cuadrados:insert(cuadrado2)
cuadrados:insert(cuadrado3)
cuadrados:insert(cuadrado4)
cuadrados:insert(cuadrado5)
cuadrados:insert(cuadrado6)


-- FINAL
titulo = display.newImage("rec/titulo.png")
titulo.x = ancho/2
titulo.y = 100
grupo:insert(titulo)

local tap = audio.loadSound("mus/pop.aif")
audio.setMaxVolume( 1, { channel=1 } )


bar = display.newImage("rec/barr.png")
bar.x = ancho/2
bar.y  = alto/2 - 80
bar.alpha = 0
grupo:insert(bar)

conf = display.newImage("rec/conf.png")
conf.x = ancho/2
conf.y = alto/2
grupo:insert(conf)

son = display.newImageRect("rec/musi.png",50,50)
son.x = ancho/2
son.y = alto/2 - 100
son.alpha = 0
grupo:insert(son)

fx = display.newImageRect("rec/fx.png",80,80)
fx.x = ancho/2
fx.y = alto / 2 - 150
fx.alpha =0
grupo:insert(fx)

------------------
--FIN-----------
----------------

function cambio(event)
	if event.phase == "began" then
		cuadrado1:setFillColor(math.random(0.2,1),math.random(0.2,0.6),math.random(0.2,1))
		audio.play(tap)
	end
	return true
end

function cambio2(event)
	if event.phase == "began" then
		cuadrado2:setFillColor(math.random(0.2,1),math.random(0.2,0.6),math.random(0.2,1))
		audio.play(tap)
	end
	return true
end

function cambio3(event)
	if event.phase == "began" then
		cuadrado3:setFillColor(math.random(0.2,1),math.random(0.2,0.6),math.random(0.2,1))
		audio.play(tap)
	end
	return true
end

function cambio4(event)
	if event.phase == "began" then
		cuadrado4:setFillColor(math.random(0.2,1),math.random(0.2,0.6),math.random(0.2,1))
		audio.play(tap)		
	end
	return true
end

function cambio5(event)
	if event.phase == "began" then
		cuadrado5:setFillColor(math.random(0.2,1),math.random(0.2,0.6),math.random(0.2,1))
		audio.play(tap)
	end
	return true
end

function cambio6(event)
	if event.phase == "began" then
		cuadrado6:setFillColor(math.random(0.2,1),math.random(0.2,0.6),math.random(0.2,1))
		audio.play(tap)
	end
	return true
end
------------------
--- FIN----------
----------------

cuadrado1:addEventListener("touch",cambio)
cuadrado2:addEventListener("touch",cambio2)
cuadrado3:addEventListener("touch",cambio3)
cuadrado4:addEventListener("touch",cambio4)
cuadrado5:addEventListener("touch",cambio5)
cuadrado6:addEventListener("touch",cambio6)
-----FIN.-----
----------


--------------Botons................
----------------------------










