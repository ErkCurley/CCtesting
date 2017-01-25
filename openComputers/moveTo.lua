-- Robot Self-tracking System created by Latias1290 for turtles. Ported to OpenComputers by Erkcurley

local component = require("component")
local computer = require("computer")
local robot = require("robot")
local shell = require("shell")
local sides = require("sides")
local io = require("io")
local gps = require("gps")



function moveTo(x,y,z)
    gps.readLocation()
    local xStart, yStart, zStart = gps.getLocation()

    if xStart < x then
        face(3) --Face Positive X
        while xStart < x do
            gps.forward()
        end
    end
    if xStart > x then
        face(1) --Face Negative X
        while xStart > x do
            gps.forward()
        end
    end
    if zStart < z then
        face(2) --Face Positive z
        while zStart < z do
            gps.forward()
        end
    end
    if zStart > z then
        face(0)    --Face Negative z
        while zStart > z do
            gps.forward()
        end
    end
    if yStart < y then
        while yStart < y do
            gps.down()
        end
    end
    if yStart > y then
        while yStart < y do
            gps.up()
        end
    end
end

function face(f)
    gps.readLocation()
    local fStart = gps.getFace()
    
    while fStart ~= f do
        gps.faceRight()
        fStart = gps.getFace()
    end
end