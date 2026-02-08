-- INSTRUCTIONS FOR LOCALIZATION

-- The default English string can be replaced by changing the '=true' to the translation work.
-- Example for French:
--    MSA_L["Nonstop crafting has been enabled"]=true
--    MSA_L["Nonstop crafting has been enabled"]="La fabrication en continu a été activée."

-- Data insert points - This MUST be included in the translation text if they exist:
--  {name1} and {name2}
--  {num1} and {num2}
--  {misc1} and {misc2}

    -- EXAMPLE NOTATION (English to French)

    -- MSA_L["Combining {name1} stacks..."]="Combinaison de piles de {name1}..."
    -- "Combining Bismuth Stacks" in English or in French "Combinaison de piles de Bismuth..."

-- WARNING!!!
-- DO NOT UPDATE GRM IF YOU HAVE NOT BACKED UP YOUR TRANSLATION WORK!!! Twitch and other services will overwrite your work without warning when they update!!!
-- WARNING!!!

MSA.LOC.English = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true
    MSA_L["Mass Salvage Assist"]=true

    -- MSA_afk.lua
    MSA_L["Warning! AFK while crafting."]=true
    MSA_L["WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"]=true

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]=true
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]=true
    MSA_L["{num1} minutes, {num2} seconds"]=true
    MSA_L["Calculating..."]=true

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]=true
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]=true
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]=true
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]=true
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]=true
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]=true
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]=true
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]=true
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]=true
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]=true
    MSA_L["Combining {num1} stacks..."]=true
    MSA_L["Crafting has ended prematurely because Shattered Essence buff is not present"]=true

    -- MSA_Localization.ua
    MSA_L["Missing Localization Error - Please report to addon dev."]=true
    MSA_L["Language Selected: {name1}"]=true
    MSA_L["Localization text missing"]=true

    -- MSA_Slash.lua
    MSA_L["help"]=true
    MSA_L["craft"]=true
    MSA_L["enable"]=true
    MSA_L["disable"]=true
    MSA_L["Timer"]=true
    MSA_L["reset"]=true
    MSA_L["resume"]=true
    MSA_L["Invalid Format"]=true
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]=true
    MSA_L["Example: /msa craft 382981 191461"]=true
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]=true
    MSA_L["The recipe ID \'{num1}\' is not valid."]=true
    MSA_L["The item ID \'{num1}\' is not valid."]=true
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]=true
    MSA_L["\'{name1}\' is not a salvage recipe."]=true
    MSA_L["\'{num1}\' is not a valid crafting reagent."]=true
    MSA_L["Initial stack is too small. Stacks are being combined. One moment..."]=true
    MSA_L["No items in bags to craft."]=true
    MSA_L["Not enough to craft - {num1} {misc1} remaining in bags."]=true -- Example: "5 Bismuth remaining in bags."
    MSA_L["Nonstop crafting is currently disabled. Please type \'/msa enable\' to continue nonstop."]=true
    MSA_L["Nonstop crafting has been enabled"]=true
    MSA_L["Nonstop crafting is already enabled"]=true
    MSA_L["Nonstop crafting has been disabled"]=true
    MSA_L["Nonstop crafting is already disabled"]=true
    MSA_L["No crafting spell is ready to resume."]=true
    MSA_L["Resuming..."]=true
    MSA_L['Example - Mass Mill Hochenblume:']=true
    MSA_L['/msa craft recipe_id item_id']=true
    MSA_L['/msa craft 382981 191461']=true
    MSA_L["/msa enable    - Turn on endless salvaging"]=true
    MSA_L["/msa disable   - Turn off endless salvaging"]=true
    MSA_L["/msa resume   - Continue with most recently used spell"]=true
    MSA_L["/msa timer      - Show or Hide the Crafting Timer"]=true
    MSA_L["/msa reset      - Resets timer position to default"]=true

    -- MSA_UI.lua
    MSA_L["Nonstop Crafting"]=true
    MSA_L["MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs."]=true
    MSA_L["MSA AFK ALERT"]=true
    MSA_L["Typing \'/msa timer\' to open/close also works."]=true
    MSA_L["AFK Alert"]=true
    MSA_L["Alert 1: Going AFK while crafting"]=true
    MSA_L["Alert 2: 20 Second offline countdown"]=true
    MSA_L["Play Sound When Player Goes AFK"]=true
    MSA_L["Sound will trigger only during nonstop crafting."]=true
    MSA_L["Play Sound When Offline Countdown Timer Begins"]=true
    MSA_L["Sound will trigger only during nonstop crafting."]=true
    MSA_L["Force Audio"]=true
    MSA_L["Alerts will be heard even if sound is disabled."]=true
    MSA_L["Flash Desktop Icon"]=true
    MSA_L["The WOW icon will only flash if not focused already."]=true
    MSA_L["Flash When Player Goes AFK"]=true
    MSA_L["Flash When Logoff Timer Begins"]=true
    MSA_L["Time Remaining"]=true
    MSA_L["Always Show Timer When Crafting"]=true
    MSA_L["If you wish to reopen the timer again, type \'/msa timer\'"]=true
    MSA_L["Calculate using only reagents in bags."]=true
    MSA_L["Cancel Crafting On Buff Expiration"]=true
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]=true
    MSA_L["Ring Bell on Expiration"]=true
    MSA_L["For now, there is only 1 sound choice. This will change."]=true
    MSA_L["Cancel Crafting On Buff Expiration"]=true
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]=true
    MSA_L["Ring Bell On Expiration"]=true
    MSA_L["For now, there is only 1 sound choice. This will change."]=true


end
