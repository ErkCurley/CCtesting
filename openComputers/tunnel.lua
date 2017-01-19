--Creator: Erkcurley

local component = require("component")
local computer = require("computer")
local robot = require("robot")
local shell = require("shell")
local sides = require("sides")

local distance = 1
local blocksMined = 0

local function forward(number)

	while number < distance do
		robot.swing()
		robot.forward()
		dig()
		robot.turnLeft()
		robot.swing()
		robot.forward()
		dig()
		robot.turnRight()
		robot.turnRight()
		robot.forward()
		robot.swing()
		robot.forward()
		dig()
		robot.turnLeft()
		robot.turnLeft()
		robot.forward()
		robot.turnRight()
		distance = distance + 1
	end
end

local function dig()

	robot.swingUp()
	robot.swingDown()

end

forward(16)