-----------------------------------
-- Area: Behemoth's Dominion
--  NPC: qm2 (???)
-- Spawns Behemoth or King Behemoth
-- @pos -267 -19 74 127
-----------------------------------
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Behemoths_Dominion/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local Behemoth = GetMobAction(17297440);
    local KingBehemoth = GetMobAction(17297441);

    if ((KingBehemoth == ACTION_NONE or KingBehemoth == ACTION_SPAWN)
    and (Behemoth == ACTION_NONE or Behemoth == ACTION_SPAWN)) then
        -- Trade Beastly Shank
        if (trade:hasItemQty(3341,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_NQ ~= 0) then
                player:tradeComplete();
                SpawnMob(17297440):updateClaim(player);
            end
        -- Trade Savory Shank
        elseif (trade:hasItemQty(3342,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_HQ == 1) then
                player:tradeComplete();
                SpawnMob(17297441):updateClaim(player);
            end
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local BehPop = 17297459;
	local npcID = npc:getID();
    if (npcID == BehPop and player:hasKeyItem(ATMA_OF_THE_BEAST_KING)) then
	   SpawnMob(17297440);
	   player:delKeyItem(ATMA_OF_THE_BEAST_KING);
	else   

       player:messageSpecial(IRREPRESSIBLE_MIGHT);
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