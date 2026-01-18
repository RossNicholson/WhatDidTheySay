-- WhatDidTheySay - Core Utilities
-- Shared helper functions

local Utils = {}

-- Split string by whitespace, preserving order
function Utils.SplitWords(text)
    local words = {}
    for word in text:gmatch("%S+") do
        table.insert(words, word)
    end
    return words
end

-- Normalize text for comparison (lowercase, trim)
function Utils.Normalize(text)
    return text:lower():gsub("^%s+", ""):gsub("%s+$", "")
end

-- Check if string contains only ASCII characters
function Utils.IsASCII(text)
    return not text:match("[^\x00-\x7F]")
end

-- Count occurrences of pattern in text
function Utils.CountPattern(text, pattern)
    local count = 0
    for _ in text:gmatch(pattern) do
        count = count + 1
    end
    return count
end

-- Check if string is a number
function Utils.IsNumber(str)
    return tonumber(str) ~= nil
end

-- Check if string looks like a player name (WoW name format)
function Utils.IsPlayerName(str)
    -- WoW names: 2-12 characters, alphanumeric, some special chars allowed
    return str:match("^[A-Za-z][A-Za-z0-9]*$") ~= nil and #str >= 2 and #str <= 12
end

-- Extract item links from text (returns table of link strings)
function Utils.ExtractItemLinks(text)
    local links = {}
    for link in text:gmatch("|c%x+|Hitem:[^|]+|h[^|]*|h|r") do
        table.insert(links, link)
    end
    return links
end

-- Extract spell links from text
function Utils.ExtractSpellLinks(text)
    local links = {}
    for link in text:gmatch("|c%x+|Hspell:[^|]+|h[^|]*|h|r") do
        table.insert(links, link)
    end
    return links
end

-- Extract quest links from text
function Utils.ExtractQuestLinks(text)
    local links = {}
    for link in text:gmatch("|c%x+|Hquest:[^|]+|h[^|]*|h|r") do
        table.insert(links, link)
    end
    return links
end

-- Extract raid icons from text
function Utils.ExtractRaidIcons(text)
    local icons = {}
    for icon in text:gmatch("{rt[1-8]}") do
        table.insert(icons, icon)
    end
    return icons
end

-- Safely clamp value between min and max
function Utils.Clamp(value, min, max)
    if value < min then return min end
    if value > max then return max end
    return value
end

-- Get table length (safe for sparse arrays)
function Utils.TableLength(t)
    local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
    return count
end

-- Universal WoW abbreviations and gaming terms that should NEVER trigger foreign language detection
-- These are universal across all languages and indicate English gaming messages
Utils.UNIVERSAL_WOW_ABBREVIATIONS = {
    -- Classes (full names and abbreviations)
    ["warrior"] = true, ["war"] = true, ["warr"] = true,
    ["mage"] = true, ["mag"] = true,
    ["rogue"] = true, ["rog"] = true,
    ["hunter"] = true, ["hunt"] = true, ["huntard"] = true,
    ["priest"] = true,
    ["warlock"] = true, ["lock"] = true, ["wl"] = true,
    ["druid"] = true, ["dru"] = true, ["dudu"] = true,
    ["shaman"] = true, ["sham"] = true,
    ["paladin"] = true, ["pala"] = true, ["pal"] = true, ["pally"] = true,
    
    -- Roles
    ["tank"] = true, ["mt"] = true, ["ot"] = true, -- Main Tank, Off Tank
    ["heal"] = true, ["healer"] = true, ["heals"] = true,
    ["dps"] = true, ["dd"] = true, -- Damage Dealer
    
    -- LFG/LFM abbreviations
    ["lf"] = true, ["lfg"] = true, ["lfm"] = true, ["lfw"] = true, ["lfb"] = true,
    ["lf1m"] = true, ["lf2m"] = true, ["lf3m"] = true, ["lf4m"] = true,
    ["lft"] = true, ["lfh"] = true, ["lfd"] = true, -- Looking for Tank/Healer/DPS
    
    -- Trading abbreviations
    ["wts"] = true, ["wtb"] = true, ["wtt"] = true, -- Want to Sell/Buy/Trade
    
    -- Dungeons and Raids (Classic Era)
    ["dm"] = true, -- Deadmines or Dire Maul
    ["vc"] = true, -- VanCleef (Deadmines boss)
    ["bfd"] = true, -- Blackfathom Deeps
    ["bsf"] = true, -- Blackfathom Deeps (German abbreviation)
    ["st"] = true, -- Stockades
    ["sfk"] = true, -- Shadowfang Keep
    ["rfk"] = true, -- Razorfen Kraul
    ["rfd"] = true, -- Razorfen Downs
    ["gnomer"] = true, ["gnomeregan"] = true,
    ["uld"] = true, ["uldaman"] = true, -- Uldaman
    ["zf"] = true, -- Zul'Farrak
    ["mara"] = true, -- Maraudon
    ["scholo"] = true, -- Scholomance
    ["strat"] = true, -- Stratholme
    ["ud"] = true, -- Stratholme Undead side
    ["live"] = true, -- Stratholme Living side
    ["brd"] = true, -- Blackrock Depths
    ["ubrs"] = true, -- Upper Blackrock Spire
    ["lbrs"] = true, -- Lower Blackrock Spire
    ["stockades"] = true,
    
    -- Raids
    ["mc"] = true, -- Molten Core
    ["ony"] = true, ["onyxia"] = true, -- Onyxia's Lair
    ["bwl"] = true, -- Blackwing Lair
    ["zg"] = true, -- Zul'Gurub
    ["aq"] = true, -- Ahn'Qiraj
    ["aq20"] = true, -- Ahn'Qiraj 20
    ["aq40"] = true, -- Ahn'Qiraj 40
    ["naxx"] = true, ["naxxramas"] = true, -- Naxxramas
    
    -- Cities and Zones
    ["sw"] = true, -- Stormwind
    ["org"] = true, -- Orgrimmar
    ["if"] = true, ["ironforge"] = true,
    ["darna"] = true, ["darnassus"] = true,
    ["tb"] = true, -- Thunder Bluff
    ["uc"] = true, -- Undercity
    ["tp"] = true, ["tpn"] = true, -- Teleport/Teleportation
    ["fp"] = true, -- Flight Path
    
    -- Actions and Commands
    ["inv"] = true, ["invite"] = true, ["invites"] = true,
    ["summon"] = true, ["summons"] = true,
    ["port"] = true, ["portal"] = true,
    ["res"] = true, ["rez"] = true, ["resurrect"] = true,
    ["pull"] = true, ["pulls"] = true, ["pulling"] = true,
    ["buff"] = true, ["buffs"] = true,
    ["debuff"] = true, ["debuffs"] = true,
    
    -- Status and Communication
    ["afk"] = true, ["brb"] = true, ["bb"] = true, -- Be Back
    ["gg"] = true, -- Good Game
    ["wp"] = true, -- Well Played
    ["gl"] = true, -- Good Luck
    ["hf"] = true, -- Have Fun
    ["ty"] = true, ["thx"] = true, ["thanks"] = true,
    ["np"] = true, -- No Problem
    ["sry"] = true, ["sorry"] = true,
    ["pls"] = true, ["please"] = true,
    ["ready"] = true, ["rdy"] = true, ["r"] = true,
    ["wait"] = true,
    ["go"] = true, ["going"] = true,
    ["need"] = true, ["needs"] = true,
    ["want"] = true, ["wants"] = true,
    
    -- Items and Currency
    ["gold"] = true, ["g"] = true,
    ["silver"] = true, ["s"] = true,
    ["copper"] = true, ["c"] = true,
    ["item"] = true, ["items"] = true,
    ["bag"] = true, ["bags"] = true,
    ["mount"] = true, ["mounts"] = true,
    ["pet"] = true, ["pets"] = true,
    
    -- Quest and Game Mechanics
    ["quest"] = true, ["quests"] = true, ["q"] = true,
    ["lvl"] = true, ["level"] = true, ["levels"] = true,
    ["xp"] = true, ["exp"] = true, -- Experience
    ["rep"] = true, -- Reputation
    ["layer"] = true, ["layers"] = true, ["layering"] = true,
    
    -- Combat and Gameplay
    ["cc"] = true, -- Crowd Control
    ["add"] = true, ["adds"] = true, -- Additional enemies
    ["boss"] = true, ["bosses"] = true,
    ["mob"] = true, ["mobs"] = true,
    ["aggro"] = true,
    ["pull"] = true, ["pulling"] = true,
    ["taunt"] = true,
    ["interrupt"] = true, ["kick"] = true,
    ["aoe"] = true, -- Area of Effect
    ["dot"] = true, -- Damage Over Time
    ["hot"] = true, -- Heal Over Time
    ["dps"] = true, -- Damage Per Second
    ["hps"] = true, -- Heals Per Second
    
    -- Crowd Control Abilities (common names)
    ["sheep"] = true, ["poly"] = true, -- Polymorph
    ["sap"] = true, -- Sap (rogue)
    ["blind"] = true, -- Blind (rogue)
    ["trap"] = true, -- Freezing Trap
    ["fear"] = true,
    ["charm"] = true,
    
    -- Marking Symbols
    ["skull"] = true, ["x"] = true,
    ["cross"] = true,
    ["square"] = true,
    ["moon"] = true,
    ["triangle"] = true,
    ["diamond"] = true,
    ["star"] = true,
    ["circle"] = true,
    
    -- Directions and Locations
    ["north"] = true, ["south"] = true, ["east"] = true, ["west"] = true,
    ["n"] = true, ["s"] = true, ["e"] = true, ["w"] = true,
    ["ne"] = true, ["nw"] = true, ["se"] = true, ["sw"] = true,
    ["left"] = true, ["right"] = true,
    ["up"] = true, ["down"] = true,
    ["in"] = true, ["out"] = true,
    ["inside"] = true, ["outside"] = true,
    ["here"] = true, ["there"] = true,
    
    -- Common English Words (that appear in gaming context)
    ["for"] = true, ["to"] = true, ["with"] = true,
    ["or"] = true, ["and"] = true,
    ["the"] = true, ["a"] = true, ["an"] = true,
    ["if"] = true, ["then"] = true, ["now"] = true,
    ["yes"] = true, ["no"] = true,
    ["good"] = true, ["great"] = true, ["nice"] = true,
    ["fast"] = true, ["slow"] = true,
    ["high"] = true, ["low"] = true,
    ["clear"] = true,
    ["get"] = true, ["got"] = true,
    ["have"] = true, ["has"] = true,
    ["run"] = true, ["runs"] = true,
    ["group"] = true, ["party"] = true,
    ["raid"] = true, ["raids"] = true,
    ["dungeon"] = true, ["dungeons"] = true,
    ["guild"] = true,
    ["world"] = true,
    ["help"] = true,
    
    -- Professions (abbreviations)
    ["alch"] = true, ["alchemy"] = true,
    ["bs"] = true, ["blacksmith"] = true, ["blacksmithing"] = true,
    ["ench"] = true, ["enchant"] = true, ["enchanting"] = true,
    ["eng"] = true, ["engineer"] = true, ["engineering"] = true,
    ["herb"] = true, ["herbalism"] = true,
    ["lw"] = true, ["leatherworking"] = true,
    ["mining"] = true,
    ["skinning"] = true,
    ["tailor"] = true, ["tailoring"] = true,
    ["cook"] = true, ["cooking"] = true,
    ["fish"] = true, ["fishing"] = true,
    ["firstaid"] = true, ["fa"] = true,
}

WDTS_Utils = Utils
