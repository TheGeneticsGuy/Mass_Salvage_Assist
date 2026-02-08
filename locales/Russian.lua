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

MSA.LOC.Russian = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true
    MSA_L["Mass Salvage Assist"]=true

    -- MSA_afk.lua
    MSA_L["Warning! AFK while crafting."]="Внимание! Вы отсутствуете во время создания."
    MSA_L["WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"]="ВНИМАНИЕ — ЗАПУЩЕН ОТСЧЕТ ДО ВЫХОДА ИЗ ИГРЫ!!!"

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]="{num1} сек."
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]="{num1} ч, {num2} мин, {misc1} сек."
    MSA_L["{num1} minutes, {num2} seconds"]="{num1} мин, {num2} сек."
    MSA_L["Calculating..."]="Вычисление..."

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]="Объединение завершено. Пожалуйста, перезапустите."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="Создание завершилось преждевременно. Пожалуйста, перезапустите, чтобы продолжить непрерывное создание."
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]="Этот аддон работает только с предметами в сумках. Пожалуйста, переместите предметы в сумки и выберите снова."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]="MSA обнаружил, что качество требуемого реагента изменилось с {num1} на {num2}. Создание остановлено во избежание нежелательного результата низкого качества. Пожалуйста, выберите {misc1} снова и перезапустите, если хотите продолжить."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]="MSA обнаружил, что качество требуемого реагента изменилось с {num1} на {num2}. Создание остановлено во избежание нежелательного использования {misc1}. Пожалуйста, выберите снова и перезапустите, если хотите продолжить."
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]="Создание завершилось преждевременно на сложном рецепте утилизации с несколькими реагентами. Проверка стопок вторичного реагента {name1}. Один момент..."
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]="Нет стопок вторичных реагентов для объединения. Пожалуйста, проверьте доступные реагенты и начните снова."
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]="Нет стопок вторичных реагентов для объединения. Пожалуйста, проверьте доступные {name1} и начните снова."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="Создание завершилось преждевременно. Пожалуйста, перезапустите, чтобы продолжить непрерывное создание."
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]="Объединение завершено. Пожалуйста, вручную выберите 2-й реагент и перезапустите создание."
    MSA_L["Combining {num1} stacks..."]="Объединение {num1} стопок..."
    MSA_L["Crafting has ended prematurely because Shattered Essence buff is not present"]="Создание завершилось преждевременно, так как отсутствует эффект «Расколотая сущность»."

    -- MSA_Localization.ua
    MSA_L["Missing Localization Error - Please report to addon dev."]="Ошибка: отсутствует локализация — пожалуйста, сообщите разработчику аддона."
    MSA_L["Language Selected: {name1}"]="Выбранный язык: {name1}"
    MSA_L["Localization text missing"]="Текст локализации отсутствует"

    -- MSA_Slash.lua
    MSA_L["help"]="помощь"
    MSA_L["craft"]="создать"
    MSA_L["enable"]="включить"
    MSA_L["disable"]="отключить"
    MSA_L["Timer"]="таймер"
    MSA_L["reset"]="сброс"
    MSA_L["resume"]="продолжить"
    MSA_L["Invalid Format"]="Неверный формат"
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]="Пожалуйста, введите \'/msa создать ID_рецепта ID_предмета\'"
    MSA_L["Example: /msa craft 382981 191461"]="Пример: /msa создать 382981 191461"
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]="Неверная команда: введите '/msa помощь' для информации!"
    MSA_L["The recipe ID \'{num1}\' is not valid."]="ID рецепта \'{num1}\' недействителен."
    MSA_L["The item ID \'{num1}\' is not valid."]="ID предмета \'{num1}\' недействителен."
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]="ID предмета \'{num1}\' недействителен. И он слишком длинный!"
    MSA_L["\'{name1}\' is not a salvage recipe."]="\'{name1}\' не является рецептом утилизации."
    MSA_L["\'{num1}\' is not a valid crafting reagent."]="\'{num1}\' не является действительным реагентом для создания."
    MSA_L["Initial stack is too small. Stacks are being combined. One moment..."]="Начальная стопка слишком мала. Стопки объединяются. Один момент..."
    MSA_L["No items in bags to craft."]="В сумках нет предметов для создания."
    MSA_L["Not enough to craft - {num1} {misc1} remaining in bags."]="Недостаточно для создания — в сумках осталось {num1} {misc1}."
    MSA_L["Nonstop crafting is currently disabled. Please type \'/msa enable\' to continue nonstop."]="Непрерывное создание отключено. Введите \'/msa включить\', чтобы продолжить без остановки."
    MSA_L["Nonstop crafting has been enabled"]="Непрерывное создание включено"
    MSA_L["Nonstop crafting is already enabled"]="Непрерывное создание уже включено"
    MSA_L["Nonstop crafting has been disabled"]="Непрерывное создание отключено"
    MSA_L["Nonstop crafting is already disabled"]="Непрерывное создание уже отключено"
    MSA_L["No crafting spell is ready to resume."]="Нет готового заклинания создания для продолжения."
    MSA_L["Resuming..."]="Продолжение..."
    MSA_L['Example - Mass Mill Hochenblume:']="Пример — Массовое измельчение хохецветника:"
    MSA_L['/msa craft recipe_id item_id']="/msa создать ID_рецепта ID_предмета"
    MSA_L['/msa craft 382981 191461']="/msa создать 382981 191461"
    MSA_L["/msa enable    - Turn on endless salvaging"]="/msa включить    - Включить бесконечную утилизацию"
    MSA_L["/msa disable   - Turn off endless salvaging"]="/msa отключить   - Отключить бесконечную утилизацию"
    MSA_L["/msa resume   - Continue with most recently used spell"]="/msa продолжить  - Продолжить с последним заклинанием"
    MSA_L["/msa timer      - Show or Hide the Crafting Timer"]="/msa таймер      - Показать или скрыть таймер создания"
    MSA_L["/msa reset      - Resets timer position to default"]="/msa сброс       - Сбросить позицию таймера"

    -- MSA_UI.lua
    MSA_L["Nonstop Crafting"]="Непрерывное создание"
    MSA_L["MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs."]="Ограничение MSA: Непрерывный режим работает только с реагентами в сумках игрока, но не в банке."
    MSA_L["MSA AFK ALERT"]="ОПОВЕЩЕНИЕ MSA ОБ ОТСУТСТВИИ"
    MSA_L["Typing \'/msa timer\' to open/close also works."]="Ввод \'/msa таймер\' для открытия/закрытия также работает."
    MSA_L["AFK Alert"]="Оповещение об отсутствии (AFK)"
    MSA_L["Alert 1: Going AFK while crafting"]="Оповещение 1: Переход в режим отсутствия при создании"
    MSA_L["Alert 2: 20 Second offline countdown"]="Оповещение 2: 20-секундный отсчет до выхода из игры"
    MSA_L["Play Sound When Player Goes AFK"]="Воспроизводить звук, когда игрок отходит"
    MSA_L["Sound will trigger only during nonstop crafting."]="Звук сработает только во время непрерывного создания."
    MSA_L["Play Sound When Offline Countdown Timer Begins"]="Воспроизводить звук при начале отсчета до выхода"
    MSA_L["Sound will trigger only during nonstop crafting."]="Звук сработает только во время непрерывного создания."
    MSA_L["Force Audio"]="Принудительный звук"
    MSA_L["Alerts will be heard even if sound is disabled."]="Оповещения будут слышны, даже если звук отключен."
    MSA_L["Flash Desktop Icon"]="Мигание иконки на рабочем столе"
    MSA_L["The WOW icon will only flash if not focused already."]="Иконка WOW будет мигать, только если окно не в фокусе."
    MSA_L["Flash When Player Goes AFK"]="Мигать, когда игрок отходит"
    MSA_L["Flash When Logoff Timer Begins"]="Мигать при начале отсчета до выхода"
    MSA_L["Time Remaining"]="Оставшееся время"
    MSA_L["Always Show Timer When Crafting"]="Всегда показывать таймер при создании"
    MSA_L["If you wish to reopen the timer again, type \'/msa timer\'"]="Если вы хотите снова открыть таймер, введите \'/msa таймер\'"
    MSA_L["Calculate using only reagents in bags."]="Вычислять, используя только реагенты в сумках."
    MSA_L["Cancel Crafting On Buff Expiration"]="Отменить создание при истечении эффекта"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Включите, чтобы создание автоматически останавливалось при истечении эффекта."
    MSA_L["Ring Bell on Expiration"]="Звонок при истечении"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Пока доступен только 1 вариант звука. Это изменится."
    MSA_L["Cancel Crafting On Buff Expiration"]="Отменить создание при истечении эффекта"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="Включите, чтобы создание автоматически останавливалось при истечении эффекта."
    MSA_L["Ring Bell On Expiration"]="Звонок при истечении"
    MSA_L["For now, there is only 1 sound choice. This will change."]="Пока доступен только 1 вариант звука. Это изменится."

end
