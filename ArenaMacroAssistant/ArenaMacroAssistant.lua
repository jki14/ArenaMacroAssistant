function chatmsg(text)
    DEFAULT_CHAT_FRAME:AddMessage('|cFFFF7C0A[ArenaMacroAssistant]' .. text)
end

function macroEdit(name, id, icons, iconFallback, body)
    local body = string.gsub(body, '%%d', tostring(id))
    local icon = icons[id] or iconFallback
    return EditMacro(name, nil, icon, body)
end

function macroUpdate(name, classId, icons, iconFallback, body)
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

function run()
    -- chatmsg(' on update')
    macroUpdate('!faerieRogue', 4,
                {133252, 133242, 133269, 133259}, 133272,
                '#showtooltips\n/cast [@arena%d]Faerie Fire(Rank 1)\n/use Zapthrottle Mote Extractor')
    macroUpdate('!pounceRogue', 4,
                {133251, 133241, 133268, 133258}, 133271,
                '#showtooltips Discombobulator Ray\n/cast [@arena%d]Pounce\n/use Discombobulator Ray')
end

local arenaMacroAssistant = CreateFrame('Frame')
arenaMacroAssistant:RegisterEvent('ARENA_OPPONENT_UPDATE')
arenaMacroAssistant:SetScript('OnEvent', run)
-- chatmsg(' initialized')
