--Creator: Erkcurley

local component = require("component")
local computer = require("computer")
local robot = require("robot")
local shell = require("shell")
local sides = require("sides")

local args, options = shell.parse(...)

if args[1] == nil then
	--this doesn't work
	local length = 16
	
end

local length = tonumber(args[1])


distance = 0
facing = 0
blocksMined = 0
directionFacing = "North"

directions = {"North","East","South","West"}



function forward(number)
	
	if number == nil then
		number = 1
	end

	if number < 1 then
		number = 1
	end

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
	if side == facing - 1 then
		robot.turnLeft()
	else
		while  facing ~= side do
			robot.turnRight()
			facing = facing + 1
			if facing > 3 then
				facing = 0
			end
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
	if computer.energy() < computer.maxEnergy()*.1 then
		refuel()
	end
end

function refuel()
	while computer.energy() < computer.maxEnergy()*.8 do
	end
end

function home()
	local i = 0
	turn(2)
	while i < distance do
		robot.forward()
		i = i + 1
	end
	dumpInv()
	refuel()
	turn(0)
	
	if distance < length then
		goBack(distance)
		distance = 0
	end
end

function goBack()
	local i = 0
	while i < distance do
		robot.forward()
		i = i + 1
	end
end

function checkInv()
	robot.select(16)
	local count = robot.count()
	robot.select(1)
	if count > 0 then
		home()
	end
end

forward(length)
home()