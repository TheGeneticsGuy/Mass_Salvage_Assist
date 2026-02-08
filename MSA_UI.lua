-- For the UI Frames of Mass Salvage Assist adddon

local UI = {};
MSA.UI = UI;
MSA.UI.AFK_Craft_ID = 0;     -- Holds ID for when logoff countdown messes with profession

-- Holds GUI frame load configuration details
UI.LoadUI = function()

    -- Checkbox to be placed on inscription window
    if not UI.MSA_checkbox then

        UI.MSA_checkbox = CreateFrame ( "CheckButton" , "MSA_checkbox" , ProfessionsFrame.CraftingPage , "InterfaceOptionsCheckButtonTemplate" )
        UI.MSA_checkbox.value = MSA_save.non_stop
        UI.MSA_checkbox:SetChecked ( UI.MSA_checkbox.value )

        -- Text to the right of checkbox
        UI.MSA_checkbox.Text = UI.MSA_checkbox:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.MSA_checkbox.Text:SetText( MSA.L("Nonstop Crafting") )
        UI.MSA_checkbox.Text:SetPoint( "LEFT" , UI.MSA_checkbox, "RIGHT" , 2 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.MSA_checkbox:SetHitRectInsets ( 0 , 0 - UI.MSA_checkbox.Text:GetWidth() - 2 , 0 , 0 );

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.MSA_checkbox:SetPoint ( "BOTTOMLEFT" , ProfessionsFrame.CraftingPage.CreateAllButton , "TOPLEFT" , 0 , 10 )

        -- Change the setting wether enabled or not
        UI.MSA_checkbox:SetScript ( "OnClick" , function( self )
            MSA_save.non_stop = self:GetChecked()
            UI.MSA_checkbox.value = MSA_save.non_stop
        end)

        -- Tooltip
        UI.MSA_checkbox:SetScript ( "OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" );
            GameTooltip:AddLine ( MSA.L("MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs.") );
            GameTooltip:Show();
        end);

        UI.MSA_checkbox:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)

        -- Create an event to track when the profession spell changes thus it only runs the checkbox
        -- Show or Hide when necessary
        local Checkbox_Tracker = CreateFrame ( "Frame" );
        Checkbox_Tracker:RegisterEvent ( "SPELL_DATA_LOAD_RESULT" );
        Checkbox_Tracker.craft_id = 0;

        Checkbox_Tracker:SetScript ( "OnEvent" , function( _ , _ , craft_id )
            if Checkbox_Tracker.craft_id ~= craft_id then
                if not C_TradeSkillUI.IsRecipeRepeating() then
                    Checkbox_Tracker.craft_id = craft_id;       -- Do not want to overwrite this if player  is just flipping through spells when crafting
                    if craft_id then
                        MSA.UI.AFK_Craft_ID = craft_id;
                    end
                end
                UI.Configure_Visiblity( craft_id );
            end

        end);

    end

    -- Timer Open Button
    if not UI.MSA_Timer_Button then
        --- TIMER BUTTON
        UI.MSA_Timer_Button = CreateFrame ( "Button" , "MSA_Timer_Button" , ProfessionsFrame.CraftingPage.SchematicForm , "UIPanelButtonTemplate" );
        UI.MSA_Timer_Button:SetSize( 100 , 23 );
        UI.MSA_Timer_Button:SetPoint( "TOPRIGHT" , ProfessionsFrame.CraftingPage.SchematicForm , "TOPRIGHT" , -5 , -37 );
        UI.MSA_Timer_Button:SetText ( MSA.L("Timer") );

        UI.MSA_Timer_Button:SetScript ( "OnClick" , function()
            if UI.CT_Core_Frame:IsVisible() then
                UI.CT_Core_Frame:Hide();
            else
                UI.CT_Core_Frame:Show();
            end
        end);

        UI.MSA_Timer_Button:SetScript ( "OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" );
            GameTooltip:AddLine ( MSA.L("Typing \'/msa timer\' to open/close also works.") );
            GameTooltip:Show();
        end);

        UI.MSA_Timer_Button:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)

    end

    -- Mouseover Settings window
    if not UI.MSA_ProfWindow_Settings then
        UI.MSA_Settings_DirectionButton = CreateFrame ( "Button" , "FCF_GlobalInfoButton" , ProfessionsFrame.CraftingPage , "GameMenuButtonTemplate" );
        UI.MSA_Settings_DirectionButton:SetSize ( 24 , 24);
        UI.MSA_Settings_DirectionButton:SetPoint("TOPRIGHT" , UI.MSA_Timer_Button , "BOTTOMRIGHT" , 0 , -5 );
        UI.MSA_Settings_DirectionButton:SetText( ">" );

        UI.MSA_Settings_DirectionButton:SetScript ( "OnEnter" , function( self )
            UI.MSA_ProfWindow_Settings:Show();

            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" );
            GameTooltip:AddLine ( MSA.L("MSA AFK ALERT") , 1 , 0 , 0 );
            GameTooltip:Show();

        end)

        UI.MSA_Settings_DirectionButton:SetScript("OnLeave" , function()
            if not UI.MSA_ProfWindow_Settings.locked and not UI.MSA_ProfWindow_Settings:IsMouseOver(1, -1, -20, 1) then
                UI.MSA_ProfWindow_Settings:Hide();
            end

            GameTooltip:Hide();
        end)

        UI.MSA_Settings_DirectionButton:SetScript("OnClick" , function( _ , button )
            if button == "LeftButton" then
                UI.MSA_ProfWindow_Settings.locked = true;
            end
        end)

        UI.MSA_ProfWindow_Settings = CreateFrame ( "Frame" , "MSA_ProfWindow_Settings" , UI.MSA_Settings_DirectionButton , "TranslucentFrameTemplate" );
        UI.MSA_ProfWindow_Settings.CloseButton = CreateFrame ("Button" , nil ,  UI.MSA_ProfWindow_Settings , "UIPanelCloseButton" );
        UI.MSA_ProfWindow_Settings:Hide();

        -- Vartiable for control to lock frame open if needed
        UI.MSA_ProfWindow_Settings.locked = false;
        UI.MSA_ProfWindow_Settings.timer = 0;

        local ProfSettingsWindowWidth = function()
            local defaultWidth = 405;
            local adjusted = {
                [2]=465
            }
            if adjusted[MSA_save.languageSelected] then
                return adjusted[MSA_save.languageSelected];
            else
                return defaultWidth;
            end
        end
         -- Frame Details
         UI.MSA_ProfWindow_Settings:SetPoint( "TOPLEFT" , UI.MSA_Timer_Button , "TOPRIGHT" , 10 , 0 );
         UI.MSA_ProfWindow_Settings:SetSize( ProfSettingsWindowWidth() , 230 );
         UI.MSA_ProfWindow_Settings:EnableMouse ( true );
         UI.MSA_ProfWindow_Settings:SetToplevel ( true );

         UI.MSA_ProfWindow_Settings:SetFrameStrata("TOOLTIP");

         -- Close Button
         UI.MSA_ProfWindow_Settings.CloseButton:SetPoint( "TOPRIGHT" , UI.MSA_ProfWindow_Settings , "TOPRIGHT" , -4 , -4 );
         UI.MSA_ProfWindow_Settings.CloseButton:SetSize ( 26 , 26 );

         UI.MSA_ProfWindow_Settings:SetScript ( "OnHide" , function( self )
            self.locked = false;
         end);

         UI.MSA_ProfWindow_Settings:SetScript("OnUpdate" , function( self , elapsed )
            self.timer = self.timer + elapsed;
            if self.timer > 0.1 then

                if not self.locked and not self:IsMouseOver(1, -1, -20, 1) and not UI.MSA_Settings_DirectionButton:IsMouseOver() then
                    self:Hide();
                end

                self.timer = 0;
            end
        end)

    end

    -- AFK Alert Checkbox
    if not UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox then
        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox = CreateFrame ( "CheckButton" , "MSA_AFK_Alert_Checkbox" , UI.MSA_ProfWindow_Settings , "InterfaceOptionsCheckButtonTemplate" )
        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox.value = MSA_save.afkAlarm[1]
        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox:SetChecked ( UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox.value );
        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox:SetPoint ( "TOPLEFT" , UI.MSA_ProfWindow_Settings , "TOPLEFT" , 15 , - 15 );

        -- Text to the right of checkbox
        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox.Text = UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox.Text:SetFont( STANDARD_TEXT_FONT , 12 , "BOLD");
        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox.Text:SetText( MSA.L("AFK Alert") );
        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox.Text:SetPoint( "LEFT" , UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox, "RIGHT" , 2 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox:SetHitRectInsets ( 0 , 0 - UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox.Text:GetWidth() - 2 , 0 , 0 );

        -- Change the setting wether enabled or not
        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox:SetScript ( "OnClick" , function( self )
            MSA_save.afkAlarm[1] = self:GetChecked()
            UI.MSA_checkbox.value = MSA_save.afkAlarm[1]
            UI.ForceSoundCheckBoxConfigure()
        end)

        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox:SetScript("OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" )
            GameTooltip:AddLine ( MSA.L("MSA AFK ALERT") , 1 , 0 , 0 )
            GameTooltip:AddLine ( ' ' )
            GameTooltip:AddDoubleLine ( MSA.L("Alert 1: Going AFK while crafting") )
            GameTooltip:AddDoubleLine ( MSA.L("Alert 2: 20 Second offline countdown") )
            GameTooltip:Show();
        end)

        UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)

    end

    if not UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1 then

        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1 = CreateFrame ( "CheckButton" , "MSA_AFK_Sound1" , UI.MSA_ProfWindow_Settings , "InterfaceOptionsCheckButtonTemplate" )
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1.value = MSA_save.afkAlarm[3]
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1:SetChecked ( UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1.value )

        -- Text to the right of checkbox
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1.Text = UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1.Text:SetFont( STANDARD_TEXT_FONT , 12 , "BOLD")
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1.Text:SetText( MSA.L("Play Sound When Player Goes AFK") )
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1.Text:SetPoint( "LEFT" , UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1, "RIGHT" , 1 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1:SetHitRectInsets ( 0 , 0 - UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1.Text:GetWidth() - 2 , 0 , 0 )

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1:SetPoint ( "TOPLEFT" , UI.MSA_ProfWindow_Settings.MSA_AFK_Alert_Checkbox , "BOTTOMRIGHT" , 0 , -3 )

        -- Change the setting wether enabled or not
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1:SetScript ( "OnClick" , function( self )
            MSA_save.afkAlarm[3] = self:GetChecked()
            self.value = MSA_save.afkAlarm[3]
        end)

        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1:SetScript("OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" )
            GameTooltip:AddLine ( MSA.L("Sound will trigger only during nonstop crafting.") );
            GameTooltip:Show();
        end)

        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)
    end

    if not UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2 then

        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2 = CreateFrame ( "CheckButton" , "MSA_AFK_Sound2" , UI.MSA_ProfWindow_Settings , "InterfaceOptionsCheckButtonTemplate" )
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2.value = MSA_save.afkAlarm[5]
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2:SetChecked ( UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2.value )

        -- Text to the right of checkbox
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2.Text = UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2.Text:SetFont( STANDARD_TEXT_FONT , 12 , "BOLD");
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2.Text:SetText( MSA.L("Play Sound When Offline Countdown Timer Begins") )
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2.Text:SetPoint( "LEFT" , UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2, "RIGHT" , 1 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2:SetHitRectInsets ( 0 , 0 - UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2.Text:GetWidth() - 2 , 0 , 0 );

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2:SetPoint ( "TOPLEFT" , UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1 , "BOTTOMLEFT" , 0 , -3 );

        -- Change the setting wether enabled or not
        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2:SetScript ( "OnClick" , function( self )
            MSA_save.afkAlarm[5] = self:GetChecked()
            self.value = MSA_save.afkAlarm[5]

        end)

        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2:SetScript("OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" );
            GameTooltip:AddLine ( MSA.L("Sound will trigger only during nonstop crafting.") );
            GameTooltip:Show();
        end)

        UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)
    end

    if not UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound then

        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound = CreateFrame ( "CheckButton" , "MSA_AFK_ForceSound" , UI.MSA_ProfWindow_Settings , "InterfaceOptionsCheckButtonTemplate" )
        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound.value = MSA_save.afkAlarm[6]
        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound:SetChecked ( UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound.value )

        -- Text to the right of checkbox
        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound.Text = UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound.Text:SetFont( STANDARD_TEXT_FONT , 12 , "BOLD");
        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound.Text:SetText( MSA.L("Force Audio") )
        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound.Text:SetPoint( "LEFT" , UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound, "RIGHT" , 1 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound:SetHitRectInsets ( 0 , 0 - UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound.Text:GetWidth() - 2 , 0 , 0 );

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound:SetPoint ( "TOPLEFT" , UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2 , "BOTTOMLEFT" , 0 , -3 );

        -- Change the setting wether enabled or not
        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound:SetScript ( "OnClick" , function( self )
            MSA_save.afkAlarm[6] = self:GetChecked()
            UI.MSA_checkbox.value = MSA_save.afkAlarm[6];
        end)

        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound:SetScript("OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" );
            GameTooltip:AddLine ( MSA.L("Alerts will be heard even if sound is disabled.") );
            GameTooltip:Show();
        end)

        UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)
    end

    if not UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox then

        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox = CreateFrame ( "CheckButton" , "MSA_FlashClientCheckbox" , UI.MSA_ProfWindow_Settings , "InterfaceOptionsCheckButtonTemplate" )
        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox.value = MSA_save.flashClientIcon
        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox:SetChecked ( UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox.value )

        -- Text to the right of checkbox
        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox.Text = UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox.Text:SetFont( STANDARD_TEXT_FONT , 12 , "BOLD");
        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox.Text:SetText( MSA.L("Flash Desktop Icon") )
        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox.Text:SetPoint( "LEFT" , UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox, "RIGHT" , 1 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox:SetHitRectInsets ( 0 , 0 - UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox.Text:GetWidth() - 2 , 0 , 0 );

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox:SetPoint ( "TOPLEFT" , UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound , "BOTTOMLEFT" , 0 , -3 );

        -- Change the setting wether enabled or not
        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox:SetScript ( "OnClick" , function( self )
            MSA_save.flashClientIcon = self:GetChecked()
            UI.MSA_checkbox.value = MSA_save.flashClientIcon

            UI.ConfigureFlashClientOptions()
        end)

        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox:SetScript("OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" );
            GameTooltip:AddLine ( MSA.L("The WOW icon will only flash if not focused already.") );
            GameTooltip:Show();
        end)

        UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)
    end

    if not UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK then

        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK = CreateFrame ( "CheckButton" , "MSA_flashClientIconAFK" , UI.MSA_ProfWindow_Settings , "InterfaceOptionsCheckButtonTemplate" )
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK.value = MSA_save.flashClientIconAFK
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK:SetChecked ( UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK.value )

        -- Text to the right of checkbox
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK.Text = UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK.Text:SetFont( STANDARD_TEXT_FONT , 12 , "BOLD");
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK.Text:SetText( MSA.L("Flash When Player Goes AFK") )
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK.Text:SetPoint( "LEFT" , UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK, "RIGHT" , 1 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK:SetHitRectInsets ( 0 , 0 - UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK.Text:GetWidth() - 2 , 0 , 0 );

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK:SetPoint ( "TOPLEFT" , UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox , "BOTTOMRIGHT" , 0 , -3 );

        -- Change the setting wether enabled or not
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK:SetScript ( "OnClick" , function( self )
            MSA_save.flashClientIconAFK = self:GetChecked()
            UI.MSA_checkbox.value = MSA_save.flashClientIconAFK
        end)

        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK:SetScript("OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" );
            GameTooltip:AddLine ( MSA.L("The WOW icon will only flash if not focused already.") );
            GameTooltip:Show();
        end)

        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)
    end

    if not UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff then

        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff = CreateFrame ( "CheckButton" , "MSA_flashClientIconLogOff" , UI.MSA_ProfWindow_Settings , "InterfaceOptionsCheckButtonTemplate" )
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff.value = MSA_save.flashClientIconLogOff
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff:SetChecked ( UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff.value )

        -- Text to the right of checkbox
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff.Text = UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff.Text:SetFont( STANDARD_TEXT_FONT , 12 , "BOLD");
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff.Text:SetText( MSA.L("Flash When Logoff Timer Begins") )
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff.Text:SetPoint( "LEFT" , UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff, "RIGHT" , 1 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff:SetHitRectInsets ( 0 , 0 - UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff.Text:GetWidth() - 2 , 0 , 0 );

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff:SetPoint ( "TOPLEFT" , UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK , "BOTTOMLEFT" , 0 , -3 );

        -- Change the setting wether enabled or not
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff:SetScript ( "OnClick" , function( self )
            MSA_save.flashClientIconLogOff = self:GetChecked()
            UI.MSA_checkbox.value = MSA_save.flashClientIconLogOff
        end)

        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff:SetScript("OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" );
            GameTooltip:AddLine ( MSA.L("The WOW icon will only flash if not focused already.") );
            GameTooltip:Show();
        end)

        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)
    end

    UI.ForceSoundCheckBoxConfigure();
end

-- UI Feature to grey out the checkbox when it doesn't apply.
UI.ForceSoundCheckBoxConfigure = function()
    if UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound then
        if MSA_save.afkAlarm[1] then
            UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1:Enable();
            UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1.Text:SetTextColor ( 1 , .82 , 0 );
            UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2:Enable();
            UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2.Text:SetTextColor ( 1 , .82 , 0 );
            UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound:Enable();
            UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound.Text:SetTextColor ( 1 , .82 , 0 );
            UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox:Enable();
            UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox.Text:SetTextColor ( 1 , .82 , 0 );

            UI.ConfigureFlashClientOptions()
        else
            UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1:Disable();
            UI.MSA_ProfWindow_Settings.MSA_AFK_Sound1.Text:SetTextColor ( 0.5 , .5 , 0.5 );
            UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2:Disable();
            UI.MSA_ProfWindow_Settings.MSA_AFK_Sound2.Text:SetTextColor ( 0.5 , .5 , 0.5 );
            UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound:Disable();
            UI.MSA_ProfWindow_Settings.MSA_AFK_ForceSound.Text:SetTextColor ( 0.5 , .5 , 0.5 );
            UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox:Disable();
            UI.MSA_ProfWindow_Settings.MSA_FlashClientCheckbox.Text:SetTextColor ( 0.5 , .5 , 0.5 );
            UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK:Disable();
            UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK.Text:SetTextColor ( 0.5 , .5 , 0.5 );
            UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff:Disable();
            UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff.Text:SetTextColor ( 0.5 , .5 , 0.5 );
        end
    end

end

-- For configuring the checkbox option
UI.ConfigureFlashClientOptions = function()
    if MSA_save.flashClientIcon then
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff:Enable();
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff.Text:SetTextColor ( 1 , .82 , 0 );
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK:Enable();
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK.Text:SetTextColor ( 1 , .82 , 0 );
    else
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff:Disable();
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconLogOff.Text:SetTextColor ( 0.5 , .5 , 0.5 );
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK:Disable();
        UI.MSA_ProfWindow_Settings.MSA_flashClientIconAFK.Text:SetTextColor ( 0.5 , .5 , 0.5 );
    end
end

----------------------------
------ UI DEVELOPMENT ------
---------- TIMER -----------
----------------------------

-- Deploy it
UI.Deploy_Timer_UI = function()

    if not UI.CT_Core_Frame then
        -- Core frame
        UI.CT_Core_Frame = CreateFrame( "Frame" , "CT_Core_Frame" , UIParent , BackdropTemplateMixin and "BackdropTemplate" );
        UI.CT_Core_Frame:SetBackdrop ( {
            bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background" ,
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile = true,
            tileSize = 32,
            edgeSize = 8,
            insets = { left = 2 , right = 2 , top = 3 , bottom = 2 }
         })
         local ProfSettingsTimerWidth = function()
            local defaultWidth = 320;
            local adjusted = {
                [2]=400,
                [3]=340
            }
            if adjusted[MSA_save.languageSelected] then
                return adjusted[MSA_save.languageSelected];
            else
                return defaultWidth;
            end
        end

        UI.CT_Core_Frame:SetPoint ( MSA_save.pos[1] , UIParent , MSA_save.pos[2] , MSA_save.pos[3] , MSA_save.pos[4] );
        UI.CT_Core_Frame:SetSize( ProfSettingsTimerWidth() , 110 );
        UI.CT_Core_Frame:EnableMouse ( true );
        UI.CT_Core_Frame:SetToplevel ( true );
        UI.CT_Core_Frame:SetFrameStrata("HIGH");
        UI.CT_Core_Frame:EnableMouse ( true );
        UI.CT_Core_Frame:SetMovable ( true );
        UI.CT_Core_Frame:RegisterForDrag ( "LeftButton" );
        UI.CT_Core_Frame:SetScript ( "OnDragStart" , UI.CT_Core_Frame.StartMoving )
        UI.CT_Core_Frame:SetScript ( "OnDragStop" , function( self )
            self:StopMovingOrSizing()
            local pos1 , _ , pos2 , x , y = self:GetPoint();
            MSA_save.pos = { pos1 , pos2 , x , y };
        end);
        UI.CT_Core_Frame.value = 0              -- Will be placeholder of the seconds...
        UI.CT_Core_Frame.On_Update_Timer = 0;   -- Control speed of on_update.
        UI.CT_Core_Frame.craft_id = 0;          -- Keep tabs on the craft ID
        UI.CT_Core_Frame.refresh_count = 0      -- Refresh the countdown every X crafts

        -- Keep it closed at start
        UI.CT_Core_Frame:Hide();

        UI.CT_Core_Frame:SetScript( "OnShow" , function()
            if C_TradeSkillUI.IsRecipeRepeating() then
                if #MSA.CT.timer_table < 10 and #MSA.CT.timer_table > 0 then
                    MSA.UI.CT_Core_Frame.Countdown_Text:SetText( MSA.L("Calculating...") )
                elseif MSA.UI.CT_Core_Frame.value > 0 then
                    MSA.UI.CT_Core_Frame.Countdown_Text:SetText( MSA.CT.formatTime ( MSA.UI.CT_Core_Frame.value ) );
                end
            end
        end)

        -- Close Button
        UI.CT_Core_Frame.CT_CloseButton = CreateFrame( "Button" , "CT_CloseButton" , UI.CT_Core_Frame , "UIPanelCloseButton");
        UI.CT_Core_Frame.CT_CloseButton:SetPoint( "TOPRIGHT" , UI.CT_Core_Frame , "TOPRIGHT" , -4 , -4 );
        UI.CT_Core_Frame.CT_CloseButton:SetSize ( 26 , 26 );

        -- Font Strings Title and main
        UI.CT_Core_Frame.Header_Text = UI.CT_Core_Frame:CreateFontString ( nil , "OVERLAY" , "GameFontWhiteTiny" );
        UI.CT_Core_Frame.Header_Text:SetPoint ( "TOP" , UI.CT_Core_Frame, "TOP" , 0 , -12 );
        UI.CT_Core_Frame.Header_Text:SetFont( STANDARD_TEXT_FONT , 14 , "BOLD");
        UI.CT_Core_Frame.Header_Text:SetText ( MSA.L("Time Remaining") );

        UI.CT_Core_Frame.Countdown_Text = UI.CT_Core_Frame:CreateFontString ( nil , "OVERLAY" , "GameFontWhite" );
        UI.CT_Core_Frame.Countdown_Text:SetPoint ( "TOP" , UI.CT_Core_Frame.Header_Text , "BOTTOM" , 0 , -5 );


        --------------------------------
        -------- TIMER SETTINGS --------
        ---------- CHECKBOXES ----------

        UI.CT_Core_Frame.Always_Show_Checkbox = CreateFrame ( "CheckButton" , "Always_Show_Checkbox" , UI.CT_Core_Frame , "InterfaceOptionsCheckButtonTemplate" )
        UI.CT_Core_Frame.Always_Show_Checkbox.value = MSA_save.always_show
        UI.CT_Core_Frame.Always_Show_Checkbox:SetChecked ( UI.CT_Core_Frame.Always_Show_Checkbox.value )

        -- Text to the right of checkbox
        UI.CT_Core_Frame.Always_Show_Checkbox.Text = UI.CT_Core_Frame.Always_Show_Checkbox:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.CT_Core_Frame.Always_Show_Checkbox.Text:SetFont( STANDARD_TEXT_FONT , 12 , "BOLD");
        UI.CT_Core_Frame.Always_Show_Checkbox.Text:SetText( MSA.L("Always Show Timer When Crafting") )
        UI.CT_Core_Frame.Always_Show_Checkbox.Text:SetPoint( "LEFT" , UI.CT_Core_Frame.Always_Show_Checkbox, "RIGHT" , 2 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.CT_Core_Frame.Always_Show_Checkbox:SetHitRectInsets ( 0 , 0 - UI.CT_Core_Frame.Always_Show_Checkbox.Text:GetWidth() - 2 , 0 , 0 );

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.CT_Core_Frame.Always_Show_Checkbox:SetPoint ( "BOTTOMLEFT" , UI.CT_Core_Frame , "BOTTOMLEFT" , 10 , 5 )

        -- Change the setting wether enabled or not
        UI.CT_Core_Frame.Always_Show_Checkbox:SetScript ( "OnClick" , function( self )
            MSA_save.always_show = self:GetChecked()
            UI.MSA_checkbox.value = MSA_save.always_show
            if not UI.MSA_checkbox.value then
                MSA.Report(MSA.L("MSA") .. ": " .. MSA.L("If you wish to reopen the timer again, type \'/msa timer\'"))
            end
        end)

        UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox = CreateFrame ( "CheckButton" , "MSA_In_Bags_Only_Checkbox" , UI.CT_Core_Frame , "InterfaceOptionsCheckButtonTemplate" )
        UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox.value = MSA_save.count_bags_Only
        UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox:SetChecked ( UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox.value )

        -- Text to the right of checkbox
        UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox.Text = UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox.Text:SetFont( STANDARD_TEXT_FONT , 12 , "BOLD");
        UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox.Text:SetText( MSA.L("Calculate using only reagents in bags.") )
        UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox.Text:SetPoint( "LEFT" , UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox, "RIGHT" , 2 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox:SetHitRectInsets ( 0 , 0 - UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox.Text:GetWidth() - 2 , 0 , 0 );

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox:SetPoint ( "BOTTOMLEFT" , UI.CT_Core_Frame.Always_Show_Checkbox , "TOPLEFT" , 0 , 0 )

        -- Change the setting wether enabled or not
        UI.CT_Core_Frame.MSA_In_Bags_Only_Checkbox:SetScript ( "OnClick" , function( self )
            MSA_save.count_bags_Only = self:GetChecked()
            UI.MSA_checkbox.value = MSA_save.count_bags_Only
            MSA.CT.Calculate_Remaining_Time();
        end)

    end

end

----------------------------
-- ENCH SPECIFIC CHECKBOX --
----------------------------

-- Method:          UI.Configure_TWW_Ench ( bool )
-- What it Does:    Builds the checkbox for Shattered Essence buff that is unique to TWW
-- Purpose:         Give player contorl to enable or disable this feature.
UI.Configure_TWW_Ench = function( hide_frame )

    if hide_frame then
        if UI.EnchBuff_Checkbox then
            UI.EnchBuff_Checkbox:Hide();
        end
        return;
    end

    if not UI.EnchBuff_Checkbox and ProfessionsFrame and ProfessionsFrame.CraftingPage then

        local sound_checkbox_configure = function( enable )
            if enable then
                UI.EnchBuff_Sound_Checkbox.Text:SetTextColor ( 1 , 0.82 , 0 );
                UI.EnchBuff_Sound_Checkbox:Enable();
            else
                UI.EnchBuff_Sound_Checkbox.Text:SetTextColor ( 0.5 , 0.5 , 0.5 );
                UI.EnchBuff_Sound_Checkbox:Disable();
            end

        end

        UI.EnchBuff_Checkbox = CreateFrame ( "CheckButton" , "EnchBuff_Checkbox" , ProfessionsFrame.CraftingPage , "InterfaceOptionsCheckButtonTemplate" )
        UI.EnchBuff_Checkbox.value = MSA_save.shatter_essence
        UI.EnchBuff_Checkbox:SetChecked ( UI.EnchBuff_Checkbox.value )
        UI.Special_Considerations_Table[445466][4] = MSA_save.shatter_essence;

        -- Text to the right of checkbox
        UI.EnchBuff_Checkbox.Text = UI.EnchBuff_Checkbox:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.EnchBuff_Checkbox.Text:SetText( MSA.L("Cancel Crafting On Buff Expiration") );
        UI.EnchBuff_Checkbox.Text:SetPoint( "LEFT" , UI.EnchBuff_Checkbox, "RIGHT" , 2 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.EnchBuff_Checkbox:SetHitRectInsets ( 0 , 0 - UI.EnchBuff_Checkbox.Text:GetWidth() - 2 , 0 , 0 );

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.EnchBuff_Checkbox:SetPoint ( "TOPLEFT" , ProfessionsFrame.CraftingPage.SchematicForm.Reagents , "BOTTOMLEFT" , 0 , -5 )

        -- Change the setting wether enabled or not
        UI.EnchBuff_Checkbox:SetScript ( "OnClick" , function( self )
            MSA_save.shatter_essence = self:GetChecked()
            UI.EnchBuff_Checkbox.value = MSA_save.shatter_essence
            UI.Special_Considerations_Table[445466][4] = MSA_save.shatter_essence;
            sound_checkbox_configure( MSA_save.shatter_essence );
        end)

        -- Tooltip
        UI.EnchBuff_Checkbox:SetScript ( "OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" );
            GameTooltip:AddLine ( MSA.L("MSA") .. ": " .. MSA.L("Enable to ensure crafting automatically stops when buff expires.") );
            GameTooltip:Show();
        end);

        UI.EnchBuff_Checkbox:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)

        -- Build the sound option now
        UI.EnchBuff_Sound_Checkbox = CreateFrame ( "CheckButton" , "EnchBuff_Sound_Checkbox" , UI.EnchBuff_Checkbox , "InterfaceOptionsCheckButtonTemplate" )
        UI.EnchBuff_Sound_Checkbox.value = MSA_save.buff_expire_sound[1]
        UI.EnchBuff_Sound_Checkbox:SetChecked ( UI.EnchBuff_Sound_Checkbox.value )

        -- Text to the right of checkbox
        UI.EnchBuff_Sound_Checkbox.Text = UI.EnchBuff_Sound_Checkbox:CreateFontString ( nil , "OVERLAY" , "GameFontNormal" )
        UI.EnchBuff_Sound_Checkbox.Text:SetText( MSA.L("Ring Bell on Expiration") );
        UI.EnchBuff_Sound_Checkbox.Text:SetPoint( "LEFT" , UI.EnchBuff_Sound_Checkbox, "RIGHT" , 2 , 0 )

        -- Normalize the click area of check button to length of the text
        UI.EnchBuff_Sound_Checkbox:SetHitRectInsets ( 0 , 0 - UI.EnchBuff_Sound_Checkbox.Text:GetWidth() - 2 , 0 , 0 );

        -- Ensures this is always to the left of the CreateAllButton, accounting for width of text also
        UI.EnchBuff_Sound_Checkbox:SetPoint ( "TOPLEFT" , UI.EnchBuff_Checkbox, "BOTTOMRIGHT" , 0 , 0 )

        -- Change the setting wether enabled or not
        UI.EnchBuff_Sound_Checkbox:SetScript ( "OnClick" , function( self )
            MSA_save.buff_expire_sound[1] = self:GetChecked()
            UI.EnchBuff_Sound_Checkbox.value = MSA_save.buff_expire_sound[1]
        end)

        -- Tooltip
        UI.EnchBuff_Sound_Checkbox:SetScript ( "OnEnter" , function( self )
            GameTooltip:SetOwner ( self , "ANCHOR_CURSOR" );
            GameTooltip:AddLine ( MSA.L("MSA") .. ": " .. MSA.L("For now, there is only 1 sound choice. This will change.") );
            GameTooltip:Show();
        end);

        UI.EnchBuff_Sound_Checkbox:SetScript ( "OnLeave" , function()
            GameTooltip:Hide()
        end)

        sound_checkbox_configure( MSA_save.shatter_essence );

        -- This will auto-show on first creation

    elseif UI.EnchBuff_Checkbox then
        UI.EnchBuff_Checkbox:Show();
    end

end
-- /run MSA.UI.Configure_TWW_BS()
-- Method:          UI.Configure_TWW_BS(bool)
-- What it Does:    Implements checkbox creation function for Everburning Ignition
-- Purpose:         Refined controls over auto-salvaging performance to prevent continued action if everburning expires
UI.Configure_TWW_BS = function(hide_frame)
    if (hide_frame) then
        if UI.BSBuff_CheckBox then
            UI.BSBuff_CheckBox:Hide();
        end
        return;
    end

    if not UI.BSBuff_CheckBox and ProfessionsFrame and ProfessionsFrame.CraftingPage then
        local sound_checkbox_configure = function(enable)
            if enable then
                UI.BSBuff_Sound_Checkbox.Text:SetTextColor(1, 0.82, 0);
                UI.BSBuff_Sound_Checkbox:Enable();
            else
                UI.BSBuff_Sound_Checkbox.Text:SetTextColor(0.5, 0.5, 0.5);
                UI.BSBuff_Sound_Checkbox:Disable();
            end

        end

        UI.BSBuff_CheckBox = CreateFrame("CheckButton", "BSBuff_Checkbox", ProfessionsFrame.CraftingPage,
            "InterfaceOptionsCheckButtonTemplate");
        UI.BSBuff_CheckBox.value = MSA_save.everburning_ignition;
        UI.BSBuff_CheckBox:SetChecked(UI.BSBuff_CheckBox.value);
        UI.Special_Considerations_Table[453727][4] = MSA_save.everburning_ignition;

        UI.BSBuff_CheckBox.Text = UI.BSBuff_CheckBox:CreateFontString(nil, "OVERLAY", "GameFontNormal");
        UI.BSBuff_CheckBox.Text:SetText(MSA.L("Cancel Crafting On Buff Expiration"));
        UI.BSBuff_CheckBox.Text:SetPoint("LEFT", UI.BSBuff_CheckBox, "RIGHT", 2, 0);

        UI.BSBuff_CheckBox:SetHitRectInsets(0, 0 - UI.BSBuff_CheckBox.Text:GetWidth() - 2, 0, 0);

        UI.BSBuff_CheckBox:SetPoint("TOPLEFT", ProfessionsFrame.CraftingPage.SchematicForm.Reagents, "BOTTOMLEFT", 0,
            -55);

        UI.BSBuff_CheckBox:SetScript("OnClick", function(self)
            MSA_save.everburning_ignition = self:GetChecked()
            UI.BSBuff_CheckBox.value = MSA_save.everburning_ignition
            UI.Special_Considerations_Table[453727][4] = MSA_save.everburning_ignition;
            sound_checkbox_configure(MSA_save.everburning_ignition);
        end)

        UI.BSBuff_CheckBox:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine(MSA.L("MSA") .. ": " .. MSA.L("Enable to ensure crafting automatically stops when buff expires."));
            GameTooltip:Show();
        end);

        UI.BSBuff_CheckBox:SetScript("OnLeave", function()
            GameTooltip:Hide();
        end)

        UI.BSBuff_Sound_Checkbox = CreateFrame("CheckButton", "BSBuff_Sound_Checkbox", UI.BSBuff_CheckBox,
            "InterfaceOptionsCheckButtonTemplate");
        UI.BSBuff_Sound_Checkbox.value = MSA_save.bs_buff_expire_sound[1];
        UI.BSBuff_Sound_Checkbox:SetChecked(UI.BSBuff_Sound_Checkbox.value);

        UI.BSBuff_Sound_Checkbox.Text = UI.BSBuff_Sound_Checkbox:CreateFontString(nil, "OVERLAY", "GameFontNormal");
        UI.BSBuff_Sound_Checkbox.Text:SetText(MSA.L("Ring Bell On Expiration"));
        UI.BSBuff_Sound_Checkbox.Text:SetPoint("LEFT", UI.BSBuff_Sound_Checkbox, "RIGHT", 2, 0);

        UI.BSBuff_Sound_Checkbox:SetHitRectInsets(0, 0 - UI.BSBuff_Sound_Checkbox.Text:GetWidth() - 2, 0, 0);

        UI.BSBuff_Sound_Checkbox:SetPoint("TOPLEFT", UI.BSBuff_CheckBox, "BOTTOMRIGHT", 0, 0);

        UI.BSBuff_Sound_Checkbox:SetScript("OnClick", function(self)
            MSA_save.bs_buff_expire_sound[1] = self:GetChecked();
            UI.BSBuff_Sound_Checkbox.value = MSA_save.bs_buff_expire_sound[1];
        end)

        UI.BSBuff_Sound_Checkbox:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
            GameTooltip:AddLine(MSA.L("MSA") .. ": " .. MSA.L("For now, there is only 1 sound choice. This will change."));
            GameTooltip:Show();
        end)

        UI.BSBuff_Sound_Checkbox:SetScript("OnLeave", function()
            GameTooltip:Hide();
        end)

        sound_checkbox_configure(MSA_save.everburning_ignition);

    elseif UI.BSBuff_CheckBox then
        UI.BSBuff_CheckBox:Show();
    end
end

-----------------
--- UI LOGIC ----
-----------------



-- I don't have the string variable for for Khaz Algar
-- /run local ids = C_TradeSkillUI.GetAllProfessionTradeSkillLines(); for i=1,#ids do local info=C_TradeSkillUI.GetProfessionInfoBySkillLineID(ids[i]); if info.expansionName=="Khaz Algar" then print(info.professionName .. " - " .. info.professionID);end;end

UI.SPECIAL_TRADESKILLID = {
    [2874] = 445466,        -- 2874 = Enchanting - Currently, only special prof used
    [2872] = 453727         -- 2872 = Khaz Algar Blacksmithing, 453727 = Everburning Ignition spell
    -- [2880] = "LW",
    -- [2871] = "ALCH",
    -- [2875] = "ENG",
    -- [2828] = "INSC"
    -- [2879] = "JC",
    -- [2883] = "TAIL",
    -- [2877] = "HERB",
    -- [2881] = "MINING",
    -- [2882] = "SKIN",
    -- [2873] = "COOK"
 }

-- Table to hold all special considerations based on expansion specific profession IDs
-- type_consideration
UI.Special_Considerations_Table = {
    [445466] = {1, UI.Configure_TWW_Ench, 445798, MSA_save.shatter_essence}, -- [ Recipe_id_to_show_checkbox ] = { type_consideration , special_action_function [, ... optional_variables] }
    [453727] = {1, UI.Configure_TWW_BS, 453734, MSA_save.everburning_ignition}
}

-- Method:          UI.Hide_Special_Frames ( int )
-- What it Does:    Hides all special frames not focused if they are visible
-- Purpose:         Ensures frames only shaow as needed and this is flexible for all special considerations.
UI.Hide_Special_Frames = function ( bypass_id )
    for id in pairs(UI.Special_Considerations_Table) do
        if id ~= bypass_id then

            -- For buffs, this is a special checkbox
            if UI.Special_Considerations_Table[id][1] == 1 then
                UI.Special_Considerations_Table[id][2]( true );
            end

        end
    end
end

-- Method:          UI.Configure_Visiblity( int )
-- What it Does:    Shows or hides the checkbox for mass crafting depending on prfession and spell
-- Purpose:         Only show checkbox when necessary.
UI.Configure_Visiblity = function( craft_id )
    if craft_id then
        if MSA.Crafting.Is_Salvage_Recipe( craft_id ) then
            UI.MSA_checkbox:Show()
        else
            UI.MSA_checkbox:Hide()
        end

        if UI.Special_Considerations_Table[craft_id] then
            UI.Special_Considerations_Table[craft_id][2]();
        end

        UI.Hide_Special_Frames(craft_id);
    end
end