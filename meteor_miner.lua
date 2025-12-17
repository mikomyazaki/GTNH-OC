local component = require("component")
local robot = component.robot
local sides = require("sides")

-- Find location of start waypoint
-- local position = component.navigation.findWaypoints(48)[1]["position"]

-- Do some movement
for i = 1,5,1 do
    robot.forward()
end

for i = 1,3,1 do
    robot.up()
end

robot.turnRight()
for i = 1,3,1 do
    robot.up()
end

-- Move to start waypoint
local x,y,z = component.navigation.getPosition()

for i = 1,y-82.5,1 do
    robot.down()
end

while robot.navigation.getFacing() ~= sides.north do
    robot.turnLeft()
end

for i=1,x-28.5,1 do
    robot.forward()
end

robot.turnLeft()

for i=1,z-(-44.5),1 do
    robot.forward()
end