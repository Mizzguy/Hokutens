-----------------------------------
-- Area: Bostaunieux Oubliette
-- NPC:  qm1(???)
-- Spawns Bodach
-- @pos 19, 16, -140
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getVar("Weaponskill_H2H") == 1) and (player:hasKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH)) then
	   SpawnMob(17461479):updateClaim(player); --Bodach
	else   
       player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end   
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;