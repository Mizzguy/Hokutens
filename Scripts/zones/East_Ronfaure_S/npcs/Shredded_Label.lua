-----------------------------------
-- Area: East Ronfaure [S]
-- NPC: Shredded Label
-- @pos 479.734 -19.769 -165.895 81
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure_[S]/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/West_Sarutabaruta_[S]/TextIDs");


-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
          
    if (player:hasKeyItem(RED_LABELED_CRATE) == true) then
        SpawnMob(17109368):updateClaim(player);
        for i = 17109369, 17109374, 1 do
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
