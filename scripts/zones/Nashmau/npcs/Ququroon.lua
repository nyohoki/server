-----------------------------------
-- Area: Nashmau
--  NPC: Ququroon
-- Type: Standard NPC
-- !pos -2.400 -1 66.824 53
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/settings")
local ID = require("scripts/zones/Nashmau/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

    if (player:getQuestStatus(xi.quest.log_id.AHT_URHGAN, xi.quest.id.ahtUrhgan.RAT_RACE) == QUEST_ACCEPTED and player:getCharVar("ratraceCS") == 4) then
        if (trade:hasItemQty(5455, 1) and trade:hasItemQty(5453, 1) and trade:hasItemQty(5136, 1) and trade:hasItemQty(5456, 1) and trade:hasItemQty(5454, 1) and trade:getItemCount() == 5) then
            player:startEvent(310)
        end
    end

end

entity.onTrigger = function(player, npc)
    local ratRaceProg = player:getCharVar("ratraceCS")
    if (ratRaceProg == 3) then
        player:startEvent(309)
    elseif (ratRaceProg == 4) then
        player:startEvent(242)
    elseif (ratRaceProg >= 5) then
        player:startEvent(315)
    else
        player:startEvent(241)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 309) then
        player:setCharVar("ratraceCS", 4)
    elseif (csid == 310) then
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 5595)
        else
            player:tradeComplete()
            player:addItem(5595)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 5595)
            player:setCharVar("ratraceCS", 5)
        end
    end
end

return entity