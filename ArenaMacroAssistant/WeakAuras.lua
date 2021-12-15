-- AMA-FaerieRogue: Text Custom Function
function()
    local unit = 'focus'
    local body = select(3, GetMacroInfo('!faerieRogue')) or ''
    for i = 1, 5 do
        local token = string.format('arena%d', i)
        if string.find(body, token) then
            unit = token
            break
        end
    end
    for i, subregion in ipairs(aura_env.region.subRegions) do
        if subregion.type == "subtext" then
            local classColor = {
                [1] = {0.78,0.61,0.43,1.0},
                [2] = {0.96,0.55,0.73,1.0},
                [3] = {0.67,0.83,0.45,1.0},
                [4] = {1.00,0.96,0.41,1.0},
                [5] = {1.00,1.00,1.00,1.0},
                [6] = {0.77,0.12,0.23,1.0},
                [7] = {0.00,0.44,0.87,1.0},
                [8] = {0.25,0.78,0.92,1.0},
                [9] = {0.53,0.53,0.93,1.0},
                [10] = {0.00,1.00,0.60,1.0},
                [11] = {1.00,0.49,0.04,1.0},
                [12] = {0.64,0.19,0.79,1.0}
            }
            local classId = select(2, UnitClassBase(unit)) or 6
            subregion:Color(unpack(classColor[classId]))
            break
        end
    end
    return unit
end

-- AMA-ChargeMage: Text Custom Function
function()
    local unit = 'focus'
    if not UnitIsEnemy('focus', 'player') then
        local body = select(3, GetMacroInfo('!chargeMage')) or ''
        for i = 1, 5 do
            local token = string.format('arena%d', i)
            if string.find(body, token) then
                unit = token
                break
            end
        end
    end
    for i, subregion in ipairs(aura_env.region.subRegions) do
        if subregion.type == "subtext" then
            local classColor = {
                [1] = {0.78,0.61,0.43,1.0},
                [2] = {0.96,0.55,0.73,1.0},
                [3] = {0.67,0.83,0.45,1.0},
                [4] = {1.00,0.96,0.41,1.0},
                [5] = {1.00,1.00,1.00,1.0},
                [6] = {0.77,0.12,0.23,1.0},
                [7] = {0.00,0.44,0.87,1.0},
                [8] = {0.25,0.78,0.92,1.0},
                [9] = {0.53,0.53,0.93,1.0},
                [10] = {0.00,1.00,0.60,1.0},
                [11] = {1.00,0.49,0.04,1.0},
                [12] = {0.64,0.19,0.79,1.0}
            }
            local classId = select(2, UnitClassBase(unit)) or 6
            subregion:Color(unpack(classColor[classId]))
            break
        end
    end
    return unit
end

-- AMA-ChargePriest: Text Custom Function
function()
    local unit = 'focus'
    local body = select(3, GetMacroInfo('!chargePriest')) or ''
    for i = 1, 5 do
        local token = string.format('arena%d', i)
        if string.find(body, token) then
            unit = token
            break
        end
    end
    for i, subregion in ipairs(aura_env.region.subRegions) do
        if subregion.type == "subtext" then
            local classColor = {
                [1] = {0.78,0.61,0.43,1.0},
                [2] = {0.96,0.55,0.73,1.0},
                [3] = {0.67,0.83,0.45,1.0},
                [4] = {1.00,0.96,0.41,1.0},
                [5] = {1.00,1.00,1.00,1.0},
                [6] = {0.77,0.12,0.23,1.0},
                [7] = {0.00,0.44,0.87,1.0},
                [8] = {0.25,0.78,0.92,1.0},
                [9] = {0.53,0.53,0.93,1.0},
                [10] = {0.00,1.00,0.60,1.0},
                [11] = {1.00,0.49,0.04,1.0},
                [12] = {0.64,0.19,0.79,1.0}
            }
            local classId = select(2, UnitClassBase(unit)) or 6
            subregion:Color(unpack(classColor[classId]))
            break
        end
    end
    return unit
end
