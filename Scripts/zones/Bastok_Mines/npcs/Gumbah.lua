-----------------------------------
-- Area: Bastok Mines
-- NPC: Gumbah
-- Finishes Quest: Blade of Darkness
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local wscount = player:getVar("GSword_Trials");
	
	if (player:getQuestStatus(BASTOK,INHERITANCE) == QUEST_ACCEPTED) and (wscount <= 149) then  -- checking if you want to quit if you dont have 300 ws points or threw weapon away
	   player:startEvent(191);
	elseif (player:getQuestStatus(BASTOK,INHERITANCE) == QUEST_ACCEPTED) and (wscount >= 150) then
	    if (trade:hasItemQty(16952,1) and trade:getItemCount() == 1) then --trading weapon in after 300 ws 
		   player:setVar("GSword_Trials", 1);
		   player:delKeyItem(WEAPON_TRAINING_GUIDE);
	       player:startEvent(193);
	       player:tradeComplete();
	    end
	end  
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    --player:startEvent(193);
    local bladeDarkness = player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);
	local mLvl = player:getMainLvl();   -- add this
	local wscount = player:getVar("GSword_Trials"); --add this
    if (player:getMainLvl() >= ADVANCED_JOB_LEVEL and  bladeDarkness == QUEST_AVAILABLE) then
        --DARK KNIGHT QUEST
        player:startEvent(0x0063);
    elseif (bladeDarkness == QUEST_COMPLETED and player:getQuestStatus(BASTOK,BLADE_OF_DEATH) == QUEST_AVAILABLE) then    
        player:startEvent(0x0082);
    elseif ((player:hasCompletedMission(BASTOK, ON_MY_WAY) == true) 
    or ((player:getCurrentMission(BASTOK) == ON_MY_WAY) and (player:getVar("MissionStatus") == 3)))
        and (player:getVar("[B7-2]Werei") == 0) then
        player:startEvent(0x00b1);
    
		
    elseif (player:getQuestStatus(BASTOK,INHERITANCE) == QUEST_AVAILABLE) and (mLvl >= 71) then -- and skill == 2) then  --eviseration ws quest start /add this all the way till end;
	    --if (skillId >= 230) then
	       player:startEvent(190); -- add this
		--else
        --   player:PrintToPlayer("Come back when your Great Sword skill is above 230.");	
        --end	
    elseif (player:getVar("Weaponskill_GSword") == 2) then -- back from killing NM final cs	-- add this
	       player:delKeyItem(ANNALS_OF_TRUTH);
		   player:startEvent(194);		   
		   
	elseif (player:getQuestStatus(BASTOK,INHERITANCE) == QUEST_ACCEPTED) and (wscount <= 149) then  -- checking if you want to quit if you dont have 300 ws points or threw weapon away --addthis
	       player:startEvent(191);
	    
	elseif (player:getQuestStatus(BASTOK,INHERITANCE) == QUEST_ACCEPTED) and (wscount >= 150) then -- cs for passing 300 wspoints --addthis
	       player:PrintToPlayer("Trade the Weapon in.");
		   
    else 
        --DEFAULT 
        player:startEvent(0x0034);
	end	 
 
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x0063) then
        player:addQuest(BASTOK, BLADE_OF_DARKNESS);
    elseif (csid == 0x0082) then
        player:addQuest(BASTOK, BLADE_OF_DEATH);
        player:addKeyItem(LETTER_FROM_ZEID);
        player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_ZEID);
    elseif (csid == 0x00b1) then
        player:setVar("[B7-2]Werei", 1);
    elseif (csid == 190) then  -- add this all the way till the end;
       player:addQuest(BASTOK,INHERITANCE);   
       player:setVar("GSword_Trials", 1);
	   player:addItem(16952);
	   player:addKeyItem(WEAPON_TRAINING_GUIDE);
	   player:messageSpecial(KEYITEM_OBTAINED,WEAPON_TRAINING_GUIDE);
	   player:messageSpecial(ITEM_OBTAINED,16952);
    elseif (csid == 191) then
       player:startEvent(192); -- not enough points for ws turn in
    elseif (csid == 193) then -- cs to head to nm for ws
       player:addKeyItem(MAP_TO_THE_ANNALS_OF_TRUTH)
   	   player:messageSpecial(KEYITEM_OBTAINED,MAP_TO_THE_ANNALS_OF_TRUTH);
       player:setVar("Weaponskill_GSword", 1);
       --player:startEvent(194);
    elseif (csid == 194) then -- final ws cs and award of ws
        --if (player:hasLearnedWeaponskill(2) == false) then       
	       player:addLearnedWeaponskill(4);
           player:PrintToPlayer("You have learned the Weaponskill Ground Strike!");
           player:setVar("Weaponskill_GSword", 0); 
           player:completeQuest(BASTOK,INHERITANCE);
        --end		
    end
end;