_Lvl1QuickSetup = {}
addonName = "_Lvl1QuickSetup"
addon = _Lvl1QuickSetup
local _, class = UnitClass("player");
local _,race = UnitRace("player")
local Frame = CreateFrame("Frame");

Frame:RegisterEvent("CINEMATIC_START")
Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
--Frame:RegisterEvent("CINEMATIC_STOP")
Frame:RegisterEvent("ADDON_LOADED")

local function IsMod()
return (IsShiftKeyDown() or IsAltKeyDown() or IsControlKeyDown())
end

--SkipFrame = CreateFrame("Frame")

LoadAddOn("Blizzard_MacroUI")

local consoleVariables = {};

local autocomplete = CreateFrame("Frame")
autocomplete:RegisterEvent("QUEST_COMPLETE")
autocomplete:RegisterEvent("QUEST_PROGRESS")


autocomplete:RegisterEvent("QUEST_ACCEPT_CONFIRM")
autocomplete:RegisterEvent("QUEST_GREETING")
autocomplete:RegisterEvent("GOSSIP_SHOW")
autocomplete:RegisterEvent("QUEST_DETAIL")


local questTimer = 0


local function IsQuestComplete(quest)
	for i = 1,GetNumQuestLogEntries() do
		local questTitle, level, questTag, suggestedGroup, isHeader, isCollapsed, isComplete, isDaily  = GetQuestLogTitle(i);
		if isComplete and (questID == quest or questTitle == quest) then
			return true
		end
	end
end



autocomplete:SetScript("OnEvent",function()
if IsMod() or UnitName("target") == "Prospector Remtravel" then return end
if event == "QUEST_COMPLETE" then
	if GetNumQuestChoices() <= 1 and GetTime() - questTimer > 0.25 then
		GetQuestReward(GetNumQuestChoices())
		questTimer = GetTime()
	end
end

if event == "QUEST_PROGRESS" and IsQuestCompletable() then
	CompleteQuest()
end

if event == "QUEST_DETAIL" then
	AcceptQuest()
	HideUIPanel(QuestFrame)
end

if event == "QUEST_ACCEPT_CONFIRM" then
	ConfirmAcceptQuest() 
	StaticPopup_Hide("QUEST_ACCEPT")
end

if event == "GOSSIP_SHOW" or event == "QUEST_GREETING" then
	-- Select quests
	--print(event)
	if QuestFrameGreetingPanel:IsShown() or GossipFrameGreetingPanel:IsShown() then

		-- Select quests
		if event == "QUEST_GREETING" then
			-- Select quest greeting completed quests
			for i = 1, GetNumActiveQuests() do
				local title, isComplete = GetActiveTitle(i)
				if title and isComplete then
					return SelectActiveQuest(i)
				end
			end
			-- Select quest greeting available quests
			for i = 1, GetNumAvailableQuests() do
				local title, isComplete = GetAvailableTitle(i)
				if title and not isComplete then
					return SelectAvailableQuest(i)
				end
			end
		else
			-- Select gossip completed quests
			for i = 1, GetNumGossipActiveQuests() do
				local title, level, lowlvl = select(i * 3 - 2, GetGossipActiveQuests())
				if title and IsQuestComplete(title) then
					return SelectGossipActiveQuest(i)
				end
			end
			-- Select gossip available quests
			for i = 1, GetNumGossipAvailableQuests() do
				local title, level = select(i * 3 - 2, GetGossipAvailableQuests())
				if title then
					return SelectGossipAvailableQuest(i)
				end
			end
		end
	end
end

end)

function createMacros(arg)
	local profile = class
	if arg ~= nil then
		profile = arg
	end
	local i,j = GetNumMacros()
	if not(L1QS_characterMacros[profile]) then return end
	for index,macro in pairs(L1QS_characterMacros[profile]) do 
		local characterMacro = 1
		if macro[4] ~= nil then
			characterMacro = nil
		end
		if type(macro[2]) ~= "number" then
			macro[2] = 1
		end
		--print(macro[1],macro[2],macro[3])
		if GetMacroInfo(macro[1]) == nil and (profile ~= class or characterMacro ~= nil or i == 0) then 
			CreateMacro(macro[1], macro[2], macro[3],1, characterMacro)
		end
	end
end

local start = false
function L1Setup()
	
	--if UnitLevel('player') == 1 then
			--print('start')
		local a=true SetActionBarToggles(a,a,a,a,0) SHOW_MULTI_ACTIONBAR_1=a SHOW_MULTI_ACTIONBAR_2=a SHOW_MULTI_ACTIONBAR_3=a SHOW_MULTI_ACTIONBAR_4 = a MultiActionBar_Update()
		createMacros()
		loadActionButtons()
		for var,value in pairs(consoleVariables) do 
			SetCVar(var,value)
		end
		
		CameraZoomOut(50)
		
		loadKeyBinds()
	--end
end

local starttime = nil
local function Delay()
	if not starttime then starttime = GetTime() end
	if GetTime() - starttime > 1.5 then
		starttime = nil
		L1Setup()
		Frame:SetScript("OnUpdate",nil)
	end

end

Frame:SetScript("OnEvent",function(self,event,arg1,arg2,arg3,arg4)
	
	--if event == "PLAYER_REGEN_ENABLED" or event == "CHAT_MSG_SYSTEM" then
		--L1QS_UpdateMacros(event,arg1)
	--if event == "CINEMATIC_STOP" then
		--SkipFrame:SetScript("OnUpdate",nil)
	if event == "CINEMATIC_START" then
		StopCinematic()
		--if UnitLevel('player') == 1 then
			--L1Setup()
		--end
	elseif event == "ADDON_LOADED" and arg1 == addonName then
		--print('ok')
		if L1QS_macroPlacement == nil then 
			L1QS_macroPlacement = {}
		end
		if L1QS_Bindings == nil then 
			L1QS_Bindings = {}
		end
		if L1QS_characterMacros == nil then 
			L1QS_characterMacros = {}
		end
		if L1QS_Settings == nil then 
			L1QS_Settings = {}
		end
		if L1QS_Settings[class] == nil then
			L1QS_Settings[class] = {}
		end
		if L1QS_Settings[race] == nil then
			L1QS_Settings[race] = {}
		end
		if not L1QS_Settings["Guidelime"] then
			L1QS_Settings["Guidelime"] = {}
		end
		if UnitLevel('player') == 1 and UnitXP("player") == 0 then
			Frame:SetScript("OnUpdate",Delay)
			local _ = L1QS.config_cache:gsub("([^\n\r]*)[\n\r]",function(c)
				var,value = string.match(c,"%s*SET%s+(%a+)%s+\"(.*)\"")
				if var and var ~= "" then
					consoleVariables[var] = value
				end
				return ""
			end)
			
			for i,v in pairs(L1QS_Settings["Guidelime"]) do
				if type(v) == "table" then
					GuidelimeDataChar[i] = {}
				else
					GuidelimeDataChar[i] = v
				end
			end
			
			--GuidelimeDataChar = L1QS_Settings["Guidelime"]
			if GuidelimeDataChar and GuidelimeDataChar["guideSkip"] then
				for i,v in pairs(GuidelimeDataChar["guideSkip"]) do
					GuidelimeDataChar["guideSkip"][i] = {}
				end
			end
			if L1QS_Settings[race]["currentGuide"] then
				GuidelimeDataChar["currentGuide"] = L1QS_Settings[race]["currentGuide"]
			end
		end
	elseif event == "ADDON_LOADED" then
		--print('aab')
		if Abar_Frame then
			Abar_Frame:SetPoint("CENTER", "UIParent", "CENTER", 0,-210)
		end
	end
end)


-- Fast loot function
--
local tDelay = 0
local function FastLoot()
	--print('a')
    if GetTime() - tDelay >= 0.3 then
        tDelay = GetTime()
        if not IsModifiedClick("AUTOLOOTTOGGLE") then
            for i = GetNumLootItems(), 1, -1 do
                LootSlot(i)
            end
            tDelay = GetTime()
        end
    end
end

-- event frame
local faster = CreateFrame("Frame")
faster:RegisterEvent("LOOT_READY")
faster:RegisterEvent("LOOT_OPENED")
faster:SetScript("OnEvent", FastLoot)

function reportActionButtons()
	local lActionSlot = 0;
	for lActionSlot = 1, 120 do
		local lActionText = GetActionText(lActionSlot);
		local lActionTexture = GetActionTexture(lActionSlot);
		if lActionTexture then
			local lMessage = "Slot " .. lActionSlot .. ": [" .. lActionTexture .. "]";
			if lActionText then
				lMessage = lMessage .. " \"" .. lActionText .. "\"";
			end
			DEFAULT_CHAT_FRAME:AddMessage(lMessage);
		end
	end
end

function FindSpell(spellName,spellRank)
   local i, s;
   local found = false;
   if spellRank == "" then spellRank = nil end

	for i = 1, MAX_SKILLLINE_TABS do
		local name, texture, offset, numSpells = GetSpellTabInfo(i);
		if (not name) then
			break
		end
		for s = offset + 1, offset + numSpells do
			local spell, rank = GetSpellName(s, BOOKTYPE_SPELL);
			
			if spellRank then
				if spellName == spell and spellRank == rank then
					return s
				end
			else
				if (spell == spellName) then 
					found = true;
				end
			end
			if (found and spell ~=spellName) then
				return s-1
			end
		end
	end

   if (found) then return s-1; end
   return nil;
 end


function loadActionButtons(arg)
	local profile = class
	if arg ~= nil then
		profile = arg
	end
	if L1QS_macroPlacement[profile] then
		for slot,macro in pairs(L1QS_macroPlacement[profile]) do 
			local spell, rank = string.find(macro,"(.+)::(.*)")
			spellId = spell and FindSpell(spell,rank)
			if GetMacroIndexByName(macro) > 0 then
				PickupMacro(macro) 
				if GetCursorInfo() == "macro" then PlaceAction(slot) end
				ClearCursor()
			elseif spellId then 
				PickupSpell(spellId,BOOKTYPE_SPELL)
				if GetCursorInfo() == "spell" then PlaceAction(slot) end
				ClearCursor()
			end
		end
	end
end

-- /run saveActionButtons() print(L1QS_macroPlacement["HUNTER"][1])
-- /run print(L1QS_macroPlacement["HUNTER"][1])

function saveActionButtons(arg)
	local profile = class
	if arg ~= nil then
		profile = arg
	end
	L1QS_macroPlacement[profile] = {}
	local lActionSlot = 0;
	for lActionSlot = 1, 120 do
		local actionType,Id = GetActionInfo(lActionSlot)
		local lActionText = GetActionText(lActionSlot);
		local lActionTexture = GetActionTexture(lActionSlot);
		if lActionText ~= nil and actionType == "macro" then
			L1QS_macroPlacement[profile][lActionSlot] = lActionText
		elseif actionType == BOOKTYPE_SPELL then
			local text,subtext = GetSpellName(Id, BOOKTYPE_SPELL)
			L1QS_macroPlacement[profile][lActionSlot] = text..'::'..tostring(subtext)
		end
	end
end


function saveKeyBinds(arg)
	local profile = class
	if arg ~= nil then
		profile = arg
	end
	L1QS_Bindings[profile] = {}
	for index = 1, GetNumBindings() do
	  local command,key1,key2 = GetBinding(index)
	  if key1 then
		L1QS_Bindings[profile][key1] = command;
	  end
	  if key2 then
		L1QS_Bindings[profile][key2] = command;
	  end
	end
end

function loadKeyBinds(arg)
	local profile = class
	if arg ~= nil then
		profile = arg
	end
	if L1QS_Bindings[profile] then
		SaveBindings(2) --characer specific keybinds
		LoadBindings(2)
		for index = 1, GetNumBindings() do
			local command,key1,key2 = GetBinding(index)
			if key1 then
				SetBinding(key1);
			end
			if key2 then
				SetBinding(key2);
			end
		end
		for key,command in pairs(L1QS_Bindings[profile]) do 
			SetBinding(key,command)
		end
		SaveBindings(2)
	end
end

function saveMacros(arg)
    local profile = class
    if arg ~= nil then
        profile = arg
    end
    
    local iconId = {}
    local numIcons = GetNumMacroIcons()
    for id = 1, numIcons do
        local name = GetMacroIconInfo(id)
        iconId[name] = id
    end
    
    local i, j = GetNumMacros()
    if i == 0 and j == 0 then return end
    L1QS_characterMacros[profile] = {}
    local globalMacro = true
    for index = 1, i do
        local name, icon, body = GetMacroInfo(index)
        L1QS_characterMacros[profile][index] = {name, iconId[icon], body, globalMacro}
    end
    globalMacro = nil
    for index = MAX_ACCOUNT_MACROS + 1, MAX_ACCOUNT_MACROS + j do
        local name, icon, body = GetMacroInfo(index)
        L1QS_characterMacros[profile][index] = {name, iconId[icon], body, globalMacro}
    end
end


function saveAll(arg)
	saveMacros(arg)
	saveKeyBinds(arg)
	saveActionButtons(arg)
	if GuidelimeDataChar then
		L1QS_Settings["Guidelime"] = GuidelimeDataChar
		L1QS_Settings[race]["currentGuide"] = GuidelimeDataChar["currentGuide"]
	else
		L1QS_Settings["Guidelime"] = {}
	end
	
end

function loadAll(arg)
--createMacros(arg)
loadKeyBinds(arg)
loadActionButtons(arg)
end


