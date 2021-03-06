local modem = peripheral.wrap("left")
local goTo = {...}
log = fs.open("LogPos","w") 
  
function forward(num)
  if not turtle.detectUp() then
    shell.run("Fuel")
  end
  
  for i=1,num do 
    turtle.forward()
    
  end
  local X, Y, Z = gps.locate()
  log.writeLine(X.."  "..Y.." "..Z.." Forward"..num)
end
function up()
  if not turtle.detectUp() then
    shell.run("Fuel")
  end
  for i=1,num do
    turtle.up()
  end
  local X, Y, Z = gps.locate()
  log.writeLine(X.."  "..Y.." "..Z.." Up")
end
function down()
  if not turtle.detectUp() then
    shell.run("Fuel")
  end
  for i=1,num do
    turtle.down()
  end
  local X, Y, Z = gps.locate()
  log.writeLine(X.."  "..Y.." "..Z.." Down")
end
function back(num)
  turtle.turnLeft()
  turtle.turnLeft()
  for i=1,num do 
    forward(1)
  end
end

function right(num)
  turtle.turnRight()
  for i=1,num do 
    forward(1)
  end
end
function left(num)
  turtle.turnLeft()
  for i=1,num do 
    forward(1)
  end
end
function round()
  turtle.turnLeft()
  turtle.turnLeft()
end
function turn(face,want)
  if want == "North" then want = 1 end  
  if want == "East"  then want = 2 end
  if want == "South" then want = 3 end
  if want == "West"  then want = 4 end
  
  if face == want then

  else
    while face ~= want do 
      turtle.turnRight()
      face = face + 1
      if face == 5 then
        face = face - 4
      end
    end
  end
end

function move(a,b,c)
  a = tonumber(a)
  b = tonumber(b)
  c = tonumber(c)
  face = face()
  local startX, startY, startZ = gps.locate()
  
  if(a>startX)then
    turn(face,"East")
    face = 2
    num = startX - a
    if num < 0 then num = num * -1 end
    forward(num)
  else
    if(a ~= startX)then
      turn(face,"West")
      face = 4
      num = startX -a
      if num < 0 then num = num + -1 end
      forward(num)
    end
  end

  if(b>startY)then
    num = b - startY
    up(num)  
  else
    if(b ~= startY)then
      num = startY - b
      down(num)
    end
  end

  
  if(c>startZ)then
    turn(face,"South")
    face = 3
    --print("I should go Forward".. startZ - c)
    num = startZ - c
    if num < 0 then num =  num * -1 end
    forward(num)
  else
    if(c ~= startZ)then
      turn(face,"North")
      face = 1
      num = startZ - c
      if num < 0 then num = num * -1 end
      forward(num)
    end
  end
  --print("Face = " .. face)
end

function face()
  local x,y,z = gps.locate()
  forward(1)
  local X,Y,Z = gps.locate()
  round()
  forward(1)
  round()
  if(X>x)then
    return 2 --"East"
  end
  if(X<x)then
    return 4 --"West"
  end
  if(Z>z)then
    return 3 --"South"
  end
  if(Z<z)then
    return 1 --"North"
  end
  return "None"
end
--X,Y,Z
move(goTo[1],goTo[2],goTo[3])
log.close()
