local isAFK;

local AFK = {};
AFK.TimeSinceCraft = 0;     -- For the 20 second countdown, I only want this to go off if the countdown timer is within a few seeconds of crafting.
MSA.AFK = AFK;

-- Register events
local Listener = CreateFrame("Frame");
Listener:RegisterEvent("PLAYER_FLAGS_CHANGED")
Listener:RegisterEvent("PLAYER_ENTERING_WORLD")
Listener:RegisterEvent("UNIT_FLAGS")

-- We need to listen for player flag change OR, if player is already AFK when logging in.
Listener:SetScript("OnEvent", function(self, event, unit )
    if event == "PLAYER_FLAGS_CHANGED" then
        local isCurrentlyAFK = UnitIsAFK("player")

        -- Player just went AFK
        if not isAFK and isCurrentlyAFK then
            isAFK = true

            -- Play first alert for simple AFK - not logout
            if MSA_save.afkAlarm[1] and C_TradeSkillUI.IsRecipeRepeating() then      -- Only play if going afk.
                PlaySound(SOUNDKIT[MSA_save.afkAlarm[2]] , "Master");
                print("MSA Warning! AFK while crafting. Sound Activated." );
            end

        -- Player returned from AFK
        elseif isAFK and not isCurrentlyAFK then
            isAFK = false
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Initialize state when loading
        isAFK = UnitIsAFK("player")

    elseif event == "UNIT_FLAGS" and MSA_save.afkAlarm[1] and ( time() - MSA.AFK.TimeSinceCraft ) <= 5 then
        if unit == "player" and isAFK then
            -- Need to give some time for popup to show and build the fontstring.
            C_Timer.After ( 1 , function()
                if StaticPopup1:IsVisible() then
                    local num = StaticPopup1Text:GetText():match("%d%d");
                    if num and tonumber ( num ) <= 20 then
                        PlaySound(SOUNDKIT[MSA_save.afkAlarm[3]] , "Master")
                        print("MSA WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!")
                    end
                end
            end)

        end
    end
end)