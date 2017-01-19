--Creator: Erkcurley

local component = require("component")
local computer = require("computer")
local robot = require("robot")
local shell = require("shell")
local sides = require("sides")

distance = 0
facing = 0
blocksMined = 0
directionFacing = "North"

directions = {"North","East","South","West"}

function forward(number)

	while distance < number do
		checkInv()
		robot.swing()
		robot.forward()
		dig()
		turn(3)
		robot.swing()
		robot.forward()
		dig()
		turn(1)
		robot.forward()
		robot.swing()
		robot.forward()
		dig()
		turn(3)
		robot.forward()
		turn(0)
		distance = distance + 1

	end
end

function turn(side)
	while  facing ~= side do
		robot.turnLeft()
		facing = facing - 1
		if facing < 0 then
			facing = 3
		end
	end 
end

function dig()

	robot.swingUp()
	robot.swingDown()

end

function dumpInv()
	local i = 1
	while i <= 16 do
		robot.select(i)
		robot.drop()
		i = i + 1
	end
end

function checkPower()
	-- if power is lower than 10% go home
end

function refuel()
	--get the energy level
	--stay until the energy level is full
end

function home()
	local i = 0
	turn(2)
	while i < distance do
		robot.forward()
		i = i + 1
	end
	distance = 0
	dumpInv()
	refuel()
	turn(0)
end

function checkInv()
	robot.select(16)
	local count = robot.count()
	robot.select(1)
	if count > 0 then

		home()

	end
end

forward(16)
home()