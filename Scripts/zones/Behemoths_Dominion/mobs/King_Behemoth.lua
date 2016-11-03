-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: King Behemoth
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAGIC_COOL, 60);
	--mob:addMod(MOD_REGEN, 50);
	mob:addMod(MOD_DARKRES, 50);
    mob:addMod(MOD_PARALYZERES, 50);
    mob:addMod(MOD_SLOWRES, 250);
    mob:addMod(MOD_BINDRES, 100);
	mob:addMod(MOD_SLEEPRES, 1000);
	mob:addMod(MOD_BLINDRES, 50);
	mob:addMod(MOD_SILENCERES, 150);
	mob:addMod(MOD_LULLABYRES, 1000);
	mob:addMod(MOD_MEVA, 100);
	mob:addMod(MOD_MDEF, 45);
	mob:addMod(MOD_DEF, 50);	
	mob:addMod(MOD_ATT, 500);
	mob:addMod(MOD_MATT, 200);
	mob:setMod(MOD_REGAIN, 30);
end;

function onMobEngaged(mob)
	mob:setMobMod(MOBMOD_RAGE, 3600);	
end

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then
        spell:setAoE(SPELLAOE_RADIAL);
        spell:setFlag(SPELLFLAG_HIT_ALL);
        spell:setRadius(30);
        spell:setAnimation(280);
        spell:setMPCost(1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(BEHEMOTH_DETHRONER);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Todo: move this to SQL after drop slots are a thing
    if (math.random(1,100) <= 2) then -- Hardcoded "this or this item" drop rate until implemented.
        SetDropRate(1936,13566,1000); -- Defending Ring
        SetDropRate(1936,13415,0);
    else
        SetDropRate(1936,13566,0);
        SetDropRate(1936,13415,1000); -- Pixie Earring
    end

    -- Set King_Behemoth's Window Open Time
    if (LandKingSystem_HQ ~= 1) then
        local wait = 72 * 3600;
        SetServerVariable("[POP]King_Behemoth", os.time(t) + wait); -- 3 days
        if (LandKingSystem_HQ == 0) then -- Is time spawn only
            DeterMob(mob:getID(), true);
        end
    end

    -- Set Behemoth's spawnpoint and respawn time (21-24 hours)
    if (LandKingSystem_NQ ~= 1) then
        SetServerVariable("[PH]King_Behemoth", 0);
        local Behemoth = mob:getID()-1;
        DeterMob(Behemoth, false);
        UpdateNMSpawnPoint(Behemoth);
        GetMobByID(Behemoth):setRespawnTime(math.random(75600,86400));
    end
end;
