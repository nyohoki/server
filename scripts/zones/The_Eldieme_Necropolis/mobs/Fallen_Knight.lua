-----------------------------------
-- Area: The Eldieme Necropolis
--  Mob: Fallen Knight
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    xi.regime.checkRegime(player, mob, 671, 1, xi.regime.type.GROUNDS)
    xi.regime.checkRegime(player, mob, 675, 2, xi.regime.type.GROUNDS)
end

return entity