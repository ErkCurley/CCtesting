--Creator: Erkcurley

--Need to make a better navigation program. maybe indicated an initial direction facing? or use navigation upgrades?



local component = require("component")
local computer = require("computer")
local robot = require("robot")
local shell = require("shell")
local sides = require("sides")

local args, options = shell.parse(...)

local length = tonumber(args[1])
local width = tonumber(args[2])

local xHome, yHome, zHome = gps.getLocation() --Start location of the program. This should be where the robot goes when it has finished mining. Also the start of the quary.
local xLast, yLast, zLast = gps.getLocation() --This is the location that the robot needs to return to after it needs to drop off goods or get more energy.

--Dump inv works without problem
function dumpInv()
	local i = 1
	while i <= 16 do
		robot.select(i)
		robot.drop()
		i = i + 1
	end
	robot.select(1)
end

--Checking power needs to be tested
function checkPower()
	if computer.energy() < computer.maxEnergy()*.1 then
		refuel()
	end
end

--Refuel needs tested
function refuel()
	while computer.energy() < computer.maxEnergy()*.8 do
		os.sleep(10)
	end
end


function home()

end

function goBack()

end

--checkInv works properly
function checkInv()
	robot.select(16)
	local count = robot.count()
	robot.select(1)
	if count > 0 then
		home()
	end
end



home()