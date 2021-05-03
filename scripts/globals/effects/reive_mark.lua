-----------------------------------
-- xi.effect.REIVE_MARK
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    if (target:getPet()) then
        target:getPet():addStatusEffect(effect)
    end
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    if (target:getPet()) then
        target:getPet():delStatusEffect(xi.effect.REIVE_MARK)
    end
end

return effect_object