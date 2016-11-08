-----------------------------------
-- Area: North Gustaberg [S]
-- NPC: Shredded Label
-- @pos -199.721 0.499 469.335 88
-- Spawns: Feeorin NM
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg_[S]/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/North_Gustaberg_[S]/TextIDs");


-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
          
    if (player:hasKeyItem(BLUE_LABELED_CRATE) == true) then
        SpawnMob(17138051):updateClaim(player);
        for i = 17138052, 17138057, 1 do
            SpawnMob(i):updateClaim(player);
            local party = player:getParty();
	    
	        if (party ~= nil) then
	            for i,v in ipairs(party) do
                    v:addStatusEffect(EFFECT_LEVEL_RESTRICTION, 60, 0, 0);
                end
            end    
        end           
    else
        player:PrintToPlayer("You do not possess the Key Item");    
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
