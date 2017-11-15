require('Gloabl')

local sp = cc.Sprite:create('xxx.png')
self:addChild(sp)
sp:setPosition(display.center)

local order = OrderMap(
	'spawn', OrderMap('moveby', {0.5, cc.p(50,0) }, 'scaleto', {0.5, 1.105}),
	'spawn', OrderMap('moveby', {0.5, cc.p(-50,0)}, 'scaleto', {0.5, 1.0  }),
	'spawn', OrderMap('moveby', {0.5, cc.p(-50,0)}, 'scaleto', {0.5, 1.105}),
	'spawn', OrderMap('moveby', {0.5, cc.p(50,0) }, 'scaleto', {0.5, 1.0  })
)
local anime = require('Anime')
local act = anime(order, {turns = 10})
sp:runAction(act)
