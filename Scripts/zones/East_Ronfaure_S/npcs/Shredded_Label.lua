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
    local party = player:getParty();
    local alliance = player:getAlliance();
    
    if (alliance ~= nil) then
         for i,v in ipairs(alliance) do
             if (v:hasKeyItem(RED_LABELED_CRATE) == true) then
                 v:addStatusEffect(EFFECT_LEVEL_RESTRICTION, 60, 0, 0);
                 v:delKeyItem(RED_LABELED_CRATE);
                 for i = 17109368, 17109374, 1 do
                     SpawnMob(i):updateClaim(player);
                 end
             else
                player:PrintToPlayer("You do not posses the Key Item");
             end   
         end
     elseif (party ~= nil) then
          for i,v in ipairs(party) do
              if (v:hasKeyItem(RED_LABELED_CRATE) == true) then
                  v:addStatusEffect(EFFECT_LEVEL_RESTRICTION, 60, 0, 0);
                  v:delKeyItem(RED_LABELED_CRATE);
                  for i = 17109368, 17109374, 1 do
                      SpawnMob(i):updateClaim(player);
                  end  
              else
                 player:PrintToPlayer("You do not posses the Key Item");
              end
         end
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
