-- Test suite for German training data
-- Test all messages and report results

local testMessages = {
    "Verkaufe [Arkanitbarren] x10 günstig, flüstern",
    "Suche Gruppe für Todesminen, Magier Stufe 20",
    "Gruppe sucht Heiler für die Höhlen des Wehklagens",
    "Wer braucht noch die Quest Die Defias-Bruderschaft?",
    "Krieger sucht Gruppe für Burg Schattenfang",
    "Verkaufe grüne Ausrüstung Stufe 15 bis 25",
    "Kaufe große Mengen [Kupfererz]",
    "Gibt es hier einen Schmied für [Runenverzierte Brustplatte]?",
    "Suchen noch Schaden für Kloster Friedhof",
    "Warum hat der Server heute so viel Verzögerung?",
    "Einladen bitte",
    "Danke für die Einladung",
    "Bin kurz weg",
    "Gleich wieder da",
    "Bin zurück",
    "Tut mir leid für die Verzögerung",
    "Keine Sorge",
    "Alles klar",
    "Verstanden",
    "Bin bereit",
    "Mana ist leer",
    "Bitte kurz warten",
    "Ich habe die Gegner auf mir",
    "Heilung bitte",
    "Zu viele Gegner",
    "Wir sind tot",
    "Alle bitte freilassen",
    "Wiederbeleben bitte",
    "Wer hat die Beuteverteilung?",
    "Ich würfle darauf",
    "Ich verzichte",
    "Warum hast du darauf gewürfelt?",
    "Das ist für Heiler",
    "Glückwunsch zur Beute",
    "War keine Absicht",
    "Neuer Versuch",
    "Weiter gehts",
    "Kurze Pause",
    "Letzter Versuch dann muss ich los",
    "Vorsichtig hier",
    "Weitere Gegner kommen",
    "Zurückziehen",
    "Neu sammeln",
    "Erstes Ziel Totenkopf",
    "Fernkämpfer hinten bleiben",
    "Nahkämpfer raus aus dem Effekt",
    "Unterbrecht den Zauber",
    "Schutz auf mir",
    "Große Heilung kommt",
    "Abwehrfähigkeiten jetzt",
    "Kampfrausch jetzt",
    "Sehr gut gemacht",
    "Saubere Runde",
    "Danke an alle",
    "Hat Spaß gemacht",
    "Bis später",
    "Gute Nacht",
    "Hallo zusammen",
    "Guten Abend",
    "Hat jemand Lust zu questen?",
    "Wo finde ich den Questgeber für Der verlorene Pilot?",
    "Wie komme ich nach Donnerfels?",
    "Portal nach Sturmwind bitte",
    "Portal nach Eisenschmiede gegen Trinkgeld",
    "Magier bietet Portale an",
    "Hexenmeister kann beschwören",
    "Beschwörung bitte",
    "Ich stehe am Ritualstein",
    "Warte auf Beschwörung",
    "Einladung kommt gleich",
    "Gruppe ist leider voll",
    "Vielleicht später",
    "Im Moment keine Zeit",
    "Frag später nochmal",
    "Verzaubere Waffe mit +5 Stärke",
    "Brauche eine Verzauberung",
    "Was kostet Kreuzfahrer?",
    "Viel zu teuer",
    "Der Markt ist kaputt",
    "Preise sind komplett überzogen",
    "Farmgebiet ist total voll",
    "Zu viele Bots hier",
    "Melde den bitte",
    "Das ist eindeutig ein Bot",
    "Blizzard unternimmt nichts",
    "So ist Klassik eben",
    "Hardcore ist nichts für mich",
    "Charakter tot",
    "Stufe 32 wegen Verbindungsabbruch gestorben",
    "Hardcore ist gnadenlos",
    "Respekt fürs Durchhalten",
    "Nie wieder Hardcore",
    "Auf welchem Server spielst du?",
    "Horde oder Allianz?",
    "Für die Horde",
    "Für die Allianz",
    "Lok'tar Ogar",
    "Das Licht sei mit dir",
    "Haha",
    "Was zum…",
    "Oh mein Gott",
    "Lach mich kaputt",
    "Keine Ahnung",
    "Was war das denn",
    "Bitte helfen",
    "Hilfe hier",
    "Ich bin der Einzige der noch lebt",
    "Lauf weg",
    "Zu spät",
    "Mist",
    "Verdammt",
    "Guter Versuch",
    "Fast geschafft",
    "Das war knapp",
    "Alles unter Kontrolle",
    "Keine Panik",
    "Ich habe keine Ausdauer mehr",
    "Trank ist auf Abklingzeit",
    "Warte kurz",
    "Ich markiere die Ziele",
    "Nicht alle gleichzeitig angreifen",
    "Bleibt zusammen",
    "Nicht vorlaufen",
    "Jetzt angreifen",
    "Noch ein Gegner",
    "Geschafft",
    "Sehr sauber",
    "War knapp aber gut",
    "Ich muss gleich offline",
    "Noch ein Versuch",
    "Dann bin ich weg",
}

print("=== Testing German Training Data ===\n")
print(string.format("Total messages: %d\n", #testMessages))

local failures = {}
local successes = 0
local lowConfidence = {}

for i, msg in ipairs(testMessages) do
    local result = io.popen(string.format("./lua5.1 Tests/test_simple.lua '%s' 2>&1 | grep -E 'Translated:|Confidence:|Reason:'", msg:gsub("'", "'\\''")))
    local output = result:read("*a")
    result:close()
    
    local translated = output:match("Translated:%s+(.+)")
    local confidence = output:match("Confidence:%s+([0-9.]+)")
    local reason = output:match("Reason:%s+(.+)")
    
    if translated then
        local conf = tonumber(confidence) or 0
        if conf >= 0.50 then
            successes = successes + 1
            print(string.format("%d. ✓ [%.2f] %s", i, conf, msg:sub(1, 50)))
        else
            table.insert(lowConfidence, {i = i, msg = msg, conf = conf, trans = translated})
            print(string.format("%d. ⚠ [%.2f] %s", i, conf, msg:sub(1, 50)))
        end
    else
        table.insert(failures, {i = i, msg = msg, reason = reason or "unknown"})
        print(string.format("%d. ✗ [FAIL] %s - %s", i, msg:sub(1, 50), reason or "no translation"))
    end
end

print("\n=== Summary ===")
print(string.format("Success (≥0.50): %d/%d (%.1f%%)", successes, #testMessages, (successes/#testMessages)*100))
print(string.format("Low Confidence (<0.50): %d", #lowConfidence))
print(string.format("Failures: %d", #failures))

if #lowConfidence > 0 then
    print("\n=== Low Confidence Messages ===")
    for _, item in ipairs(lowConfidence) do
        print(string.format("%d. [%.2f] %s", item.i, item.conf, item.msg))
        print(string.format("   → %s", item.trans))
    end
end

if #failures > 0 then
    print("\n=== Failed Messages ===")
    for _, item in ipairs(failures) do
        print(string.format("%d. %s", item.i, item.msg))
        print(string.format("   Reason: %s", item.reason))
    end
end
