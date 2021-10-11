--[[
function chatmsg(text)
    DEFAULT_CHAT_FRAME:AddMessage('|cFFFF7C0A[ArenaMacroAssistant]' .. text)
end
]]--

function macroEdit(name, id, icons, iconFallback, body)
    local body = string.gsub(body, '%%d', tostring(id))
    local icon = icons[id] or iconFallback
    return EditMacro(name, nil, icon, body)
end

function macroUpdateOpponent(name, classId, icons, iconFallback, body)
    for i = 1, 5 do
        local cid = select(3, UnitClass(string.format('arena%d',i)))
        if cid and cid == classId then
            local function handler()
                if not macroEdit(name, i, icons, iconFallback, body) then
                    C_Timer.After(0.2, handler)
                end
            end
            C_Timer.After(0.2, handler)
            return true
        end
    end
    for i = 1, 5 do
        local cid = select(3, UnitClass(string.format('arena%d',i)))
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
    return false
end

function macroUpdateTeam(name, classId, icons, iconFallback, body)
    for i = 1, 4 do
        local cid = select(3, UnitClass(string.format('party%d',i)))
        if cid and cid == classId then
            local function handler()
                if not macroEdit(name, i, icons, iconFallback, body) then
                    C_Timer.After(0.2, handler)
                end
            end
            C_Timer.After(0.2, handler)
            return true
        end
    end
    local function handler()
        if not macroEdit(name, 1, icons, iconFallback, body) then
            C_Timer.After(0.2, handler)
        end
    end
    C_Timer.After(0.2, handler)
    return false
end

function runOpponent()
    macroUpdateOpponent('!faerieRogue', 4,
                        {133252, 133242, 133269, 133259}, 133272,
                        '#showtooltips\n/cast [@arena%d]Faerie Fire(Rank 1)\n/use Zapthrottle Mote Extractor')
    macroUpdateOpponent('!pounceRogue', 4,
                        {133251, 133241, 133268, 133258}, 133271,
                        '#showtooltips Discombobulator Ray\n/cast [@arena%d]Pounce\n/use Discombobulator Ray')
end

local arenaMacroAssistantOpponent = CreateFrame('Frame')
arenaMacroAssistantOpponent:RegisterEvent('ARENA_OPPONENT_UPDATE')
arenaMacroAssistantOpponent:SetScript('OnEvent', function()
    C_Timer.After(0.2, runOpponent)
end)

function runTeam()
    macroUpdateTeam('!abolishPriest', 5, {136068, 134114, 134080}, 134111,
                    '#showtooltips Abolish Poison\n/cast [@player,mod:alt][@focus,help,mod:ctrl][@party%d,mod:ctrl][@target,help]Abolish Poison;Soothe Animal')
    local curseList = {2, 7, 5, 9}
    for i = 1, #curseList do
        if macroUpdateTeam('!removePaladin', curseList[i], {135952, 134113, 134079}, 134110,
                           '#showtooltips Remove Curse\n/cast [@player,mod:alt][@focus,help,mod:ctrl][@party%d,mod:ctrl][@target,help][@targettarget,help]Remove Curse') then
            break
        end
    end
end

local arenaMacroAssistantTeam = CreateFrame('Frame')
arenaMacroAssistantTeam:RegisterEvent('ARENA_TEAM_UPDATE')
arenaMacroAssistantTeam:RegisterEvent('GROUP_ROSTER_UPDATE')
arenaMacroAssistantTeam:SetScript('OnEvent', function()
    C_Timer.After(0.4, runTeam)
end)
