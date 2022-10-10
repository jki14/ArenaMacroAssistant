local teamSize = 5

function chatmsg(text)
    DEFAULT_CHAT_FRAME:AddMessage('|cFFFF7C0A[ArenaMacroAssistant]' .. text)
end

function macroEdit(name, id, icons, iconFallback, body)
    local body = string.gsub(body, '%%d', tostring(id))
    local icon = icons[id] or iconFallback
    return EditMacro(name, nil, icon, body)
end

function macroUpdateOpponent(name, classId, manaBar, icons, iconFallback, body)
    for i = 1, teamSize do
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
        for i = 1, teamSize do
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

function macroUpdateCurse()
    local function getTalentSpent(spellId)
        local keyName = GetSpellInfo(spellId)
        for tabIndex = 1, GetNumTalentTabs() do
            for i = 1, GetNumTalents(tabIndex) do
                local name, _, _, _, spent = GetTalentInfo(tabIndex, i)
                if name == keyName then
                    return spent
                end
            end
        end
        return 0
    end

    local meeles = { }
    meeles[1] = 'Warrior'
    meeles[3] = 'Hunter'
    meeles[4] = 'Rogue'
    meeles[6] = 'DeathKnight'
    local meelebody = getTalentSpent(18223) > 0 and '/cast [@arena%d]语言诅咒' or '/cast [@arena%d]虚弱诅咒'
    for i = 1, 5 do
        local name = string.format('!curse%d', i)
        local token = string.format('arena%d', i)
        local cid = select(3, UnitClass(token))
        local mana = UnitPowerMax(token, 0)
        local body = '/cast [@arena%d]语言诅咒'
        if not cid or meeles[cid] or (mana and mana < 10000) then
            body = meelebody
        end
        local function handler()
            if not macroEdit(name, i, {}, nil, body) then
                C_Timer.After(0.2, handler)
            end
        end
        C_Timer.After(0.2, handler)
    end
end

function macroUpdateTeam(name, classId, manaBar, icons, iconFallback, body)
    for i = 1, 4 do
        local token = string.format('party%d', i)
        local cid = select(3, UnitClass(token))
        local mana = UnitPowerMax(token, 0)
        if cid and cid == classId then
            if not manaBar or (mana and mana >= manaBar) then
                macroEdit(name, i, icons, iconFallback, body)
                return true
            end
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
    macroUpdateOpponent('!lockMage', 8, nil,
                        {133251, 133241, 133268, 133258}, 133271,
                        '#showtooltips\n/cast [@arena%d]法术封锁')
    macroUpdateCurse()
end

local arenaMacroAssistantOpponent = CreateFrame('Frame')
arenaMacroAssistantOpponent:RegisterEvent('PLAYER_ENTERING_WORLD')
arenaMacroAssistantOpponent:RegisterEvent('UPDATE_BATTLEFIELD_STATUS')
arenaMacroAssistantOpponent:RegisterEvent('ARENA_OPPONENT_UPDATE')
arenaMacroAssistantOpponent:SetScript('OnEvent', function(self, event, ...)
    if event == 'UPDATE_BATTLEFIELD_STATUS' then
        local index = select(1, ...)
        teamSize = select(6, GetBattlefieldStatus(index)) or 5
    end
    C_Timer.After(0.5, runOpponent)
end)

function runTeam()
    return false
end

local arenaMacroAssistantTeam = CreateFrame('Frame')
arenaMacroAssistantTeam:RegisterEvent('PLAYER_ENTERING_WORLD')
arenaMacroAssistantTeam:RegisterEvent('ARENA_TEAM_UPDATE')
arenaMacroAssistantTeam:RegisterEvent('GROUP_ROSTER_UPDATE')
arenaMacroAssistantTeam:SetScript('OnEvent', function()
    C_Timer.After(0.5, runTeam)
end)
