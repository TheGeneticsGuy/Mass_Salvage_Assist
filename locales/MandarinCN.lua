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

MSA.LOC.MandarinCN = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true
    MSA_L["Mass Salvage Assist"]=true

    -- MSA_afk.lua
    MSA_L["Warning! AFK while crafting."]="警告！制作期间暂离。"
    MSA_L["WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"]="警告 - 掉线倒计时已触发！！！"

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]="{num1} 秒"
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]="{num1} 小时, {num2} 分钟, {misc1} 秒"
    MSA_L["{num1} minutes, {num2} seconds"]="{num1} 分钟, {num2} 秒"
    MSA_L["Calculating..."]="计算中..."

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]="堆叠已完成。请重新开始。"
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="制作过早结束。请重新开始，制作将不间断继续。"
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]="此插件仅适用于你背包中选定的物品。请将物品移至背包并重新选择。"
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]="MSA 检测到所需材料的品质已从 {num1} 变为 {num2}。制作已停止，以防止意外使用低品质材料制作。如果希望继续，请重新选择 {misc1} 并重新开始。"
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]="MSA 检测到所需材料的品质已从 {num1} 变为 {num2}。制作已停止，以防止意外使用 {misc1}。如果希望继续，请重新选择并重新开始。"
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]="复杂拆解配方的制作过早结束，正在检查次级材料 {name1} 的堆叠。请稍候..."
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]="没有次级材料堆叠可合并。请检查可用材料并重试。"
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]="没有次级材料堆叠可合并。请检查可用的 {name1} 并重试。"
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="制作过早结束。请重新开始，制作将不间断继续。"
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]="堆叠已完成。请手动选择第二个材料并重启制作。"
    MSA_L["Combining {num1} stacks..."]="正在合并 {num1} 个堆叠..."
    MSA_L["Crafting has ended prematurely because Shattered Essence buff is not present"]="制作过早结束，因为“破碎精华”增益不存在。"

    -- MSA_Localization.ua
    MSA_L["Missing Localization Error - Please report to addon dev."]="缺少本地化错误 - 请向插件开发者报告。"
    MSA_L["Language Selected: {name1}"]="已选语言：{name1}"
    MSA_L["Localization text missing"]="本地化文本缺失"

    -- MSA_Slash.lua
    MSA_L["help"]="帮助"
    MSA_L["craft"]="制作"
    MSA_L["enable"]="启用"
    MSA_L["disable"]="禁用"
    MSA_L["Timer"]="计时器"
    MSA_L["reset"]="重置"
    MSA_L["resume"]="恢复"
    MSA_L["Invalid Format"]="格式无效"
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]="请输入 \'/msa 制作 配方ID 物品ID\'"
    MSA_L["Example: /msa craft 382981 191461"]="示例：/msa 制作 382981 191461"
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]="无效命令：请输入 '/msa 帮助' 获取更多信息！"
    MSA_L["The recipe ID \'{num1}\' is not valid."]="配方 ID \'{num1}\' 无效。"
    MSA_L["The item ID \'{num1}\' is not valid."]="物品 ID \'{num1}\' 无效。"
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]="物品 ID \'{num1}\' 无效。而且它太长了！"
    MSA_L["\'{name1}\' is not a salvage recipe."]="\'{name1}\' 不是拆解配方。"
    MSA_L["\'{num1}\' is not a valid crafting reagent."]="\'{num1}\' 不是有效的制作材料。"
    MSA_L["Initial stack is too small. Stacks are being combined. One moment..."]="初始堆叠太小。正在合并堆叠。请稍候..."
    MSA_L["No items in bags to craft."]="背包中没有可制作的物品。"
    MSA_L["Not enough to craft - {num1} {misc1} remaining in bags."]="材料不足以制作 - 背包中剩余 {num1} 个 {misc1}。"
    MSA_L["Nonstop crafting is currently disabled. Please type \'/msa enable\' to continue nonstop."]="不间断制作当前已禁用。请输入 \'/msa 启用\' 以继续不间断制作。"
    MSA_L["Nonstop crafting has been enabled"]="不间断制作已启用"
    MSA_L["Nonstop crafting is already enabled"]="不间断制作已处于启用状态"
    MSA_L["Nonstop crafting has been disabled"]="不间断制作已禁用"
    MSA_L["Nonstop crafting is already disabled"]="不间断制作已处于禁用状态"
    MSA_L["No crafting spell is ready to resume."]="没有准备好恢复的制作法术。"
    MSA_L["Resuming..."]="正在恢复..."
    MSA_L['Example - Mass Mill Hochenblume:']="示例 - 批量研磨霍亨花："
    MSA_L['/msa craft recipe_id item_id']="/msa 制作 配方ID 物品ID"
    MSA_L['/msa craft 382981 191461']="/msa 制作 382981 191461"
    MSA_L["/msa enable    - Turn on endless salvaging"]="/msa 启用    - 开启无尽拆解"
    MSA_L["/msa disable   - Turn off endless salvaging"]="/msa 禁用    - 关闭无尽拆解"
    MSA_L["/msa resume   - Continue with most recently used spell"]="/msa 恢复    - 继续使用最近使用的法术"
    MSA_L["/msa timer      - Show or Hide the Crafting Timer"]="/msa 计时器   - 显示或隐藏制作计时器"
    MSA_L["/msa reset      - Resets timer position to default"]="/msa 重置     - 将计时器位置重置为默认值"

    -- MSA_UI.lua
    MSA_L["Nonstop Crafting"]="不间断制作"
    MSA_L["MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs."]="MSA 限制：不间断模式仅适用于玩家背包内的材料，不支持银行页。"
    MSA_L["MSA AFK ALERT"]="MSA 暂离警报"
    MSA_L["Typing \'/msa timer\' to open/close also works."]="输入 \'/msa 计时器\' 打开/关闭也有效。"
    MSA_L["AFK Alert"]="暂离警报"
    MSA_L["Alert 1: Going AFK while crafting"]="警报 1：制作时进入暂离状态"
    MSA_L["Alert 2: 20 Second offline countdown"]="警报 2：20 秒掉线倒计时"
    MSA_L["Play Sound When Player Goes AFK"]="玩家暂离时播放音效"
    MSA_L["Sound will trigger only during nonstop crafting."]="音效仅在不间断制作期间触发。"
    MSA_L["Play Sound When Offline Countdown Timer Begins"]="掉线倒计时开始时播放音效"
    MSA_L["Sound will trigger only during nonstop crafting."]="音效仅在不间断制作期间触发。"
    MSA_L["Force Audio"]="强制音频"
    MSA_L["Alerts will be heard even if sound is disabled."]="即使禁用了声音也能听到警报。"
    MSA_L["Flash Desktop Icon"]="闪烁桌面图标"
    MSA_L["The WOW icon will only flash if not focused already."]="WOW 图标仅在未聚焦时闪烁。"
    MSA_L["Flash When Player Goes AFK"]="玩家暂离时闪烁"
    MSA_L["Flash When Logoff Timer Begins"]="掉线计时器开始时闪烁"
    MSA_L["Time Remaining"]="剩余时间"
    MSA_L["Always Show Timer When Crafting"]="制作时始终显示计时器"
    MSA_L["If you wish to reopen the timer again, type \'/msa timer\'"]="如果希望再次打开计时器，请输入 \'/msa 计时器\'"
    MSA_L["Calculate using only reagents in bags."]="仅使用背包中的材料进行计算。"
    MSA_L["Cancel Crafting On Buff Expiration"]="增益过期时取消制作"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="启用以确保增益过期时自动停止制作。"
    MSA_L["Ring Bell on Expiration"]="过期时响铃"
    MSA_L["For now, there is only 1 sound choice. This will change."]="目前只有 1 种声音选择。以后会更改。"
    MSA_L["Cancel Crafting On Buff Expiration"]="增益过期时取消制作"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="启用以确保增益过期时自动停止制作。"
    MSA_L["Ring Bell On Expiration"]="过期时响铃"
    MSA_L["For now, there is only 1 sound choice. This will change."]="目前只有 1 种声音选择。以后会更改。"

end