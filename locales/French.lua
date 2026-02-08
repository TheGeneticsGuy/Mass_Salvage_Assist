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

MSA.LOC.French = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true
    MSA_L["Mass Salvage Assist"]=true

    -- MSA_afk.lua
    MSA_L["Warning! AFK while crafting."]="Attention ! Absent pendant la fabrication."
    MSA_L["WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"]="ATTENTION - DÉCOMPTE DE DÉCONNEXION DÉCLENCHÉ !!!"

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]="{num1} secondes"
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]="{num1} h, {num2} minutes, {misc1} secondes"
    MSA_L["{num1} minutes, {num2} seconds"]="{num1} minutes, {num2} secondes"
    MSA_L["Calculating..."]="Calcul en cours..."

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]="L'empilement est terminé. Veuillez redémarrer."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="La fabrication s'est terminée prématurément. Veuillez redémarrer pour continuer la fabrication en continu."
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]="Cet addon ne fonctionne qu'avec des objets présents dans vos sacs. Veuillez déplacer les objets dans vos sacs et re-sélectionner."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]="MSA a détecté que la qualité du composant requis a changé de {num1} à {num2}. La fabrication a été arrêtée pour éviter une création de moindre qualité non désirée. Veuillez re-sélectionner {misc1} et redémarrer si vous souhaitez continuer."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]="MSA a détecté que la qualité du composant requis a changé de {num1} à {num2}. La fabrication a été arrêtée pour éviter l'utilisation non désirée de {misc1}. Veuillez re-sélectionner et redémarrer si vous souhaitez continuer."
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]="La fabrication s'est terminée prématurément sur une recette complexe avec plusieurs composants. Vérification des piles du composant secondaire {name1}. Un instant..."
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]="Aucune pile de composant secondaire à combiner. Veuillez vérifier vos composants disponibles et recommencer."
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]="Aucune pile de composant secondaire à combiner. Veuillez vérifier vos {name1} disponibles et recommencer."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="La fabrication s'est terminée prématurément. Veuillez redémarrer pour continuer la fabrication en continu."
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]="L'empilement est terminé. Veuillez choisir manuellement le 2ème composant et relancer la fabrication."
    MSA_L["Combining {num1} stacks..."]="Combinaison de {num1} piles..."
    MSA_L["Crafting has ended prematurely because Shattered Essence buff is not present"]="La fabrication s'est terminée prématurément car l'amélioration Essence brisée est absente."

    -- MSA_Localization.ua
    MSA_L["Missing Localization Error - Please report to addon dev."]="Erreur de localisation manquante - Veuillez signaler au développeur de l'addon."
    MSA_L["Language Selected: {name1}"]="Langue sélectionnée : {name1}"
    MSA_L["Localization text missing"]="Texte de localisation manquant"

    -- MSA_Slash.lua
    MSA_L["help"]="aide"
    MSA_L["craft"]="fabriquer"
    MSA_L["enable"]="activer"
    MSA_L["disable"]="desactiver"
    MSA_L["Timer"]="Minuteur"
    MSA_L["reset"]="reinitialiser"
    MSA_L["resume"]="reprendre"
    MSA_L["Invalid Format"]="Format invalide"
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]="Veuillez taper \'/msa fabriquer ID_recette ID_objet\'"
    MSA_L["Example: /msa craft 382981 191461"]="Exemple : /msa fabriquer 382981 191461"
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]="Commande invalide : Veuillez taper '/msa aide' pour plus d'infos !"
    MSA_L["The recipe ID \'{num1}\' is not valid."]="L'ID de recette \'{num1}\' n'est pas valide."
    MSA_L["The item ID \'{num1}\' is not valid."]="L'ID d'objet \'{num1}\' n'est pas valide."
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]="L'ID d'objet \'{num1}\' n'est pas valide. Et il est trop long !"
    MSA_L["\'{name1}\' is not a salvage recipe."]="\'{name1}\' n'est pas une recette de récupération."
    MSA_L["\'{num1}\' is not a valid crafting reagent."]="\'{num1}\' n'est pas un composant d'artisanat valide."
    MSA_L["Initial stack is too small. Stacks are being combined. One moment..."]="La pile initiale est trop petite. Les piles sont en cours de combinaison. Un instant..."
    MSA_L["No items in bags to craft."]="Aucun objet à fabriquer dans les sacs."
    MSA_L["Not enough to craft - {num1} {misc1} remaining in bags."]="Pas assez pour fabriquer - {num1} {misc1} restant dans les sacs."
    MSA_L["Nonstop crafting is currently disabled. Please type \'/msa enable\' to continue nonstop."]="La fabrication en continu est désactivée. Tapez \'/msa activer\' pour continuer sans arrêt."
    MSA_L["Nonstop crafting has been enabled"]="La fabrication en continu a été activée."
    MSA_L["Nonstop crafting is already enabled"]="La fabrication en continu est déjà activée."
    MSA_L["Nonstop crafting has been disabled"]="La fabrication en continu a été désactivée."
    MSA_L["Nonstop crafting is already disabled"]="La fabrication en continu est déjà désactivée."
    MSA_L["No crafting spell is ready to resume."]="Aucun sort d'artisanat n'est prêt à reprendre."
    MSA_L["Resuming..."]="Reprise..."
    MSA_L['Example - Mass Mill Hochenblume:']="Exemple - Pilonnage de masse Hochenblume :"
    MSA_L['/msa craft recipe_id item_id']="/msa fabriquer ID_recette ID_objet"
    MSA_L['/msa craft 382981 191461']="/msa fabriquer 382981 191461"
    MSA_L["/msa enable    - Turn on endless salvaging"]="/msa activer        - Activer la récupération sans fin"
    MSA_L["/msa disable   - Turn off endless salvaging"]="/msa desactiver   - Désactiver la récupération sans fin"
    MSA_L["/msa resume   - Continue with most recently used spell"]="/msa reprendre   - Continuer avec le dernier sort utilisé"
    MSA_L["/msa timer      - Show or Hide the Crafting Timer"]="/msa minuteur     - Afficher ou masquer le minuteur"
    MSA_L["/msa reset      - Resets timer position to default"]="/msa reinitialiser - Réinitialiser la position du minuteur"

    -- MSA_UI.lua
    MSA_L["Nonstop Crafting"]="Fabrication en continu"
    MSA_L["MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs."]="Limitation MSA : Le mode continu ne fonctionne que pour les composants dans les sacs, pas en banque."
    MSA_L["MSA AFK ALERT"]="ALERTE ABSENCE MSA"
    MSA_L["Typing \'/msa timer\' to open/close also works."]="Taper \'/msa minuteur\' pour ouvrir/fermer fonctionne aussi."
    MSA_L["AFK Alert"]="Alerte Absence"
    MSA_L["Alert 1: Going AFK while crafting"]="Alerte 1 : Passage en mode Absent pendant la fabrication"
    MSA_L["Alert 2: 20 Second offline countdown"]="Alerte 2 : Compte à rebours de déconnexion (20 sec)"
    MSA_L["Play Sound When Player Goes AFK"]="Jouer un son quand le joueur passe Absent"
    MSA_L["Sound will trigger only during nonstop crafting."]="Le son ne se déclenchera que pendant la fabrication en continu."
    MSA_L["Play Sound When Offline Countdown Timer Begins"]="Jouer un son au début du compte à rebours de déconnexion"
    MSA_L["Force Audio"]="Forcer l'audio"
    MSA_L["Alerts will be heard even if sound is disabled."]="Les alertes seront audibles même si le son est désactivé."
    MSA_L["Flash Desktop Icon"]="Faire clignoter l'icône du bureau"
    MSA_L["The WOW icon will only flash if not focused already."]="L'icône WOW ne clignotera que si la fenêtre n'est pas active."
    MSA_L["Flash When Player Goes AFK"]="Clignoter quand le joueur passe Absent"
    MSA_L["Flash When Logoff Timer Begins"]="Clignoter au début du compte à rebours de déconnexion"
    MSA_L["Time Remaining"]="Temps restant"
    MSA_L["Always Show Timer When Crafting"]="Toujours afficher le minuteur lors de la fabrication"
    MSA_L["If you wish to reopen the timer again, type \'/msa timer\'"]="Pour rouvrir le minuteur, tapez \'/msa minuteur\'"
    MSA_L["Calculate using only reagents in bags."]="Calculer avec uniquement les composants dans les sacs."
    MSA_L["Cancel Crafting On Buff Expiration"]="Annuler la fabrication à l'expiration de l'amélioration"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Activer pour arrêter la fabrication quand l'amélioration expire."
    MSA_L["Ring Bell on Expiration"]="Sonner à l'expiration"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Pour l'instant, il n'y a qu'un choix de son. Cela changera."
    MSA_L["Cancel Crafting On Buff Expiration"]="Annuler la fabrication à l'expiration de l'amélioration"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Activer pour arrêter la fabrication quand l'amélioration expire."
    MSA_L["Ring Bell On Expiration"]="Sonner à l'expiration"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Pour l'instant, il n'y a qu'un choix de son. Cela changera."

end
