--[[
  Copyright (c) 2009 Snoring Minotaur

  Permission to use, copy, modify, and/or distribute this software for any
  purpose with or without fee is hereby granted, provided that the above
  copyright notice and this permission notice appear in all copies.

  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
--]]

local GetFactionInfo_orig = GetFactionInfo

local function AdjustFactionInfo(name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, ...)
    if isHeader == 1 and hasRep == nil and barValue ~= 0 then
        hasRep = 1
        if description == '' then
            description = GRAY_FONT_COLOR_CODE .. '(hidden reputation)' .. FONT_COLOR_CODE_CLOSE
        end
    end
    return name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, ...
end

local function HiddenReps_GetFactionInfo(...)
    return AdjustFactionInfo(GetFactionInfo_orig(...))
end

GetFactionInfo = HiddenReps_GetFactionInfo
