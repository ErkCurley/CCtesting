-- Robot Self-tracking System created by Latias1290 for turtles. Ported to OpenComputers by Erkcurley

local component = require("component")
local computer = require("computer")
local robot = require("robot")
local shell = require("shell")
local sides = require("sides")

local xPos, yPos, zPos = nil
face = 1 --North = 0; West = 1; South = 2; East = 3;
cal = false

function setLocation() -- get gps using other computers
 xPos, yPos, zPos = gps.locate()
 cal = true
end

function manSetLocation(x, y, z) -- manually set location
 x = tonumber(x)
 y = tonumber(y)
 z = tonumber(z)
 
 xPos = x
 yPos = y
 zPos = z
 cal = true
end

function getLocation() -- return the location
 if xPos ~= nil then
  return xPos, yPos, zPos
 elseif xPos == nil then
  return nil
 end
end

function turnLeft() -- turn left
 if face == 0 then
  face = 1
 elseif face == 1 then
  face = 2
 elseif face == 2 then
  face = 3
 elseif face == 3 then
  face = 0
 end
end

function turnRight() -- turn right
 if face == 0 then
  face = 3
 elseif face == 1 then
  face = 0
 elseif face == 2 then
  face = 1
 elseif face == 3 then
  face = 2
 end
end

function forward() -- go forward
 robot.forward()
 if cal == true then
  if face == 0 then
   zPos = zPos - 1
  elseif face == 1 then
   xPos = xPos - 1
  elseif face == 2 then
   zPos = zPos + 1
  elseif face == 3 then
   xPos = xPos + 1
  end
 else
  io.stderr:write("Not Calibrated.")
 end
end

function back() -- go back
 robot.back()
 if cal == true then
  if face == 0 then
   zPos = zPos + 1
  elseif face == 1 then
   xPos = xPos + 1
  elseif face == 2 then
   zPos = zPos - 1
  elseif face == 2 then
   xPos = xPos - 1
  end
 else
  io.stderr:write("Not Calibrated.")
 end
end

function up() -- go up
 robot.up()
 if cal == true then
  yPos = yPos + 1
 else
  io.stderr:write("Not Calibrated.")
 end
end

function down() -- go down
 robot.down()
 if cal == true then
  yPos = yPos - 1
 else
  io.stderr:write("Not Calibrated.")
 end
end

function jump() -- perform a jump. useless? yup!
  robot.up()
  robot.down()
end
