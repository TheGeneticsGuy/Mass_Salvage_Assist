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

MSA.LOC.PortugueseBR = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true
    MSA_L["Mass Salvage Assist"]=true

    -- MSA_afk.lua
    MSA_L["Warning! AFK while crafting."]="Aviso! Ausente durante a produção."
    MSA_L["WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"]="AVISO - CONTAGEM DE DESCONEXÃO INICIADA!!!"

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]="{num1} segundos"
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]="{num1} horas, {num2} minutos, {misc1} segundos"
    MSA_L["{num1} minutes, {num2} seconds"]="{num1} minutos, {num2} segundos"
    MSA_L["Calculating..."]="Calculando..."

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]="O empilhamento terminou. Por favor, reinicie."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="A produção terminou prematuramente. Por favor, reinicie para continuar sem parar."
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]="Este addon só funciona com itens selecionados em suas bolsas. Mova os itens para suas bolsas e selecione novamente."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]="O MSA detectou que a qualidade do reagente necessário mudou de {num1} para {num2}. A produção parou para evitar criação de qualidade inferior indesejada. Selecione {misc1} novamente e reinicie se quiser continuar."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]="O MSA detectou que a qualidade do reagente necessário mudou de {num1} para {num2}. A produção parou para evitar uso indesejado de {misc1}. Selecione novamente e reinicie se quiser continuar."
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]="A produção terminou prematuramente em uma receita complexa com múltiplos reagentes. Verificando pilhas do reagente secundário {name1}. Um momento..."
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]="Sem pilhas de reagentes secundários para combinar. Verifique seus reagentes disponíveis e comece novamente."
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]="Sem pilhas de reagentes secundários para combinar. Verifique seus {name1} disponíveis e comece novamente."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="A produção terminou prematuramente. Por favor, reinicie para continuar sem parar."
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]="O empilhamento terminou. Escolha manualmente o 2º reagente e reinicie a produção."
    MSA_L["Combining {num1} stacks..."]="Combinando {num1} pilhas..."
    MSA_L["Crafting has ended prematurely because Shattered Essence buff is not present"]="A produção terminou prematuramente porque o bônus Essência Estilhaçada não está presente."

    -- MSA_Localization.ua
    MSA_L["Missing Localization Error - Please report to addon dev."]="Erro de Localização Ausente - Por favor, reporte ao desenvolvedor."
    MSA_L["Language Selected: {name1}"]="Idioma Selecionado: {name1}"
    MSA_L["Localization text missing"]="Texto de localização ausente"

    -- MSA_Slash.lua
    MSA_L["help"]="ajuda"
    MSA_L["craft"]="criar"
    MSA_L["enable"]="ativar"
    MSA_L["disable"]="desativar"
    MSA_L["Timer"]="cronometro"
    MSA_L["reset"]="redefinir"
    MSA_L["resume"]="retomar"
    MSA_L["Invalid Format"]="Formato Inválido"
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]="Digite \'/msa criar id_receita id_item\'"
    MSA_L["Example: /msa craft 382981 191461"]="Exemplo: /msa criar 382981 191461"
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]="Comando Inválido: Digite '/msa ajuda' para Mais Informações!"
    MSA_L["The recipe ID \'{num1}\' is not valid."]="O ID da receita \'{num1}\' não é válido."
    MSA_L["The item ID \'{num1}\' is not valid."]="O ID do item \'{num1}\' não é válido."
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]="O ID do item \'{num1}\' não é válido. E é muito longo!"
    MSA_L["\'{name1}\' is not a salvage recipe."]="\'{name1}\' não é uma receita de recuperação."
    MSA_L["\'{num1}\' is not a valid crafting reagent."]="\'{num1}\' não é um reagente de produção válido."
    MSA_L["Initial stack is too small. Stacks are being combined. One moment..."]="Pilha inicial muito pequena. Pilhas estão sendo combinadas. Um momento..."
    MSA_L["No items in bags to craft."]="Sem itens nas bolsas para criar."
    MSA_L["Not enough to craft - {num1} {misc1} remaining in bags."]="Não há o suficiente para criar - {num1} {misc1} restantes nas bolsas."
    MSA_L["Nonstop crafting is currently disabled. Please type \'/msa enable\' to continue nonstop."]="Produção contínua está desativada. Digite \'/msa ativar\' para continuar sem parar."
    MSA_L["Nonstop crafting has been enabled"]="Produção contínua foi ativada"
    MSA_L["Nonstop crafting is already enabled"]="Produção contínua já está ativada"
    MSA_L["Nonstop crafting has been disabled"]="Produção contínua foi desativada"
    MSA_L["Nonstop crafting is already disabled"]="Produção contínua já está desativada"
    MSA_L["No crafting spell is ready to resume."]="Nenhum feitiço de produção pronto para retomar."
    MSA_L["Resuming..."]="Retomando..."
    MSA_L['Example - Mass Mill Hochenblume:']="Exemplo - Moagem em Massa de Hochenblume:"
    MSA_L['/msa craft recipe_id item_id']="/msa criar id_receita id_item"
    MSA_L['/msa craft 382981 191461']="/msa criar 382981 191461"
    MSA_L["/msa enable    - Turn on endless salvaging"]="/msa ativar    - Ligar recuperação sem fim"
    MSA_L["/msa disable   - Turn off endless salvaging"]="/msa desativar   - Desligar recuperação sem fim"
    MSA_L["/msa resume   - Continue with most recently used spell"]="/msa retomar   - Continuar com o último feitiço usado"
    MSA_L["/msa timer      - Show or Hide the Crafting Timer"]="/msa cronometro      - Mostrar ou Esconder o Cronômetro"
    MSA_L["/msa reset      - Resets timer position to default"]="/msa redefinir      - Redefine a posição do cronômetro para o padrão"

    -- MSA_UI.lua
    MSA_L["Nonstop Crafting"]="Produção Contínua"
    MSA_L["MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs."]="Limitação do MSA: O modo contínuo só funciona para reagentes nas bolsas do jogador, não no banco."
    MSA_L["MSA AFK ALERT"]="ALERTA DE AUSÊNCIA MSA"
    MSA_L["Typing \'/msa timer\' to open/close also works."]="Digitar \'/msa cronometro\' para abrir/fechar também funciona."
    MSA_L["AFK Alert"]="Alerta de Ausência"
    MSA_L["Alert 1: Going AFK while crafting"]="Alerta 1: Ficar Ausente durante a produção"
    MSA_L["Alert 2: 20 Second offline countdown"]="Alerta 2: Contagem de desconexão de 20 segundos"
    MSA_L["Play Sound When Player Goes AFK"]="Tocar Som Quando Jogador Ficar Ausente"
    MSA_L["Sound will trigger only during nonstop crafting."]="O som só tocará durante a produção contínua."
    MSA_L["Play Sound When Offline Countdown Timer Begins"]="Tocar Som Quando Contagem de Desconexão Começar"
    MSA_L["Sound will trigger only during nonstop crafting."]="O som só tocará durante a produção contínua."
    MSA_L["Force Audio"]="Forçar Áudio"
    MSA_L["Alerts will be heard even if sound is disabled."]="Alertas serão ouvidos mesmo se o som estiver desativado."
    MSA_L["Flash Desktop Icon"]="Piscar Ícone da Área de Trabalho"
    MSA_L["The WOW icon will only flash if not focused already."]="O ícone do WOW só piscará se não estiver em foco."
    MSA_L["Flash When Player Goes AFK"]="Piscar Quando Jogador Ficar Ausente"
    MSA_L["Flash When Logoff Timer Begins"]="Piscar Quando Timer de Desconexão Começar"
    MSA_L["Time Remaining"]="Tempo Restante"
    MSA_L["Always Show Timer When Crafting"]="Sempre Mostrar Cronômetro ao Produzir"
    MSA_L["If you wish to reopen the timer again, type \'/msa timer\'"]="Se quiser reabrir o cronômetro, digite \'/msa cronometro\'"
    MSA_L["Calculate using only reagents in bags."]="Calcular usando apenas reagentes nas bolsas."
    MSA_L["Cancel Crafting On Buff Expiration"]="Cancelar Produção ao Expirar Bônus"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Ative para garantir que a produção pare quando o bônus expirar."
    MSA_L["Ring Bell on Expiration"]="Tocar Sino ao Expirar"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Por enquanto, há apenas 1 escolha de som. Isso mudará."
    MSA_L["Cancel Crafting On Buff Expiration"]="Cancelar Produção ao Expirar Bônus"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Ative para garantir que a produção pare quando o bônus expirar."
    MSA_L["Ring Bell On Expiration"]="Tocar Sino ao Expirar"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Por enquanto, há apenas 1 escolha de som. Isso mudará."


end