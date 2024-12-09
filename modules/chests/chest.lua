chest = {}
chest = world:newRectangleCollider(20, 20, 96, 96)
chest:setType('static')
chest: setCollisionClass('Chest')



return chest