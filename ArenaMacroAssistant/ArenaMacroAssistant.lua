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
    macroUpdateOpponent('!faerieRogue', 4, nil,
                        {133252, 133242, 133269, 133259}, 133272,
                        '#showtooltips\n/cast [@arena%d]Faerie Fire(Rank 1)\n/use [nostealth]Zapthrottle Mote Extractor')
    macroUpdateOpponent('!pounceRogue', 4, nil,
                        {133251, 133241, 133268, 133258}, 133271,
                        '#showtooltips Discombobulator Ray\n/cast [@arena%d]Pounce\n/use Discombobulator Ray')
    local mageList = {8, 9, 11}
    for i = 1, #mageList do
        if macroUpdateOpponent('!chargeMage', mageList[i], nil, {132219, 134135, 133267, 134116}, 133270,
                               '#showtooltips Feral Charge\n/cast [nostance:1/3,mod:alt][nostance:1,nomod:alt]Dire Bear Form\n/use [mod:alt]Skull of Impending Doom\n/cast [@focus,harm,mod:ctrl][@arena%d,mod:ctrl][nomod]Feral Charge') then
            break
        end
    end
    local priestList = {2, 7, 5, 11}
    local priestMana = {8000, 8000, nil, nil}
    for i = 1, #priestList do
        if macroUpdateOpponent('!chargePriest', priestList[i], priestMana[i], {132938, 134135, 133267, 134116}, 133270,
                               '#showtooltips Feral Charge\n/cast [@focus,help]Regrowth;[nostance:1]Dire Bear Form\n/cast [@arena%d]Feral Charge') then
            break
        end
    end
end

local arenaMacroAssistantOpponent = CreateFrame('Frame')
arenaMacroAssistantOpponent:RegisterEvent('ARENA_OPPONENT_UPDATE')
arenaMacroAssistantOpponent:SetScript('OnEvent', function()
    C_Timer.After(0.5, runOpponent)
end)

function runTeam()
    macroUpdateTeam('!abolishPriest', 5, {136068, 134114, 134080}, 134111,
                    '#showtooltips Abolish Poison\n/cast [@player,mod:alt][@focus,help,mod:ctrl][@party%d,mod:ctrl][@target,help]Abolish Poison;Soothe Animal')
    local paladinList = {2, 7, 5, 9}
    for i = 1, #paladinList do
        if macroUpdateTeam('!removePaladin', paladinList[i], {135952, 134113, 134079}, 134110,
                           '#showtooltips Remove Curse\n/cast [@player,mod:alt][@focus,help,mod:ctrl][@party%d,mod:ctrl][@target,help][@targettarget,help]Remove Curse') then
            break
        end
    end
end

local arenaMacroAssistantTeam = CreateFrame('Frame')
arenaMacroAssistantTeam:RegisterEvent('ARENA_TEAM_UPDATE')
arenaMacroAssistantTeam:RegisterEvent('GROUP_ROSTER_UPDATE')
arenaMacroAssistantTeam:SetScript('OnEvent', function()
    C_Timer.After(0.5, runTeam)
end)
