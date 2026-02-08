-- English Localization file

MSA.LOC.English = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]=true
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]=true
    MSA_L["{num1} minutes, {num2} seconds"]=true
    MSA_L["Calculating..."]=true

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]=true
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]=true
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]=true
    MSA_L["MSA has dedected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]=true
    MSA_L["MSA has dedected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]=true
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]=true
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]=true
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]=true
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]=true
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]=true
    MSA_L["Combining {name1} stacks..."]=true
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
    MSA_L["timer"]=true
    MSA_L["reset"]=true
    MSA_L["resume"]=true
    MSA_L["craft"]=true
    MSA_L["Invalid Format"]=true
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]=true
    MSA_L["Example: /msa craft 382981 191461"]=true
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]=true
    MSA_L["The recipe ID \'{num1}\' is not valid."]=true
    MSA_L["The item ID \'{num1}\' is not valid."]=true
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]=true
    MSA_L["\'{name1}\' is not a salvage recipe."]=true
    MSA_L["\'{num1}\' is not a valid crafting reagent."]=true


end
