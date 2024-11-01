
-- SLASH COMMAND
SLASH_MSA1 = '/msa';

local SC = {}   -- SC for Slash Command
MSA.SC = SC;

-- Hold the item ID from the macro
SC.g_item_id = 0

-----------------------------
---- SLASH COMMAND LOGIC ----
-----------------------------

-- SLASH COMMAND LOGIC
SlashCmdList["MSA"] = function(input)

    if input and string.lower(input) then -- and string.find ( input , "forcepurge" , 1 , true ) == nil then  -- purge data may have name after, don't want to lowercase that
        input = string.lower(input):match("^%s*(.-)%s*$");    -- Strip out the white space
    end

    -- On to the Logic

    if input == "" or not input then
        SC.Error();
        return;
    end

    local command = SC.Parse_Slash_Input(input);

    if #command < 3 then
        if command[1] == "help" then
            SC.Help()
        elseif command[1] == "craft" then
            print('Invalid Format: Please type \'/msa craft recipe_id item_id\'\nExample: /msa craft 382981 191461')
        else
            SC.Error();
        end

    elseif #command == 3 then
        if command[1] == "craft" then
            if SC.IsValid ( command ) then
                SC.Craft( command[2] , command[3] );
            end

        else
            SC.Error();
        end

    else
        SC.Error();
    end
end

------------------------------
------- SC FUNCTIONS ---------
-- STARTING WITH VALIDATION --
---------- HELPERS -----------
------------------------------

-- Method:          SC.Parse_Slash_Input ( string )
-- What it Does:    Converts the string input into a list
-- Purpose:         Easier to determine slash command usage.
SC.Parse_Slash_Input = function ( input )
    local result = {}
    if input:find("%S+") then
        for word in input:gmatch( "%S+") do

            -- Check if word is a number and if so, convert to int
            local num = tonumber(word)

            if num then
                table.insert(result, num)
            else
                table.insert(result, word)
            end
        end
    else
        table.insert ( result , input );    -- Only a word
    end
    return result
end

-- Method:          SC.Error()
-- What it Does:    Merely prints the default error message
-- Purpose:         Just build the string here
SC.Error = function()
    print("Invalid Command: Please type '/msa help' for More Info!");
end

-- Method:          SC.IsValid ( list )
-- What it Does:    Checks if the inputted slash command to craft is valid
-- Purpose:         Quality of life to be able to use slash commands, and to also have
--                  Good user protection on inputs
SC.IsValid = function ( command )
    local isValid = true;

    -- Verify 2 - don't return right away as we want to report the other number
    if type( command[2] ) == "number" and #tostring(command[2]) < 11 and not SC.Is_Salvage_Recipe ( command[2] ) then
        isValid = false;
    elseif type( command[2] ) ~= "number" then
        print('The recipe ID \'' .. command[2] .. '\' is not valid.')
        isValid = false;
    end

    if type( command[3] ) == "number" and not SC.Is_Valid_Item_ID ( command[3] ) then
        isValid = false;
    elseif type( command[3] ) ~= "number" then
        print('The item ID \'' .. command[3] .. '\' is not valid.')
        isValid = false;
    elseif #tostring(command[2]) > 10 then
        print('The item ID \'' .. command[3] .. '\' is not valid. And, it\'s too long!')
    end

    return isValid;
end

-- Method:          SC.Is_Salvage_Recipe ( int )
-- What it Does:    Returns true if a valid recipe
-- Purpose:         Easy to check for slash commands if the spell given was valid.
SC.Is_Salvage_Recipe = function( recipe_id )
    local recipe_info = C_TradeSkillUI.GetRecipeInfo( recipe_id );

    if recipe_info and recipe_info.name ~= "" then
        if recipe_info.isSalvageRecipe then
            return true;
        else
            print('\'' .. recipe_info.name .. '\' is not a salvage recipe.')
        end
    else
        print('The recipe ID \'' .. recipe_id .. '\' is not valid.')
    end
    return false;
end

-- Method:          SC.Is_Valid_Item_ID ( int )
-- What it Does:    Returns true if the item is a valid itemID
-- Purpose:         Just breaking up the validation checks
SC.Is_Valid_Item_ID = function ( item_id )

    local item_class = select ( 6 , GetItemInfoInstant ( item_id ) );

    if item_class then
        if item_class == 7 then -- 7 indicates tradeskill reagent
            return true;
        else
            print('\'' .. item_id .. '\' is not a valid crafting reagent.')
        end
    else
        print('The item ID \'' .. item_id .. '\' is not valid.')
    end
    return false;
end

---------------------------
---------------------------
--- CORE SLASH COMMANDS ---
---------------------------
---------------------------

-- Method:          SC.Craft ( int , int )
-- What it Does:    Takes the parameters of spell/recipe id, and the item ID, and uses them
--                  to auto-start mass salvaging even with profession window closed.
-- Purpose:         There appears to be some kind of memory leak in the default Blizz profession frames
--                  and by not having the profession window open, this prevents issues like frames loss.
SC.Craft = function( recipe_id , item_id )
    for bag = 0 , NUM_BAG_SLOTS + 1 do  -- Loop through all bags + reagent bag
        for slot = 1, C_Container.GetContainerNumSlots( bag ) do
            local itemInfo = C_Container.GetContainerItemInfo( bag , slot )
            local default_stack_min = MSA.Crafting.Get_Reagent_Count_Spell( recipe_id );

            if itemInfo and itemInfo.itemID == item_id and itemInfo.stackCount >= default_stack_min then   -- Don't pick the one not with at leat 1 stack
                local item_link = ItemLocation:CreateFromBagAndSlot( bag, slot)
                if item_link:IsValid() and C_Item.GetItemID(item_link) == item_id then
                    -- Item secured, let's build to craft
                    SC.g_item_id = item_id;
                    C_Container.PickupContainerItem( bag , slot )
                    C_TradeSkillUI.CraftSalvage( recipe_id, C_Item.GetItemMaxStackSizeByID( item_id ), ItemLocation:CreateFromBagAndSlot( bag, slot) )
                    ClearCursor()
                    return
                end
            end
        end
    end
end

-- Method:          SC.Help()
-- What it Does:    Prints out the slash commands available and how to use them
-- Purpose:         Useful to have slash command help
SC.Help = function()
    local help_text = "\n" .. "Mass Salvage Assist" .. "\n"
    print("\n")
    print('Mass Salvage Assist')
    print('- Example - Mass Mill Hochenblume:')
    print('- /msa craft recipe_id item_id')
    print('- /msa craft 382981 191461')
    print("\n")
end