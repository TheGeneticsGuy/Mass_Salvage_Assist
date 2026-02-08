-- INSTRUCTIONS FOR LOCALIZATION

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

MSA.LOC.German = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true
    MSA_L["Mass Salvage Assist"]=true -- Or keep true if you prefer English title

    -- MSA_afk.lua
    MSA_L["Warning! AFK while crafting."]="Warnung! AFK während des Handwerks."
    MSA_L["WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"]="WARNUNG - AUSLOG-COUNTDOWN AUSGELÖST!!!"

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]="{num1} Sekunden"
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]="{num1} Std, {num2} Minuten, {misc1} Sekunden"
    MSA_L["{num1} minutes, {num2} seconds"]="{num1} Minuten, {num2} Sekunden"
    MSA_L["Calculating..."]="Berechne..."

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]="Stapeln abgeschlossen. Bitte neu starten."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="Handwerk vorzeitig beendet. Bitte neu starten, um endlos fortzufahren."
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]="Dieses Addon funktioniert nur mit Gegenständen in deinen Taschen. Bitte verschiebe sie in deine Taschen und wähle erneut aus."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]="MSA hat erkannt, dass sich die Qualität der Reagenz von {num1} auf {num2} geändert hat. Handwerk gestoppt, um ungewollte minderwertige Herstellung zu verhindern. Bitte {misc1} neu auswählen und neu starten."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]="MSA hat erkannt, dass sich die Qualität der Reagenz von {num1} auf {num2} geändert hat. Handwerk gestoppt, um ungewollte Nutzung von {misc1} zu verhindern. Bitte neu auswählen und neu starten."
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]="Handwerk bei komplexem Verwertungs-Rezept mit mehreren Reagenzien vorzeitig beendet. Prüfe Stapel der sekundären Reagenz {name1}. Einen Moment..."
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]="Keine sekundären Reagenzstapel zum Kombinieren. Bitte überprüfe deine verfügbaren Reagenzien und starte erneut."
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]="Keine sekundären Reagenzstapel zum Kombinieren. Bitte überprüfe deine verfügbaren {name1} und starte erneut."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="Handwerk vorzeitig beendet. Bitte neu starten, um endlos fortzufahren."
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]="Stapeln ist fertig. Bitte wähle manuell die 2. Reagenz und starte das Handwerk neu."
    MSA_L["Combining {num1} stacks..."]="Kombiniere {num1} Stapel..."
    MSA_L["Crafting has ended prematurely because Shattered Essence buff is not present"]="Handwerk vorzeitig beendet, da der Buff 'Zerschmetterte Essenz' fehlt."

    -- MSA_Localization.ua
    MSA_L["Missing Localization Error - Please report to addon dev."]="Fehlende Lokalisierung - Bitte an den Addon-Entwickler melden."
    MSA_L["Language Selected: {name1}"]="Sprache ausgewählt: {name1}"
    MSA_L["Localization text missing"]="Lokalisierungstext fehlt"

    -- MSA_Slash.lua
    MSA_L["help"]="hilfe"
    MSA_L["craft"]="herstellen"
    MSA_L["enable"]="aktivieren"
    MSA_L["disable"]="deaktivieren"
    MSA_L["Timer"]=true -- "Timer" is commonly used in German gaming, or "zeitmesser"
    MSA_L["reset"]="zuruecksetzen"
    MSA_L["resume"]="fortsetzen"
    MSA_L["Invalid Format"]="Ungültiges Format"
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]="Bitte tippe \'/msa herstellen rezept_id gegenstands_id\'"
    MSA_L["Example: /msa craft 382981 191461"]="Beispiel: /msa herstellen 382981 191461"
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]="Ungültiger Befehl: Bitte tippe '/msa hilfe' für mehr Infos!"
    MSA_L["The recipe ID \'{num1}\' is not valid."]="Die Rezept-ID \'{num1}\' ist ungültig."
    MSA_L["The item ID \'{num1}\' is not valid."]="Die Gegenstands-ID \'{num1}\' ist ungültig."
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]="Die Gegenstands-ID \'{num1}\' ist ungültig. Und sie ist zu lang!"
    MSA_L["\'{name1}\' is not a salvage recipe."]="\'{name1}\' ist kein Verwertungs-Rezept."
    MSA_L["\'{num1}\' is not a valid crafting reagent."]="\'{num1}\' ist keine gültige Handwerks-Reagenz."
    MSA_L["Initial stack is too small. Stacks are being combined. One moment..."]="Anfangsstapel ist zu klein. Stapel werden kombiniert. Einen Moment..."
    MSA_L["No items in bags to craft."]="Keine Gegenstände zum Herstellen in den Taschen."
    MSA_L["Not enough to craft - {num1} {misc1} remaining in bags."]="Nicht genug zum Herstellen - {num1} {misc1} verbleiben in den Taschen."
    MSA_L["Nonstop crafting is currently disabled. Please type \'/msa enable\' to continue nonstop."]="Endloses Handwerk ist derzeit deaktiviert. Bitte tippe \'/msa aktivieren\' um fortzufahren."
    MSA_L["Nonstop crafting has been enabled"]="Endloses Handwerk wurde aktiviert."
    MSA_L["Nonstop crafting is already enabled"]="Endloses Handwerk ist bereits aktiviert."
    MSA_L["Nonstop crafting has been disabled"]="Endloses Handwerk wurde deaktiviert."
    MSA_L["Nonstop crafting is already disabled"]="Endloses Handwerk ist bereits deaktiviert."
    MSA_L["No crafting spell is ready to resume."]="Kein Handwerkszauber bereit zum Fortsetzen."
    MSA_L["Resuming..."]="Setze fort..."
    MSA_L['Example - Mass Mill Hochenblume:']="Beispiel - Massenmahlen Hochenblume:"
    MSA_L['/msa craft recipe_id item_id']="/msa herstellen rezept_id gegenstands_id"
    MSA_L['/msa craft 382981 191461']="/msa herstellen 382981 191461"
    MSA_L["/msa enable    - Turn on endless salvaging"]="/msa aktivieren         - Endloses Verwerten einschalten"
    MSA_L["/msa disable   - Turn off endless salvaging"]="/msa deaktivieren     - Endloses Verwerten ausschalten"
    MSA_L["/msa resume   - Continue with most recently used spell"]="/msa fortsetzen         - Mit dem zuletzt genutzten Zauber weitermachen"
    MSA_L["/msa timer      - Show or Hide the Crafting Timer"]="/msa timer                - Zeige oder verstecke den Handwerkstimer"
    MSA_L["/msa reset      - Resets timer position to default"]="/msa zuruecksetzen  - Setzt Timer-Position zurück"

    -- MSA_UI.lua
    MSA_L["Nonstop Crafting"]="Endloses Handwerk"
    MSA_L["MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs."]="MSA Einschränkung: Endlos-Modus funktioniert nur für Reagenzien in Spielertaschen, nicht im Bankfach."
    MSA_L["MSA AFK ALERT"]="MSA AFK ALARM"
    MSA_L["Typing \'/msa timer\' to open/close also works."]="Tippen von \'/msa timer\' zum Öffnen/Schließen funktioniert auch."
    MSA_L["AFK Alert"]="AFK Alarm"
    MSA_L["Alert 1: Going AFK while crafting"]="Alarm 1: AFK gehen während des Handwerks"
    MSA_L["Alert 2: 20 Second offline countdown"]="Alarm 2: 20 Sekunden Offline-Countdown"
    MSA_L["Play Sound When Player Goes AFK"]="Sound abspielen, wenn Spieler AFK geht"
    MSA_L["Sound will trigger only during nonstop crafting."]="Sound wird nur während des endlosen Handwerks ausgelöst."
    MSA_L["Play Sound When Offline Countdown Timer Begins"]="Sound abspielen, wenn Offline-Countdown beginnt"
    MSA_L["Sound will trigger only during nonstop crafting."]="Sound wird nur während des endlosen Handwerks ausgelöst."
    MSA_L["Force Audio"]="Audio erzwingen"
    MSA_L["Alerts will be heard even if sound is disabled."]="Alarme werden gehört, auch wenn Sound deaktiviert ist."
    MSA_L["Flash Desktop Icon"]="Desktop-Icon blinken lassen"
    MSA_L["The WOW icon will only flash if not focused already."]="Das WOW-Icon blinkt nur, wenn das Fenster nicht im Fokus ist."
    MSA_L["Flash When Player Goes AFK"]="Blinken, wenn Spieler AFK geht"
    MSA_L["Flash When Logoff Timer Begins"]="Blinken, wenn Auslog-Timer beginnt"
    MSA_L["Time Remaining"]="Verbleibende Zeit"
    MSA_L["Always Show Timer When Crafting"]="Timer beim Handwerk immer anzeigen"
    MSA_L["If you wish to reopen the timer again, type \'/msa timer\'"]="Um den Timer wieder zu öffnen, tippe \'/msa timer\'"
    MSA_L["Calculate using only reagents in bags."]="Nur mit Reagenzien in den Taschen berechnen."
    MSA_L["Cancel Crafting On Buff Expiration"]="Handwerk bei Buff-Ablauf abbrechen"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Aktivieren, damit das Handwerk automatisch stoppt, wenn der Buff abläuft."
    MSA_L["Ring Bell on Expiration"]="Glocke bei Ablauf läuten"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Derzeit gibt es nur eine Soundwahl. Das wird sich ändern."
    MSA_L["Cancel Crafting On Buff Expiration"]="Handwerk bei Buff-Ablauf abbrechen"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Aktivieren, damit das Handwerk automatisch stoppt, wenn der Buff abläuft."
    MSA_L["Ring Bell On Expiration"]="Glocke bei Ablauf läuten"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Derzeit gibt es nur eine Soundwahl. Das wird sich ändern."

end
