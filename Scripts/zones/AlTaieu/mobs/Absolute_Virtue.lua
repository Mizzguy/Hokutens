-----------------------------------
-- Area: Al'Taieu
--  HNM: Absolute Virtue
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
     -- setMod
   
    mob:setMod(MOBMOD_MAIN_2HOUR, 1);
	mob:setMod(MOBMOD_2HOUR_MULTI, 1);
	mob:setMod(MOD_ATT, 500);
	mob:setMod(MOD_STR, 50);
	mob:setMod(MOD_MDEF, 200);
	--mob:setMod(MOD_MATT, 135);
end;


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- setMod
    mob:setMod(MOD_REGEN, 500);

    local JoL = GetMobByID(16912848);
    -- Special check for regen modification by JoL pets killed
    if (JoL:getLocalVar("JoL_Qn_xzomit_Killed") == 9) then
        mob:addMod(MOD_REGEN, -130)
    end
    if (JoL:getLocalVar("JoL_Qn_hpemde_Killed") == 9) then
        mob:addMod(MOD_REGEN, -130)
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
end;

------------------------------------
-- onSpellPrecast
------------------------------------

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then -- Meteor
        spell:setAoE(SPELLAOE_RADIAL);
        spell:setFlag(SPELLFLAG_HIT_ALL);
        spell:setRadius(30);
        spell:setAnimation(280); -- AoE Meteor Animation
        spell:setMPCost(1);
    end
end;

------------------------------------
-- onMonsterMagicPrepare
------------------------------------

function onMonsterMagicPrepare(caster, target)
end;

-----------------------------------
-- onMagicHit
-----------------------------------

function onMagicHit(caster, target, spell)
    local REGEN = target:getMod(MOD_REGEN);
    local DAY = VanadielDayElement();
    local ELEM = spell:getElement();
    if (GetServerVariable("AV_Regen_Reduction") < 60) then
        -- Had to serverVar the regen instead of localVar because localVar reset on claim loss.
        if (ELEM == DAY and (caster:isPC() or caster:isPet())) then
            SetServerVariable("AV_Regen_Reduction", 1+GetServerVariable("AV_Regen_Reduction"));
            target:addMod(MOD_REGEN, -2);
        end
    end
    return 1;
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(VIRTUOUS_SAINT);
	
	if (GetServerVariable("kingalex") == 1) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial( ITEM_CANNOT_BE_OBTAINED, 2488 );
		else
			player:addItem(2488, 1);
			player:messageSpecial(ITEM_OBTAINED, 2488);
	    end  
    end
end;