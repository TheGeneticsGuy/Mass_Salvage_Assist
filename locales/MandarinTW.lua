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

MSA.LOC.MandarinTW = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true
    MSA_L["Mass Salvage Assist"]=true

    -- MSA_afk.lua
    MSA_L["Warning! AFK while crafting."]="警告！製作期間暫離。"
    MSA_L["WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"]="警告 - 登出倒數計時已觸發！！！"

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]="{num1} 秒"
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]="{num1} 小時 {num2} 分 {misc1} 秒"
    MSA_L["{num1} minutes, {num2} seconds"]="{num1} 分 {num2} 秒"
    MSA_L["Calculating..."]="計算中..."

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]="堆疊已完成。請重新啟動。"
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="製作已提前結束。請重新啟動以繼續不間斷製作。"
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]="此插件僅適用於您背包中選定的物品。請將物品移至背包並重新選擇。"
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]="MSA 偵測到所需材料的品質已從 {num1} 變更為 {num2}。製作已停止以防止意外製作出低品質物品。若要繼續，請重新選擇 {misc1} 並重新啟動。"
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]="MSA 偵測到所需材料的品質已從 {num1} 變更為 {num2}。製作已停止以防止意外使用 {misc1}。若要繼續，請重新選擇並重新啟動。"
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]="在包含多種材料的複雜拆解配方上，製作已提前結束。正在檢查次要材料 {name1} 的堆疊。請稍候..."
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]="沒有次要材料堆疊可供合併。請檢查您可用的材料並重新開始。"
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]="沒有次要材料堆疊可供合併。請檢查您可用的 {name1} 並重新開始。"
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="製作已提前結束。請重新啟動以繼續不間斷製作。"
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]="堆疊已完成。請手動選擇第二種材料並重新啟動製作。"
    MSA_L["Combining {num1} stacks..."]="正在合併 {num1} 個堆疊..."
    MSA_L["Crafting has ended prematurely because Shattered Essence buff is not present"]="製作已提前結束，因為「碎裂精華」增益效果不存在"

    -- MSA_Localization.ua
    MSA_L["Missing Localization Error - Please report to addon dev."]="遺失在地化錯誤 - 請回報給插件開發者。"
    MSA_L["Language Selected: {name1}"]="已選語言：{name1}"
    MSA_L["Localization text missing"]="在地化文字遺失"

    -- MSA_Slash.lua
    MSA_L["help"]="幫助"
    MSA_L["craft"]="製作"
    MSA_L["enable"]="啟用"
    MSA_L["disable"]="停用"
    MSA_L["Timer"]="計時器"
    MSA_L["reset"]="重置"
    MSA_L["resume"]="恢復"
    MSA_L["Invalid Format"]="格式無效"
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]="請輸入 \'/msa 製作 配方ID 物品ID\'"
    MSA_L["Example: /msa craft 382981 191461"]="範例：/msa 製作 382981 191461"
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]="無效指令：請輸入 '/msa 幫助' 以取得更多資訊！"
    MSA_L["The recipe ID \'{num1}\' is not valid."]="配方 ID \'{num1}\' 無效。"
    MSA_L["The item ID \'{num1}\' is not valid."]="物品 ID \'{num1}\' 無效。"
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]="物品 ID \'{num1}\' 無效。而且太長了！"
    MSA_L["\'{name1}\' is not a salvage recipe."]="\'{name1}\' 不是拆解配方。"
    MSA_L["\'{num1}\' is not a valid crafting reagent."]="\'{num1}\' 不是有效的製作材料。"
    MSA_L["Initial stack is too small. Stacks are being combined. One moment..."]="初始堆疊太小。正在合併堆疊。請稍候..."
    MSA_L["No items in bags to craft."]="背包中沒有可製作的物品。"
    MSA_L["Not enough to craft - {num1} {misc1} remaining in bags."]="製作材料不足 - 背包中剩餘 {num1} 個 {misc1}。"
    MSA_L["Nonstop crafting is currently disabled. Please type \'/msa enable\' to continue nonstop."]="不間斷製作目前已停用。請輸入 \'/msa 啟用\' 以繼續不間斷製作。"
    MSA_L["Nonstop crafting has been enabled"]="不間斷製作已啟用"
    MSA_L["Nonstop crafting is already enabled"]="不間斷製作已處於啟用狀態"
    MSA_L["Nonstop crafting has been disabled"]="不間斷製作已停用"
    MSA_L["Nonstop crafting is already disabled"]="不間斷製作已處於停用狀態"
    MSA_L["No crafting spell is ready to resume."]="沒有準備好恢復的製作法術。"
    MSA_L["Resuming..."]="正在恢復..."
    MSA_L['Example - Mass Mill Hochenblume:']="範例 - 大量研磨霍亨花："
    MSA_L['/msa craft recipe_id item_id']="/msa 製作 配方ID 物品ID"
    MSA_L['/msa craft 382981 191461']="/msa 製作 382981 191461"
    MSA_L["/msa enable    - Turn on endless salvaging"]="/msa 啟用    - 開啟無盡拆解"
    MSA_L["/msa disable   - Turn off endless salvaging"]="/msa 停用    - 關閉無盡拆解"
    MSA_L["/msa resume   - Continue with most recently used spell"]="/msa 恢復    - 繼續使用最近使用的法術"
    MSA_L["/msa timer      - Show or Hide the Crafting Timer"]="/msa 計時器   - 顯示或隱藏製作計時器"
    MSA_L["/msa reset      - Resets timer position to default"]="/msa 重置     - 將計時器位置重置為預設值"

    -- MSA_UI.lua
    MSA_L["Nonstop Crafting"]="不間斷製作"
    MSA_L["MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs."]="MSA 限制：不間斷模式僅適用於玩家背包內的材料，不支援銀行頁面。"
    MSA_L["MSA AFK ALERT"]="MSA 暫離警報"
    MSA_L["Typing \'/msa timer\' to open/close also works."]="輸入 \'/msa 計時器\' 來開啟/關閉也有效。"
    MSA_L["AFK Alert"]="暫離警報"
    MSA_L["Alert 1: Going AFK while crafting"]="警報 1：製作時進入暫離狀態"
    MSA_L["Alert 2: 20 Second offline countdown"]="警報 2：20 秒離線倒數計時"
    MSA_L["Play Sound When Player Goes AFK"]="當玩家暫離時播放音效"
    MSA_L["Sound will trigger only during nonstop crafting."]="音效僅會在不間斷製作期間觸發。"
    MSA_L["Play Sound When Offline Countdown Timer Begins"]="當離線倒數計時開始時播放音效"
    MSA_L["Sound will trigger only during nonstop crafting."]="音效僅會在不間斷製作期間觸發。"
    MSA_L["Force Audio"]="強制開啟音效"
    MSA_L["Alerts will be heard even if sound is disabled."]="即使停用了遊戲聲音，仍可聽到警報聲。"
    MSA_L["Flash Desktop Icon"]="閃爍桌面圖示"
    MSA_L["The WOW icon will only flash if not focused already."]="WOW 圖示僅在未處於焦點時才會閃爍。"
    MSA_L["Flash When Player Goes AFK"]="當玩家暫離時閃爍"
    MSA_L["Flash When Logoff Timer Begins"]="當登出計時器開始時閃爍"
    MSA_L["Time Remaining"]="剩餘時間"
    MSA_L["Always Show Timer When Crafting"]="製作時始終顯示計時器"
    MSA_L["If you wish to reopen the timer again, type \'/msa timer\'"]="如果希望再次開啟計時器，請輸入 \'/msa 計時器\'"
    MSA_L["Calculate using only reagents in bags."]="僅使用背包中的材料進行計算。"
    MSA_L["Cancel Crafting On Buff Expiration"]="增益效果到期時取消製作"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="啟用以確保增益效果到期時自動停止製作。"
    MSA_L["Ring Bell on Expiration"]="到期時響鈴"
    MSA_L["For now, there is only 1 sound choice. This will change."]="目前只有 1 種音效選擇。這將在未來變更。"
    MSA_L["Cancel Crafting On Buff Expiration"]="增益效果到期時取消製作"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="啟用以確保增益效果到期時自動停止製作。"
    MSA_L["Ring Bell On Expiration"]="到期時響鈴"
    MSA_L["For now, there is only 1 sound choice. This will change."]="目前只有 1 種音效選擇。這將在未來變更。"

end
