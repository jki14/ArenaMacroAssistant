function chatmsg(text)
    DEFAULT_CHAT_FRAME:AddMessage('|cFFFF7C0A[ArenaMacroAssistant]' .. text)
end

function macroEdit(name, id, icons, iconFallback, body)
    local body = string.gsub(body, '%%d', tostring(id))
    local icon = icons[id] or iconFallback
    return EditMacro(name, nil, icon, body)
end

function macroUpdateOpponent(name, classId, manaBar, icons, iconFallback, body)
    for i = 1, 5 do
        local token = string.format('arena%d', i)
        local cid = select(3, UnitClass(token))
        local mana = UnitPowerMax(token, 0)
        if cid and cid == classId then
            if not manaBar or (mana and mana >= manaBar) then
                local function handler()
                    if not macroEdit(name, i, icons, iconFallback, body) then
                        C_Timer.After(0.2, handler)
                    end
                end
                C_Timer.After(0.2, handler)
                return true
            end
        end
    end
    if classId == 4 or classId == 11 then
        for i = 1, 5 do
            local cid = select(3, UnitClass(string.format('arena%d', i)))
            if not cid then
                local function handler()
                    if not macroEdit(name, i, icons, iconFallback, body) then
                        C_Timer.After(0.2, handler)
                    end
                end
                C_Timer.After(0.2, handler)
                return true
            end
        end
    end
    macroEdit(name, 1, icons, iconFallback, body)
    return false
end

function macroUpdateTeam(name, classId, icons, iconFallback, body)
    for i = 1, 4 do
        local cid = select(3, UnitClass(string.format('party%d', i)))
        if cid and cid == classId then
            macroEdit(name, i, icons, iconFallback, body)
            return true
        end
    end
    macroEdit(name, 1, icons, iconFallback, body)
    return false
end

function runOpponent()
    macroUpdateOpponent('!corruptionRogue', 4, nil,
                        {133252, 133242, 133269, 133259}, 133272,
                        '#showtooltips\n/cast [harm,@arena%d]腐蚀术\n/cast [harm,@arena%d]吞噬魔法')
    macroUpdateOpponent('!faerieRogue', 4, nil,
                        {133252, 133242, 133269, 133259}, 133272,
                        '#showtooltips\n/cast [@arena%d]精灵之火(等级 1)')
end

local arenaMacroAssistantOpponent = CreateFrame('Frame')
arenaMacroAssistantOpponent:RegisterEvent('ARENA_OPPONENT_UPDATE')
arenaMacroAssistantOpponent:SetScript('OnEvent', function()
    C_Timer.After(0.5, runOpponent)
end)

function runTeam()
    return false
end

local arenaMacroAssistantTeam = CreateFrame('Frame')
arenaMacroAssistantTeam:RegisterEvent('ARENA_TEAM_UPDATE')
arenaMacroAssistantTeam:RegisterEvent('GROUP_ROSTER_UPDATE')
arenaMacroAssistantTeam:SetScript('OnEvent', function()
    C_Timer.After(0.5, runTeam)
end)
