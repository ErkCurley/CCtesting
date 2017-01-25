--Creator: Erkcurley

local component = require("component")
local computer = require("computer")
local robot = require("robot")
local shell = require("shell")
local sides = require("sides")
local gps = require("gps")

local args, options = shell.parse(...)

local length = tonumber(args[1])

distance = 0
blocksMined = 0

function tunnel(number)
	
	if number == nil then
		number = 1
	end

	if number < 1 then
		number = 1
	end

	while distance < number do
		checkInv()
		robot.swing()
		forward()
		dig()
		faceRight()
		robot.swing()
		forward()
		dig()
		faceLeft()
		faceLeft()
		forward()
		robot.swing()
		forward()
		dig()
		faceRight()
		faceRight()
		forward()
		faceLeft()
		distance = distance + 1
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
		-- io.write(i)
		robot.drop()
		i = i + 1
	end
	robot.select(1)
end

function checkPower()
	if computer.energy() < computer.maxEnergy()*.1 then
		refuel()
	end
end

function refuel()
	while computer.energy() < computer.maxEnergy()*.8 do
		os.sleep(10)
	end
end

function home()
	--io.write(distance)
	local i = 0
	faceRight()
	faceRight()
	while i < distance do
		forward()
		i = i + 1
	end
	dumpInv()
	refuel()
	faceRight()
	faceRight()
	
	if distance < length then
		goBack(distance)
		io.write(distance)
	end
end

function goBack()
	local i = 0
	while i < distance do
		forward()
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

tunnel(length)
home()
