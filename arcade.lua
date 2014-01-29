module(...,package.seeall)
math.randomseed(os.time()) -- Make sure to seed the random number generator.


local alto = display.contentHeight
local ancho = display.contentWidth

grupo = display.newGroup()

aumenV = 6
aumen = 0
cont = 3
disC = 1
score = 0
tope = 1550
compro = false

cuadrado = nil
cuadrado2 = nil
cuadrado3 = nil
cuadrado4 = nil
cuadrado5 = nil
cuadrado6 = nil


fondo = display.newRect(0,0,ancho,alto)
fondo.x = ancho / 2
fondo.y = alto / 2
fondo:setFillColor(0.5,0.5,0.5)
grupo:insert(fondo)

barra2 = display.newRect(0,0,ancho,140)
barra2.x = ancho / 2
barra2.y = 70
barra2:setFillColor(0,0.5,0.5)
grupo:insert(barra2)

barra = display.newRect(0,0,80,140)
barra.x = 10
barra.y = 70
barra:setFillColor(0.2,1,0.2)
grupo:insert(barra)

scoreImage = display.newImage("rec/score.png")
scoreImage.x = 180
scoreImage.y = 100
grupo:insert(scoreImage)


---------------------------
----------------Pausa-----------
--------------------------

subS = display.newRect(0,0,ancho,alto)
subS.x = ancho / 2
subS.y = alto / 2
subS:setFillColor(0.3,0.3,0.3)
subS.alpha = 0.5
subS.isVisible = false

pauseb = display.newImage("rec/puaseb.jpg")
pauseb.x = 60
pauseb.y = alto - 55
pauseb.isVisible = false

returnB = display.newImage("rec/return.png")
returnB.x = 70
returnB.y = alto - 180
returnB.isVisible = false

gameOverF = display.newImageRect("rec/GAO.png",768,1024)
gameOverF.x = ancho / 2
gameOverF.y = alto / 2
gameOverF.alpha = 0

num = display.newImageRect("rec/3.png",250,250)
num.x = ancho / 2
num.y = alto/2

------------------------------------------------------
--------------------------------------------------------
---------------------Funciones--------------
----------------------------------------------------------------
------------------------PAUSE--------------
-----------
function listeners(event)
	pauseb:removeEventListener("touch",pause)
	pauseb:addEventListener("touch",continue)
end
function listeners2(event)
	pauseb:removeEventListener("touch",continue)
	pauseb:addEventListener("touch",pause)
end
	
function pause(event)
	if event.phase == "ended" then
		aumen = 0
		subS.isVisible = true
		timer.performWithDelay( 100, listeners )
		cuadrado:removeEventListener("touch",convert)
		cuadrado2:removeEventListener("touch",convert)
		cuadrado3:removeEventListener("touch",convert)
		cuadrado4:removeEventListener("touch",convert)
	end
	return true
end

function continue(event)
	if event.phase == "ended" then
		subS.isVisible = false
		returnB.isVisible = false
		aumen = aumenV
		timer.performWithDelay( 100,listeners2 )
		cuadrado:addEventListener("touch",convert)
		cuadrado2:addEventListener("touch",convert)
		cuadrado3:addEventListener("touch",convert)
		cuadrado4:addEventListener("touch",convert)
	end
	return true
end

-------------------------------
-----------------Sqarwe--------------------
----------------------

function shuffle(t)
  local n = #t

  while n >= 2 do
    -- n is now the last pertinent index
    local k = math.random(n) -- 1 <= k <= n
    -- Quick swap
    t[n], t[k] = t[k], t[n]
    n = n - 1
  end

  return t
end


function createSquares(event)
	colores = {"rec/c1.png","rec/c2.png","rec/c3.png","rec/c4.png","rec/c5.png","rec/c6.png"}
	random1 = colores[math.random(1,6)]
	random2 = colores[math.random(1,6)]
	valorR1 = random1
	valorR2 = random2

	if random1 == random2 then
		shuffle(colores)
		random2 = nil
		random2= colores[math.random(1,6)]
	end

	----------------------------------------------
	---POsicion----------------------------------
	---------------------------

	pos1 = {190,560}
	posRan1 = pos1[math.random(1,2)]
	posRan2 = pos1[math.random(1,2)]


	pos2 = {190,560}
	posRan3 = pos2[math.random(1,2)]
	posRan4 = pos2[math.random(1,2)]


	pos3 = {190,560}
	posRan5 = pos3[math.random(1,2)]
	posRan6 = pos3[math.random(1,2)]

	if posRan1 == posRan2 then
		posRan1 = nil
		posRan1 = 190
		posRan2 = nil
		posRan2 = 560		
	end		

	if posRan3 == posRan4 then
		posRan3 = nil
		posRan3 = 190
		posRan4 = nil
		posRan4 = 560	
	end		

	if posRan5 == posRan6 then
		posRan5 = nil
		posRan5 = 190
		posRan6 = nil
		posRan6 = 560	
	end		

-------------FEn

-------------One vcolor
	if compro == false then
		scoreText = display.newText(score,0,0,system.nativeFont,100)
		scoreText.x = 400
		scoreText.y = 70
		scoreText:setTextColor(0,0,0)
		grupo:insert(scoreText)
	end

	compro = true

	cuadrado = display.newImageRect(random1,340,280)
	cuadrado.x = posRan1
	cuadrado.y = 290
	cuadrado.alpha = 0
	transition.to(cuadrado, {alpha = 1, time = 100 })
	cuadrado2 = display.newImageRect(random1,340,280)
	cuadrado2.x = posRan2
	cuadrado2.y = 290
	transition.to(cuadrado2, {alpha = 1, time = 100 })
	cuadrado3 = display.newImageRect(random1,340,280)
	cuadrado3.x = posRan4
	cuadrado3.y = 575
	transition.to(cuadrado3, {alpha = 1, time = 100 })
	cuadrado4 = display.newImageRect(random1,340,280)
	cuadrado4.x = posRan5
	cuadrado4.y = 870
	transition.to(cuadrado4, {alpha = 1, time = 100 })

	------------------------SECONE COLOR
	------
	cuadrado5 = display.newImageRect(random2,340,280)
	cuadrado5.x = posRan3
	cuadrado5.y = 575
	transition.to(cuadrado5, {alpha = 1, time = 100 })
	cuadrado6 = display.newImageRect(random2,340,280)
	cuadrado6.x = posRan6
	cuadrado6.y = 870
	transition.to(cuadrado6, {alpha = 1, time = 100 })

	grupo:insert(cuadrado)
	grupo:insert(cuadrado2)
	grupo:insert(cuadrado3)
	grupo:insert(cuadrado4)
	grupo:insert(cuadrado5)
	grupo:insert(cuadrado6)

	grupo:insert(subS)
	grupo:insert(returnB)
	grupo:insert(pauseb)

	grupo:insert(gameOverF)


	return true
end

--------------------------------------------------------------------
----------------------------------------------CreateSquaresFin----------------------
-------------------------------------------------------------------





function convert(event)
	if event.phase == "began" then
		if event.target == cuadrado then
			cuadrado = nil
			cuadrado = display.newImageRect(random2,340,280)
			cuadrado.x = posRan1
			cuadrado.y = 290
			cuadrado:removeEventListener("touch",convert)
			c1 = true
			if c1 == true then
				timer.performWithDelay(50,deleListener1)
			end
			grupo:insert(cuadrado)
		elseif event.target == cuadrado2 then
			cuadrado2 = nil
			cuadrado2 = display.newImageRect(random2,340,280)
			cuadrado2.x = posRan2
			cuadrado2.y = 290
			cuadrado2:removeEventListener("touch",convert)
			c2 = true
			if c2 == true then
				timer.performWithDelay(50,deleListener2)
			end
			grupo:insert(cuadrado2)
		elseif event.target == cuadrado3 then
			cuadrado3 = nil
			cuadrado3 = display.newImageRect(random2,340,280)
			cuadrado3.x = posRan4
			cuadrado3.y = 575
			cuadrado3:removeEventListener("touch",convert)
			c3 = true
			if c3 == true then
				timer.performWithDelay(50,deleListener3)
			end
			grupo:insert(cuadrado3)
		elseif event.target == cuadrado4 then
			cuadrado4 = nil
			cuadrado4 = display.newImageRect(random2,340,280)
			cuadrado4.x = posRan5
			cuadrado4.y = 870
			cuadrado4:removeEventListener("touch",convert)
			c4 = true
			if c4 == true then
				timer.performWithDelay(50,deleListener4)
			end
			grupo:insert(cuadrado4)
		end
		grupo:insert(subS)
		grupo:insert(returnB)
		grupo:insert(pauseb)

	end
	
	return true
end

function deleListener1(event)
		cuadrado:removeEventListener("touch",convert)
	return true
end
function deleListener2(event)
		cuadrado2:removeEventListener("touch",convert)	
	return true
end
function deleListener3(event)
		cuadrado3:removeEventListener("touch",convert)
	return true
end
function deleListener4(event)
		cuadrado4:removeEventListener("touch",convert)
	return true
end

-----------------------------------------------------------
-------------------------FIn Conversion.-----------------------------
--------------------------------------------
----------------------------------------
----------------------


function endGame(event)
	cer = true

	pauseb:removeEventListener("touch",pause)
	pauseb.isVisible = false
	grupo:insert(gameOverF)

	timer.performWithDelay(100,removeAll,1)

	scoreText:removeSelf()
	scoreText = nil
	finalScoreText = display.newText(score,0,0,system.nativeFont,150)
	finalScoreText.x = ancho / 2
	finalScoreText.y = 850
	finalScoreText.alpha = 0
	finalScoreText:setFillColor(0,0,0)
	grupo:insert(finalScoreText)	

	transition.to(gameOverF,{alpha = 1, time = 200})
	transition.to(finalScoreText,{alpha = 1, time = 100})

	Runtime:removeEventListener("enterFrame",loopGame)

	deleListener1()
	deleListener2()
	deleListener3()
	deleListener4()

	return true
end

function loopGame(event)
	
	-------------------------
	---------Contador--------
	------------------ 		

	transition.to(uno,{alpha = 1,time = 500})
	transition.to(dos,{alpha = 1, time = 1000})
	transition.to(num,{xScale = 2,yScale = 2, time = 100})

	cont = cont - disC
	
	if cont == -30 then 
		
		transition.to(tres,{alpha = 1,time = 500})
		transition.to(cuatro,{alpha = 1,time = 1000})
		num:removeSelf()
		num = nil
		num = display.newImageRect( "rec/2.png",250,250)
		num.x = ancho / 2
		num.y = alto / 2
		transition.to(num,{xScale = 2,yScale = 2, time = 60})

	elseif cont == -60 then
		transition.to(cinco,{alpha = 1, time = 500})
		transition.to(seis,{alpha = 1, time = 1000})
		num:removeSelf()
		num = nil
		num = display.newImageRect( "rec/1.png",250,250)
		num.x = ancho / 2 + 50
		num.y = alto/2
		transition.to(num,{xScale = 2,yScale = 2, time = 60})
		
	elseif cont == -90 then
		pauseb.isVisible = true
		pauseb:addEventListener("touch",pause)
		num:removeSelf()
		num = nil
		aumen = aumenV
		cuadrado:addEventListener("touch",convert)
		cuadrado2:addEventListener("touch",convert)
		cuadrado3:addEventListener("touch",convert)
		cuadrado4:addEventListener("touch",convert)
		
	end
	---------------------------
	-------------fin-----------

	----------------------
	------------Barra----------
	barra.width = barra.width + aumen
	if barra.width > tope then
		aumenV = 0
		endGame()
	end 

	--------cretethe Sq--------------
	-------------------------------
	if c1 == true and c2 == true and c3 == true and c4 == true then
		score = score + 5
		scoreText.text = score
		print(score)
		timer.performWithDelay(50,recre,1)	
		c1 = false
		c2 = false
		c3 = false
		c4 = false
	end
	
	return true
end

--------------------------------------------------
---------------------------------------------------------------------------
------------------------------End game y loop Game
---------------------------------------------------------------------------------------------

function addListeners(event)
	cuadrado:addEventListener("touch",convert)
	cuadrado2:addEventListener("touch",convert)
	cuadrado3:addEventListener("touch",convert)
	cuadrado4:addEventListener("touch",convert)
end

function recre(event)

		cuadrado:removeSelf()
		cuadrado = nil
		cuadrado2:removeSelf()
		cuadrado2 = nil
		cuadrado3:removeSelf()
		cuadrado3 = nil
		cuadrado4:removeSelf()
		cuadrado4 = nil
		cuadrado5:removeSelf()
		cuadrado5 = nil
		cuadrado6:removeSelf()
		cuadrado6 = nil

		timer.performWithDelay(1,createSquares,1)
		timer.performWithDelay(5,addListeners,1)
end

function removeAll(event)
	cuadrado:removeSelf()
	cuadrado = nil
	cuadrado2:removeSelf()
	cuadrado2 = nil
	cuadrado3:removeSelf()
	cuadrado3 = nil
	cuadrado4:removeSelf()
	cuadrado4 = nil
	cuadrado5:removeSelf()
	cuadrado5 = nil
	cuadrado6:removeSelf()
	cuadrado6 = nil
	return true
end

-----------------------------------------------
--------------------------------------------------------------------------------------
---------------------------START----------------------
---------------------
grupo:insert(num)

function start(event)
	barra.width = 140
	compro = false
	score = 0
	Runtime:addEventListener("enterFrame",loopGame)
	timer.performWithDelay(100,createSquares,1)
end




