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

MSA.LOC.Korean = function()

    -- Custom Slash Command
    MSA_L["/XXXX"]=true     -- Create your own. Be sure to include the '/' -- /MSA will ALWAYS work regardless of region.

    -- General
    MSA_L["MSA"]=true
    MSA_L["Mass Salvage Assist"]=true

    -- MSA_afk.lua
    MSA_L["Warning! AFK while crafting."]="경고! 제작 중 자리 비움 감지."
    MSA_L["WARNING - COUNTDOWN TO LOGOFF TRIGGERED!!!"]="경고 - 접속 종료 카운트다운이 시작되었습니다!!!"

    -- MSA_Craft_Timer.lua
    MSA_L["{num1} seconds"]="{num1}초"
    MSA_L["{num1} hrs, {num2} minutes, {misc1} seconds"]="{num1}시간 {num2}분 {misc1}초"
    MSA_L["{num1} minutes, {num2} seconds"]="{num1}분 {num2}초"
    MSA_L["Calculating..."]="계산 중..."

    -- MSA_Crafting.lua
    MSA_L["Stacking has finished. Please restart"]="묶음 정리가 완료되었습니다. 다시 시작해주세요."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="제작이 조기에 종료되었습니다. 다시 시작하면 연속 제작이 계속됩니다."
    MSA_L["This addon will only work with items selected within your bags. Please move items to your bags and re-select."]="이 애드온은 가방 안에 있는 아이템으로만 작동합니다. 아이템을 가방으로 옮긴 후 다시 선택해주세요."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted lower quality crafting. Please reselect {misc1} and restart if you wish to continue."]="MSA가 필수 재료의 품질이 {num1}에서 {num2}(으)로 변경된 것을 감지했습니다. 원치 않는 저품질 제작을 방지하기 위해 작업이 중단되었습니다. 계속하려면 {misc1}을(를) 다시 선택하고 재시작하세요."
    MSA_L["MSA has detected that the quality of the required reagent has changed from {num1} to {num2}. Crafting has been stopped to prevent unwanted use of {misc1}. Please reselect and restart if you wish to continue."]="MSA가 필수 재료의 품질이 {num1}에서 {num2}(으)로 변경된 것을 감지했습니다. {misc1}의 원치 않는 사용을 방지하기 위해 작업이 중단되었습니다. 계속하려면 다시 선택하고 재시작하세요."
    MSA_L["Crating has ended prematurely on a complex salvage recipe with multiple reagents. Checking stacks of secondary {name1} reagent. One moment..."]="복합 재료가 필요한 제작이 조기에 중단되었습니다. 보조 재료인 {name1}의 묶음을 확인 중입니다. 잠시만 기다려주세요..."
    MSA_L["No secondary reagent stacks to combine. Please check your available reagents and start again."]="합칠 보조 재료 묶음이 없습니다. 사용 가능한 재료를 확인하고 다시 시작해주세요."
    MSA_L["No secondary reagent stacks to combine. Please check your available {name1} and start again."]="합칠 보조 재료 묶음이 없습니다. 사용 가능한 {name1}을(를) 확인하고 다시 시작해주세요."
    MSA_L["Crafting has ended prematurely. Please restart and crafting will continue nonstop"]="제작이 조기에 종료되었습니다. 다시 시작하면 연속 제작이 계속됩니다."
    MSA_L["Stacking is finished. Please manually choose the 2nd reagent and restart crafting."]="묶음 정리가 끝났습니다. 두 번째 재료를 수동으로 선택하고 제작을 다시 시작해주세요."
    MSA_L["Combining {num1} stacks..."]="{num1}개의 묶음을 합치는 중..."
    MSA_L["Crafting has ended prematurely because Shattered Essence buff is not present"]="'부서진 정수' 버프가 없어서 제작이 조기에 종료되었습니다."

    -- MSA_Localization.ua
    MSA_L["Missing Localization Error - Please report to addon dev."]="번역 오류 - 애드온 개발자에게 제보해주세요."
    MSA_L["Language Selected: {name1}"]="선택된 언어: {name1}"
    MSA_L["Localization text missing"]="번역 텍스트 누락"

    -- MSA_Slash.lua
    MSA_L["help"]="도움말"
    MSA_L["craft"]="제작"
    MSA_L["enable"]="활성화"
    MSA_L["disable"]="비활성화"
    MSA_L["Timer"]="타이머"
    MSA_L["reset"]="초기화"
    MSA_L["resume"]="재개"
    MSA_L["Invalid Format"]="잘못된 형식"
    MSA_L["Please type \'/msa craft recipe_id item_id\'"]="\'/msa 제작 조리법ID 아이템ID\'를 입력해주세요."
    MSA_L["Example: /msa craft 382981 191461"]="예시: /msa 제작 382981 191461"
    MSA_L["Invalid Command: Please type '/msa help' for More Info!"]="잘못된 명령어: 더 많은 정보를 보려면 '/msa 도움말'을 입력하세요!"
    MSA_L["The recipe ID \'{num1}\' is not valid."]="조리법 ID \'{num1}\'은(는) 유효하지 않습니다."
    MSA_L["The item ID \'{num1}\' is not valid."]="아이템 ID \'{num1}\'은(는) 유효하지 않습니다."
    MSA_L["The item ID \'{num1}\' is not valid. And, it\'s too long!"]="아이템 ID \'{num1}\'은(는) 유효하지 않으며, 너무 깁니다!"
    MSA_L["\'{name1}\' is not a salvage recipe."]="\'{name1}\'은(는) 추출 조리법이 아닙니다."
    MSA_L["\'{num1}\' is not a valid crafting reagent."]="\'{num1}\'은(는) 유효한 제작 재료가 아닙니다."
    MSA_L["Initial stack is too small. Stacks are being combined. One moment..."]="초기 묶음이 너무 적습니다. 묶음을 합치는 중입니다. 잠시만요..."
    MSA_L["No items in bags to craft."]="가방에 제작할 아이템이 없습니다."
    MSA_L["Not enough to craft - {num1} {misc1} remaining in bags."]="제작 재료 부족 - 가방에 {num1}개의 {misc1} 남음."
    MSA_L["Nonstop crafting is currently disabled. Please type \'/msa enable\' to continue nonstop."]="현재 연속 제작이 비활성화되어 있습니다. 계속하려면 \'/msa 활성화\'를 입력하세요."
    MSA_L["Nonstop crafting has been enabled"]="연속 제작이 활성화되었습니다."
    MSA_L["Nonstop crafting is already enabled"]="연속 제작이 이미 활성화되어 있습니다."
    MSA_L["Nonstop crafting has been disabled"]="연속 제작이 비활성화되었습니다."
    MSA_L["Nonstop crafting is already disabled"]="연속 제작이 이미 비활성화되어 있습니다."
    MSA_L["No crafting spell is ready to resume."]="재개할 제작 주문이 준비되지 않았습니다."
    MSA_L["Resuming..."]="작업 재개 중..."
    MSA_L['Example - Mass Mill Hochenblume:']="예시 - 호헨블루메 대량 제분:"
    MSA_L['/msa craft recipe_id item_id']="/msa 제작 조리법ID 아이템ID"
    MSA_L['/msa craft 382981 191461']="/msa 제작 382981 191461"
    MSA_L["/msa enable    - Turn on endless salvaging"]="/msa 활성화    - 연속 추출 켜기"
    MSA_L["/msa disable   - Turn off endless salvaging"]="/msa 비활성화   - 연속 추출 끄기"
    MSA_L["/msa resume   - Continue with most recently used spell"]="/msa 재개   - 최근 사용한 주문으로 계속하기"
    MSA_L["/msa timer      - Show or Hide the Crafting Timer"]="/msa 타이머      - 제작 타이머 표시 또는 숨기기"
    MSA_L["/msa reset      - Resets timer position to default"]="/msa 초기화      - 타이머 위치를 기본값으로 재설정"

    -- MSA_UI.lua
    MSA_L["Nonstop Crafting"]="연속 제작"
    MSA_L["MSA Limitation: Nonstop will only work for reagents within player bags, not bank tabs."]="MSA 제한사항: 연속 작업은 가방에 있는 재료로만 작동하며, 은행 보관함은 지원하지 않습니다."
    MSA_L["MSA AFK ALERT"]="MSA 자리 비움 경고"
    MSA_L["Typing \'/msa timer\' to open/close also works."]="\'/msa 타이머\'를 입력하여 열고 닫을 수도 있습니다."
    MSA_L["AFK Alert"]="자리 비움 경고"
    MSA_L["Alert 1: Going AFK while crafting"]="경고 1: 제작 중 자리 비움 상태 전환"
    MSA_L["Alert 2: 20 Second offline countdown"]="경고 2: 20초 접속 종료 카운트다운"
    MSA_L["Play Sound When Player Goes AFK"]="플레이어가 자리 비움 상태일 때 소리 재생"
    MSA_L["Sound will trigger only during nonstop crafting."]="소리는 연속 제작 중에만 재생됩니다."
    MSA_L["Play Sound When Offline Countdown Timer Begins"]="접속 종료 카운트다운 시작 시 소리 재생"
    MSA_L["Sound will trigger only during nonstop crafting."]="소리는 연속 제작 중에만 재생됩니다."
    MSA_L["Force Audio"]="오디오 강제 출력"
    MSA_L["Alerts will be heard even if sound is disabled."]="소리가 꺼져 있어도 경고음이 들리게 합니다."
    MSA_L["Flash Desktop Icon"]="바탕화면 아이콘 깜박임"
    MSA_L["The WOW icon will only flash if not focused already."]="WOW 아이콘은 게임 화면을 보고 있지 않을 때만 깜박입니다."
    MSA_L["Flash When Player Goes AFK"]="플레이어가 자리 비움 상태일 때 깜박임"
    MSA_L["Flash When Logoff Timer Begins"]="접속 종료 타이머 시작 시 깜박임"
    MSA_L["Time Remaining"]="남은 시간"
    MSA_L["Always Show Timer When Crafting"]="제작 시 항상 타이머 표시"
    MSA_L["If you wish to reopen the timer again, type \'/msa timer\'"]="타이머를 다시 열려면 \'/msa 타이머\'를 입력하세요."
    MSA_L["Calculate using only reagents in bags."]="가방에 있는 재료로만 계산합니다."
    MSA_L["Cancel Crafting On Buff Expiration"]="버프 만료 시 제작 취소"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="버프가 만료되면 제작을 자동으로 중단하도록 설정합니다."
    MSA_L["Ring Bell on Expiration"]="만료 시 벨 소리 재생"
    MSA_L["For now, there is only 1 sound choice. This will change."]="현재 선택할 수 있는 소리는 1개뿐입니다. 추후 변경될 예정입니다."
    MSA_L["Cancel Crafting On Buff Expiration"]="버프 만료 시 제작 취소"
    MSA_L["Enable to ensure crafting automatically stops when buff expires."]="버프가 만료되면 제작을 자동으로 중단하도록 설정합니다."
    MSA_L["Ring Bell On Expiration"]="만료 시 벨 소리 재생"
    MSA_L["For now, there is only 1 sound choice. This will change."]="현재 선택할 수 있는 소리는 1개뿐입니다. 추후 변경될 예정입니다."

end
