walls  = {}
if gameMap.layers["Walls"] then
    for i, obj in pairs(gameMap.layers["Walls"].objects) do
        local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
        wall:setType('static')
        wall:setCollisionClass("Solid")
        wall:applyAngularImpulse(1000)
        table.insert(walls, wall)
    end
end

return walls