local component = require("component")
local robot_api = require("robot")
local sides = require("sides")

local nav = component.proxy(component.list("navigation")())

local function face (direction)
    while nav.getFacing() ~= direction do
        robot_api.turnRight()
    end
end
-- Find location of start waypoint
-- local position = component.navigation.findWaypoints(48)[1]["position"]

-- +x is east, -x is west
-- +z is south, -z is north

-- Do some movement
face(sides.east)
for i = 1,5,1 do
    robot_api.forward()
end

for i = 1,3,1 do
    robot_api.up()
end

face(sides.south)
for i = 1,3,1 do
    robot_api.forward()
end

-- Move to start waypoint
local x,y,z = nav.getPosition()

local y_dist = y-82.5
for i = 1,y_dist,1 do
    if math.abs(y_dist) > 0 then
        robot_api.down()
    else
        robot_api.up()
    end
end

face(sides.west)
local x_dist = x-82.5
for i = 1,x_dist,1 do
    if math.abs(x_dist) > 0 then
        robot_api.back()
    else
        robot_api.forward()
    end
end

face(sides.north)
local z_dist = z-44.5
for i = 1,z_dist,1 do
    if math.abs(z_dist) > 0 then
        robot_api.back()
    else
        robot_api.forward()
    end
end