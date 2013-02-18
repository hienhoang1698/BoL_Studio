--[[
	Script: ShowLastHits v0.1
	Author: SurfaceS
	v0.1 	initial release
]]

do
	--[global]
	function OnLoad()
		gameState = GameState()
		enemyMinion = minionManager(MINION_ENEMY, 1000, player, MINION_SORT_HEALTH_ASC)
	end

	function OnTick()
		if player.dead or gameState:gameIsOver() then return end
		enemyMinion:update()
	end
	
	function OnDraw()
		if player.dead or gameState:gameIsOver() then return end
		for index,object in pairs(enemyMinion.objects) do
			-- temp add object.valid till allclass have it
			if object.valid and ValidTarget(object) and object.health < player:CalcDamage(object, player.totalDamage) then
				DrawCircle(object.x, object.y, object.z, 90, 0xFFFFFF)
				DrawCircle(object.x, object.y, object.z, 91, 0xFFFFFF)
				DrawCircle(object.x, object.y, object.z, 92, 0xFFFFFF)
			end
		end
	end
end