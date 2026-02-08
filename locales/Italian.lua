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

MSA.LOC.Italian = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true
    MSA_L["Mass Salvage Assist"]=true

    -- MSA_afk.lua
    MSA_L["Warning! AFK while crafting."]="Attenzione! Assente (AFK) durante la creazione."
    MSA_L["WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"]="ATTENZIONE - CONTO ALLA ROVESCIA PER LA DISCONNESSIONE AVVIATO!!!"

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]="{num1} secondi"
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]="{num1} ore, {num2} minuti, {misc1} secondi"
    MSA_L["{num1} minutes, {num2} seconds"]="{num1} minuti, {num2} secondi"
    MSA_L["Calculating..."]="Calcolo in corso..."

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]="L'impilamento è terminato. Per favore riavvia."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="La creazione è terminata prematuramente. Per favore riavvia e la creazione continuerà senza sosta."
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]="Questo addon funziona solo con oggetti selezionati nelle tue borse. Per favore sposta gli oggetti nelle borse e riseleziona."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]="MSA ha rilevato che la qualità del reagente richiesto è cambiata da {num1} a {num2}. La creazione è stata interrotta per prevenire creazioni indesiderate di qualità inferiore. Per favore riseleziona {misc1} e riavvia se desideri continuare."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]="MSA ha rilevato che la qualità del reagente richiesto è cambiata da {num1} a {num2}. La creazione è stata interrotta per prevenire l'uso indesiderato di {misc1}. Per favore riseleziona e riavvia se desideri continuare."
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]="La creazione è terminata prematuramente su una ricetta di recupero complessa con reagenti multipli. Controllo delle pile del reagente secondario {name1}. Un momento..."
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]="Nessuna pila di reagenti secondari da combinare. Per favore controlla i reagenti disponibili e ricomincia."
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]="Nessuna pila di reagenti secondari da combinare. Per favore controlla i tuoi {name1} disponibili e ricomincia."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="La creazione è terminata prematuramente. Per favore riavvia e la creazione continuerà senza sosta."
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]="L'impilamento è terminato. Per favore scegli manualmente il 2° reagente e riavvia la creazione."
    MSA_L["Combining {num1} stacks..."]="Combinazione di {num1} pile..."
    MSA_L["Crafting has ended prematurely because Shattered Essence buff is not present"]="La creazione è terminata prematuramente perché il beneficio Essenza Infranta non è presente."

    -- MSA_Localization.ua
    MSA_L["Missing Localization Error - Please report to addon dev."]="Errore di localizzazione mancante - Per favore segnalalo allo sviluppatore dell'addon."
    MSA_L["Language Selected: {name1}"]="Lingua Selezionata: {name1}"
    MSA_L["Localization text missing"]="Testo di localizzazione mancante"

    -- MSA_Slash.lua
    MSA_L["help"]="aiuto"
    MSA_L["craft"]="crea"
    MSA_L["enable"]="abilita"
    MSA_L["disable"]="disabilita"
    MSA_L["Timer"]="timer"
    MSA_L["reset"]="reimposta"
    MSA_L["resume"]="riprendi"
    MSA_L["Invalid Format"]="Formato Non Valido"
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]="Per favore scrivi \'/msa crea id_ricetta id_oggetto\'"
    MSA_L["Example: /msa craft 382981 191461"]="Esempio: /msa crea 382981 191461"
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]="Comando Non Valido: Per favore scrivi '/msa aiuto' per Maggiori Info!"
    MSA_L["The recipe ID \'{num1}\' is not valid."]="L'ID ricetta \'{num1}\' non è valido."
    MSA_L["The item ID \'{num1}\' is not valid."]="L'ID oggetto \'{num1}\' non è valido."
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]="L'ID oggetto \'{num1}\' non è valido. E, è troppo lungo!"
    MSA_L["\'{name1}\' is not a salvage recipe."]="\'{name1}\' non è una ricetta di recupero."
    MSA_L["\'{num1}\' is not a valid crafting reagent."]="\'{num1}\' non è un reagente di creazione valido."
    MSA_L["Initial stack is too small. Stacks are being combined. One moment..."]="La pila iniziale è troppo piccola. Le pile vengono combinate. Un momento..."
    MSA_L["No items in bags to craft."]="Nessun oggetto nelle borse da creare."
    MSA_L["Not enough to craft - {num1} {misc1} remaining in bags."]="Non abbastanza per creare - {num1} {misc1} rimanenti nelle borse."
    MSA_L["Nonstop crafting is currently disabled. Please type \'/msa enable\' to continue nonstop."]="La creazione continua è attualmente disabilitata. Per favore scrivi \'/msa abilita\' per continuare senza sosta."
    MSA_L["Nonstop crafting has been enabled"]="La creazione continua è stata abilitata"
    MSA_L["Nonstop crafting is already enabled"]="La creazione continua è già abilitata"
    MSA_L["Nonstop crafting has been disabled"]="La creazione continua è stata disabilitata"
    MSA_L["Nonstop crafting is already disabled"]="La creazione continua è già disabilitata"
    MSA_L["No crafting spell is ready to resume."]="Nessun incantesimo di creazione è pronto per riprendere."
    MSA_L["Resuming..."]="Ripresa in corso..."
    MSA_L['Example - Mass Mill Hochenblume:']="Esempio - Pestatura di Massa Hochenblume:"
    MSA_L['/msa craft recipe_id item_id']="/msa crea id_ricetta id_oggetto"
    MSA_L['/msa craft 382981 191461']="/msa crea 382981 191461"
    MSA_L["/msa enable    - Turn on endless salvaging"]="/msa abilita    - Attiva il recupero senza fine"
    MSA_L["/msa disable   - Turn off endless salvaging"]="/msa disabilita   - Disattiva il recupero senza fine"
    MSA_L["/msa resume   - Continue with most recently used spell"]="/msa riprendi   - Continua con l'ultimo incantesimo usato"
    MSA_L["/msa timer      - Show or Hide the Crafting Timer"]="/msa timer      - Mostra o Nascondi il Timer di Creazione"
    MSA_L["/msa reset      - Resets timer position to default"]="/msa reimposta      - Reimposta la posizione del timer al default"

    -- MSA_UI.lua
    MSA_L["Nonstop Crafting"]="Creazione Continua"
    MSA_L["MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs."]="Limitazione MSA: La modalità continua funzionerà solo per i reagenti nelle borse del giocatore, non nelle schede della banca."
    MSA_L["MSA AFK ALERT"]="AVVISO MSA AFK"
    MSA_L["Typing \'/msa timer\' to open/close also works."]="Scrivere \'/msa timer\' per aprire/chiudere funziona ugualmente."
    MSA_L["AFK Alert"]="Avviso AFK"
    MSA_L["Alert 1: Going AFK while crafting"]="Avviso 1: Diventare Assente (AFK) durante la creazione"
    MSA_L["Alert 2: 20 Second offline countdown"]="Avviso 2: Conto alla rovescia offline di 20 secondi"
    MSA_L["Play Sound When Player Goes AFK"]="Riproduci Suono Quando il Giocatore Diventa Assente"
    MSA_L["Sound will trigger only during nonstop crafting."]="Il suono si attiverà solo durante la creazione continua."
    MSA_L["Play Sound When Offline Countdown Timer Begins"]="Riproduci Suono All'Inizio del Conto alla Rovescia Offline"
    MSA_L["Sound will trigger only during nonstop crafting."]="Il suono si attiverà solo durante la creazione continua."
    MSA_L["Force Audio"]="Forza Audio"
    MSA_L["Alerts will be heard even if sound is disabled."]="Gli avvisi si sentiranno anche se il suono è disabilitato."
    MSA_L["Flash Desktop Icon"]="Lampeggia Icona Desktop"
    MSA_L["The WOW icon will only flash if not focused already."]="L'icona di WOW lampeggerà solo se non è già in primo piano."
    MSA_L["Flash When Player Goes AFK"]="Lampeggia Quando il Giocatore Diventa Assente"
    MSA_L["Flash When Logoff Timer Begins"]="Lampeggia All'Inizio del Timer di Disconnessione"
    MSA_L["Time Remaining"]="Tempo Rimanente"
    MSA_L["Always Show Timer When Crafting"]="Mostra Sempre il Timer Durante la Creazione"
    MSA_L["If you wish to reopen the timer again, type \'/msa timer\'"]="Se desideri riaprire il timer, scrivi \'/msa timer\'"
    MSA_L["Calculate using only reagents in bags."]="Calcola usando solo i reagenti nelle borse."
    MSA_L["Cancel Crafting On Buff Expiration"]="Annulla Creazione alla Scadenza del Beneficio"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Abilita per assicurare che la creazione si fermi automaticamente quando il beneficio scade."
    MSA_L["Ring Bell on Expiration"]="Suona Campanello alla Scadenza"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Per ora, c'è solo 1 scelta di suono. Questo cambierà."
    MSA_L["Cancel Crafting On Buff Expiration"]="Annulla Creazione alla Scadenza del Beneficio"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Abilita per assicurare che la creazione si fermi automaticamente quando il beneficio scade."
    MSA_L["Ring Bell On Expiration"]="Suona Campanello alla Scadenza"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Per ora, c'è solo 1 scelta di suono. Questo cambierà."


end
