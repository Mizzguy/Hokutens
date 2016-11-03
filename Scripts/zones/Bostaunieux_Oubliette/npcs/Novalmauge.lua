-----------------------------------
-- Area: Bostaunieux Obliette
-- NPC:  Novalmauge
-- Starts and Finishes Quest: The Rumor
-- Involved in Quest: The Holy Crest, Trouble at the Sluice
-- @pos 70 -24 21 167
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");
require("scripts/globals/pathfind");

local path = {
41.169430, -24.000000, 19.860674,
42.256676, -24.000000, 19.885197,
41.168694, -24.000000, 19.904638,
21.859211, -24.010996, 19.792259,
51.917370, -23.924366, 19.970068,
74.570229, -24.024828, 20.103880,
44.533886, -23.947662, 19.926519
};

function onSpawn(npc)
    npc:initNpcAi();
    npc:setPos(pathfind.first(path));
    onPath(npc);
end;

function onPath(npc)
    pathfind.patrol(npc, path);
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	local wscount = player:getVar("Scythe_Trials");
		
    if (player:getVar("troubleAtTheSluiceVar") == 2) then
        if (trade:hasItemQty(959,1) and trade:getItemCount() == 1) then -- Trade Dahlia
            player:startEvent(0x0011);
            npc:wait(-1);
        end
    end
    if (player:getQuestStatus(SANDORIA,THE_RUMOR) == QUEST_ACCEPTED) then
        local count = trade:getItemCount();
        local BeastBlood = trade:hasItemQty(930,1)
        if (BeastBlood == true and count == 1) then
            player:startEvent(0x000c);
            npc:wait(-1);
        end
    end
	if (player:getQuestStatus(SANDORIA,SOULS_IN_SHADOW) == QUEST_ACCEPTED) and (wscount <= 149) then  -- checking if you want to quit if you dont have 300 ws points or threw weapon away
	   player:startEvent(3);
	elseif (player:getQuestStatus(SANDORIA,SOULS_IN_SHADOW) == QUEST_ACCEPTED) and (wscount >= 150) then
	    if (trade:hasItemQty(16793,1) and trade:getItemCount() == 1) then --trading weapon in after 300 ws 
		   player:setVar("Scythe_Trials", 1);
		   player:delKeyItem(WEAPON_TRAINING_GUIDE);
	       player:startEvent(1);
	       player:tradeComplete();
	    end
	end 
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local troubleAtTheSluice = player:getQuestStatus(SANDORIA,TROUBLE_AT_THE_SLUICE);
    local TheHolyCrest = player:getVar("TheHolyCrest_Event");
    local tatsVar = player:getVar("troubleAtTheSluiceVar");
    local theRumor = player:getQuestStatus(SANDORIA,THE_RUMOR);
	local mLvl = player:getMainLvl();   -- add this
	local wscount = player:getVar("Scythe_Trials"); --add this
    local skill = player:getSkillLevel(SKILL_SYH);
	
    npc:wait(-1);
    if ((player:getQuestStatus(SANDORIA,SOULS_IN_SHADOW) == QUEST_AVAILABLE) and mLvl >= 71 and skill >= 240 ) then
	    player:startEvent(0); -- add this
		
    elseif (player:getVar("Weaponskill_Scythe") == 2) then -- back from killing NM final cs	-- add this
	    player:delKeyItem(ANNALS_OF_TRUTH);
	    player:startEvent(5);		   
		   
	elseif (player:getQuestStatus(SANDORIA,SOULS_IN_SHADOW) == QUEST_ACCEPTED) and (wscount <= 149) then  -- checking if you want to quit if you dont have 300 ws points or threw weapon away --addthis
	    player:startEvent(2);
	    
	elseif (player:getQuestStatus(SANDORIA,SOULS_IN_SHADOW) == QUEST_ACCEPTED) and (wscount >= 150) then -- cs for passing 300 wspoints --addthis
	    player:PrintToPlayer("Trade the Weapon in.");
    -- The Holy Crest Quest
    elseif (TheHolyCrest == 1) then
        player:startEvent(0x0006);
    elseif (TheHolyCrest == 2) then
        player:startEvent(0x0007);
    -- Trouble at the Sluice Quest
    elseif (tatsVar == 1) then
        player:startEvent(0x000f);
        player:setVar("troubleAtTheSluiceVar",2);
    elseif (tatsVar == 2) then
        player:startEvent(0x0010);
	
		
    -- The rumor Quest
    elseif (theRumor == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3 and player:getMainLvl() >= 10) then
        player:startEvent(0x000d);
    elseif (theRumor == QUEST_ACCEPTED) then
        player:startEvent(0x000b);
    elseif (theRumor == QUEST_COMPLETED) then
        player:startEvent(0x000e); -- Standard dialog after "The Rumor"
    else
        player:startEvent(0x000a); -- Standard dialog
    
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

function onEventFinish(player,csid,option,npc)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x0006) then
        player:setVar("TheHolyCrest_Event",2);
    elseif (csid == 0x0011) then
        player:tradeComplete();
        player:addKeyItem(NEUTRALIZER);
        player:messageSpecial(KEYITEM_OBTAINED,NEUTRALIZER);
        player:setVar("troubleAtTheSluiceVar",0);
    elseif (csid == 0x000d and option == 1) then
        player:addQuest(SANDORIA,THE_RUMOR);
    elseif (csid == 0x000c) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4853); -- Scroll of Drain
        else
            player:tradeComplete();
            player:addItem(4853);
            player:messageSpecial(ITEM_OBTAINED, 4853); -- Scroll of Drain

            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,THE_RUMOR);
        end
    elseif (csid == 0 and option == 1) then  -- add this all the way till the end;
       player:addQuest(SANDORIA,SOULS_IN_SHADOW);   
       player:setVar("Scythe_Trials", 1);
	   player:addItem(16793);
	   player:addKeyItem(WEAPON_TRAINING_GUIDE);
	   player:messageSpecial(KEYITEM_OBTAINED,WEAPON_TRAINING_GUIDE);
	   player:messageSpecial(ITEM_OBTAINED,16793);
    elseif (csid == 2) then
       player:startEvent(3); -- not enough points for ws turn in
    elseif (csid == 1) then -- cs to head to nm for ws
       player:addKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH)
   	   player:messageSpecial(KEYITEM_OBTAINED,MAP_TO_THE_ANNALS_OF_TRUTH);
       player:setVar("Weaponskill_Scythe", 1);
       --player:startEvent(283);
    elseif (csid == 5) then -- final ws cs and award of ws       
	       player:addLearnedWeaponskill(7);
           player:PrintToPlayer("You have learned the Weaponskill Spiral Hell!");
           player:setVar("Weaponskill_Scythe", 0); 
           player:completeQuest(SANDORIA,SOULS_IN_SHADOW);
        --end		
    end

    npc:wait(0);
end;