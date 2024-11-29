if L1QS_macroPlacement or L1QS_Bindings or L1QS_characterMacros or L1QS_Settings then
return
end
if not print then
	function print(...)
		local args = {...}
		local str = ""
		for i,v in ipairs(args) do
			if v == nil then v = "nil"
			elseif v == false then v = "false"
			elseif v == true then v = "true"
			end
			if i > 1 then str = str.."  " end
			str = str..tostring(v)
		end
		return DEFAULT_CHAT_FRAME:AddMessage(str)
	end
end
-- You only need to edit this file if you plan on playing on a fresh account
-- Copy paste the contents of the file _Lvl1QuickSetup.lua inside your WTF folder below:


L1QS_macroPlacement = {
	["HUNTER"] = {
		"as", -- [1]
		"kc", -- [2]
		"cc", -- [3]
		"Multi-Shot::Rank 6", -- [4]
		"clip", -- [5]
		"Auto Shot::", -- [6]
		"Freezing Trap::Rank 3", -- [7]
		"frost", -- [8]
		"Volley::Rank 2", -- [9]
		"f", -- [10]
		"sb", -- [11]
		nil, -- [12]
		nil, -- [13]
		nil, -- [14]
		nil, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		nil, -- [19]
		nil, -- [20]
		nil, -- [21]
		nil, -- [22]
		nil, -- [23]
		nil, -- [24]
		"eagleye", -- [25]
		nil, -- [26]
		nil, -- [27]
		nil, -- [28]
		nil, -- [29]
		"call", -- [30]
		nil, -- [31]
		"as1", -- [32]
		"as2", -- [33]
		"Explosive Trap::Rank 4", -- [34]
		"md", -- [35]
		nil, -- [36]
		nil, -- [37]
		nil, -- [38]
		"0tlt", -- [39]
		"Aspect of the Pack::", -- [40]
		"mend", -- [41]
		"Revive Pet::", -- [42]
		nil, -- [43]
		"Aspect of the Beast::", -- [44]
		"PA", -- [45]
		"PF", -- [46]
		"Tranquilizing Shot::", -- [47]
		nil, -- [48]
		"stuck", -- [49]
		nil, -- [50]
		"Raptor Strike::Rank 9", -- [51]
		"Aimed Shot::Rank 7", -- [52]
		nil, -- [53]
		nil, -- [54]
		"Dismiss Pet::", -- [55]
		nil, -- [56]
		"HM", -- [57]
		"dt", -- [58]
		"Stoneform::Racial", -- [59]
		"Focus", -- [60]
		"Intimidation::", -- [61]
		"fd", -- [62]
		"rd", -- [63]
		"Rapid Fire::", -- [64]
		"Multi-Shot::Rank 6", -- [65]
		"cheetah", -- [66]
		"kcs", -- [67]
		"Scorpid Sting::", -- [68]
		"serp", -- [69]
		nil, -- [70]
		"viper", -- [71]
		"ssf", -- [72]
	},
}
L1QS_Bindings = {
	["HUNTER"] = {
		["NUMPAD7"] = "RAIDTARGET4",
		["NUMPAD3"] = "RAIDTARGET6",
		["CTRL--"] = "MASTERVOLUMEDOWN",
		["SHIFT-Z"] = "ACTIONBUTTON11",
		["SHIFT-I"] = "TOGGLEPETBOOK",
		["SHIFT-X"] = "ACTIONBUTTON8",
		["SHIFT-TAB"] = "MULTIACTIONBAR2BUTTON8",
		["NUMPAD5"] = "RAIDTARGET2",
		["BUTTON4"] = "MULTIACTIONBAR3BUTTON9",
		["LEFT"] = "BONUSACTIONBUTTON3",
		["CTRL-MOUSEWHEELUP"] = "MULTIACTIONBAR3BUTTON11",
		["SHIFT-S"] = "MULTIACTIONBAR1BUTTON6",
		["NUMPAD4"] = "RAIDTARGET5",
		["CTRL-PAGEDOWN"] = "COMBATLOGPAGEDOWN",
		["CAPSLOCK"] = "MULTIACTIONBAR3BUTTON10",
		["CTRL-Q"] = "MULTIACTIONBAR4BUTTON7",
		["CTRL-F"] = "MULTIACTIONBAR2BUTTON5",
		["SHIFT-3"] = "MULTIACTIONBAR1BUTTON3",
		["ALT-SHIFT-S"] = "TOGGLESOUND",
		["NUMPADPLUS"] = "MINIMAPZOOMIN",
		["ALT-SHIFT-MOUSEWHEELUP"] = "CAMERAZOOMIN",
		["MOUSEWHEELDOWN"] = "MULTIACTIONBAR4BUTTON10",
		["NUMPADMULTIPLY"] = "TOGGLEAUTORUN",
		["CTRL-F10"] = "SHAPESHIFTBUTTON10",
		["SHIFT-4"] = "MULTIACTIONBAR1BUTTON4",
		["-"] = "SITORSTAND",
		[","] = "OPENALLBAGS",
		["/"] = "OPENCHATSLASH",
		["NUMPADDIVIDE"] = "TOGGLERUN",
		["1"] = "ACTIONBUTTON1",
		["0"] = "TOGGLESHEATH",
		["3"] = "ACTIONBUTTON3",
		["2"] = "ACTIONBUTTON2",
		["5"] = "MULTIACTIONBAR1BUTTON9",
		["4"] = "ACTIONBUTTON4",
		["7"] = "MOVEANDSTEER",
		["6"] = "ACTIONBUTTON7",
		["CTRL-F5"] = "SHAPESHIFTBUTTON5",
		["ALT-SHIFT-MOUSEWHEELDOWN"] = "CAMERAZOOMOUT",
		["="] = "TOGGLE_BINDPAD",
		["A"] = "STRAFELEFT",
		["SHIFT-PAGEDOWN"] = "CHATBOTTOM",
		["C"] = "ACTIONBUTTON10",
		["B"] = "MULTIACTIONBAR2BUTTON9",
		["E"] = "MULTIACTIONBAR1BUTTON1",
		["D"] = "STRAFERIGHT",
		["G"] = "MULTIACTIONBAR1BUTTON11",
		["F"] = "MULTIACTIONBAR1BUTTON12",
		["CTRL-F6"] = "SHAPESHIFTBUTTON6",
		["K"] = "TOGGLECHARACTER1",
		["M"] = "TOGGLEWORLDMAP",
		["SHIFT-BUTTON3"] = "MULTIACTIONBAR2BUTTON11",
		["O"] = "TOGGLESOCIAL",
		["N"] = "ACTIONBUTTON9",
		["Q"] = "MULTIACTIONBAR1BUTTON7",
		["P"] = "TOGGLESPELLBOOK",
		["S"] = "MULTIACTIONBAR1BUTTON5",
		["R"] = "ACTIONBUTTON5",
		["U"] = "TOGGLECHARACTER2",
		["T"] = "MULTIACTIONBAR1BUTTON10",
		["F7"] = "TURNLEFT",
		["V"] = "ACTIONBUTTON6",
		["ESCAPE"] = "TOGGLEGAMEMENU",
		["X"] = "MULTIACTIONBAR1BUTTON8",
		["Z"] = "MULTIACTIONBAR1BUTTON2",
		["CTRL-S"] = "MULTIACTIONBAR2BUTTON6",
		["\\"] = "MULTIACTIONBAR1BUTTON2",
		["NUMPAD1"] = "RAIDTARGET8",
		["SHIFT-LEFT"] = "BONUSACTIONBUTTON10",
		["CTRL-4"] = "MULTIACTIONBAR3BUTTON1",
		["CTRL-6"] = "BONUSACTIONBUTTON6",
		["CTRL-PAGEUP"] = "COMBATLOGPAGEUP",
		["F12"] = "MULTIACTIONBAR4BUTTON3",
		["F11"] = "TOGGLEBACKPACK",
		["CTRL-9"] = "BONUSACTIONBUTTON9",
		["F10"] = "TOGGLEBAG3",
		["ENTER"] = "OPENCHAT",
		["ALT-S"] = "MULTIACTIONBAR4BUTTON4",
		["SHIFT-\\"] = "ACTIONBUTTON11",
		["SPACE"] = "JUMP",
		["CTRL-F8"] = "SHAPESHIFTBUTTON8",
		["ALT-E"] = "MULTIACTIONBAR4BUTTON2",
		["HOME"] = "PREVVIEW",
		["ALT-M"] = "CARTOGRAPHER_OPENALTERNATEMAP",
		["CTRL-SPACE"] = "MULTIACTIONBAR2BUTTON7",
		["ALT-Z"] = "MULTIACTIONBAR3BUTTON2",
		["TAB"] = "TARGETNEARESTENEMY",
		["W"] = "MOVEFORWARD",
		["CTRL-F1"] = "SHAPESHIFTBUTTON1",
		["MOUSEWHEELUP"] = "MULTIACTIONBAR4BUTTON9",
		["CTRL-5"] = "BONUSACTIONBUTTON5",
		["I"] = "TOGGLELFGPARENT",
		["SHIFT-M"] = "TOGGLEBATTLEFIELDMINIMAP",
		["SHIFT-O"] = "TOGGLECHANNELPULLOUT",
		["CTRL-F4"] = "SHAPESHIFTBUTTON4",
		["."] = "OPENALLBAGS",
		["F9"] = "MOVEBACKWARD",
		["SHIFT-RIGHT"] = "ALLNAMEPLATES",
		["CTRL-V"] = "MULTIACTIONBAR4BUTTON6",
		["CTRL-7"] = "BONUSACTIONBUTTON7",
		["CTRL-F9"] = "SHAPESHIFTBUTTON9",
		["CTRL-N"] = "TOGGLETALENTS",
		["ALT-Q"] = "MULTIACTIONBAR4BUTTON1",
		["SHIFT-N"] = "MULTIACTIONBAR2BUTTON1",
		["F8"] = "TURNRIGHT",
		["PRINTSCREEN"] = "SCREENSHOT",
		["DOWN"] = "FRIENDNAMEPLATES",
		["SHIFT-UP"] = "PREVIOUSACTIONPAGE",
		["CTRL-F2"] = "SHAPESHIFTBUTTON2",
		["CTRL-8"] = "BONUSACTIONBUTTON8",
		["CTRL-1"] = "MULTIACTIONBAR2BUTTON10",
		["NUMPAD8"] = "RAIDTARGET3",
		["CTRL-SHIFT-PAGEDOWN"] = "COMBATLOGBOTTOM",
		["NUMPADMINUS"] = "MINIMAPZOOMOUT",
		["UP"] = "NAMEPLATES",
		["INSERT"] = "PITCHUP",
		["ALT-X"] = "MULTIACTIONBAR3BUTTON3",
		["SHIFT-F1"] = "MULTIACTIONBAR3BUTTON5",
		["BUTTON5"] = "MULTIACTIONBAR3BUTTON8",
		["CTRL-SHIFT-TAB"] = "TARGETPREVIOUSFRIEND",
		["SHIFT-2"] = "MULTIACTIONBAR2BUTTON4",
		["SHIFT-F2"] = "MULTIACTIONBAR3BUTTON6",
		["BUTTON3"] = "MULTIACTIONBAR2BUTTON12",
		["CTRL-MOUSEWHEELDOWN"] = "MULTIACTIONBAR3BUTTON12",
		["CTRL-="] = "MASTERVOLUMEUP",
		["CTRL-E"] = "MULTIACTIONBAR4BUTTON8",
		["F4"] = "MULTIACTIONBAR3BUTTON7",
		["SHIFT-P"] = "TOGGLECHARACTER3",
		["SHIFT-DOWN"] = "NEXTACTIONPAGE",
		["SHIFT-1"] = "MULTIACTIONBAR2BUTTON3",
		["Y"] = "MULTIACTIONBAR4BUTTON5",
		["L"] = "TOGGLEQUESTLOG",
		["NUMPAD2"] = "RAIDTARGET1",
		["ALT-\\"] = "MULTIACTIONBAR3BUTTON2",
		["'"] = "MULTIACTIONBAR2BUTTON2",
		["PAGEUP"] = "MULTIACTIONBAR4BUTTON11",
		["PAGEDOWN"] = "MULTIACTIONBAR4BUTTON12",
		["NUMPAD6"] = "RAIDTARGET7",
	},
}
L1QS_characterMacros = {
	["HUNTER"] = {
		{
			"0tlt", -- [1]
			602, -- [2]
			"/petpassive [mod]\n/stopmacro [mod]\n/targetlasttarget\n/targetlasttarget [noexists][noharm][dead]\n/targetenemy [noexists]\n", -- [3]
			true, -- [4]
		}, -- [1]
		{
			"as1", -- [1]
			622, -- [2]
			"/cancelaura Aspect of the Cheetah\n/cancelaura Aspect of the Pack\n/use [mod:shift] !Aspect of the Monkey; !Aspect of the Hawk\n", -- [3]
			true, -- [4]
		}, -- [2]
		{
			"as2", -- [1]
			73, -- [2]
			"/cancelaura [nomod] Aspect of the Cheetah\n/cancelaura [nomod] Aspect of the Pack\n/use [nomod] !Aspect of the Viper; !Aspect of the Beast\n", -- [3]
			true, -- [4]
		}, -- [3]
		{
			"call", -- [1]
			78, -- [2]
			"/cast [target=pet,noexists] Call pet\n/stopmacro [target=pet,noexists]\n/castsequence reset=2 feed pet, nil\n/click MultiBarRightButton4\n", -- [3]
			true, -- [4]
		}, -- [4]
		{
			"eagleye", -- [1]
			85, -- [2]
			"/cast !eagle eye\n//cast [channeling:Eagle Eye][] Eagle Eye\n", -- [3]
			true, -- [4]
		}, -- [5]
		{
			"fd", -- [1]
			206, -- [2]
			"#showtooltip feign death\n/stopcasting [nomod]\n/stopcasting [nomod]\n/petstay\n/cast [nomod] feign death\n", -- [3]
			true, -- [4]
		}, -- [6]
		{
			"Focus", -- [1]
			580, -- [2]
			"/script SetCVar(\"cameraDistanceMax\",50)\n/focus [target=mouseover, exists, nomod] [nomod]\n", -- [3]
			true, -- [4]
		}, -- [7]
		{
			"frost", -- [1]
			386, -- [2]
			"/cast Frost Trap\n/petstay [combat]\n/cast [combat] Feign Death\n", -- [3]
			true, -- [4]
		}, -- [8]
		{
			"kc", -- [1]
			89, -- [2]
			"/startattack\n/cast mongoose bite\n/cast [nopet] !Raptor Strike\n/use kill command\n/stopmacro [target=pettarget,exists]\n/petattack\n/run MainMenuBarLeftEndCap:Hide();MainMenuBarRightEndCap:Hide()\n", -- [3]
			true, -- [4]
		}, -- [9]
		{
			"kcs", -- [1]
			406, -- [2]
			"#showtooltip\n/use [mod,target=focus] [target=mouseover, exists, harm] [nomod] concussive shot\n/cast !Auto Shot\n", -- [3]
			true, -- [4]
		}, -- [10]
		{
			"mend", -- [1]
			92, -- [2]
			"/cast [nomod] Mend Pet; Mend Pet(Rank 1)\n", -- [3]
			true, -- [4]
		}, -- [11]
		{
			"PA", -- [1]
			65, -- [2]
			"/cast [mod] dash\n/cast [mod] dive\n/petautocaston [mod] dash\n/petautocaston [mod] dive\n/stopmacro [mod]\n/petattack [target=mouseover,exists] []\n/petautocaston Claw\n/petautocaston Bite\n/petautocastoff Screech\n/petautocastoff Growl\n", -- [3]
			true, -- [4]
		}, -- [12]
		{
			"PF", -- [1]
			241, -- [2]
			"/petfollow [mod]\n/petautocaston [nomod] Growl\n/petautocastoff [nomod] Claw\n/petautocastoff [nomod] Screech\n//petautocastoff [nomod] Bite\n/petautocastoff dash\n/petautocastoff dive\n", -- [3]
			true, -- [4]
		}, -- [13]
		{
			"sb", -- [1]
			31, -- [2]
			"#showtooltip\n/cast [target=mouseover,exists,harm] [] scare beast\n", -- [3]
			true, -- [4]
		}, -- [14]
		{
			"viper", -- [1]
			70, -- [2]
			"#show viper sting\n/cast [mod:shift,target=focus] [nomod] Viper Sting;\n", -- [3]
			true, -- [4]
		}, -- [15]
		nil, -- [16]
		nil, -- [17]
		nil, -- [18]
		{
			"as", -- [1]
			1, -- [2]
			"/cast Arcane Shot\n/cast !Auto Shot\n", -- [3]
		}, -- [19]
		{
			"cc", -- [1]
			126, -- [2]
			"#show steady shot\n//cast [target=pettarget,exists] !Kill Command\n//cast !Auto Shot\n/cast steady shot\n/cast !Auto Shot\n", -- [3]
		}, -- [20]
		{
			"cheetah", -- [1]
			662, -- [2]
			"/cast Aspect of the cheetah\n/cancelaura aspect of the cheetah\n/cancelaura aspect of the pack\n", -- [3]
		}, -- [21]
		{
			"claw", -- [1]
			53, -- [2]
			"/cast [target=pettarget,exists] Bite\n/cast [target=pettarget,exists] Claw\n/petautocastoff Claw\n/petautocaston Bite\n/stopmacro [target=pettarget,exists]\n/petattack\n", -- [3]
		}, -- [22]
		{
			"clip", -- [1]
			222, -- [2]
			"/startattack\n/cast [nomod][target=focus] Wing Clip\n", -- [3]
		}, -- [23]
		{
			"cs", -- [1]
			279, -- [2]
			"/startattack\n/castsequence reset=2.12 !Auto Shot, Steady Shot\n/cast [target=pettarget,exists] Kill Command\n/cast claw\n", -- [3]
		}, -- [24]
		{
			"dt", -- [1]
			288, -- [2]
			"/cast [mod:shift,target=focus] [target=mouseover,harm,exists] [] Distracting Shot\n", -- [3]
		}, -- [25]
		{
			"f", -- [1]
			361, -- [2]
			"#showtooltip flare\n/stopcasting\n/stopcasting\n/cast [nomod] !Flare\n/cast [mod:shift] freezing trap; [mod:ctrl] Snake Trap\n", -- [3]
		}, -- [26]
		{
			"HM", -- [1]
			125, -- [2]
			"/cast [nomod] Hunter's Mark; [target=focus] Hunter's Mark(Rank 1)\n", -- [3]
		}, -- [27]
		{
			"md", -- [1]
			93, -- [2]
			"#showtooltip misdirection\n/cast [help] [target=focus,exists,help] [] Misdirection\n", -- [3]
		}, -- [28]
		{
			"rd", -- [1]
			40, -- [2]
			"/cast Bestial wrath\n/cast Blood Fury\n/use 13\n/petautocastoff growl\n", -- [3]
		}, -- [29]
		{
			"rf", -- [1]
			121, -- [2]
			"/cancelaura deterrence\n/cancelaura hand of protection\n/cast rapid fire\n/cast Blood Fury\n/use Rabid(Ferocity Ability)\n/use 13\n/use 10\n", -- [3]
		}, -- [30]
		{
			"serp", -- [1]
			117, -- [2]
			"/cast [nomod] Serpent Sting; Serpent Sting(Rank 1)\n", -- [3]
		}, -- [31]
		{
			"sp", -- [1]
			1, -- [2]
			"/use 13\n/cast blood fury\n", -- [3]
		}, -- [32]
		{
			"ss", -- [1]
			236, -- [2]
			"/cast [mod,target=focus] [] Silencing Shot\n", -- [3]
		}, -- [33]
		{
			"ssf", -- [1]
			1, -- [2]
			"#show scatter shot\n/stopcasting\n/stopcasting\n/cancelaura deterrence\n/cast [mod:shift, target=focus] [target=mouseover, exists, harm] [] scatter shot\n/stopattack\n", -- [3]
		}, -- [34]
		{
			"stuck", -- [1]
			542, -- [2]
			"#show hearthstone\n/run a,b=GetItemCooldown(6948)if a+b<GetTime()and GetItemCount(6948)>0 then RaidNotice_AddMessage(RaidWarningFrame,\"WARNING: USING HEARTHSTONE!\",ChatTypeInfo.RAID_WARNING) end\n/click HelpFrameStuckStuck\n", -- [3]
		}, -- [35]
		{
			"ts", -- [1]
			566, -- [2]
			"#showtooltip\n/stopcasting [nomod:ctrl]\n/stopcasting [nomod:ctrl]\n/cancelaura deterrence\n/cast [mod:shift, target=focus] [nomod] tranquilizing shot\n", -- [3]
		}, -- [36]
	},
}
L1QS_Settings = {
	["Dwarf"] = {
	},
	["Draenei"] = {
	},
	["Guidelime"] = {
	},
	["HUNTER"] = {
	},
}
