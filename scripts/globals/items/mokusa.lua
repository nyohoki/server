-----------------------------------
-- ID: 18451
-- Item: Mokusa
-- Additional Effect: Wind Damage
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local item_object = {}

item_object.onAdditionalEffect = function(player, target, damage)
    local chance = 5

    if (math.random(0, 99) >= chance) then
        return 0, 0, 0
    else
        local dmg = math.random(4, 19)
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        dmg = addBonusesAbility(player, xi.magic.ele.WIND, target, dmg, params)
        dmg = dmg * applyResistanceAddEffect(player, target, xi.magic.ele.WIND, 0)
        dmg = adjustForTarget(target, dmg, xi.magic.ele.WIND)
        dmg = finalMagicNonSpellAdjustments(player, target, xi.magic.ele.WIND, dmg)

        local message = xi.msg.basic.ADD_EFFECT_DMG
        if (dmg < 0) then
            message = xi.msg.basic.ADD_EFFECT_HEAL
        end

        return xi.subEffect.WIND_DAMAGE, message, dmg
    end
end

return item_object