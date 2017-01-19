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

function home()
	-- body
end

function checkInv()
	robot.select(16)
	if robot.getItemCount() > 0 then

		home()

	end

end

forward(16)