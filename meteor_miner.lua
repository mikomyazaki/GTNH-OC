local component = require("component")
local nav = component.navigation
local robot_api = require("robot")
local sides = require("sides")

-- Find location of start waypoint
-- local position = component.navigation.findWaypoints(48)[1]["position"]

-- Do some movement
for i = 1,5,1 do
    robot_api.forward()
end

for i = 1,3,1 do
    robot_api.up()
end

robot_api.turnRight()
for i = 1,3,1 do
    robot_api.up()
end

-- Move to start waypoint
local x,y,z = nav.getPosition()

for i = 1,y-82.5,1 do
    robot_api.down()
end

while nav.getFacing() ~= sides.north do
    robot_api.turnLeft()
end

for i=1,x-28.5,1 do
    robot_api.back()
end

robot_api.turnLeft()

for i=1,z-(-44.5),1 do
    robot_api.forward()
end