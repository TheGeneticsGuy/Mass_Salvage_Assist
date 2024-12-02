
local Crafting = {};
MSA.Crafting = Crafting;

-- Useful globals I haven't put in a tablet yet...
local combiningStacks = false;

-- Method:          Crafting.Get_Reagent_Count_Spell ( int )
-- What it Does:    Returns the number of reagents needed for that crafting spell
-- Purpose:         When combining stacks, I want to always pick the lowest stack first, UNLESS it is small than the minimum stack size to craft
--                  Why? Well, what if 4 herbs are in an early bag slot, but 1 herb is in the final bag slot? I want to stakc the 4 first or else
--                  milling will keep erroring. In all other cases I combine smallest to largest.
Crafting.Get_Reagent_Count_Spell = function( craft_id )
    return C_TradeSkillUI.GetRecipeSchematic( craft_id , false ).quantityMax
end

-- Method:          Crafting.CombineStacks ( list , int , bool , bool , int )
-- What it Does:    Determines which item is being processed, and then keeps the stacks refreshed so crafting can continue indefinitely.
-- Purpose:         Quality of life for crafting thousands.
Crafting.CombineStacks = function( scrapSlot , itemID , forced , restart_crafting , craft_id , special_msg )
    if not combiningStacks or forced then
        combiningStacks = true;
        scrapSlot = scrapSlot or nil;
        if restart_crafting == nil then
            restart_crafting = false;
        end

        local lowestStack;
        local maxStackSize = 0  -- Placeholder til it gets replaced.
        local itemInfo;

        if not scrapSlot and ( C_TradeSkillUI.IsRecipeRepeating() or restart_crafting ) then
            scrapSlot , itemID = Crafting.GetSalveItemDetails( restart_crafting , craft_id );
        end

        if scrapSlot then

            if forced then
                -- Let's refresh scrapslot number
                local item_detail = C_Container.GetContainerItemInfo( scrapSlot[1] , scrapSlot[2] )

                if item_detail and item_detail.itemID == itemID then
                    scrapSlot[3] = item_detail.stackCount;
                end
            end

            -- BLIZZ HAS AN ORDER OF CRAFTING PRIORITY
            -- * PLAYER BAGS
            -- * PLAYER REAGENT BAG
            -- * PLAYER BANK
            -- * PLAYER REAGENT BANK
            -- * PLAYER WARBAND (TABS IN ORDER)

            local default_stack_min = 5

            -- Let's review first the bags in the slots
            for bag = 0 , NUM_BAG_SLOTS + 1 do  -- Loop through all bags (0 is backpack, 1-4 are additional bags, +1 for reagent bag)
                for slot = 1, C_Container.GetContainerNumSlots( bag ) do

                    if scrapSlot[1] ~= bag or scrapSlot[2] ~= slot then
                        itemInfo = C_Container.GetContainerItemInfo( bag , slot )

                        if itemInfo and itemInfo.itemID == itemID then

                            maxStackSize = C_Item.GetItemMaxStackSizeByID(itemID);
                            default_stack_min = Crafting.Get_Reagent_Count_Spell(craft_id);

                            if lowestStack and lowestStack[3] > itemInfo.stackCount and lowestStack[3] >= default_stack_min then
                                lowestStack = { bag , slot , itemInfo.stackCount};
                            elseif not lowestStack then
                                lowestStack = { bag , slot , itemInfo.stackCount};
                            end

                        end
                    end
                end
            end

            if lowestStack then
                -- Now, let's combine all of the smallest stacks to biggest stacks.
                print("Slot: " .. scrapSlot[1] .. " : " .. scrapSlot[2] .. " --" .. lowestStack[1] .. " : " .. lowestStack[2])
                C_Container.PickupContainerItem( lowestStack[1] , lowestStack[2] );
                C_Container.PickupContainerItem( scrapSlot[1] , scrapSlot[2] );

                -- This can only be called WHEN already mass crafting or it will cause taint.
                if C_TradeSkillUI.IsRecipeRepeating() then
                    Crafting.Refresh_Crafting( craft_id , maxStackSize , scrapSlot[1] , scrapSlot[2] );
                end

                if ( (scrapSlot[3] + lowestStack[3]) < maxStackSize ) or ( scrapSlot[3] < 150 and lowestStack[3] ~= 0 )  then
                    C_Timer.After ( 1.8 , function()
                        Crafting.CombineStacks( scrapSlot , itemID , true , restart_crafting , craft_id , special_msg );  -- Cycle back through to collect ALL the items. There needs to be a slight delay between each item move due to Blizz's bag limitations with stacking.
                    end);
                    return;
                end

            elseif C_TradeSkillUI.IsRecipeRepeating() then
                Crafting.Refresh_Crafting( craft_id , C_Item.GetItemMaxStackSizeByID(itemID) , scrapSlot[1] , scrapSlot[2] );
            end
        end
        combiningStacks = false;
        if special_msg then
            print("MSA: Stacking has finished. Please restart" );
        end
    end

    if restart_crafting and not C_TradeSkillUI.IsRecipeRepeating() then
        print("MSA: Crafting has ended prematurely. Please restart and crafting will continue nonstop." )
    end
end

-- Method:          Crafting.Refresh_Crafting( int , int , int , int )
-- What it Does:    Refreshes the Craft all/Mill All button
-- Purpose:         Useful so stacks don't run out.
Crafting.Refresh_Crafting = function( craft_id , maxStackSize , bag , slot )
    if ProfessionsFrame and ProfessionsFrame.CraftingPage.SchematicForm:IsVisible() and ProfessionsFrame.CraftingPage.SchematicForm:GetRecipeInfo().recipeID == craft_id and ProfessionsFrame.CraftingPage.SchematicForm:GetTransaction().salvageItem then
        ProfessionsFrame.CraftingPage:CreateInternal(ProfessionsFrame.CraftingPage.SchematicForm:GetRecipeInfo().recipeID, ProfessionsFrame.CraftingPage:GetCraftableCount(), ProfessionsFrame.CraftingPage.SchematicForm:GetCurrentRecipeLevel())
    else
        maxStackSize = maxStackSize or 1000
        C_TradeSkillUI.CraftSalvage( craft_id , maxStackSize , ItemLocation:CreateFromBagAndSlot( bag , slot ))
    end
end

-- Method:          Crafting.GetSalveItemDetails( bool , int )
-- What it Does:    Determines the details of the item and slot the item is being processed/milled/prosected/etc, from
-- Purpose:         To replenish this stack, I need information. This also accomplishes accounting for the bug
--                  that Blizz has failed to fix in 2 expansions so far (DF and TWW) where even though you select a stack
--                  It mass mills the bag in order of slot position regardles (right and up in the bags). So, it will replenish
--                  First slot if it fails rather than the selected slot.
Crafting.GetSalveItemDetails = function( restart_crafting , craft_id )

    local item;
    local item_id = MSA.SC.g_item_id;

    if ProfessionsFrame and ProfessionsFrame.CraftingPage.SchematicForm:IsVisible() and ProfessionsFrame.CraftingPage.SchematicForm:GetRecipeInfo().recipeID == craft_id and ProfessionsFrame.CraftingPage.SchematicForm:GetTransaction().salvageItem then
        item = ProfessionsFrame.CraftingPage.SchematicForm:GetTransaction().salvageItem;
        if not item or type(item.debugItemID) ~= "number" then
            return;
        else
            item_id = item.debugItemID;
            MSA.SC.g_item_id = item.debugItemID;
        end
    end

    -- This is failing, so add stacks to first slot (compensates for positioning bug of not crafting the item you selected, but first in slot)
    if restart_crafting then
        local item_detail = {}

        for bag = 0 , NUM_BAG_SLOTS + 1 do  -- Loop through all bags + reagent bag
            for slot = 1, C_Container.GetContainerNumSlots( bag ) do
                item_detail = C_Container.GetContainerItemInfo( bag , slot )

                if item_detail and item_detail.itemID == item_id then
                    return { bag , slot , item_detail.stackCount } , item_id;
                end
            end
        end

        -- Crafts the selected item in the salvage box.
    else
        local itemDetails;
        local stack_count = 0;

        -- This is technically better as it focuses on the actually selected herbs, not just first
        if item then
            itemDetails = item:GetItemLocation();
            if itemDetails then
                stack_count = C_Container.GetContainerItemInfo( itemDetails.bagID , itemDetails.slotIndex ).stackCount
            end
        else
            local stack_size, bag, slot = Crafting.GetFirstReagentSizeStack( item_id , craft_id );
            if stack_size then
                itemDetails = {};
                itemDetails.bagID = bag;
                itemDetails.slotIndex = slot;
                stack_count = stack_size;
            end
        end

        if itemDetails then
            -- Return nil if the item selected is not in your bags... as that is not helpful.
            if itemDetails.bagID < 0 or itemDetails.bagID > 5 then
                print("MSA: This addon will only work with items selected within your bags. Please move items to your bags and re-select." );
                return;
            else
                return { itemDetails.bagID , itemDetails.slotIndex , stack_count } , item_id;
            end
        end
    end
end

-- Method:          Crafting.GetFirstReagentSizeStack( int , int )
-- What it Does:    Returns the stack count of the first slot in the bags where the reagent is
-- Purpose:         Need to know how many in the stack if going to initialize reagent stacking immediately.
Crafting.GetFirstReagentSizeStack = function( item_id , craft_id )
    if not item_id then
        if MSA.SC.g_item_id ~= 0 then
            item_id = MSA.SC.g_item_id;
        end
    end

    if ProfessionsFrame and ProfessionsFrame.CraftingPage.SchematicForm:IsVisible() and ProfessionsFrame.CraftingPage.SchematicForm:GetRecipeInfo().recipeID == craft_id and ProfessionsFrame.CraftingPage.SchematicForm:GetTransaction().salvageItem then
        local item = ProfessionsFrame.CraftingPage.SchematicForm:GetTransaction().salvageItem;
        if not item or type(item.debugItemID) ~= "number" then
            return;
        else
            item_id = item.debugItemID;
            MSA.SC.g_item_id = item.debugItemID;
        end
    end

    local item_info = {}

    for bag = 0 , NUM_BAG_SLOTS + 1 do  -- Loop through all bags + reagent bag
        if not count then
            for slot = 1, C_Container.GetContainerNumSlots( bag ) do
                item_info = C_Container.GetContainerItemInfo( bag , slot )

                if item_info and item_info.itemID == item_id then

                    return item_info.stackCount , bag , slot
                end
            end
        end
    end
    return
end

-- Method:          Crafting.Get_Remaining_Count_Bags( int )
-- What it Does:    Returns the count of all the items in the player bags based on given item_id
--                  Or, it defaults to the selected salvage item ID being crafted.
-- Purpose:         So a timer can be calculated not based on total items to craft, but just on what is in bags
--                  So that the addon can make it's own timer based on that.
Crafting.Get_Remaining_Count_Bags = function( craft_id )
    local item_id = MSA.SC.g_item_id;
    local total_count = 0

    if ProfessionsFrame and ProfessionsFrame.CraftingPage.SchematicForm:IsVisible() and ProfessionsFrame.CraftingPage.SchematicForm:GetRecipeInfo().recipeID == craft_id and ProfessionsFrame.CraftingPage.SchematicForm:GetTransaction().salvageItem then
        local item = ProfessionsFrame.CraftingPage.SchematicForm:GetTransaction().salvageItem;
        if not item or type(item.debugItemID) ~= "number" then
            return total_count;
        else
            item_id = item.debugItemID;
            MSA.SC.g_item_id = item.debugItemID;
        end
    end

    if item_id == 0 then
        return total_count;
    end

    -- Let's see what's in our bags!
    for bag = 0 , NUM_BAG_SLOTS + 1 do  -- Loop through all bags + reagent bag
        for slot = 1, C_Container.GetContainerNumSlots( bag ) do
            local item_info = C_Container.GetContainerItemInfo( bag , slot )

            -- Establish the first stack size and the total amoutn
            -- We do this because I need to know if there are additional items in the bags to be stacked.
            if item_info and item_info.itemID == item_id then-- item.debugItemID then
                total_count = total_count + item_info.stackCount;
            end
        end
    end

    return total_count
end

-- Method:          Crafting.Is_More_To_Craft( int )
-- What it Does:    Returns true if there are enough reagents to continue crafting
-- Purpose:         There seems to be a common bug where crafting just stops for some reason when there is maybe only 20 or so
--                  crafts remaining. Or, even you get a resourcefulness proc and now have extra to craft at the end. This will do a
--                  quick bag check if crafting should be continued again after crafting.
Crafting.Is_More_To_Craft = function( craft_id )
    local item_id = craft_id or MSA.SC.g_item_id;

    if ProfessionsFrame and ProfessionsFrame.CraftingPage.SchematicForm:IsVisible() and ProfessionsFrame.CraftingPage.SchematicForm:GetRecipeInfo().recipeID == craft_id and ProfessionsFrame.CraftingPage.SchematicForm:GetTransaction().salvageItem then
        local item = ProfessionsFrame.CraftingPage.SchematicForm:GetTransaction().salvageItem;
        if not item or type(item.debugItemID) ~= "number" then
            return;
        else
            item_id = item.debugItemID;
            MSA.SC.g_item_id = item.debugItemID;
        end
    end

    local max_stack_size = C_Item.GetItemMaxStackSizeByID(item_id);
    local default_stack_min = Crafting.Get_Reagent_Count_Spell(craft_id);
    local total_count = 0;
    local first_stack_count = 0;
    local needs_to_stack = false;
    local more_to_craft = false;

    -- Just an escape in case this API fails. It shouldn't but there could be issues with long latency that could cause this to error out.
    if not max_stack_size then
        return false;
    end

    -- Let's see what's in our bags!
    for bag = 0 , NUM_BAG_SLOTS + 1 do  -- Loop through all bags + reagent bag
        for slot = 1, C_Container.GetContainerNumSlots( bag ) do
            local item_info = C_Container.GetContainerItemInfo( bag , slot )

            -- Establish the first stack size and the total amoutn
            -- We do this because I need to know if there are additional items in the bags to be stacked.
            if item_info and item_info.itemID == item_id then-- item.debugItemID then
                if first_stack_count == 0 then
                    first_stack_count = item_info.stackCount;
                end
                total_count = total_count + item_info.stackCount;
            end
        end
    end

    if first_stack_count < total_count and first_stack_count < max_stack_size then
        needs_to_stack = true
    end

    if total_count >= default_stack_min then
        more_to_craft = true
    end

    return needs_to_stack , more_to_craft
end

Crafting.Has_Buff = function ( buff )
    local has_buff = false;
    AuraUtil.ForEachAura("player", "HELPFUL", nil, function(name, icon, _, _, _, _, _, _, _, spellId, ...)
        if spellId == buff then
            has_buff = true
            return true
        end
    end)
    return has_buff
end

-- Method:          Crafting.CraftListener ( int )
-- What it Does:    Acts as an event listener to control when to trigger the reagent stacking action
-- Purpose:         Quality of life helper for mass Crafting.
Crafting.CraftListener = function ( craft_id )
    if MSA_save.non_stop and not combiningStacks then

        -- Check if current craft is Gleaming Shatter and abort if Shattered Essence buff is not present
        if ( craft_id == 470726 and not Crafting.Has_Buff( 445798 ) ) then
            C_TradeSkillUI.StopRecipeRepeat()
            print ("MSA - Crafting has ended prematurely because Shattered Essence buff is not present")
            return
        end

        local remaining_casts = C_TradeSkillUI.GetRemainingRecasts()

        if ( remaining_casts and remaining_casts < 25 ) then
            Crafting.CombineStacks( nil , nil , nil , nil , craft_id );
        else
            -- I separate these so I don't pull first reagent logic if not needed
            local first_stack , bag , slot = Crafting.GetFirstReagentSizeStack( nil , craft_id )

            if first_stack then
                if first_stack < 150 then
                    Crafting.CombineStacks( nil , nil , nil , nil , craft_id );

                elseif not ProfessionsFrame or (ProfessionsFrame and not ProfessionsFrame.CraftingPage.SchematicForm:IsVisible() ) and C_TradeSkillUI.IsRecipeRepeating() then
                    -- ONLY RUN THIS LOGIC IF PROFESSION WINDOW IS NOT OPEN
                    -- There is a bug where the CraftSalvage function seems to swap stacks even if you never selected it to
                    -- This compensates that by refreshing it more frequently.

                    local default_stack_min = Crafting.Get_Reagent_Count_Spell(craft_id);
                    local stack_num_rounded = ( math.floor ( ( first_stack + (default_stack_min/2) ) / default_stack_min ) * default_stack_min )    -- For mod % check == 0
                    local mod_val = 100;
                    local item_id = MSA.SC.g_item_id;

                    if item_id ~= 0 then
                        local max_stack_size = C_Item.GetItemMaxStackSizeByID ( item_id )
                        if max_stack_size and max_stack_size < 1000 then
                            if ( default_stack_min * 20 ) >= ( max_stack_size / 2 ) then
                                mod_val = math.floor( max_stack_size / 4 )
                            else
                                mod_val = math.floor ( default_stack_min * 20 )
                            end
                        end

                    end

                    if stack_num_rounded % mod_val == 0 then
                        Crafting.Refresh_Crafting( craft_id , nil , bag , slot  );
                    end
                end
            end
        end
    end
end

-- Method:          Crafting.Is_Salvage_Recipe ( int )
-- What it Does:    Returns true if the recipe is a salvage type recipe
-- Purpose:         Universal compatibility of any salvage recipe so no need to have a pre-built table of them.
Crafting.Is_Salvage_Recipe = function ( craft_id )
    local recipe_info = C_TradeSkillUI.GetRecipeInfo( craft_id );

    if recipe_info and recipe_info.isSalvageRecipe then
        return true;
    end
    return false;
end

-- Event listener to account for actions to know when to align conditions to begin stacking the reagents in bags.
local CraftingFrame = CreateFrame( "FRAME" , "MSA_CraftingListener" );
CraftingFrame:RegisterEvent( "TRADE_SKILL_CRAFT_BEGIN" );
CraftingFrame:RegisterEvent( "UNIT_SPELLCAST_FAILED" );
CraftingFrame:SetScript( "OnEvent" , function( _ , event , craft_id , _ , failed_id )

    if event == "TRADE_SKILL_CRAFT_BEGIN" then
        if Crafting.Is_Salvage_Recipe ( craft_id ) then
            Crafting.CraftListener(craft_id);
        end

    elseif event == "UNIT_SPELLCAST_FAILED" and Crafting.Is_Salvage_Recipe ( failed_id ) and MSA_save.non_stop and C_TradeSkillUI.GetCraftableCount(failed_id) > 0 and not combiningStacks then
        local needs_to_stack , more_to_craft = Crafting.Is_More_To_Craft(failed_id);

        -- Do we need to restack herbs and restart, or do we need to just restart
        if needs_to_stack then
            Crafting.CombineStacks( nil , nil , nil , true , failed_id );

        elseif more_to_craft then
            print("MSA - Crafting has ended prematurely. Please restart and crafting will continue nonstop" )
        end

    end

end);