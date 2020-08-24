-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local _W=display.contentWidth
local _H=display.contentHeight
local foe
local foehp
local youhp
local attackb
local protecb
local huddy
local turn
local youhpn
local foehpn
local timer
local mission
local youshield
local foeshield
local action
function hpbar(value)
	if(youshield==true)then
value=value/2
youshield=false
youhp:setFillColor(0,1,0)
	end
youhp.width=youhp.width+value
youhpn=youhpn+value

if(youhpn<=150/2)then
youhp:setFillColor(1,1,0)
	end
	if(youhpn<=150/4)then
youhp:setFillColor(1,0,0)
	end
	
	end
	function foebar(value)
foehp.width=foehp.width+value
foehpn=foehpn+value

if(foehpn<=150/2)then
foehp:setFillColor(1,1,0)
	end
	if(foehpn<=150/4)then
foehp:setFillColor(1,0,0)
	end
	
	end
function setMission(idmiss)
if idmiss==0 then
	mission.text="O que deseja fazer?"
	elseif idmiss==1 then
		mission.text="O inimigo ataca!"
		elseif idmiss==2 then
		mission.text="Vitória!"
		elseif idmiss==3 then
			mission.text="Você ataca!"
			elseif idmiss==4 then
				mission.text="Você usa seu escudo!"
	end
	end
	function attackset(event)
		if(turn=="choice")then
		turn="you"
		action="attack"
	end
	end
function protectset(event)
if(turn=="choice")then
		turn="you"
		action="protect"
	end
end
function attack(event)
if(turn=="you")then
	if(action=="attack")then
	setMission(3)
	elseif action=="protect"then
		setMission(4)
end
timer=timer+1
if(timer==90)then
	if(action=="attack") then

foebar(-20)
elseif action=="protect" then
youshield=true
youhp:setFillColor(0,0,1)
	end
turn="foe"
timer=0
if(foehpn<=0)then
	Runtime:removeEventListener("enterFrame", enemyia)
setMission(2)
	end
end
end
end
function enemyation(event)
	local cont=0
	while(cont<=4)do
foe.y=foe.y-1
end

	end
function enemyia(event)
	


if(turn=="foe")then
	setMission(1)
timer=timer+1
if(timer==90)then
	
hpbar(-20)
	timer=0
turn="choice"
setMission(0)
	end
end

	end
function beginBattle()
	math.randomseed( os.time() )
	local randbg = math.floor( math.random()*9 )
	local bg = display.newImage( randbg ..".png", 550, 350 )
	bg:scale(2.5,2.8)
	bg.x = display.contentCenterX
bg.y = display.contentCenterY
	

	huddy=display.newRect(_W/2, _H-80,_W, 100)
foe=display.newImage("spiky.png",_W/2,_H/2-80)
foe:setFillColor(math.random(0,10)/10,math.random(0,10)/10,math.random(0,10)/10)
foe:scale(0.4,0.4)

foehp=display.newImage("hpbar.png",_W/2, _H/2+12)
foehp.width=150
foehp:setFillColor(0,1,0)
youhp=display.newImage("hpbar.png",_W/2,_H-70)
youhp.width=150
youhpn=150
youhp:setFillColor(0,1,0)
attackb=display.newImage("atticon.png",_W/2-110,_H-70)
attackb:scale(0.5,0.5)
protecb=display.newImage("deficon.png",_W/2+110,_H-70)
protecb:scale(0.5,0.5)
mission=display.newText("O que você deseja fazer?", _W/2,_H/2+50,native.systemFontBold, 25)

turn="choice"
Runtime:addEventListener("enterFrame", attack)
Runtime:addEventListener("enterFrame", enemyation)
attackb:addEventListener("touch", attackset)
protecb:addEventListener("touch", protectset)
Runtime:addEventListener("enterFrame", enemyia)
foehpn=150
huddy:setFillColor(0,0,0)
huddy.alpha=0.5
timer=0

	end

	beginBattle()