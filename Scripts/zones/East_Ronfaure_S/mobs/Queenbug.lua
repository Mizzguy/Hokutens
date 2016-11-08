-----------------------------------
-- Area: Crystal War - East Ronfaure (S)
-- MOB: Queenbug ( 17109368 )
-- Loc: -480 -19 -176 178 
-- Companion Mob: Ancilla Beetle x6 (17109369-374)
-- 
-- I-9 Shredded Label ( 17109839 ): x:479.734, y:-19.769, z:-165.895 81
-- Lvl Cap: 60
-- Required Item: RED_LABELED_CRATE KI:1113 
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn 
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn 
-----------------------------------

function onMobSpawn(mob)
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
    player:delStatusEffect(EFFECT_LEVEL_RESTRICTION);
    
end;

