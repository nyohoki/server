-----------------------------------
-- Area: Western Altepa Desert (125)
--  Mob: Maharaja
-- Note: Popped by qm1
-- Involved in Quest: Inheritance
-- !pos -652.3 0.2 -341.5 125
-----------------------------------
require("scripts/globals/wsquest")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.EXP_BONUS, -100)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 180)
end

entity.onMobDeath = function(mob, player, isKiller)
    xi.wsquest.handleWsnmDeath(xi.wsquest.ground_strike, player)
end

return entity