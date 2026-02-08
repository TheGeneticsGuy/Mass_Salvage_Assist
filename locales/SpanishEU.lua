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

MSA.LOC.SpanishEU = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true
    MSA_L["Mass Salvage Assist"]=true

    -- MSA_afk.lua
    MSA_L["Warning! AFK while crafting."]="¡Advertencia! Ausente durante la fabricación."
    MSA_L["WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"]="¡ADVERTENCIA - CUENTA ATRÁS DE DESCONEXIÓN INICIADA!"

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]="{num1} segundos"
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]="{num1} h, {num2} minutos, {misc1} segundos"
    MSA_L["{num1} minutes, {num2} seconds"]="{num1} minutos, {num2} segundos"
    MSA_L["Calculating..."]="Calculando..."

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]="El apilamiento ha terminado. Por favor, reinicia."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="La fabricación ha terminado prematuramente. Por favor, reinicia y la fabricación continuará sin parar."
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]="Este addon solo funciona con objetos seleccionados dentro de tus bolsas. Por favor, mueve los objetos a tus bolsas y vuelve a seleccionar."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]="MSA ha detectado que la calidad del componente requerido ha cambiado de {num1} a {num2}. La fabricación se ha detenido para evitar una fabricación de menor calidad no deseada. Por favor, vuelve a seleccionar {misc1} y reinicia si deseas continuar."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]="MSA ha detectado que la calidad del componente requerido ha cambiado de {num1} a {num2}. La fabricación se ha detenido para evitar el uso no deseado de {misc1}. Por favor, vuelve a seleccionar y reinicia si deseas continuar."
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]="La fabricación ha terminado prematuramente en una receta de recuperación compleja con múltiples componentes. Comprobando montones del componente secundario {name1}. Un momento..."
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]="No hay montones de componentes secundarios para combinar. Por favor, comprueba tus componentes disponibles y empieza de nuevo."
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]="No hay montones de componentes secundarios para combinar. Por favor, comprueba tus {name1} disponibles y empieza de nuevo."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="La fabricación ha terminado prematuramente. Por favor, reinicia y la fabricación continuará sin parar."
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]="El apilamiento ha terminado. Por favor, elige manualmente el 2º componente y reinicia la fabricación."
    MSA_L["Combining {num1} stacks..."]="Combinando {num1} montones..."
    MSA_L["Crafting has ended prematurely because Shattered Essence buff is not present"]="La fabricación ha terminado prematuramente porque el beneficio Esencia destrozada no está presente."

    -- MSA_Localization.ua
    MSA_L["Missing Localization Error - Please report to addon dev."]="Error de localización - Por favor, informa al desarrollador del addon."
    MSA_L["Language Selected: {name1}"]="Idioma seleccionado: {name1}"
    MSA_L["Localization text missing"]="Falta texto de localización"

    -- MSA_Slash.lua
    MSA_L["help"]="ayuda"
    MSA_L["craft"]="fabricar"
    MSA_L["enable"]="activar"
    MSA_L["disable"]="desactivar"
    MSA_L["Timer"]="temporizador"
    MSA_L["reset"]="restablecer"
    MSA_L["resume"]="reanudar"
    MSA_L["Invalid Format"]="Formato inválido"
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]="Por favor, escribe \'/msa fabricar ID_receta ID_objeto\'"
    MSA_L["Example: /msa craft 382981 191461"]="Ejemplo: /msa fabricar 382981 191461"
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]="Comando inválido: ¡Por favor, escribe '/msa ayuda' para más información!"
    MSA_L["The recipe ID \'{num1}\' is not valid."]="El ID de receta \'{num1}\' no es válido."
    MSA_L["The item ID \'{num1}\' is not valid."]="El ID de objeto \'{num1}\' no es válido."
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]="El ID de objeto \'{num1}\' no es válido. ¡Y es demasiado largo!"
    MSA_L["\'{name1}\' is not a salvage recipe."]="\'{name1}\' no es una receta de recuperación."
    MSA_L["\'{num1}\' is not a valid crafting reagent."]="\'{num1}\' no es un componente de fabricación válido."
    MSA_L["Initial stack is too small. Stacks are being combined. One moment..."]="El montón inicial es demasiado pequeño. Se están combinando los montones. Un momento..."
    MSA_L["No items in bags to craft."]="No hay objetos en las bolsas para fabricar."
    MSA_L["Not enough to craft - {num1} {misc1} remaining in bags."]="No hay suficiente para fabricar - quedan {num1} {misc1} en las bolsas."
    MSA_L["Nonstop crafting is currently disabled. Please type \'/msa enable\' to continue nonstop."]="La fabricación ininterrumpida está desactivada. Escribe \'/msa activar\' para continuar sin parar."
    MSA_L["Nonstop crafting has been enabled"]="La fabricación ininterrumpida ha sido activada"
    MSA_L["Nonstop crafting is already enabled"]="La fabricación ininterrumpida ya está activada"
    MSA_L["Nonstop crafting has been disabled"]="La fabricación ininterrumpida ha sido desactivada"
    MSA_L["Nonstop crafting is already disabled"]="La fabricación ininterrumpida ya está desactivada"
    MSA_L["No crafting spell is ready to resume."]="Ningún hechizo de fabricación está listo para reanudarse."
    MSA_L["Resuming..."]="Reanudando..."
    MSA_L['Example - Mass Mill Hochenblume:']="Ejemplo - Moler en masa Hochenblume:"
    MSA_L['/msa craft recipe_id item_id']="/msa fabricar ID_receta ID_objeto"
    MSA_L['/msa craft 382981 191461']="/msa fabricar 382981 191461"
    MSA_L["/msa enable    - Turn on endless salvaging"]="/msa activar    - Activar recuperación sin fin"
    MSA_L["/msa disable   - Turn off endless salvaging"]="/msa desactivar   - Desactivar recuperación sin fin"
    MSA_L["/msa resume   - Continue with most recently used spell"]="/msa reanudar   - Continuar con el último hechizo usado"
    MSA_L["/msa timer      - Show or Hide the Crafting Timer"]="/msa temporizador - Mostrar u ocultar el temporizador"
    MSA_L["/msa reset      - Resets timer position to default"]="/msa restablecer  - Restablecer la posición del temporizador"

    -- MSA_UI.lua
    MSA_L["Nonstop Crafting"]="Fabricación ininterrumpida"
    MSA_L["MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs."]="Limitación de MSA: El modo ininterrumpido solo funciona con componentes en las bolsas, no en el banco."
    MSA_L["MSA AFK ALERT"]="ALERTA DE AUSENTE MSA"
    MSA_L["Typing \'/msa timer\' to open/close also works."]="Escribir \'/msa temporizador\' para abrir/cerrar también funciona."
    MSA_L["AFK Alert"]="Alerta de Ausente"
    MSA_L["Alert 1: Going AFK while crafting"]="Alerta 1: Ponerse Ausente mientras se fabrica"
    MSA_L["Alert 2: 20 Second offline countdown"]="Alerta 2: Cuenta atrás de 20 segundos para desconexión"
    MSA_L["Play Sound When Player Goes AFK"]="Reproducir sonido cuando el jugador se ausente"
    MSA_L["Sound will trigger only during nonstop crafting."]="El sonido solo sonará durante la fabricación ininterrumpida."
    MSA_L["Play Sound When Offline Countdown Timer Begins"]="Reproducir sonido al inicio de la cuenta atrás de desconexión"
    MSA_L["Sound will trigger only during nonstop crafting."]="El sonido solo sonará durante la fabricación ininterrumpida."
    MSA_L["Force Audio"]="Forzar audio"
    MSA_L["Alerts will be heard even if sound is disabled."]="Las alertas se oirán incluso si el sonido está desactivado."
    MSA_L["Flash Desktop Icon"]="Parpadear icono de escritorio"
    MSA_L["The WOW icon will only flash if not focused already."]="El icono de WOW solo parpadeará si no está en primer plano."
    MSA_L["Flash When Player Goes AFK"]="Parpadear cuando el jugador se ausente"
    MSA_L["Flash When Logoff Timer Begins"]="Parpadear al inicio del temporizador de desconexión"
    MSA_L["Time Remaining"]="Tiempo restante"
    MSA_L["Always Show Timer When Crafting"]="Mostrar siempre el temporizador al fabricar"
    MSA_L["If you wish to reopen the timer again, type \'/msa timer\'"]="Si deseas volver a abrir el temporizador, escribe \'/msa temporizador\'"
    MSA_L["Calculate using only reagents in bags."]="Calcular usando solo componentes en las bolsas."
    MSA_L["Cancel Crafting On Buff Expiration"]="Cancelar fabricación al expirar el beneficio"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Activar para asegurar que la fabricación se detenga cuando expire el beneficio."
    MSA_L["Ring Bell on Expiration"]="Sonar campana al expirar"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Por ahora, solo hay 1 opción de sonido. Esto cambiará."
    MSA_L["Cancel Crafting On Buff Expiration"]="Cancelar fabricación al expirar el beneficio"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Activar para asegurar que la fabricación se detenga cuando expire el beneficio."
    MSA_L["Ring Bell On Expiration"]="Sonar campana al expirar"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Por ahora, solo hay 1 opción de sonido. Esto cambiará."


end
