function chatmsg(text)
    DEFAULT_CHAT_FRAME:AddMessage('|cFFFF7C0A[ArenaMacroAssistant]' .. text)
end

function macroUpdate(name, classId, icons, iconFallback, body)
    for i = 1, 5 do
        local cid = select(3, UnitClass(string.format('arena%d',i)))
        if not cid or cid == classId then
            local function handler()
                if EditMacro(name, nil,
                                 icons[i] or iconFallback,
                                 string.format(body, i)) then
                    -- chatmsg(' updated')
                else
                    C_Timer.After(0.2, handler)
                end
            end
            C_Timer.After(0.2, handler)
            break
        end
    end
end

function run()
    -- chatmsg(' on update')
    macroUpdate('!faerieRogue', 4,
                {133252, 133242, 133269, 133259}, 133272,
                '#showtooltips\n/cast [@arena%d]Faerie Fire(Rank 1)')
    macroUpdate('!pounceRogue', 4,
                {133251, 133241, 133268, 133258}, 133271,
                '#showtooltips\n/cast [@arena%d]Pounce')
end

local arenaMacroAssistant = CreateFrame('Frame')
arenaMacroAssistant:RegisterEvent('ARENA_OPPONENT_UPDATE')
arenaMacroAssistant:SetScript('OnEvent', run)
-- chatmsg(' initialized')
