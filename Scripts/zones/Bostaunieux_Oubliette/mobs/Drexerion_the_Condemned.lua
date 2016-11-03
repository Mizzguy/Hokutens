-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  MOB: Drexerion_the_Condemned
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	if (GetServerVariable)("eventalex") == 1 then
		mob:addMod(MOD_REGEN, 50);
		mob:addMod(MOD_SLEEPRES, 1000);
		mob:addMod(MOD_PARALYZERES, 1000);
		mob:addMod(MOD_ATT, 200);
	else
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (GetServerVariable("eventalex") == 1) then
		if (player:getFreeSlotsCount() == 0) then
		player:messageSpecial( ITEM_CANNOT_BE_OBTAINED, 2488 );
		else
		player:addItem(2488, 1);
		player:messageSpecial(ITEM_OBTAINED, 2488);
		end
	end
end;
-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Drexerion_the_Condemned's spawnpoint and respawn time (60-72 hours)
    UpdateNMSpawnPoint(mob:getID());
	SetServerVariable("eventalex", 0);
    player:PrintToServer( "Event NM is defeated!" );
    mob:setRespawnTime(math.random(216000,259200));

end;

