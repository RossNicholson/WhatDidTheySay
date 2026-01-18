-- Test suite for real guild chat log messages
-- Based on actual in-game guild chat translations

local testCases = {
    -- Greetings (should work)
    {
        message = "moin",
        expectedTranslation = "hi (northern German)",
        priority = "Low",
        status = "Working",
    },
    {
        message = "hui",
        expectedTranslation = nil, -- Not a real word, exclamation
        priority = "Low",
        status = "Needs work",
        notes = "Should be recognized as exclamation or skipped",
    },
    
    -- LFG messages
    {
        message = "jemand lust auf hdw gleich? 3 dds needed",
        expectedTranslation = "someone interested in Wailing Caverns soon? 3 dds needed",
        priority = "Medium",
        status = "Working (but confidence low)",
        notes = "Translation works but could be improved",
    },
    {
        message = "stockades oder BFD zu haben nach SW buff",
        expectedTranslation = "to have Stockades or BFD after SW buff",
        priority = "High",
        status = "Broken",
        notes = "Wrong word order: 'zu haben' should come before the object",
    },
    {
        message = "2 DDs für HDW",
        expectedTranslation = "2 dds for Wailing Caverns",
        priority = "Low",
        status = "Working",
    },
    
    -- World buff announcements
    {
        message = "Zandalar Buff in 50 Sekunden",
        expectedTranslation = "Zandalar buff in 50 seconds",
        priority = "Medium",
        status = "Working (low confidence)",
        notes = "Translation works but confidence is low",
    },
    {
        message = "Onyxia Buff in 14 Sekunden",
        expectedTranslation = "Onyxia buff in 14 seconds",
        priority = "High",
        status = "Broken",
        notes = "Marked as 'already_english' when it should translate 'Sekunden'",
    },
    
    -- Trade/crafting
    {
        message = "Will n Verzauberer das hier 4 free",
        expectedTranslation = "does an enchanter want this here for free",
        priority = "Medium",
        status = "Working (could be better)",
        notes = "'Will' = 'want/does want', 'n' = 'ein/an', '4' = 'for'",
    },
    
    -- Layering discussions
    {
        message = "kann mich wer kurz layern?",
        expectedTranslation = "can someone quickly layer me?",
        priority = "Low",
        status = "Working",
    },
    {
        message = "was bringt das layern?",
        expectedTranslation = "what does layering bring?/what is the point of layering?",
        priority = "Medium",
        status = "Working",
        notes = "Translation is okay but could be more natural",
    },
    {
        message = "das die mobs wieder instant da sind",
        expectedTranslation = "that the mobs are instantly there again",
        priority = "High",
        status = "Broken",
        notes = "'die' is being translated as 'the one who' instead of 'the' article",
    },
    {
        message = "quasi andere 'welt' also da können dann weniger leute sein die deine Mobs töten zb",
        expectedTranslation = "basically another 'world' so there can be fewer people who kill your mobs, for example",
        priority = "High",
        status = "Very broken",
        notes = "Multiple issues: 'andere' = 'another', 'die' = 'who' (relative pronoun), word order",
    },
    {
        message = "bsp escort quest nach dm wie bei mir :D kurz vor mir einer den typen mitgeniommen",
        expectedTranslation = "e.g., escort quest to DM like with me :D right before me someone took the guy",
        priority = "High",
        status = "Very broken",
        notes = "'bsp' = 'e.g.', 'bei mir' = 'with me', 'kurz vor mir' = 'right before me', 'mitgeniommen' = 'took along'",
    },
    {
        message = "egal ob quest oder farm mobs",
        expectedTranslation = "doesn't matter if quest or farm mobs",
        priority = "Low",
        status = "Working",
    },
    {
        message = "jetzt habn ich ihn nachm layern",
        expectedTranslation = "now I have him after layering",
        priority = "Medium",
        status = "Broken",
        notes = "'habn' = 'have' (colloquial), 'nachm' = 'after the' not translated",
    },
    {
        message = "wie layert man denn?",
        expectedTranslation = "how do you layer?",
        priority = "Medium",
        status = "Broken",
        notes = "'man' = 'you/one', 'denn' in questions is emphasis and shouldn't be translated",
    },
}

-- Summary
local summary = {
    total = #testCases,
    working = 0,
    needsWork = 0,
    broken = 0,
    highPriority = 0,
}

for _, test in ipairs(testCases) do
    if test.status == "Working" or test.status == "Working (but confidence low)" or test.status == "Working (could be better)" or test.status == "Working (low confidence)" then
        summary.working = summary.working + 1
    elseif test.status == "Needs work" or test.status == "Working (could be better)" then
        summary.needsWork = summary.needsWork + 1
    elseif test.status == "Broken" or test.status == "Very broken" then
        summary.broken = summary.broken + 1
    end
    
    if test.priority == "High" then
        summary.highPriority = summary.highPriority + 1
    end
end

print("Guild Chat Log Test Suite")
print("=" .. string.rep("=", 80))
print(string.format("Total test cases: %d", summary.total))
print(string.format("Working: %d", summary.working))
print(string.format("Needs work: %d", summary.needsWork))
print(string.format("Broken: %d", summary.broken))
print(string.format("High priority issues: %d", summary.highPriority))
print()

return {
    testCases = testCases,
    summary = summary,
}
