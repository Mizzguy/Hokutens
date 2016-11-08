-----------------------------------
-- Area: Crystal War - North Gustaberg [S]
-- MOB: Feeorin (17138051)
-- Compainion Mob: Fay x6 (17138052-057)
-- 
-- Spawn Loc: Shredded Label (17138599) @ -199.721 0.499 469.335 88
-- Level Cap: 60
-- Require Item: BLUE_LABELED_CRATE KI:
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

