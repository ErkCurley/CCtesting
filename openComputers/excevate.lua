--Creator: Erkcurley
--test
--New Excavate Program - Checks power level and returns home when low.

local component = require("component")
local computer = require("computer")
local robot = require("robot")
local shell = require("shell")
local sides = require("sides")

local myX = 0
local myY = 0
local myZ = 0
local face = 1
local sides = 0
local blocksMined = 0

local function Move(x,y,z)
	if x < myX then
		Face("west")
		while myX < x do 
			robot.forward()
		end
	end
	
	if z < myZ then
		Face("north")
		while myZ < z do 
			robot.forward()
		end
	end 
	
 	if y < myY then
 		while myY < y do
 			robot.down()
		end
 	end

 	if x > myX then
 		Face("east")
		while myX > x do
			robot.forward()
		end
	end
	
	if z > myZ then
		Face("west")
		while myZ > z do 
			robot.forward()
		end
	end
	
 	if y > myY then
 		while myY > y do
 			robot.up()
		end
 	end
end

local function Turn(n)
	side = robot.sides()

	while side < n do
		robot.turnRight()
	end
end


local function Dig(Direction = 0)
	if direction == "up" then
		robot.swingUp()
	else if direction == "down" then 
		robot.swingDown()
	else
		robot.swing()
	end
end

local function Excavate(size)
	while n < size do 
		while m < size do
			Dig()
			robot.forward()
			m = m + 1
			Dig("up")
			Dig("down")
		end
		n = n + 1
	end
end

local function Home()
	
end

local function CheckRefuel()

end

local function Refuel()

end

local function Empty()
	while i < 15 do
		robot.select(i)
		--Add Block Stack To List
		robot.drop()
	end
end

local function CheckInventory()
	
end

local function PostBlocks()
	--Loop through list and post all the data in JSON
end