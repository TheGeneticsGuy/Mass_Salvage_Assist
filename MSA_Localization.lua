local LOC = {};
MSA.LOC = LOC;

-- GLobals for localizations
MSAL = {};
MSA_L = {};

local Languages = {
    "English",
    "French",
    "German",
    "Italian",
    "Russian",
    "SpanishMX",
    "SpanishEU",
    "PortugueseBR",
    "Korean",
    "MandarinCN",
    "MandarinTW"
}

local LoadLanguage = function()
    -- Array that holds all the initialization functions to load the dictionary of each language.
    if not LOC.LoadLanguage then
        MSA.LOC.LoadLanguage = {
        MSA.LOC.English,
        MSA.LOC.French,
        MSA.LOC.German,
        MSA.LOC.Italian,
        MSA.LOC.Russian,
        MSA.LOC.SpanishMX,
        MSA.LOC.SpanishEU,
        MSA.LOC.PortugueseBR,
        MSA.LOC.Korean,
        MSA.LOC.MandarinCN,
        MSA.LOC.MandarinTW
    }
    end
end

-- Method:          LOC.GetLocalizationIndex()
-- What it Does:    Initializes the region index to match the other tables
-- Purpose:         To auto configure the language localization based on region.
LOC.GetLocalizationIndex = function()
    local regions = {
        ["enUS"]=1, 
        ["frFR"]=2,
        ["deDE"]=3,
        ["itIT"]=4,
        ["ruRU"]=5,
        ["esMX"]=6,
        ["esES"]=7,
        ["ptBR"]=8,
        ["koKR"]=9,
        ["zhCN"]=10,
        ["zhTW"]=11
    }
    return regions[GetLocale()]
end

-- Method:          LOC.ConfigureAlternativeSlashCommands()
-- What it Does:    Allows the creation of custom slash command.
-- purpose:         Localization reasons.
LOC.ConfigureAlternativeSlashCommands = function()
    if MSA_L["/XXXX"] ~= true then
        SLASH_MSA2 = MSA_L["/XXXX"];
        MSA.SC.SlashCommandActions(string.gsub(MSA_L ["/XXXX"],"/",""));
    end
end

-- Method:          LOC.SetLanguage ( int , boolean )
-- What it Does:    Establishes the localization file
-- Purpose:         Set the language how you want!
LOC.SetLanguage = function ( index , forceReload )
    if forceReload then

        if MSA_save.languageSelected ~= index then
            MSA_save.languageSelected = index;

            -- Reloading
            MSA.Report(MSA.L("MSA") .. ": " .. MSA.L("Language Selected: {name1}" , Languages[index]))
            LOC.LoadLanguage[index]();
            -- Reprocess UI Frames
        end
        return
    end

    index = index or MSA_save.languageSelected;

    -- This will auto adjust the language depending on the localization
    if MSA_save.localizeSetAuto and LOC.GetLocalizationIndex() ~= index then
        index = LOC.GetLocalizationIndex();
        MSA_save.languageSelected = index;
    end

    LoadLanguage();
    LOC.LoadLanguage[index]();
    LOC.ConfigureAlternativeSlashCommands();
end

-- Method:          LOC.GetNumberUntranslatedLines ( int )
-- What it Does:    It returns the number of language lines that need to be translated
-- Purpose:         To help reach out to the community to build an effort for crowdsupport for translation efforts.
LOC.GetNumberUntranslatedLines = function ( languageIndex )
    local result = 0;
    -- index 1 will always result as 0 since it is written native in English
    if languageIndex > 1 then
        for _ , y in pairs ( GRM_L ) do
            if y == true then
                result = result + 1;
            end
        end
    end
    return result;
end

-- Method:          MSA.L( string, [...] )
-- What it Does:    Processes the localized string with the input values
-- Purpose:         I want to use my own custom localization. I don't want to rely on localization dependencies.
MSA.L = function( key , name1, name2, num1, num2, misc1, misc2 )
    if key ~= nil and MSA_L[key] ~= nil then
        if MSA_L[key] ~= true then
            key = MSA[key]; -- Get localized text - Not necessary if in default English
        end

        if name1 then -- It is not nil
            key = string.gsub(key, "{name1}", name1); -- insert playerName where needed
        end
        if name2 then -- It is not nil
            key = string.gsub(key, "{name2}", name2);
        end
        if num1 then
            key = string.gsub(key, "{num1}", num1);
        end
        if num2 then
            key = string.gsub(key, "{num2}", num2);
        end
        if misc1 then
            key = string.gsub(key, "{misc1}", misc1);
        end
        if misc2 then
            key = string.gsub(key, "{misc2}", misc2);
        end
    else
        if key ~= nil then
            MSA.Report(MSA.L( "MSA" ) .. ": " .. MSA.L("Missing Localization Error - Please report to addon dev."));
        else
            error(MSA.L("MSA") .. ": " .. MSA.L("Localization text missing"));
        end
    end
    return key;
end

-- Method:          MSA.Report ( string )
-- What it Does:    Sends to the main chat window messages on various events as deemed necessary to report on by addon creator.
-- Purpose:         To clean up the reporting and have a way to present the information blended into the default system UI
MSA.Report = function(msg)
    DEFAULT_CHAT_FRAME:AddMessage(msg, 1, 0.84, 0);
end