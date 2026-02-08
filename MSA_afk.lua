local isAFK;

local AFK = {};
AFK.TimeSinceCraft = 0;     -- For the 20 second countdown, I only want this to go off if the countdown timer is within a few seeconds of crafting.
MSA.AFK = AFK;

-- For controlling a listener
local popUpConfigured = false;

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
            if ( ( MSA_save.afkAlarm[1] and MSA_save.afkAlarm[3] ) or ( MSA_save.flashClientIcon and MSA_save.flashClientIconAFK ) ) and C_TradeSkillUI.IsRecipeRepeating() then      -- Only play if going afk.
                MSA.Report(MSA.L("MSA") .. ": " .. MSA.L("Warning! AFK while crafting."));

                if MSA_save.afkAlarm[1] and MSA_save.afkAlarm[3] then
                    local soundEnabled = GetCVar("Sound_EnableAllSound")
                    local soundSFX = GetCVar("Sound_EnableSFX")

                    if MSA_save.afkAlarm[6] and ( soundEnabled == "0" or soundSFX == "0" ) then
                        SetCVar("Sound_EnableAllSound", 1);
                        SetCVar("Sound_EnableSFX", 1);
                    end

                    PlaySound(SOUNDKIT[MSA_save.afkAlarm[2]] , "SFX");

                    -- Restore the sound
                    if MSA_save.afkAlarm[6] and ( soundEnabled == "0" or soundSFX == "0" ) then
                        C_Timer.After(1, function()
                            SetCVar("Sound_EnableAllSound", soundEnabled)
                            SetCVar("Sound_EnableSFX", soundSFX);
                        end)
                    end
                end

                -- Flash the Desktop icon if tabbed off
                if MSA_save.flashClientIcon and MSA_save.flashClientIconAFK then
                    FlashClientIcon()
                end

            end

        -- Player returned from AFK
        elseif isAFK and not isCurrentlyAFK then
            isAFK = false
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Initialize state when loading
        isAFK = UnitIsAFK("player")

    elseif event == "UNIT_FLAGS" and ( ( MSA_save.afkAlarm[1] and MSA_save.afkAlarm[5] ) or ( MSA_save.flashClientIcon and MSA_save.flashClientIconLogOff ) ) and ( time() - MSA.AFK.TimeSinceCraft ) <= 5 then
        if unit == "player" and isAFK then
            -- Need to give some time for popup to show and build the fontstring.
            C_Timer.After ( 1 , function()
                if StaticPopup1 and StaticPopup1:IsVisible() then
                    local num = StaticPopup1Text:GetText():match("%d%d");
                    if num and tonumber ( num ) <= 20 then
                        MSA.Report(MSA.L("MSA") .. ": " .. MSA.L("WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"));

                        if MSA_save.afkAlarm[1] and MSA_save.afkAlarm[5] then
                            local soundEnabled = GetCVar("Sound_EnableAllSound")
                            local soundSFX = GetCVar("Sound_EnableSFX")

                            if MSA_save.afkAlarm[6] and ( soundEnabled == "0" or soundSFX == "0" ) then
                                SetCVar("Sound_EnableAllSound", 1);
                                SetCVar("Sound_EnableSFX", 1);
                            end

                            PlaySound(SOUNDKIT[MSA_save.afkAlarm[4]] , "SFX")

                            -- Restore the sound
                            if MSA_save.afkAlarm[6] and ( soundEnabled == "0" or soundSFX == "0" ) then
                                C_Timer.After(1, function()
                                    SetCVar("Sound_EnableAllSound", soundEnabled)
                                    SetCVar("Sound_EnableSFX", soundSFX);
                                end)
                            end
                        end

                        -- Flash the Desktop icon if tabbed off
                        if MSA_save.flashClientIcon and MSA_save.flashClientIconLogOff then
                            FlashClientIcon()
                        end

                        if not popUpConfigured and ProfessionsFrame and ProfessionsFrame.CraftingPage and ProfessionsFrame.CraftingPage:IsVisible() then
                            popUpConfigured = true;

                            StaticPopup1:HookScript ( "OnHide" , function()
                                if ProfessionsFrame.CraftingPage:IsVisible() then
                                    MSA.UI.Configure_Visiblity ( MSA.UI.AFK_Craft_ID );
                                end
                            end);
                        end


                    end
                end
            end)

        end
    end
end)

