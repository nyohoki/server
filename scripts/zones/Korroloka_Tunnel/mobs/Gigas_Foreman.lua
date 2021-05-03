-----------------------------------
-- Area: Korroloka Tunnel
--  Mob: Gigas Foreman
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 733, 1, xi.regime.type.GROUNDS)
end

return entity