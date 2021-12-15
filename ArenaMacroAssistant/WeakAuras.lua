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

--[[
!WA:2!TJ1wZTrsvyuPesyYsi2H49wbm4IeBVO4Ys2w2ovLh0ylLiqXw7i5yhcbR5sln96rZmPNz8LSeGyclH7SMRlSuuik2N4j9tWffpFkxu7pGu8ipLFbC6EgDlbVWMTyFYQC1ZmN(09CoN(CoFFJtCZH9vNEY5MC6HBoS5WMpAY91ygLioncSE4ipw3LzsykAgBAYC98oNIn9E3tJzkx111oG6DOwyGLlBfVaQRJVeB3vQx3Ne8p)sT1CmWjk7sDc0xm)YvZR2QEOT9IuMHnPMQVNMb5KmndXcZQ6hOXcKuOo0aj964fFlP9cy0gnim)x5sS4BFRwMe9W61RURhHD98Lkxy1skb4dQAHmTm757rSTlA6l9y)qDYweNGkO20DAVXI5QuDJkvZPwvjeFj6E2A7syQoAnj(sQcv1VorZoWQ7slZi4svRuoFPs7h6eBcsTnCTdB6uH7bj1zAM0q)h(c77tSRlC3mvxPSQMnTHdCAg6x8fLOfUPQKgIOKITRMzbfF69iJO2meJJskOHBmcmHKQHTMVp)o9anB0i43EOE8bWIU2USVsYKjlNCQjNDVgmQjpsmQ6smnhAtTaILQVbUUK6rNCwTIUM3SbXBOk3nuJrKlGNdYRzrdiTyctIVhhyUlglOgnyUHEXRQcAHNuX3LfO446q2J5gOXpVs8e0njmhn7BINoOGB3oAbr2xIejsUxOpPeTjfdNgOphO5euapSDz6Q5wQ4QvuT5tEMdIwxuwZNkExk6GpKSvGRXwrB)PlpYOutVZNJrC0UHMbZnNVpvSP7ZJbRrndSot76m8WSsatlql5tIY)kWfXDp9klQMp)YOlSD0bxMqQz77UELgznkTz6XFDD0mRtBiPGbGTvwAL1wMTtKz93EXw4CM0Ou82uN6USMI4G0(rrD82SWluaopm)benFUnikGo1HMywjF6n45OmFcFJ83JRd3OG5vAQrDeleupfubQcRI3E2NwYWgx5rxSffxDf3qMbjbSCIwgH(bUnRs2jyNtS)LVSCUBK7Yf0imk5kYCPYlkuapUDevzs1JVz8jKKXF2UyMImVyq(QYJv3f3VX6BcDxZDXjW0AIrW4tNs(AKarSVigagFSVyDXRs1TrizSjMq2Ljpw0YXWJmfxz6uYZkB6kK1BBdC3K4W3xSCYPXKrXYXhtJF0ErZXsjtNO7kO17Qg1XCCUfLkAdMqoWI40vr(Vyhrm9atOZiAB2vcXXuQ)RcRnLmwEgvlitX)80Om)X5Tu2G4S1KrZmzVs4j63V4wzNvpj)Cw(QxvEuuuaEim6ZAOrXbrDUOEbn63Caf4)UD67WLp1KZnFQPMmBACyMPtLEYPUFQNv3mX6UqwuTzNfhM7i1D6yDZohQ28tZ33zpkDNrOlo5uPI38zsFu6oBpDhy4)KUz74BCBiDgCiZrAVZfRRWgMzgUrp3rP78X6Mrec4bUfYCu6UqSUZYdbIHfosBi9u9mI4Or2J05sNU)O2mlGdtnZrQCNJUSCplnx55wqO8a6E)JkbQOzVs0mPKxfRbwKlxb7WmoVIiQYm7aRVB26ve5FOEyhXnhVxg5TJ377mXeFiQKyKGqMJOoucLbFYeWPGtFObYuW0DBNkBt9i18oxV2wR6zIiw6HIlh0rpouLLcVxxn4ZC2lbN7VJndFPhJ4jBOzVT2UyhHqsT2rBJOVQoIeee6dVARf72NMJ)Sb3u6QPf1KOgqBsmHlibVIe85Gppmc8IWlbVmmemm8fK8gIZhzls1iK(B4As(RFc4k3(jBsiE54q0bQ825wWR3PFF)TTV5)9g5i9fF0wzCKA4sV2JgXByExIn8T0qFF9iaNeEVSqOyiQb5g(X3aZVF35g9IgENRVL3d99Xrs7WirPu(cv9oVqisyZLdzzianvYHp(KOxeDhses6domc88wXMZbI5FdmmsRVlC6wcAae(jOYYRSCE48S4MDXot0QJDMHAjKz0H5sY9JDlNGdYXOyI8YAmeYDGarN38HczBJScwJP5T3AX3ezqBr9P628uQ(ERc)vvT41UE1bSMb3r(BNtUj9HdyR9nRGG5kRwTuXLZ)(h2W2D7cmYDdjog7w(e8omrEnFI28Ho7WE8h4l(q9WGaxNvqkmitZwCXrSQVGq)o2Z(8h6sRl5byA716iXsHpPLqLkcwDcdPQf1ythIVFsXmLO49djEbkrC(0Ti0gwb5GX2AFEzGOAUMOIGZ50si0bP4YSGuC(LWx(s6(imRnrDj1vlUex0RjMyCC8sT4PRMce6AQrxGzGVb8vL2RtrRvBtQpNsDrSUvp90zNA6PHtkPCpx3MjG8jbLioCpPhjfbZbOaCnKRSNLws1T55E5u7LPafBVEHBLwTy(Lknlf5bWPdI1nNbl(KGpTeCwjVpBhlGNoUe1xdZimTGvKGYsWOWPF0fH14SLG135e)RysslAPXAqUHwJpQeLqKFh3arx3I(5Din3D84Ptjpw0hym2tXu5)nUvgDTWbPw9brV65JI1hAAwFGuTEwqI(bioM(1X0VoM(1hV0VGVwn42WxhUJf8n6NpfSrnOgObVkO3La0G0ImQbMabzfb1fKGGgw8gQGveXfGMaEdKBZMileWwW6aAcoGl4b39balb4JkhaH4BBly7HGDI6PVlCp4ntaFt4(W3Qg8THVd8q47b7Lg(UjGhK49H3Qd8k89HFQf8dGFi8JUa8Jta)KO1)OeWpZcE7KWppjS)qWVWc(LCGo4xvd(1wWVPhIg8BH35PaYGFxn43hHDvSTv2BT663Km7kl4etNdPPXzR1hDUNsYzFgjiidc1ebiDwbM0FmrhSUhpiwdhf8pLKd4bTYHyNWFXc(Zr(07zb)be0mtM0laVRfIBgHAfplIC9odGCvgrp9d(y5J8n67fE8x5FmmZXWmhdZ88cZedOCuF89)VHzEqIyugeVzqyges5zGzqOheMbXyE7psWmyB(3nU5(ctpp)7qq8Htk1bIW7CpDx9yuceHGduuS9Q3Q8Y3TSLE2WgCaJ3BGV(j(ZCEE)Nrm8w)J1)3d
--]]
