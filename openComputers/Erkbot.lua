-- Robot Self-tracking System created by Latias1290 for turtles. Ported to OpenComputers by Erkcurley

local component = require("component")
local computer = require("computer")
local robot = require("robot")
local shell = require("shell")
local sides = require("sides")
local io = require("io")

local xPos, yPos, zPos = nil
local face = 1 --North = 0; West = 1; South = 2; East = 3;
cal = false

function readLocation()
 local something = ""
 local file = io.open("/home/location","r")
 for line in file:lines() do
  something = line
  local arr = explode(",",line)
  xPos = tonumber(arr[1])
  yPos = tonumber(arr[2])
  zPos = tonumber(arr[3])
  face = tonumber(arr[4])
  cal = true
 end
file:close()
 
 --fs = io.open("/home/debug","w")
 --fs:write(something)
 --fs:close()
 
end

readLocation()

