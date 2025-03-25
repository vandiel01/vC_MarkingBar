-- Completed 03/24/2025
-- https://github.com/vandiel01/vC_MarkingBar
-------------------------------------------------------
-- Declarations
-------------------------------------------------------
local vC_CountDownNumber					= 10					-- Countdown is defaulted 10 Sec, Max is 3600s (1h) for Coutndown
-------------------------------------------------------
-- Marking Bar Toggles
-------------------------------------------------------
function vC_MB_MarkingBar()
	if ( InCombatLockdown() ) then return end

	if (( IsInGroup() or IsInRaid() ) and UnitIsGroupLeader("player") ) then
		vC_MB_MainFrame:Show()
		vC_MB_PingFrame:Show()
	else
		vC_MB_MainFrame:Hide()
		vC_MB_PingFrame:Hide()
	end
end
-------------------------------------------------------
-- Marking Bar Frame and Icons
-------------------------------------------------------
function vC_MB_ToolTips(f, c, a1)
	GameTooltip:ClearLines()
	if f == 0 then
		GameTooltip:Hide()
		return
	end
	GameTooltip:SetOwner(f,(c == 0 and "ANCHOR_NONE" or "ANCHOR_CURSOR"))
	GameTooltip:AddLine(a1)
	GameTooltip:Show()
end
if ( vC_MB_MainFrame == nil ) then
	local vC_MB_MainFrame = CreateFrame("Frame", "vC_MB_MainFrame", PlayerFrame, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_MB_MainFrame, 47, 1)
		vC_MB_MainFrame:EnableMouse(true)
		vC_MB_MainFrame:SetSize(265, 34)
		vC_MB_MainFrame:SetPoint("TOPLEFT", PlayerFrame, -53, 20)
		local vC_MB_RdyChk = CreateFrame("Button", "vC_MB_RdyChk", vC_MB_MainFrame, "BackdropTemplate")
			vC_MB_RdyChk:SetSize(20, 20)
			vC_MB_RdyChk:SetPoint("LEFT", vC_MB_MainFrame, "LEFT", 5, 0)
			vC_MB_RdyChk:SetNormalTexture(136814)
			vC_MB_RdyChk:GetNormalTexture():SetTexCoord(0,1,0,1)
			vC_MB_RdyChk:SetScript("OnClick", function(s) DoReadyCheck() end)
			vC_MB_RdyChk:SetScript("OnEnter", function(s) vC_MB_ToolTips(s,1,"Ready Check") end)
			vC_MB_RdyChk:SetScript("OnLeave", function(s) vC_MB_ToolTips(0) end)
		local vC_MB_CntDwn = CreateFrame("Button", "vC_MB_CntDwn", vC_MB_MainFrame, "BackdropTemplate")
			vC_MB_CntDwn:SetSize(28, 28)
			vC_MB_CntDwn:SetPoint("LEFT", vC_MB_RdyChk, "LEFT", 30, 0)
			vC_MB_CntDwn:SetNormalTexture(516773)
			vC_MB_CntDwn:SetScript("OnClick", function(s) C_PartyInfo.DoCountdown(vC_CountDownNumber) end)
			vC_MB_CntDwn:SetScript("OnEnter", function(s) vC_MB_ToolTips(s,1,vC_CountDownNumber.."s Countdown") end)
			vC_MB_CntDwn:SetScript("OnLeave", function(s) vC_MB_ToolTips(0) end)
		local vC_MB_iSkull = CreateFrame("Button", "vC_MB_iSkull", vC_MB_MainFrame, "BackdropTemplate")
			vC_MB_iSkull:SetSize(20, 20)
			vC_MB_iSkull:SetPoint("LEFT", vC_MB_CntDwn, "RIGHT", 12, 0)
			vC_MB_iSkull:SetNormalTexture(137009)
			vC_MB_iSkull:GetNormalTexture():SetTexCoord(0.75,1,0.25,0.5)
			vC_MB_iSkull:SetScript("OnClick", function(s) SetRaidTargetIcon("target", 8) end)
		local vC_MB_iCross = CreateFrame("Button", "vC_MB_iCross", vC_MB_MainFrame, "BackdropTemplate")
			vC_MB_iCross:SetSize(20, 20)
			vC_MB_iCross:SetPoint("LEFT", vC_MB_iSkull, "RIGHT", 3, 0)
			vC_MB_iCross:SetNormalTexture(137009)
			vC_MB_iCross:GetNormalTexture():SetTexCoord(0.5,0.75,0.25,0.5)
			vC_MB_iCross:SetScript("OnClick", function(s) SetRaidTargetIcon("target", 7) end)
		local vC_MB_iSquare = CreateFrame("Button", "vC_MB_iSquare", vC_MB_MainFrame, "BackdropTemplate")
			vC_MB_iSquare:SetSize(20, 20)
			vC_MB_iSquare:SetPoint("LEFT", vC_MB_iCross, "RIGHT", 3, 0)
			vC_MB_iSquare:SetNormalTexture(137009)
			vC_MB_iSquare:GetNormalTexture():SetTexCoord(0.25,0.5,0.25,0.5)
			vC_MB_iSquare:SetScript("OnClick", function(s) SetRaidTargetIcon("target", 6) end)
		local vC_MB_iMoon = CreateFrame("Button", "vC_MB_iMoon", vC_MB_MainFrame, "BackdropTemplate")
			vC_MB_iMoon:SetSize(20, 20)
			vC_MB_iMoon:SetPoint("LEFT", vC_MB_iSquare, "RIGHT", 3, 0)
			vC_MB_iMoon:SetNormalTexture(137009)
			vC_MB_iMoon:GetNormalTexture():SetTexCoord(0,0.25,0.25,0.5)
			vC_MB_iMoon:SetScript("OnClick", function(s) SetRaidTargetIcon("target", 5) end)
		local vC_MB_iTriangle = CreateFrame("Button", "vC_MB_iTriangle", vC_MB_MainFrame, "BackdropTemplate")
			vC_MB_iTriangle:SetSize(20, 20)
			vC_MB_iTriangle:SetPoint("LEFT", vC_MB_iMoon, "RIGHT", 3, 0)
			vC_MB_iTriangle:SetNormalTexture(137009)
			vC_MB_iTriangle:GetNormalTexture():SetTexCoord(0.75,1,0,0.25)
			vC_MB_iTriangle:SetScript("OnClick", function(s) SetRaidTargetIcon("target", 4) end)
		local vC_MB_iDiamond = CreateFrame("Button", "vC_MB_iDiamond", vC_MB_MainFrame, "BackdropTemplate")
			vC_MB_iDiamond:SetSize(20, 20)
			vC_MB_iDiamond:SetPoint("LEFT", vC_MB_iTriangle, "RIGHT", 3, 0)
			vC_MB_iDiamond:SetNormalTexture(137009)
			vC_MB_iDiamond:GetNormalTexture():SetTexCoord(0.5,0.75,0,0.25)
			vC_MB_iDiamond:SetScript("OnClick", function(s) SetRaidTargetIcon("target", 3) end)
		local vC_MB_iCircle = CreateFrame("Button", "vC_MB_iCircle", vC_MB_MainFrame, "BackdropTemplate")
			vC_MB_iCircle:SetSize(20, 20)
			vC_MB_iCircle:SetPoint("LEFT", vC_MB_iDiamond, "RIGHT", 3, 0)
			vC_MB_iCircle:SetNormalTexture(137009)
			vC_MB_iCircle:GetNormalTexture():SetTexCoord(0.25,0.5,0,0.25)
			vC_MB_iCircle:SetScript("OnClick", function(s) SetRaidTargetIcon("target", 2) end)
		local vC_MB_iStar = CreateFrame("Button", "vC_MB_iStar", vC_MB_MainFrame, "BackdropTemplate")
			vC_MB_iStar:SetSize(20, 20)
			vC_MB_iStar:SetPoint("LEFT", vC_MB_iCircle, "RIGHT", 3, 0)
			vC_MB_iStar:SetNormalTexture(137009)
			vC_MB_iStar:GetNormalTexture():SetTexCoord(0,0.25,0,0.25)
			vC_MB_iStar:SetScript("OnClick", function(s) SetRaidTargetIcon("target", 1) end)

	local vC_MB_PingFrame = CreateFrame("Frame", "vC_MB_PingFrame", vC_MB_MainFrame, "BackdropTemplate")
		vC_SetBackdrop_Choice(vC_MB_PingFrame, 47, 1)
		vC_MB_PingFrame:EnableMouse(true)
		vC_MB_PingFrame:SetSize(175, 35)
		vC_MB_PingFrame:SetPoint("RIGHT", vC_MB_MainFrame, "TOPRIGHT", 0, 15)
		local vC_MB_iQuestion = CreateFrame("Button", "vC_MB_iQuestion", vC_MB_PingFrame, "BackdropTemplate")
			vC_MB_iQuestion:SetSize(32, 32)
			vC_MB_iQuestion:SetPoint("LEFT", vC_MB_PingFrame, "LEFT", 2, 0)
			vC_MB_iQuestion:SetNormalTexture(616343)
			vC_MB_iQuestion:SetScript("OnEnter", function(s)
				--306 TOGGLEPINGLISTENER, 307 PINGATTACK, 308 PINGWARNING, 309 PINGONMYWAY, 310 PINGASSIST
				local key1, key2 = GetBindingKey("TOGGLEPINGLISTENER")
				vC_MB_ToolTips(
					vC_MB_iQuestion,1,
					(
						"Your '|CFF00CCFFPing Radial Screen|r' keybind(s) are:\n\n"..
						"Keybind #1: "..(key1 ~= nil and key1 or "NONE").."\n"..
						"Keybind #2: "..(key2 ~= nil and key2 or "NONE")..
						((key1 == nil and key2 == nil) and "\n\nYou don't have anything keybinded." or "")
					)
				)
			end)
			vC_MB_iQuestion:SetScript("OnLeave", function(s) vC_MB_ToolTips(0) end)
		local vC_MB_iPing = CreateFrame("Button", "vC_MB_iPing", vC_MB_PingFrame, "SecureActionButtonTemplate")
			vC_MB_iPing:SetSize(24, 24)
			vC_MB_iPing:SetPoint("LEFT", vC_MB_iQuestion, "RIGHT", 5, 0)
			vC_MB_iPing:SetNormalTexture(5215295)
			vC_MB_iPing:GetNormalTexture():SetTexCoord(0.330, 0.370, 0.164, 0.204)
			vC_MB_iPing:SetMouseClickEnabled(true)
			vC_MB_iPing:RegisterForClicks("AnyUp", "AnyDown")	
			vC_MB_iPing:SetAttribute("type","macro")
			vC_MB_iPing:SetAttribute("macrotext1","/ping [@target] Ping")
			vC_MB_iPing:SetScript("OnEnter", function(s)
				vC_MB_ToolTips(s,1,"Ping!\n\nYou must have a target!")
			end)
			vC_MB_iPing:SetScript("OnLeave", function(s) vC_MB_ToolTips(0) end)
		local vC_MB_iHere = CreateFrame("Button", "vC_MB_iHere", vC_MB_PingFrame, "SecureActionButtonTemplate")
			vC_MB_iHere:SetSize(24, 24)
			vC_MB_iHere:SetPoint("LEFT", vC_MB_iPing, "RIGHT", 2, 0)
			vC_MB_iHere:SetNormalTexture(5215295)
			vC_MB_iHere:GetNormalTexture():SetTexCoord(0.915, 0.990, 0.075, 0.150)
			vC_MB_iHere:RegisterForClicks("AnyUp", "AnyDown")	
			vC_MB_iHere:SetAttribute("type","macro")
			vC_MB_iHere:SetAttribute("macrotext1","/ping [@target] On My Way")
			vC_MB_iHere:SetScript("OnEnter", function(s)
				vC_MB_ToolTips(s,1,"On My Way!\n\nYou must have a target!")
			end)
			vC_MB_iHere:SetScript("OnLeave", function(s) vC_MB_ToolTips(0) end)
		local vC_MB_iWarn = CreateFrame("Button", "vC_MB_iWarn", vC_MB_PingFrame, "SecureActionButtonTemplate")
			vC_MB_iWarn:SetSize(24, 24)
			vC_MB_iWarn:SetPoint("LEFT", vC_MB_iHere, "RIGHT", 2, 0)
			vC_MB_iWarn:SetNormalTexture(5215295)
			vC_MB_iWarn:GetNormalTexture():SetTexCoord(0.478, 0.553, 0.295, 0.370)
			vC_MB_iWarn:RegisterForClicks("AnyUp", "AnyDown")    
			vC_MB_iWarn:SetAttribute("type","macro")
			vC_MB_iWarn:SetAttribute("macrotext1","/ping [@target] Warning")
			vC_MB_iWarn:SetScript("OnEnter", function(s)
				vC_MB_ToolTips(s,1,"Warning!\n\nYou must have a target!")
			end)
			vC_MB_iWarn:SetScript("OnLeave", function(s) vC_MB_ToolTips(0) end)
		local vC_MB_iAttack = CreateFrame("Button", "vC_MB_iAttack", vC_MB_PingFrame, "SecureActionButtonTemplate")
			vC_MB_iAttack:SetSize(24, 24)
			vC_MB_iAttack:SetPoint("LEFT", vC_MB_iWarn, "RIGHT", 2, 0)
			vC_MB_iAttack:SetNormalTexture(5215295)
			vC_MB_iAttack:GetNormalTexture():SetTexCoord(0.765, 0.840, 0.075, 0.150)
			vC_MB_iAttack:RegisterForClicks("AnyUp", "AnyDown")    
			vC_MB_iAttack:SetAttribute("type1","macro")
			vC_MB_iAttack:SetAttribute("macrotext1","/ping [@targettarget] Attack")
			vC_MB_iAttack:SetAttribute("type2","macro")
			vC_MB_iAttack:SetAttribute("macrotext2","/target [@targettarget,harm]")
			vC_MB_iAttack:SetScript("OnEnter", function(s)
				vC_MB_ToolTips(s,1,"Attack Away!  Kill 'em All!\n\nLEFT CLICK: Will point to what Tank is targeting!\n\nRIGHT CLICK: Will target to what Tank is targeting!")
			end)
			vC_MB_iAttack:SetScript("OnLeave", function(s) vC_MB_ToolTips(0) end)
		local vC_MB_iAssist = CreateFrame("Button", "vC_MB_iAssist", vC_MB_PingFrame, "SecureActionButtonTemplate")
			vC_MB_iAssist:SetSize(24, 24)
			vC_MB_iAssist:SetPoint("LEFT", vC_MB_iAttack, "RIGHT", 2, 0)
			vC_MB_iAssist:SetNormalTexture(5215295)
			vC_MB_iAssist:GetNormalTexture():SetTexCoord(0.765, 0.840, 0.000, 0.075)
			vC_MB_iAssist:RegisterForClicks("AnyUp", "AnyDown")    
			vC_MB_iAssist:SetAttribute("type","macro")
			vC_MB_iAssist:SetAttribute("macrotext1","/ping [@target] Assist")
			vC_MB_iAssist:SetScript("OnEnter", function(s)
				vC_MB_ToolTips(s,1,"Need of Assist or Assist Someone!\n\nYou must have a target!")
			end)
			vC_MB_iAssist:SetScript("OnLeave", function(s) vC_MB_ToolTips(0) end)
			
	vC_MB_MarkingBar()
end
-------------------------------------------------------
-- Register Events
-------------------------------------------------------
local vC_RegEv = CreateFrame("Frame")
	vC_RegEv:RegisterEvent("ADDON_LOADED")
	vC_RegEv:SetScript("OnEvent", function(s, e, ...)
	if ( e == "ADDON_LOADED" ) then
		local vC_Events = {
			"PLAYER_ENTERING_WORLD",		-- Action To Do When Loading into WoW
			"GROUP_ROSTER_UPDATE",			-- Detect Group/Raid/Leader Change
		}
		for i = 1, #vC_Events do
			vC_RegEv:RegisterEvent(vC_Events[i])
		end
		vC_RegEv:UnregisterEvent("ADDON_LOADED")
	end
	if ( e == "PLAYER_ENTERING_WORLD" or e == "GROUP_ROSTER_UPDATE" ) then 
		if ( not InCombatLockdown() ) then vC_MB_MarkingBar() end
	end
end)

