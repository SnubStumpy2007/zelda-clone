chest = {}
-- chest = world:newRectangleCollider(20, 20, 96, 96)
-- chest:setType('static')
-- chest: setCollisionClass('Chest')

if overworldMap.layers["Chest"] then
    for i, obj in pairs(overworldMap.layers["Chest"].objects) do
        local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
        wall:setType('static')
        wall:setCollisionClass("Chest")
        wall:applyAngularImpulse(1000)
        table.insert(chest, chests)
    end
end



return chest