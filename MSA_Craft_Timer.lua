-- Let's build a listener to help determine total crafting time
local CT = {};      -- CT for Craft Timer
CT.timer_table = {}

if MSA then
    MSA.CT = CT;    -- Compatibiity with Mass Crafting Assist addon, in case I ever make this standalone.
end

-- Method:          CT.Get_Avg_Craft_Time()
-- What it Does:    Returns back the avg crafting time
-- Purpose:         So calculation on total crafting time can be made
CT.Get_Avg_Craft_Time = function()
    local sum = 0

    for i = 1 , #CT.timer_table do
        sum = sum + CT.timer_table[i];
    end

    return ( sum / #CT.timer_table ) ;
end

-- Method:          CT.formatTime ( int )
-- What it Does:    Creates a nice countdown of how much time is remaining
-- Purpose:         Quality of Life information
CT.formatTime = function(seconds)
    if seconds < 60 then
        -- Less than a minute
        return string.format("%d seconds", seconds)
    end

    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local remainingSeconds = math.floor (seconds % 60)

    if hours > 0 then
        -- Has hours
        return string.format("%d hrs, %d minutes, %d seconds", hours, minutes, remainingSeconds)
    else
        -- Just minutes and seconds
        return string.format("%d minutes, %d seconds", minutes, remainingSeconds)
    end
end

-- Method:          CT.Get_Craftable_Count()
-- What it Does:    Returns the craftable count based on settings
-- Purpose:         Change Calculation for countdown.
CT.Get_Craftable_Count = function()
    local count = 0;

    if MSA_save.count_bags_Only and MSA.Crafting.Is_Salvage_Recipe(MSA.UI.CT_Core_Frame.craft_id) then
        count = MSA.Crafting.Get_Remaining_Count_Bags( MSA.UI.CT_Core_Frame.craft_id );
        -- Now that we have a count, we need to multiply it by Salvage spell amount
        count = math.floor ( (count / MSA.Crafting.Get_Reagent_Count_Spell (MSA.UI.CT_Core_Frame.craft_id) + 0.5 ) );
    else
        count = C_TradeSkillUI.GetCraftableCount(MSA.UI.CT_Core_Frame.craft_id);
    end

    return count
end

-- Method:          CT.Calculate_Remaining_Time()
-- What it Does:    Returns the estimated total crafting time of the item currently
--                  being processed
-- Purpose:         Quality of life information
CT.Calculate_Remaining_Time = function()
    if #CT.timer_table > 9 then
        local avg = CT.Get_Avg_Craft_Time();
        local seconds = math.floor ( (avg * CT.Get_Craftable_Count()) + 0.5 ); -- Math.floor always rounds down, so ensure +0.5 to fix rounding.
        MSA.UI.CT_Core_Frame.value = seconds;
        MSA.UI.CT_Core_Frame.Countdown_Text:SetText( CT.formatTime ( seconds ) );
    end
end

local timestamp = 0;
local function Trade_Skill_Craft_Record()
    if C_TradeSkillUI.IsRecipeRepeating() then
        if timestamp > 0 then
            table.insert ( CT.timer_table , ( GetTime() - timestamp ) )    -- GetTime is more precise than Epoch
            if #CT.timer_table > 100 then
                table.remove ( CT.timer_table , 1 );
            elseif #CT.timer_table == 100 then
                -- If exactly 100 it just got to 100, reset count tracking.
                CT.Initialize_Countdown();
            end
        end
        timestamp = GetTime();
        MSA.AFK.TimeSinceCraft = time();
    else
        CT.timer_table = {};
    end
end

local countdown_running = false;
local window_triggered = false;
-- TIMER FOR FRAME TRACKING UPDATES
CT.Initialize_Countdown = function( isRepeating )
    if not countdown_running or isRepeating then
        countdown_running = true;

        if #CT.timer_table < 10 then
            MSA.UI.CT_Core_Frame.Countdown_Text:SetText( "Calculating..." )
        elseif MSA.UI.CT_Core_Frame.value == 0 then
            CT.Calculate_Remaining_Time();
        else
            local count_remaining = CT.Get_Craftable_Count();
            MSA.UI.CT_Core_Frame.refresh_count = MSA.UI.CT_Core_Frame.refresh_count + 1;
            if MSA.UI.CT_Core_Frame.refresh_count == 300 or count_remaining < 100 and count_remaining % 20 == 0 then   -- Recalculate every 5 min, or every 20 crafts last 100
                CT.Calculate_Remaining_Time();
                MSA.UI.CT_Core_Frame.refresh_count = 0;
            end

            MSA.UI.CT_Core_Frame.Countdown_Text:SetText( CT.formatTime ( MSA.UI.CT_Core_Frame.value ) );
            MSA.UI.CT_Core_Frame.value = MSA.UI.CT_Core_Frame.value - 1;
        end

        C_Timer.After ( 1 , function()

            if C_TradeSkillUI.IsRecipeRepeating() then

                if not window_triggered then
                    window_triggered = true;
                    if MSA_save.always_show then
                        MSA.UI.CT_Core_Frame:Show();
                    end
                end

                -- Clear the resumes since starting new
                MSA.SC.resume_recipe_id = 0
                MSA.SC.resume_item_id = 0;

                CT.Initialize_Countdown( true );

                MSA.Crafting.Special_Considerations_Endpoint( MSA.UI.CT_Core_Frame.craft_id );
            else
                -- Crafting Stopped - Reset values
                CT.timer_table = {};

                -- let's setup the resume values, but only for salvage recipes
                if MSA.Crafting.Is_Salvage_Recipe ( MSA.UI.CT_Core_Frame.craft_id ) then
                    MSA.SC.resume_recipe_id = MSA.UI.CT_Core_Frame.craft_id
                    MSA.SC.resume_item_id = MSA.SC.g_item_id
                end

                -- reset the rest
                MSA.UI.CT_Core_Frame.value = 0;
                MSA.UI.CT_Core_Frame.craft_id = 0;
                countdown_running = false;
                timestamp = 0
                window_triggered= false;
                MSA.UI.CT_Core_Frame.Countdown_Text:SetText("");
                MSA.UI.CT_Core_Frame:Hide();
                C_Timer.After(1, function() -- For the reagent check I want it to not die immediately.
                    MSA.Crafting.reagentQuality = {0,0};
                end)
            end
        end)
    end
end

local msa_timer = CreateFrame( "FRAME" , "MSA_Crafting_Timer" )
msa_timer.craft_id = 0;
msa_timer:RegisterEvent("TRADE_SKILL_CRAFT_BEGIN")
msa_timer:RegisterEvent("SPELL_DATA_LOAD_RESULT")
msa_timer:SetScript("OnEvent", function( _ , event , craft_id )
    if event == "TRADE_SKILL_CRAFT_BEGIN" then
        Trade_Skill_Craft_Record()

        if MSA.UI.CT_Core_Frame.craft_id ~= craft_id then   -- Only need to trigger a countdown check if spell craft ID has changed.
            MSA.UI.CT_Core_Frame.craft_id = craft_id
            CT.Initialize_Countdown();
        end
    elseif event == "SPELL_DATA_LOAD_RESULT" then
        if msa_timer.craft_id ~= craft_id and not C_TradeSkillUI.IsRecipeRepeating() then
            msa_timer.craft_id = craft_id;
            if MSA.Crafting.Is_Salvage_Recipe( craft_id ) then
                MSA.UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox:Show()
            else
                MSA.UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox:Hide()
            end
        end
    end
end)