local Util = {};
MSA.Util = Util;

-- Method:          Util.issecretvalue()
-- What it Does:    Returns if a value is a secret value, but since this dropped in 12.0, API doesn't currently exist
-- Purpose:         Compatibility of all builds
Util.issecretvalue = function( value )
    if issecretvalue then
        local isSecret = issecretvalue(value);
        if isSecret and not GRM_G.secretValueDelay then
            GRM_G.secretValueDelay = true;
        end
        return isSecret
    end
    return false
end

-- Method:          Util.BuildHasSecretRestrictions()
-- What it Does:    Returns true if the current build has active Addon restrictive state as implemented in Midnight
-- Purpose:         Act as a gate so a wrapper to prevent unnecessary processing in non-restrictive classic builds
Util.BuildHasSecretRestrictions = function()
    if C_Secrets and C_Secrets.HasSecretRestrictions() then
        return true;
    end
    return false;
end