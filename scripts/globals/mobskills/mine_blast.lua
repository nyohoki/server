-----------------------------------
-- Mine Blast
-- 20 Aoe Fire damage from a bomb
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    local dmgmod = 20

    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg()*5, xi.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.MAGICAL, xi.damageType.FIRE, MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, xi.attackType.MAGICAL, xi.damageType.FIRE)
    return dmg
end

return mobskill_object