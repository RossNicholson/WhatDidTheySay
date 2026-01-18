-- WhatDidTheySay - German Language Pack - Tokens
-- High-value vocabulary for WoW Classic German players

WDTS_Lang_de_Tokens = {
    -- Roles
    ["tank"] = "tank",
    ["dps"] = "dps",
    ["heiler"] = "healer",
    ["heilerin"] = "healer",
    ["heal"] = "heal",
    
    -- Dungeons (German names/common terms)
    ["heulende"] = "Wailing Caverns",
    ["klamm"] = "Wailing Caverns",
    ["höhlen"] = "caverns",
    ["wehklagen"] = "wailing",
    ["höhlen des wehklagens"] = "Wailing Caverns",
    ["hdw"] = "Wailing Caverns", -- Abbreviation for Höhlen des Wehklagens
    ["totenminen"] = "Deadmines",
    ["todesminen"] = "Deadmines", -- Alternative spelling
    -- Note: "dm" not translated - can mean either Deadmines or Dire Maul depending on context
    ["burg"] = "Shadowfang Keep",
    ["schattenfang"] = "Shadowfang Keep",
    ["sfk"] = "Shadowfang Keep",
    ["blackfathom"] = "Blackfathom Deeps",
    ["bsf"] = "Blackfathom Deeps", -- Common abbreviation
    ["bfd"] = "BFD", -- Common abbreviation for Blackfathom Deeps
    ["gnomer"] = "Gnomeregan",
    ["rfk"] = "Razorfen Kraul",
    ["rfd"] = "Razorfen Downs",
    
    -- Common verbs
    ["suche"] = "looking for",
    ["sucht"] = "looking for",
    ["suchst"] = "are looking for", -- 2nd person: "Du suchst" = "You are looking for"
    ["gesucht"] = "wanted", -- Past participle: "schmied gesucht" = "blacksmith wanted"
    ["brauche"] = "need",
    ["braucht"] = "need",
    ["brauch"] = "need", -- Colloquial form
    ["benötige"] = "need", -- Formal form
    ["benötigt"] = "needs", -- Formal form
    ["will"] = "want",
    ["willst"] = "want",
    ["bock"] = "want to/interest", -- Gaming slang: "hat wer bock?" = "does anyone want to?"
    ["kannst"] = "can you",
    ["kannste"] = "can you", -- Colloquial form of "kannst du" = "can you"
    ["kann"] = "can",
    ["könnt"] = "can you",
    ["können"] = "can",
    ["weiß"] = "know", -- "weiß nicht" = "don't know"
    ["ob"] = "if", -- "ob wir" = "if we"
    ["glaub"] = "think/believe", -- "ich glaub" = "I think"
    ["glaube"] = "think/believe", -- "ich glaube" = "I think"
    ["glaubst"] = "think/believe", -- "du glaubst" = "you think"
    ["glaubt"] = "thinks/believes", -- "er glaubt" = "he thinks"
    ["schaffen"] = "manage/accomplish/can do", -- "wir schaffen das" = "we can manage that"
    ["zweit"] = "two/second", -- "zu zweit" = "with two/just the two of us"
    ["heilen"] = "heal", -- "ich kann heilen" = "I can heal"
    ["diszi"] = "disc/disciple priest", -- Gaming abbreviation for "Disziplinpriester" (Discipline Priest)
    ["bist"] = "are", -- Fixed: "bist du" should use phrase, not token
    ["bin"] = "am",
    ["warte"] = "wait",
    ["wartet"] = "wait",
    ["komm"] = "come",
    ["kommt"] = "comes",
    ["komme"] = "come",
    ["kommst"] = "come",
    ["geh"] = "go",
    ["geht"] = "goes/works", -- "das geht" = "that works/that goes"
    ["reinkommst"] = "come in/enter", -- "wenn du reinkommst" = "when you come in"
    ["reinkommen"] = "come in/enter",
    ["gehe"] = "go",
    ["laufe"] = "running/going", -- "ich laufe" = "I'm running/going"
    ["laufen"] = "running/going",
    ["läuft"] = "runs/goes",
    ["nannte"] = "called/named", -- Past tense: "nannte man es" = "one called it"
    ["nennen"] = "call/name", -- Infinitive
    ["nennt"] = "calls/names", -- 3rd person
    ["früher"] = "earlier/before/formerly", -- Temporal adverb: "früher nannte man" = "earlier one called"
    ["stottern"] = "stuttering/stammering", -- Verb/noun: "stottern" = "to stutter/stuttering"
    
    -- Common nouns
    ["gruppe"] = "group",
    ["spieler"] = "player",
    ["mutige"] = "brave",
    ["mutig"] = "brave",
    ["char"] = "character", -- Gaming abbreviation
    ["charakter"] = "character",
    ["bank"] = "bank",
    ["bankchar"] = "bank character",
    ["mitglieder"] = "members",
    ["mana"] = "mana",
    ["gesundheit"] = "health",
    ["leben"] = "health",
    ["ausdauer"] = "stamina",
    ["stamina"] = "stamina", -- Often used in mixed-language messages
    ["heilung"] = "healing",
    ["heilt"] = "heals",
    ["wiederbeleben"] = "resurrect/revive",
    ["wiederbelebung"] = "resurrection",
    ["tasche"] = "bag",
    ["taschen"] = "bags",
    ["tasschen"] = "bags", -- Diminutive form (small bags)
    ["wurst"] = "sausage",
    ["würste"] = "sausages",
    ["würstchen"] = "sausage", -- Diminutive form (little sausage)
    ["rauchen"] = "smoke",
    ["raucht"] = "smokes",
    ["rauch"] = "smoke",
    ["blech"] = "sheet metal/tin",
    ["gift"] = "poison", -- Note: "Gift" in German means "poison", not "gift" (present)
    
    -- Actions
    ["einladen"] = "invite",
    ["einladung"] = "invitation",
    ["rufen"] = "summon",
    ["beschwören"] = "summon",
    ["bereit"] = "ready",
    ["fertig"] = "ready/done",
    ["aufmachen"] = "open",
    ["aufmacht"] = "opens",
    ["auf"] = "open/up", -- Separable prefix: "macht auf" = "opens"
    ["aufgemacht"] = "opened",
    ["lagern"] = "store/keep",
    ["lagert"] = "stores/keeps",
    ["lagere"] = "store/keep",
    
    -- Pronouns
    ["du"] = "you",
    ["dich"] = "you", -- Already added elsewhere, but here for completeness
    
    -- LFG related
    ["für"] = "for",
    ["fürs"] = "for the", -- Contraction of "für das" = "for the"
    ["mit"] = "with",
    ["und"] = "and",
    ["oder"] = "or",
    ["wenn"] = "if/when", -- "wenn man" = "if one/you"
    ["nem"] = "a/an", -- Colloquial form of "einem" = "a/an"
    ["ne"] = "a/an", -- Colloquial form of "eine/einen" = "a/an"
    ["als"] = "as",
    ["an"] = "at/on", -- Preposition: "an wie" = "like/as"
    ["im"] = "in the", -- Contraction of "in dem"
    ["in"] = "in", -- Preposition
    ["anbieten"] = "offer",
    ["bieten"] = "offer",
    ["bietet"] = "offers",
    ["bitten"] = "ask/request",
    ["bitte"] = "please", -- Already exists, but keep for reference
    
    -- Common phrases
    ["huhu"] = "hi/hi there", -- Friendly greeting
    ["danke"] = "thanks",
    ["dankeschön"] = "thank you",
    ["bitti"] = "please", -- Common typo/colloquial spelling
    ["hilfe"] = "help",
    ["handbuch"] = "manual/handbook",
    ["buch"] = "book",
    ["erste"] = "first",
    ["erstes"] = "first", -- Neuter form: "erstes Haus" = "first house"
    ["erster"] = "first", -- Masculine form
    ["experten"] = "experts",
    ["expert"] = "expert",
    ["unterstützen"] = "support",
    ["unterstützt"] = "supports",
    ["unterstütze"] = "support",
    ["spende"] = "donation",
    ["spenden"] = "donations",
    ["gildenrock"] = "guild tabard",
    ["rock"] = "tabard",
    ["hilfsbereite"] = "helpful",
    ["hilfsbereiten"] = "helpful",
    ["ja"] = "yes",
    ["nein"] = "no",
    ["ok"] = "ok",
    ["okay"] = "ok",
    ["sorge"] = "worry/concern",
    ["verstanden"] = "understood",
    ["verstehen"] = "understand",
    
    -- Directions
    ["norden"] = "north",
    ["süden"] = "south",
    ["osten"] = "east",
    ["westen"] = "west",
    
    -- Combat terms
    ["pull"] = "pull",
    ["add"] = "add",
    ["patrouille"] = "patrol",
    ["pat"] = "patrol",
    
    -- Common question words
    ["was"] = "what",
    ["wo"] = "where",
    ["wann"] = "when",
    ["wer"] = "who",
    ["warum"] = "why",
    ["wieso"] = "why", -- Alternative form: "wieso nicht" = "why not"
    ["lange"] = "long", -- "wie lange" = "how long"
    ["wie"] = {
        default = "like/as", -- "wie" can mean "how" or "like/as" depending on context
        question = "how", -- "wie?" = "how?"
    },
    
    -- Status words
    ["tot"] = "dead",
    ["gestorben"] = "died",
    ["gestorbene"] = "died",
    ["eben"] = "just",
    ["lebend"] = "alive",
    ["voll"] = "full",
    ["volle"] = "full",
    ["vollen"] = "full",
    ["volles"] = "full",
    ["ganze"] = "whole", -- "die ganze ini" = "the whole instance"
    ["ganzen"] = "whole", -- "die ganzen" = "the whole"
    ["ganzer"] = "whole",
    ["ganzes"] = "whole",
    ["leer"] = "empty",
    ["schnell"] = "fast",
    ["langsam"] = "slow",
    
    -- Faction terms
    ["alli"] = "Alliance", -- Common abbreviation for Allianz
    ["allianz"] = "Alliance",
    ["horde"] = "Horde",
    
    -- Races
    ["menschen"] = "humans",
    ["mensch"] = "human",
    ["zwerge"] = "dwarves",
    ["zwerg"] = "dwarf",
    ["nachtelfen"] = "night elves",
    ["nachtelf"] = "night elf",
    ["gnome"] = "gnomes",
    ["gnom"] = "gnome",
    ["orks"] = "orcs",
    ["ork"] = "orc",
    ["trolle"] = "trolls",
    ["troll"] = "troll",
    ["untote"] = "undead",
    ["untoter"] = "undead",
    
    -- Guild terms
    ["gilde"] = "guild",
    ["gilden"] = "guilds",
    ["levelgilde"] = "leveling guild", -- Compound word: Level + Gilde
    ["gildendiscord"] = "guild discord",
    ["discord"] = "discord",
    ["dc"] = "dc", -- Discord abbreviation (kept as-is)
    ["link"] = "link",
    ["links"] = "left", -- "links" = "left" (direction), "links" can also mean "links" but in context usually "left"
    ["haus"] = "house", -- "erstes Haus links" = "first house left"
    ["häuser"] = "houses",
    ["satzung"] = "charter/statute",
    ["satzungs"] = "charter/statute", -- Genitive form: "Gildensatzung" = "guild charter"
    ["gildensatzung"] = "guild charter",
    ["unterschrift"] = "signature",
    ["unterschriften"] = "signatures",
    ["gildensatzungsunterschriften"] = "guild charter signatures", -- Compound word
    ["level"] = "level", -- For compound words like "Levelgilde"
    ["aktiv"] = "active",
    ["aktive"] = "active",
    ["deutsch"] = "German",
    ["deutsche"] = "German",
    ["mitglied"] = "member",
    ["beitreten"] = "join",
    ["beitritt"] = "joining",
    ["rekrutierung"] = "recruitment",
    ["rekrutiert"] = "recruits", -- 3rd person singular: "gilde rekrutiert" = "guild recruits"
    ["rekrutieren"] = "recruit/recruiting",
    ["rekrutiere"] = "recruit",
    
    -- Game mechanics
    ["quest"] = "quest",
    ["quests"] = "quests",
    ["aufgabe"] = "task/quest",
    ["aufgaben"] = "tasks/quests",
    ["grausige"] = "gruesome",
    ["grausig"] = "gruesome",
    ["dunkeleisenkrieg"] = "Dark Iron War", -- Quest name: "Der Dunkeleisenkrieg"
    ["dunkel"] = "dark",
    ["eisen"] = "iron",
    ["krieg"] = "war",
    ["buff"] = "buff",
    ["buffs"] = "buffs",
    ["debuff"] = "debuff",
    ["raid"] = "raid",
    ["raids"] = "raids",
    ["raiden"] = "raiding", -- Gerund form: "zukünftig raiden" = "future raiding"
    ["raidet"] = "raids", -- 3rd person: "er raidet" = "he raids"
    ["dungeon"] = "dungeon",
    ["dungeons"] = "dungeons",
    ["instanz"] = "instance",
    ["instanzen"] = "instances",
    ["ini"] = "instance", -- Common abbreviation for "Instanz" = "instance"
    ["inn"] = "inn",
    ["taverne"] = "tavern",
    ["stufe"] = "level",
    ["leveln"] = "leveling", -- "zum leveln" = "for leveling"
    ["lvln"] = "level/leveling", -- German abbreviation for "leveln"
    ["lvl"] = "level",
    ["mindest"] = "minimum", -- "ab Mindest Lvl" = "from minimum level"
    ["minimum"] = "minimum",
    ["erfahrung"] = "experience",
    ["exp"] = "experience",
    
    -- Character classes (German names)
    ["krieger"] = "warrior",
    ["paladin"] = "paladin",
    ["jäger"] = "hunter",
    ["jägerin"] = "huntress", -- Female form
    ["schurke"] = "rogue",
    ["schurken"] = "rogues",
    ["priester"] = "priest",
    ["priesterin"] = "priestess", -- Female form
    ["schattenpriester"] = "shadow priest",
    ["schamane"] = "shaman",
    ["magier"] = "mage",
    ["mage"] = "mage", -- Often used in mixed-language messages
    ["freundlich"] = "friendly",
    ["freundlicher"] = "friendly", -- Masculine form
    ["freundliche"] = "friendly", -- Feminine form
    ["portal"] = "portal",
    ["portale"] = "portals",
    ["hexenmeister"] = "warlock",
    ["warlock"] = "warlock",
    ["druide"] = "druid",
    ["druid"] = "druid",
    ["warrior"] = "warrior",
    ["hunter"] = "hunter",
    ["rogue"] = "rogue",
    ["priest"] = "priest",
    ["shaman"] = "shaman",
    
    -- More dungeons
    ["uldamann"] = "Uldaman",
    ["uld"] = "Uldaman",
    ["zul'farrak"] = "Zul'Farrak",
    ["zf"] = "Zul'Farrak",
    ["maraudon"] = "Maraudon",
    ["mara"] = "Maraudon",
    ["versunkener"] = "Sunken Temple",
    ["tempel"] = "Sunken Temple",
    ["blackrock"] = "Blackrock",
    ["brd"] = "Blackrock Depths",
    ["schwarzfels"] = "Blackrock",
    ["lbrs"] = "Lower Blackrock Spire",
    ["ubrs"] = "Upper Blackrock Spire",
    ["scholomance"] = "Scholomance",
    ["scholo"] = "Scholomance",
    ["stratholme"] = "Stratholme",
    ["strat"] = "Stratholme",
    ["st"] = "Stratholme", -- Common abbreviation (more often Stratholme than Sunken Temple in Classic)
    ["dire"] = "Dire Maul",
    ["maul"] = "Dire Maul",
    
    -- Trading and economy
    ["handel"] = "trade",
    ["trade"] = "trade", -- Often used as-is in German WoW
    ["fenster"] = "window", -- "Trade Fenster" = "Trade Window"
    ["unten"] = "below/at the bottom", -- "unten" = "below/at the bottom"
    ["slot"] = "slot", -- Gaming term, often used as-is
    ["traded"] = "traded", -- Anglicism: "nicht traded" = "not traded"
    ["packt"] = "put/place", -- "packt man ... rein" = "put ... in"
    ["packen"] = "put/place",
    ["packe"] = "put/place",
    ["intern"] = "internal",
    ["entspannte"] = "relaxed",
    ["entspannt"] = "relaxed",
    ["community"] = "community", -- Often used as-is, but good to have
    ["verkaufen"] = "sell",
    ["verkaufe"] = "selling",
    ["verkauft"] = "sells",
    ["vk"] = "selling", -- Abbreviation for verkaufe
    ["je"] = "each",
    ["kaufen"] = "buy",
    ["kaufe"] = "buying",
    ["kauft"] = "buys",
    ["preis"] = "price",
    ["kostet"] = "costs",
    ["kosten"] = "cost",
    ["gold"] = "gold",
    ["güldisch"] = "golden", -- Gilded/golden
    ["güldischer"] = "golden", -- Golden (masculine form)
    ["güldische"] = "golden", -- Golden (feminine form)
    ["silber"] = "silver",
    ["silbermünzen"] = "silver coins",
    ["silbermünze"] = "silver coin",
    ["münzen"] = "coins",
    ["münze"] = "coin",
    ["kupfer"] = "copper",
    ["geld"] = "money",
    ["armschienen"] = "bracers",
    ["armschiene"] = "bracer",
    ["angebot"] = "offer",
    ["angebote"] = "offers",
    
    -- Professions and crafting
    ["schmied"] = "blacksmith",
    ["schmiedin"] = "blacksmith", -- Female form
    ["schmiede"] = "blacksmithing",
    ["kürschner"] = "leatherworker",
    ["schneider"] = "tailor",
    ["alchemist"] = "alchemist",
    ["verzauberer"] = "enchanter",
    ["verzauberung"] = "enchantment",
    ["verzauberungen"] = "enchantments",
    ["feuerverzauberung"] = "fire enchantment", -- "Feuerverzauberung" = "fire enchantment"
    ["vz"] = "enchantment", -- Common abbreviation for Verzauberung
    ["entchanten"] = "enchant", -- Anglicism: "entchanten" = "enchant" (verb)
    ["enchanten"] = "enchant", -- Anglicism variant
    ["verzaubernde"] = "to be enchanted/enchanting", -- "zu verzaubernde" = "to be enchanted"
    ["enhcanter"] = "enchanter", -- Typo for "enchanter"
    ["ingenieur"] = "engineer",
    ["kräuterkundiger"] = "herbalist",
    ["kräuterkundige"] = "herbalist",
    ["bergmann"] = "miner",
    ["kräutersammler"] = "herbalist",
    ["fischer"] = "fisherman/fisher",
    ["leihen"] = "lend",
    ["leiht"] = "lends",
    ["leih"] = "lend",
    ["geliehen"] = "lent",
    ["gelassen"] = "left behind/let", -- "zurück gelassen" = "left behind"
    ["lassen"] = "let/leave",
    ["läßt"] = "lets/leaves",
    ["borgen"] = "borrow",
    ["borgt"] = "borrows",
    ["borg"] = "borrow",
    ["bettler"] = "beggar",
    
    -- Common WoW verbs
    ["gehen"] = "go",
    ["starten"] = "start",
    ["startet"] = "starts",
    ["beginnen"] = "begin",
    ["beginnt"] = "begins",
    ["stoppen"] = "stop",
    ["stoppt"] = "stops",
    ["halten"] = "hold",
    ["hält"] = "holds",
    ["angreifen"] = "attack",
    ["angreift"] = "attacks",
    ["helfen"] = "help",
    ["hilft"] = "helps",
    ["spielen"] = "play",
    ["spielt"] = "plays",
    ["spiel"] = "play",
    ["spiele"] = "play",
    ["mitmachen"] = "join",
    ["macht"] = "makes",
    ["schauen"] = "look",
    ["schaut"] = "looks",
    
    -- Time and frequency
    ["täglich"] = "daily",
    ["tägliche"] = "daily",
    ["wöchentlich"] = "weekly",
    ["wöchentliche"] = "weekly",
    ["regelmäßig"] = "regularly",
    ["regelmäßige"] = "regular",
    ["organisiert"] = "organized",
    ["organisierte"] = "organized",
    ["heute"] = "today",
    ["morgen"] = "tomorrow",
    ["jetzt"] = "now",
    ["gleich"] = "soon",
    ["endlich"] = "finally", -- "endlich kein" = "finally no"
    ["gerade"] = "just/right now",
    ["später"] = "later",
    ["immer"] = "always",
    ["nächste"] = "next",
    ["nächsten"] = "next",
    ["nächstes"] = "next",
    ["nächster"] = "next",
    
    -- Item name components (common German words in item names)
    ["schädel"] = "skull",
    ["schädelbrecher"] = "skullbreaker",
    ["brecher"] = "breaker",
    ["streitaxt"] = "war axe",
    ["ring"] = "ring",
    ["wüstenring"] = "desert ring",
    ["wüste"] = "desert",
    ["des"] = "of the", -- Genitive article
    ["des affen"] = "of the ape",
    ["affen"] = "ape",
    ["affe"] = "ape",
    ["blanchard"] = "Blanchard", -- Proper name (keep as-is but allow recognition)
    ["alexanders"] = "Alexander's", -- Possessive
    ["alexander"] = "Alexander", -- Proper name
    ["lord"] = "lord", -- Common in item names
    ["zukünftig"] = "in the future/future", -- Adverb form
    ["zukünftige"] = "future", -- Adjective form (feminine)
    ["zukünftigen"] = "future", -- Adjective form (plural/genitive)
    ["zukünftiges"] = "future", -- Adjective form (neuter)
    ["zukünftiger"] = "future", -- Adjective form (masculine)
    
    -- Quality and attributes
    ["einfach"] = "simply",
    ["gut"] = "good",
    ["gute"] = "good",
    ["besser"] = "better",
    ["beste"] = "best",
    ["neu"] = "new",
    ["neue"] = "new",
    ["alt"] = "old",
    ["alte"] = "old",
    ["groß"] = "big",
    ["große"] = "big",
    ["klein"] = "small",
    ["kleine"] = "small",
    
    -- Articles (a/an/the)
    ["ein"] = "a",
    ["eine"] = "a",
    ["anschluss"] = "connection/join",
    ["usw"] = "etc.", -- "und so weiter" = "and so on"
    ["usw."] = "etc.",
    ["einer"] = "a/one", -- Feminine dative form
    ["einem"] = "a/one", -- Masculine/neuter dative form
    ["einen"] = "a",
    ["eines"] = "a",
    ["nen"] = "a", -- Colloquial form of "einen"
    -- Note: "der", "die", "das" handled below as articles and relative pronouns
    ["das"] = {
        default = "the",
        pronoun = "that", -- "das geht" = "that works"
    },
    -- Note: "den" is context-aware - handled below
    ["dem"] = "the", -- Also "whom/that"
    
    -- Possession and existence
    ["haben"] = "have",
    ["habt"] = "have",
    ["hat"] = "has",
    ["hatte"] = "had",
    ["sein"] = "be",
    ["seid"] = "are",
    ["sind"] = "are",
    ["ist"] = "is",
    ["war"] = "was",
    ["waren"] = "were",
    ["habe"] = "have",
    ["hab"] = "have", -- Colloquial form: "ich hab" = "I have"
    ["gehabt"] = "had", -- Past participle: "habe gehabt" = "I had/have had"
    ["nachricht"] = "message",
    ["nachrichten"] = "messages",
    ["brauchst"] = "need/you need", -- "brauchst" = "you need" (2nd person singular)
    ["statistiken"] = "statistics",
    ["statistik"] = "statistics",
    ["bzgl"] = "regarding/concerning", -- "bezüglich" abbreviation
    ["gesagt"] = "said", -- Past participle: "habe gesagt" = "I said/have said"
    ["gesehen"] = "seen", -- Past participle: "habe gesehen" = "I saw/have seen"
    ["sagten"] = "said", -- Past tense plural: "sie sagten" = "they said"
    ["andere"] = "others/other", -- "andere" = "others" or "other"
    ["anderen"] = "others/other", -- "anderen" = "others" or "other" (dative/accusative)
    ["alle"] = "all/everyone", -- "alle" = "all" or "everyone"
    ["hast"] = "have",
    
    -- Pronouns and people
    ["ich"] = "I", -- "ich glaub" = "I think"
    ["man"] = "one/you", -- Impersonal pronoun: "Kann man" = "Can one/Can you"
    ["es"] = "it", -- Neuter pronoun: "nannte man es" = "one called it"
    ["dass"] = "that", -- Conjunction: "ich sagte dass" = "I said that"
    ["gestern"] = "yesterday", -- Already exists, checking
    ["konnte"] = "could", -- Past tense: "ich konnte" = "I could"
    ["konntest"] = "could", -- "du konntest" = "you could"
    ["er"] = "he", -- "er geht" = "he goes"
    ["sie"] = "she/they", -- Can mean "she" or "they" depending on context
    ["jemand"] = "someone",
    ["jmd"] = "someone", -- Abbreviation for jemand
    ["irgendjemand"] = "anyone",
    ["niemand"] = "no one",
    ["jeder"] = "everyone",
    ["alles"] = "everything/all",
    ["neuling"] = "newbie",
    ["neulinge"] = "newbies",
    
    -- Pronouns (dative/accusative)
    ["mir"] = "me",
    ["mich"] = "me",
    ["dir"] = "you",
    ["ihm"] = "him",
    ["ihr"] = "her/you",
    ["ihn"] = "him",
    ["uns"] = "us",
    ["euch"] = "you",
    ["ihnen"] = "them",
    
    -- Definite articles (masculine, feminine, neuter)
    -- Note: "das" already defined above with contextual handling
    -- Relative pronouns (context-dependent, but default to "the" for articles)
    -- ["der"] = "who/that", -- Only when used as relative pronoun
    -- ["die"] = "who/that", -- Only when used as relative pronoun
    ["den"] = {
        default = "the",
        after = {
            ["hauptstein"] = "the",
        },
    },
    ["dessen"] = "whose",
    ["deren"] = "whose",
    ["diese"] = "this",
    ["dieser"] = "this",
    ["dieses"] = "this",
    
    -- Common connecting words
    ["auch"] = "also",
    ["noch"] = "still",
    ["nochmal"] = "again/another time", -- "nochmal" = "again" or "another time"
    ["noch einmal"] = "once again",
    ["schon"] = "already",
    ["nicht"] = "not",
    ["kein"] = "no",
    ["keine"] = "no",
    ["keiner"] = "none",
    ["mehr"] = "more/anymore", -- Context-dependent: "nicht mehr" = "not anymore", "mehr" = "more"
    ["mehrere"] = "several",
    ["weniger"] = "less",
    ["etwas"] = "something",
    ["gibts"] = "are there/is there", -- Colloquial "Gibt es"
    ["gibt es"] = "are there/is there",
    ["evtl"] = "maybe/perhaps", -- Abbreviation for eventuell
    ["eventuell"] = "maybe/perhaps",
    
    -- Social and communication
    ["hallo"] = "hello/hi",
    ["hi"] = "hi",
    ["hey"] = "hey",
    ["moin"] = "hi/hello", -- Northern German greeting: "Moin" = "Hi/Hello"
    ["moin moin"] = "hi/hello", -- Extended form
    ["willkommen"] = "welcome",
    ["glück"] = "luck",
    ["glücklich"] = "happy/lucky",
    ["genießen"] = "enjoy",
    ["genieße"] = "enjoy", -- 1st person: "ich genieße" = "I enjoy"
    ["genießt"] = "enjoy", -- 3rd person: "er/sie genießt" = "he/she enjoys"
    ["freuen"] = "be happy",
    ["freut"] = "is happy",
    ["freue"] = "am happy/I'm happy", -- 1st person: "ich freue mich" = "I'm happy/I'm excited"
    ["freue mich"] = "I'm excited/I'm looking forward", -- "freue mich auf" = "I'm excited about"
    ["rund"] = "around", -- "rund um" = "around"
    ["um"] = "around/about", -- "rund um" = "around"
    ["suchen"] = "looking for",
    ["finden"] = "find",
    ["findet"] = "finds",
    
    -- Practical conversation words
    ["machst"] = "are doing", -- Fixed: "was machst du" should use phrase
    ["mache"] = "doing",
    ["machen"] = "make",
    ["müssen"] = "must",
    ["muss"] = "must",
    ["soll"] = "should",
    ["sollen"] = "should",
    ["sollst"] = "should",
    ["möchte"] = "would like",
    ["möchtest"] = "would you like",
    ["mag"] = "wants/wants to/likes", -- "mag lvln" = "wants to level"
    ["mögen"] = "like/want",
    ["magst"] = "want/wants/like",
    ["mal"] = "even/once", -- Particle: "noch nicht mal" = "haven't even", "mal" = "once"
    ["schade"] = "too bad/what a pity", -- "schade" = "too bad/what a pity"
    ["anfangen"] = "start",
    ["angefangen"] = "started",
    ["fängt an"] = "starts",
    ["fangen an"] = "start",
    
    -- Common conversational responses
    ["super"] = "great",
    ["schlecht"] = "bad",
    ["sehr"] = "very", -- "sehr mega nett" = "very very nice"
    ["so"] = "so", -- "so sehr" = "so very/so much"
    ["sea"] = "very", -- Typo for "sehr"
    ["mega"] = "very/mega", -- "mega nett" = "very nice"
    ["nett"] = "nice", -- "sehr nett" = "very nice"
    ["vielleicht"] = "maybe",
    ["bestimmt"] = "definitely",
    ["werden"] = "will/become",
    ["wird"] = "will/become",
    ["wirst"] = "will/become",
    ["wurdest"] = "were/became", -- Past tense: "du wurdest" = "you were/became"
    ["wurde"] = "was/became", -- "es wurde" = "it was/became"
    ["wurden"] = "were/became",
    ["bissl"] = "a bit/a little", -- Colloquial for "bisschen"
    ["bisschen"] = "a bit/a little",
    ["loot"] = "loot",
    ["klauen"] = "steal/take",
    ["klaut"] = "steals/takes",
    ["geklaut"] = "stolen/taken",
    ["aber"] = "but",
    ["öfter"] = "more often",
    ["öfters"] = "more often",
    ["rein"] = "in", -- Colloquial: "da rein gehen" = "go in there"
    ["raus"] = "out",
    ["natürlich"] = "of course",
    ["klar"] = "sure",
    ["genau"] = "exactly",
    ["richtig"] = "right",
    ["falsch"] = "wrong",
    ["gerne"] = "gladly/you're welcome",
    ["leider"] = "unfortunately",
    ["tschüss"] = "bye",
    ["tschau"] = "bye",
    ["auf wiedersehen"] = "goodbye",
    
    -- Location and meeting
    ["hier"] = "here",
    ["hierher"] = "here/to here",
    ["dort"] = "there",
    ["da"] = "there",
    ["bei"] = "at",
    ["zu"] = "to",
    ["süß"] = "sweet/cute/nice",
    ["zauberstab"] = "wand/staff",
    ["stab"] = "staff/stick",
    ["zum"] = "to/for", -- Contraction of "zu dem" = "to the/for the"
    ["zur"] = "to the", -- Contraction of "zu der" = "to the" (feminine)
    -- "von" handled below as context-aware (item names use "of", general use "from")
    ["nach"] = "to",
    ["treffen"] = "meet",
    ["triff"] = "meet",
    ["trefft"] = "meet",
    ["zusammen"] = "together",
    ["alleine"] = "alone",
    ["allein"] = "alone",
    ["leute"] = "people",
    ["personen"] = "people",
    
    -- Abbreviations players use
    ["wts"] = "wts", -- Want to sell (often used as-is)
    ["wtb"] = "wtb", -- Want to buy
    ["lf"] = "looking for", -- Looking for
    ["lfb"] = "looking for", -- Looking for (variant)
    ["lfm"] = "lfm", -- Looking for more
    ["lfg"] = "lfg", -- Looking for group
    ["lf1m"] = "lf1m", -- Looking for 1 more
    ["ifg"] = "lfg", -- Common typo for LFG
    ["ifm"] = "lfm", -- Common typo for LFM (Looking For More)
    -- Note: "if" was removed - "IF" in uppercase typically means "Ironforge" location, not "looking for" typo
    -- The typo "if" instead of "lf" is now handled by context or universal abbreviations check
    ["help"] = "help", -- Often used in mixed-language messages
    ["innis"] = "instances/dungeons", -- Abbreviation for Instanzen (dungeons/instances)
    ["world"] = "world", -- Often used in German WoW context
    ["gg"] = "gg", -- Good game (used as-is)
    ["wp"] = "wp", -- Well played
    ["gl"] = "gl", -- Good luck
    ["hf"] = "hf", -- Have fun
    ["brb"] = "brb", -- Be right back
    ["afk"] = "afk", -- Away from keyboard
    ["wc"] = "wc", -- Water closet/toilet
    ["kurz"] = "quickly",
    ["kurz wc"] = "brb bathroom",
    ["mats"] = "materials", -- Gaming abbreviation
    ["materialien"] = "materials",
    
    -- Who/what/where questions
    ["wem"] = "whom",
    ["wen"] = "whom",
    ["wessen"] = "whose",
    ["womit"] = "with what",
    ["wofür"] = "for what",
    ["wovon"] = "from what",
    ["wohin"] = "where to",
    ["woher"] = "where from",
    ["hin"] = "to/there", -- "wohin" = "where to", "hin gehen" = "go there"
    ["eigentlich"] = "actually", -- "eigentlich" = "actually/in fact"
    
    -- Raid/Dungeon abbreviations
    ["zg"] = "Zul'Gurub",
    ["zulgurub"] = "Zul'Gurub",
    
    -- Numbers (for trading/levels)
    ["eins"] = "one",
    ["zwei"] = "two",
    ["ab"] = "from", -- "ab wann" = "from when"
    ["dolche"] = "daggers",
    ["dolch"] = "dagger",
    ["nutzen"] = "use",
    ["nutzt"] = "uses",
    ["nutze"] = "use",
    ["drei"] = "three",
    ["vier"] = "four",
    ["fünf"] = "five",
    ["sechs"] = "six",
    ["sieben"] = "seven",
    ["acht"] = "eight",
    ["neun"] = "nine",
    ["zehn"] = "ten",
    
    -- Missing common verbs and nouns (from example and general usage)
    ["verloren"] = "lost",
    ["verlieren"] = "lose",
    ["verliert"] = "loses",
    ["kontrolle"] = "control",
    
    -- More common verbs (past tense and participles)
    ["ging"] = "went",
    ["gegangen"] = "gone",
    ["machte"] = "made",
    ["gemacht"] = "made/done",
    ["gekommen"] = "come", -- Past participle: "bin gekommen" = "have come"
    ["gewesen"] = "been", -- Past participle: "bin gewesen" = "have been"
    ["gedacht"] = "thought", -- Past participle: "habe gedacht" = "have thought"
    ["gegeben"] = "given", -- Past participle: "habe gegeben" = "have given"
    ["genommen"] = "taken", -- Past participle: "habe genommen" = "have taken"
    ["gefunden"] = "found", -- Past participle: "habe gefunden" = "have found"
    ["gekauft"] = "bought", -- Past participle: "habe gekauft" = "have bought"
    ["bauen"] = "build",
    ["baut"] = "builds",
    ["gebaut"] = "built",
    ["versuch"] = "attempt/try",
    ["versuche"] = "attempt/try",
    ["versucht"] = "attempts/tries",
    ["gehts"] = "goes", -- Colloquial: "wie gehts" = "how goes it"
    ["pause"] = "break/pause",
    ["vorsichtig"] = "careful",
    ["kommen"] = "come",
    ["zurückziehen"] = "retreat/pull back",
    ["ziehen"] = "pull/attract",
    ["zieht"] = "pulls/attracts",
    ["ziehe"] = "pull/attract",
    ["zurück"] = "back",
    ["sammeln"] = "gather/collect",
    ["ziel"] = "target",
    ["ziele"] = "targets",
    ["totenschädel"] = "skull",
    ["totenkopf"] = "skull",
    ["fernkämpfer"] = "ranged dps",
    ["nahkämpfer"] = "melee dps",
    ["hinten"] = "back/behind",
    ["bleiben"] = "stay/remain",
    ["effekt"] = "effect",
    ["runde"] = "round",
    ["kampfrausch"] = "battle rage",
    ["nacht"] = "night",
    ["abend"] = "evening",
    ["ritualstein"] = "ritual stone",
    ["unternehmen"] = "undertake/do",
    ["durchhalten"] = "persevere/endure",
    ["ahnung"] = "idea/clue",
    ["mist"] = "damn/crap",
    ["verdammt"] = "damned/damn",
    ["geschafft"] = "done/accomplished",
    ["panik"] = "panic",
    ["markiere"] = "mark",
    ["markiert"] = "marks",
    ["vorlaufen"] = "run ahead",
    ["gegner"] = "enemy/enemies",
    ["offline"] = "offline",
    ["günstig"] = "cheap/affordable",
    ["flüstern"] = "whisper",
    ["flüstere"] = "whisper",
    ["ausrüstung"] = "equipment/gear",
    ["mengen"] = "amounts/quantities",
    ["menge"] = "amount/quantity",
    ["kupfererz"] = "copper ore",
    ["gibt"] = "gives/is there",
    ["schaden"] = "damage",
    ["kloster"] = "monastery",
    ["friedhof"] = "graveyard",
    ["verzögerung"] = "delay/lag",
    ["leid"] = "sorry",
    ["freilassen"] = "release/let go",
    ["beuteverteilung"] = "loot distribution",
    ["würfle"] = "roll",
    ["würfeln"] = "roll",
    ["verzichte"] = "pass/give up",
    ["verzicht"] = "pass",
    ["gewürfelt"] = "rolled",
    ["glückwunsch"] = "congratulations",
    ["beute"] = "loot",
    ["absicht"] = "intention",
    ["weiter"] = "further/continue",
    ["weitere"] = "more/additional",
    ["schutz"] = "protection",
    ["abwehrfähigkeiten"] = "defensive abilities",
    ["spaß"] = "fun",
    ["magnete"] = "magnets",
    ["magneten"] = "magnets",
    ["magnet"] = "magnet",
    ["kräuter"] = "herbs",
    ["kraut"] = "herb",
    ["abzugeben"] = "to give away",
    ["abgeben"] = "give away",
    ["gibt ab"] = "gives away",
    ["besucher"] = "visitor",
    ["besucherin"] = "visitor",
    ["besucherinnen"] = "visitors",
    ["zentrum"] = "center",
    ["zentren"] = "centers",
    ["besucherzentrum"] = "visitor center",
    ["anhandelt"] = "trades/negotiates",
    ["anhandeln"] = "trade",
    ["handelt"] = "trades",
    ["handeln"] = "trade",
    ["questgeber"] = "quest giver",
    ["donnerfels"] = "Thunder Bluff",
    ["trinkgeld"] = "tip",
    ["beschwörung"] = "summoning",
    ["beschwöre"] = "summon",
    ["prinzessin"] = "princess",
    ["botschafter"] = "ambassador",
    ["botschafterin"] = "ambassador",
    ["bösen"] = "evil", -- Genitive: "des Bösen" = "of evil"
    ["böse"] = "evil",
    ["stärke"] = "strength",
    ["kreuzfahrer"] = "Crusader",
    ["markt"] = "market",
    ["kaputt"] = "broken",
    ["komplett"] = "completely",
    ["überzogen"] = "overpriced/exaggerated",
    ["farmgebiet"] = "farming area",
    ["total"] = "totally/completely",
    ["bot"] = "bot",
    ["melde"] = "report",
    ["melden"] = "report",
    ["eindeutig"] = "clearly/obviously",
    ["klassik"] = "Classic",
    ["hardcore"] = "Hardcore",
    ["verbindungsabbruch"] = "disconnect/connection loss",
    ["gnadenlos"] = "merciless",
    ["respekt"] = "respect",
    ["server"] = "server",
    ["licht"] = "light",
    ["lach"] = "laugh",
    ["lachen"] = "laugh",
    ["einzige"] = "only one",
    ["einzig"] = "only",
    ["spät"] = "late",
    ["trank"] = "potion",
    ["tränke"] = "potions",
    ["abklingzeit"] = "cooldown",
    ["gleichzeitig"] = "at the same time",
    ["angriff"] = "attack",
    ["sagte"] = "said", -- Past tense: "ich sagte" = "I said"
    ["sagtest"] = "said", -- "du sagtest" = "you said"
    ["machtest"] = "made/did", -- "du machtest" = "you made/did"
    ["glaubte"] = "thought/believed", -- Past tense: "ich glaubte" = "I thought"
    ["glaubtest"] = "thought/believed",
    ["hattest"] = "had", -- "du hattest" = "you had"
    ["kam"] = "came",
    ["wollte"] = "wanted",
    ["wollten"] = "wanted",
    ["könnte"] = "could",
    ["könnten"] = "could",
    ["könntest"] = "could", -- "du könntest" = "you could"
    ["würde"] = "would",
    ["würden"] = "would",
    ["würdest"] = "would", -- "du würdest" = "you would"
    ["sollte"] = "should",
    ["sollten"] = "should",
    ["solltest"] = "should", -- "du solltest" = "you should"
    ["müsste"] = "must/would have to", -- "ich müsste" = "I must/would have to"
    ["müsstest"] = "must/would have to",
    ["müssten"] = "must/would have to",
    ["möchten"] = "would like",
    
    -- Common nouns
    ["zeit"] = "time",
    ["zeitpunkt"] = "time/moment",
    ["stunde"] = "hour",
    ["minute"] = "minute",
    ["minuten"] = "minutes",
    ["sekunde"] = "second",
    ["sekunden"] = "seconds",
    ["tag"] = "day",
    ["tage"] = "days",
    ["woche"] = "week",
    ["monat"] = "month",
    ["jahr"] = "year",
    ["jahre"] = "years",
    
    -- More common adjectives/adverbs
    ["viel"] = "much/many",
    ["viele"] = "many",
    ["wenig"] = "little/few",
    ["wenige"] = "few",
    ["genug"] = "enough",
    ["zu viel"] = "too much",
    ["zu wenig"] = "too little",
    ["ganz"] = "quite/entirely",
    ["fast"] = "almost",
    ["nur"] = "only",
    ["nurnoch"] = "just/only", -- Compound of "nur noch" (just/only) written as one word
    ["auch nur"] = "even only",
    
    -- More prepositions/connectors
    ["durch"] = "through",
    ["ohne"] = "without",
    ["gegen"] = "against",
    ["während"] = "during",
    ["bis"] = "until",
    ["seit"] = "since",
    ["wegen"] = "because of",
    ["trotz"] = "despite",
    
    -- Possessive pronouns
    ["mein"] = "my",
    ["meine"] = "my",
    ["meinen"] = "my",
    ["dein"] = "your",
    ["deine"] = "your",
    ["deinen"] = "your",
    ["seine"] = "his/its",
    ["seinen"] = "his/its",
    ["ihre"] = "her/their",
    ["ihren"] = "her/their",
    ["unser"] = "our",
    ["unsere"] = "our",
    ["unserer"] = "our", -- Dative/genitive feminine form: "zu unserer gilde" = "to our guild"
    ["unserem"] = "our", -- Dative masculine/neuter form
    ["unseres"] = "our", -- Genitive masculine/neuter form
    ["wir"] = "we",
    ["unseren"] = "our",
    ["euer"] = "your",
    ["eure"] = "your",
    ["euren"] = "your",
    
    -- Time/sequence connectors
    ["dann"] = "then",
    ["danach"] = "after that",
    ["trd"] = "anyway/nevertheless", -- Abbreviation for "trotzdem" = "anyway/nevertheless"
    ["trotzdem"] = "anyway/nevertheless",
    ["davor"] = "before that",
    
    -- Movement/departure (common in WoW)
    ["abfahrt"] = "departure/let's go",
    ["los"] = "let's go/go",
    ["geht los"] = "let's go",
    ["los geht"] = "let's go",
    ["los gehts"] = "let's go",
    ["losgehen"] = "let's go",
    ["porten"] = "port",
    ["port"] = "port",
    ["darna"] = "Darnassus", -- Common abbreviation for Darnassus
    ["darnassus"] = "Darnassus",
    ["sw"] = "SW", -- Stormwind abbreviation (kept as-is)
    ["geistesabwesende"] = "absent-minded",
    ["ausgrabungsleiter"] = "excavation leader",
    ["leiter"] = "leader",
    ["ausgrabung"] = "excavation",
    ["sturmwind"] = "Stormwind",
    ["stormwind"] = "Stormwind",
    ["pls"] = "please", -- Common abbreviation
    ["teleportieren"] = "teleport",
    ["tpn"] = "teleport/port", -- Gaming abbreviation for teleport
    ["tp"] = "teleport/port", -- Gaming abbreviation
    ["bb"] = "Booty Bay",
    ["booty bay"] = "Booty Bay",
    
    -- Quest-related vocabulary
    ["zerbrechen"] = "break",
    ["zerbricht"] = "breaks",
    ["abzeichen"] = "badge",
    ["stromgarde"] = "Stromgarde",
    ["trelanes"] = "Trelane's",
    ["trelane"] = "Trelane",
    ["verteidigung"] = "defense",
    ["vyrins"] = "Vyrin's",
    ["vyrin"] = "Vyrin",
    ["rache"] = "revenge",
    ["söldner"] = "mercenary",
    ["wissen"] = "knowledge",
    ["bewahren"] = "preserve",
    ["crushridge"] = "Crushridge",
    ["kriegstreiber"] = "warmonger",
    ["braut"] = "bride",
    ["fuß"] = "foot",
    ["aufbrechen"] = "break/open",
    ["brechen"] = "break",
    ["einbalsamierer"] = "embalmer",
    ["einbalsamierers"] = "embalmer",
    ["morbent"] = "Morbent",
    ["fel"] = "Fel",
    ["von"] = {
        default = "from",
        -- In item/quest names, "von" means "of"
        in_item_context = true, -- Special flag for context-aware translation
    },
    
    -- More common gaming terms
    ["healer"] = "healer",
    -- Note: "dd" removed - it's a universal abbreviation that should pass through unchanged
    -- Note: "dm" not translated - can mean either Deadmines or Dire Maul depending on context
    
    -- Weapon and item terms
    ["waffe"] = "weapon",
    ["waffen"] = "weapons",
    ["atombombe"] = "atomic bomb", -- Colloquial: "hits like an atomic bomb"
    ["einschlägt"] = "hits/strikes", -- "einschlagen" = "to hit/strike"
    ["einschlagen"] = "hit/strike",
    ["einschläge"] = "hits/strikes",
    ["hilevel"] = "high level", -- Colloquial abbreviation
    ["ilvl"] = "item level",
    ["feurige"] = "fiery", -- Adjective form
    ["feurig"] = "fiery", -- Base form
    ["feuriger"] = "fiery", -- Inflected forms
    ["feurigen"] = "fiery",
    ["feuriges"] = "fiery",
    
    -- Trading terms
    ["stapelweise"] = "in bulk",
    ["verschiedene"] = "various/different",
    ["verschiedenen"] = "various/different",
    ["items"] = "items",
    ["gegenstände"] = "items",
    
    -- Status/AFK
    ["ruhe"] = "rest/peace",
    ["anfang"] = "beginning/start",
    ["am"] = "at the", -- "am Anfang" = "at the beginning"
    ["sage"] = "say", -- "ich sage" = "I say"
    ["sagst"] = "say", -- "du sagst" = "you say"
    ["sagt"] = "says", -- "er sagt" = "he says"
    ["sagen"] = "say", -- "wir sagen" = "we say"
    ["geändert"] = "changed", -- "habe geändert" = "have changed"
    ["ändern"] = "change",
    ["ändert"] = "changes",
    ["dabei"] = "there/involved/along",
    ["langfristig"] = "long-term",
    ["langfristiges"] = "long-term",
    ["erhebt"] = "rises",
    ["erheben"] = "rise",
    ["erhebe"] = "rise", -- Already exists but adding for context
    
    -- Hardcore/gold
    ["startgeld"] = "starting gold",
    ["anfangsgeld"] = "starting gold",
    
    -- Common adjectives
    
    -- Common nouns (items, places, objects)
    ["truhe"] = "chest",
    ["kiste"] = "chest/box",
    ["öffnen"] = "open",
    ["öffnet"] = "opens",
    ["geöffnet"] = "opened",
    ["leichentuch"] = "shroud",
    ["wollstofftasche"] = "woolen bag",
    ["wollstofftaschen"] = "woolen bags",
    ["eisenbeschlägen"] = "iron-bound",
    ["verlies"] = "Deadmines", -- Alternative word for Deadmines (Verlies = dungeon/dungeon)
    ["eisenschmiede"] = "Ironforge",
    ["lust"] = "interest/interested",
    ["herstellen"] = "make/produce",
    ["stellt her"] = "makes",
    ["hergestellt"] = "made/produced",
    ["qest"] = "quest", -- Common typo
    ["füre"] = "for", -- Typo for "für"
    ["waldmannsaxt"] = "forester axe",
    ["wald"] = "forest", -- "Wald von Elwynn" = "Forest of Elwynn"
    ["wälder"] = "forests",
    ["elwynn"] = "Elwynn", -- Proper noun: Elwynn Forest
    ["bären"] = "bears",
    ["bär"] = "bear",
    ["halben"] = "half",
    ["sachen"] = "things/stuff",
    
    -- Guild and social terms (from chat log review)
    ["mitstreiter"] = "comrades/teammates",
    ["mitstreiterin"] = "comrade/teammate",
    ["gemeinsame"] = "common/shared",
    ["gemeinsames"] = "common/shared",
    ["gemeinsamen"] = "common/shared",
    ["unternehmungen"] = "activities/undertakings",
    ["unternehmung"] = "activity/undertaking",
    ["belohnungen"] = "rewards",
    ["belohnung"] = "reward",
    ["deshalb"] = "therefore/that's why",
    ["infos"] = "info/information",
    ["info"] = "info/information",
    ["informationen"] = "information",
    ["gefährten"] = "companions",
    ["gefährte"] = "companion",
    ["atmosphäre"] = "atmosphere",
    ["veteranen"] = "veterans",
    ["veteran"] = "veteran",
    ["neuanfänger"] = "newcomers/beginners",
    ["neuanfängerin"] = "newcomer/beginner",
    ["anfänger"] = "beginner",
    ["anfängerin"] = "beginner",
    ["herzlich"] = "warmly/heartily",
    ["wilkommen"] = "welcome", -- Common typo for "willkommen"
    ["gemeindschaftliche"] = "communal", -- Typo for "gemeinschaftliche"
    ["gemeinschaftliche"] = "communal",
    ["gemeinschaftlichen"] = "communal",
    ["gemeinschaftlich"] = "communal",
    ["planen"] = "to plan/planning",
    ["plane"] = "plan",
    ["plant"] = "plans",
    ["geplant"] = "planned",
    ["werde"] = "will", -- 1st person: "ich werde" = "I will"
    ["events"] = "events",
    ["event"] = "event",
    ["duell"] = "duel",
    ["duell-turnier"] = "duel tournament",
    ["turnier"] = "tournament",
    ["joinen"] = "join", -- Anglicism, commonly used in German WoW
    ["join"] = "join",
    
    -- Additional missing words from guild chat review
    ["dahin"] = "there", -- "gehe gleich dahin" = "going there soon"
    ["halt"] = "just/simply", -- Particle: "musst halt" = "just have to"
    ["warten"] = "wait", -- "kurz warten" = "wait briefly"
    ["grad"] = "currently/right now", -- Colloquial for "gerade" = "currently"
    ["bekommt"] = "gets/receives", -- "bekommt geld zurück" = "gets money back"
    ["bekommen"] = "get/receive",
    ["bekomme"] = "get/receive",
    
    -- Additional missing words from guild chat review 2
    ["erwähnt"] = "mentioned", -- "habe erwähnt" = "have mentioned"
    ["erwähnen"] = "mention",
    ["habs"] = "have it", -- Colloquial for "hab es" = "have it"
    ["exile"] = "exile", -- Gaming term, often used as-is
    ["such"] = "look for/search", -- "such dir" = "look for yourself"
    ["questet"] = "quests", -- "mit dir questet" = "quests with you"
    ["questen"] = "quest",
    ["gequestet"] = "quested", -- Past participle: "leergequestet" = "emptied of quests"
    ["leergequestet"] = "emptied of quests/completed all quests", -- Compound: "leer" + "gequestet"
    ["lernst"] = "learn", -- "so lernst du" = "so you learn"
    ["lernen"] = "learn",
    ["lernt"] = "learns",
    ["gelernt"] = "learned",
    ["sichersten"] = "safest", -- "am sichersten" = "the safest"
    ["sicher"] = "safe",
    ["immerhin"] = "at least/anyway", -- "immerhin" = "at least/anyway"
    ["durchhaltevermögen"] = "perseverance", -- "durchhaltevermögen" = "perseverance"
    ["arbeits"] = "work", -- "arbeits kolegen" = "work colleagues"
    ["arbeit"] = "work",
    ["kolegen"] = "colleagues", -- Typo for "kollegen" = "colleagues"
    ["kollegen"] = "colleagues",
    ["kollege"] = "colleague",
    ["bleib"] = "stay", -- "bleib am leben" = "stay alive"
    ["bleibt"] = "stays",
    ["Lad"] = "invite", -- "Lad sie ein" = "Invite her"
    ["lädt"] = "invites",
    ["erst"] = "first/only", -- "erst mit lvl 20" = "first/only at level 20"
    
    -- Additional missing words from guild chat review 3
    ["warst"] = "were", -- Past tense of "sein": "warst du" = "were you"
    ["flugplatz"] = "airport", -- "am flugplatz" = "at the airport"
    ["westfall"] = "Westfall", -- Location name
    ["passiert"] = "happened", -- "ist passiert" = "has happened", "was passiert" = "what happened"
    ["passieren"] = "happen",
    ["seht"] = "see", -- Plural: "seht ihr" = "do you see"
    ["langsamer"] = "slower", -- "lieber langsamer" = "prefer slower"
    ["dafür"] = "instead/for that", -- "dafür safe" = "instead safe"
    ["südlich"] = "south of", -- "südlich der Base" = "south of the base"
    ["base"] = "base", -- Location term
    ["wasser"] = "water", -- "am wasser" = "at the water"
    ["trappern"] = "trappers", -- "vorsicht vor trappern" = "careful of trappers"
    ["trapper"] = "trapper",
    ["pillagern"] = "pillagers", -- "vorsicht vor pillagern" = "careful of pillagers"
    ["pillager"] = "pillager",
    ["besonders"] = "especially", -- "die besonders" = "especially those"
    ["allem"] = "everything/all", -- "vor allem" = "above all/especially"
    ["wollen"] = "want", -- "nicht zuuuu viel wollen" = "don't want too much"
    ["also"] = "so/also", -- "also vorsicht" = "so careful"
    
    -- Additional common German gaming terms
    ["denn"] = "because/then", -- "was denn" = "what then"
    ["doch"] = "yet/but/however", -- Common particle
    ["sondern"] = "but rather",
    ["falls"] = "in case/if",
    ["obwohl"] = "although",
    ["weil"] = "because",
    ["damit"] = "so that",
    
    -- More time expressions
    ["sofort"] = "immediately",
    ["bald"] = "soon",
    ["vorher"] = "before",
    ["nachher"] = "afterwards",
    ["bisher"] = "so far",
    
    -- More modal verbs
    ["dürfen"] = "may/be allowed to",
    ["darf"] = "may/am allowed to",
    ["darfst"] = "may/are allowed to",
    
    -- Common gaming actions
    ["sammelt"] = "gathers/collects",
    ["farmen"] = "farm/grind",
    ["farmt"] = "farms/grinds",
    ["grinden"] = "grind/farm",
    ["grindet"] = "grinds/farms",
    ["töten"] = "kill",
    ["tötet"] = "kills",
    ["getötet"] = "killed",
    
    -- More location names
    ["orgrimmar"] = "Orgrimmar",
    ["org"] = "Orgrimmar",
    ["thunder"] = "Thunder Bluff",
    ["bluff"] = "Thunder Bluff",
    ["tb"] = "Thunder Bluff",
    ["unterstadt"] = "Undercity",
    ["uc"] = "Undercity",
    ["silberwald"] = "Silverpine Forest",
    ["düsterwald"] = "Duskwood",
    ["rotkammgebirge"] = "Redridge Mountains",
    ["schlingendorntal"] = "Stranglethorn Vale",
    ["stv"] = "Stranglethorn Vale",
    ["barrens"] = "Barrens",
    ["tanaris"] = "Tanaris",
    ["ungoro"] = "Un'Goro Crater",
    ["winterspring"] = "Winterspring",
    ["felwood"] = "Felwood",
    ["ashenvale"] = "Ashenvale",
    
    -- More item/equipment terms
    ["rüstung"] = "armor",
    ["schild"] = "shield",
    ["helm"] = "helmet",
    ["brustplatte"] = "chestplate",
    ["hose"] = "pants",
    ["stiefel"] = "boots",
    ["handschuhe"] = "gloves",
    ["gürtel"] = "belt",
    ["halskette"] = "necklace",
    ["ringe"] = "rings",
    ["trinket"] = "trinket",
    ["questitem"] = "quest item",
    
    -- More numbers (expanded)
    ["elf"] = "eleven",
    ["zwölf"] = "twelve",
    ["dreizehn"] = "thirteen",
    ["vierzehn"] = "fourteen",
    ["fünfzehn"] = "fifteen",
    ["zwanzig"] = "twenty",
    ["dreißig"] = "thirty",
    ["fünfzig"] = "fifty",
    ["hundert"] = "hundred",
    
    -- More status/adjectives
    ["krank"] = "sick",
    ["gesund"] = "healthy",
    ["müde"] = "tired",
    ["stark"] = "strong",
    ["schwach"] = "weak",
    ["leicht"] = "light/easy",
    ["schwer"] = "heavy/difficult",
    
    -- More common nouns
    ["freund"] = "friend",
    ["freunde"] = "friends",
    ["feind"] = "enemy",
    ["feinde"] = "enemies",
    ["boss"] = "boss",
    ["bosse"] = "bosses",
    ["mob"] = "mob",
    ["mobs"] = "mobs",
    ["npc"] = "npc",
    
    -- More verbs (expanded conjugations)
    ["nehmen"] = "take",
    ["nimmt"] = "takes",
    ["nahm"] = "took",
    ["geben"] = "give",
    ["gab"] = "gave",
    ["sehen"] = "see",
    ["sieht"] = "sees",
    ["sah"] = "saw",
    ["wusste"] = "knew",
    ["gewusst"] = "known",
    
    -- More pronouns/possessives
    ["nichts"] = "nothing",
    
    -- More common particles
    ["nie"] = "never",
    ["oft"] = "often",
    ["manchmal"] = "sometimes",
    
    -- Common gaming abbreviations (additional)
    ["omw"] = "on my way",
    -- Note: "ty", "thx", "np" are English abbreviations - handled by universal abbreviations check
    ["problem"] = "problem", -- Common loanword in German
    ["r"] = "ready", -- Gaming abbreviation for "ready" / "fertig"
    ["gz"] = "grats/congrats", -- Gaming abbreviation for "grats" or "congrats"
    ["grats"] = "grats/congrats", -- Common gaming abbreviation
    ["ding"] = "ding/level up", -- "ding" = level up sound/notification
    ["lebt"] = "lives/is alive", -- "lebt noch" = "still alive"
    ["hs"] = "hearthstone", -- Abbreviation for hearthstone
    ["hearth"] = "hearthstone", -- Short for hearthstone
    ["hearthstone"] = "hearthstone",
    ["respawn"] = "respawn", -- Common gaming term
    ["worgen"] = "worgen", -- WoW creature name
    ["murlocs"] = "murlocs", -- WoW creature name
    ["murloc"] = "murloc",
    ["gnoll"] = "gnoll", -- WoW creature name
    ["gnolle"] = "gnolls", -- German plural form
    ["hyperspawn"] = "hyperspawn", -- Gaming term for rapid respawn
    ["autorun"] = "autorun", -- Gaming term
    ["chatten"] = "chatting", -- "chatten" = "chatting"
    ["duelliert"] = "dueling", -- "duelliert" = "dueling"
    ["equippen"] = "equip", -- "equippen" = "to equip"
    ["gelootet"] = "looted", -- Past participle: "gelootet" = "looted"
    ["skippe"] = "skipping", -- "skippe" = "I'm skipping" (colloquial)
    ["escort"] = "escort", -- Gaming term
    ["hitten"] = "hitting", -- "hitten" = "hitting" (anglicism)
    ["risky"] = "risky", -- Common loanword
    ["schwimmen"] = "swimming", -- "schwimmen" = "swimming"
    ["ertrinken"] = "drowning", -- "ertrinken" = "drowning"
    ["blauen"] = "blue", -- "blauen" = "blue" (adjective, masculine accusative/dative) or "a blue" (item)
    ["blauer"] = "blue", -- "blauer" = "blue" (masculine nominative)
    ["blaue"] = "blue", -- "blaue" = "blue" (feminine/plural)
    ["blau"] = "blue", -- "blau" = "blue" (base form)
    ["gecraftet"] = "crafted", -- Past participle: "gecraftet" = "crafted"
    ["rerolle"] = "reroll", -- "rerolle" = "I'm rerolling" (colloquial)
    ["nervös"] = "nervous", -- "nervös" = "nervous"
    ["paranoid"] = "paranoid", -- Common loanword
    ["lag"] = "lag", -- Network lag/delay
    ["cleaves"] = "cleaves", -- Gaming term (boss ability)
    ["cleave"] = "cleave",
    ["yolo"] = "yolo", -- Gaming term
    ["yolo pulls"] = "yolo pulls", -- Gaming phrase
    ["target dummies"] = "target dummies", -- Gaming term
    ["dummy"] = "target dummy", -- Gaming term
    ["town"] = "town", -- Gaming term
    ["inv"] = "inventory", -- Gaming abbreviation
    ["eig"] = "actually/really", -- "eigentlich" abbreviation
    ["eigtl"] = "actually/really", -- "eigentlich" abbreviation (alternative spelling)
    ["gn8"] = "good night", -- Abbreviation for "gute nacht"
    
    -- English gaming terms that appear in German chat (pass through unchanged)
    ["theorycraft"] = "theorycraft",
    ["mindcontrol"] = "mindcontrol",
    ["Classic"] = "Classic",
    ["WOD"] = "WOD",
    ["BFA"] = "BFA",
    ["BC"] = "BC",
    ["WotLK"] = "WotLK",
    ["AQ"] = "AQ",
    ["Patchwerk"] = "Patchwerk",
    ["Razu"] = "Razu",
    ["endboss"] = "final boss", -- Gaming term
    ["klassiker"] = "classic/classic mistake", -- "Klassiker" = "classic" or "classic mistake"
    ["überzeugend"] = "convincing", -- "überzeugend" = "convincing"
    ["niemals"] = "never", -- "niemals" = "never"
    ["nehme"] = "take/I'll take", -- "nehme" = "I'll take" or "take"
    ["nehm"] = "take", -- Colloquial form of "nehme"
    ["schultern"] = "shoulders", -- "grüne Schultern" = "green shoulders" (item)
    ["schulter"] = "shoulder",
    ["statt"] = "instead of", -- "2 pulls statt 1" = "2 pulls instead of 1"
    ["pulls"] = "pulls", -- Gaming term
    ["drin"] = "in", -- "alle drin?" = "all in?"
    ["jaja"] = "yeah yeah", -- "jaja" = "yeah yeah" (colloquial agreement)
    ["versprochen"] = "promised", -- "versprochen" = "promised"
    ["sowas"] = "such things", -- "sag sowas nicht" = "don't say such things"
    ["herz"] = "heart", -- "mein Herz rast" = "my heart is racing"
    ["rast"] = "races/is racing", -- "rast" = "races"
    ["staff"] = "staff", -- "grüner staff" = "green staff" (item)
    ["uff"] = "whew/ugh", -- "uff" = "whew/ugh" (expression of relief)
    ["skippen"] = "skip", -- "skippen wir" = "should we skip"
    ["wieder"] = "again", -- "nie wieder" = "never again"
    ["vorhanden"] = "available", -- "Tank vorhanden" = "tank available"
    ["flüstert"] = "whisper", -- "flüstert mir" = "whisper me"
    ["flüster"] = "whisper", -- Imperative: "flüster mir" = "whisper me"
    ["proc"] = "proc", -- Gaming term
    ["geprocct"] = "proc'd/procced", -- Past tense of proc
    ["geprocced"] = "proc'd/procced",
    ["geproct"] = "proc'd/procced",
    ["legenden"] = "legendaries/legendary items", -- "kleine legenden" = "small legendaries"
    ["legende"] = "legendary",
    ["niedliche"] = "cute/sweet", -- "niedliche Gnomin" = "cute gnome (female)"
    ["niedlich"] = "cute/sweet",
    ["gnomin"] = "gnome (female)", -- Female gnome
    ["schonmal"] = "already/once", -- "schonmal" = "already/once" (colloquial)
    ["flieg"] = "fly/flying", -- "ich flieg" = "I fly/I'm flying"
    ["fliege"] = "fly/flying", -- "ich fliege" = "I fly/I'm flying"
    ["schicke"] = "send/sending", -- "schicke dir" = "I send you/I'm sending you"
    ["schickt"] = "sends/sending",
    ["taschengeld"] = "pocket money", -- "Taschengeld" = "pocket money"
    ["hohen"] = "high/high-level", -- "hohen char" = "high-level character"
    ["hohe"] = "high/high-level",
    ["hoher"] = "high/high-level",
    ["angekommen"] = "arrived", -- "bin angekommen" = "I arrived/I have arrived"
    ["ankommen"] = "arrive",
    ["schaff"] = "manage/can do", -- "ich schaff" = "I can manage/I can do"
    ["seh"] = "see", -- "ich seh" = "I see" (colloquial)
    ["sehe"] = "see",
    ["jo"] = "yes/yeah", -- "oh jo" = "oh yes/oh yeah"
    ["ach"] = "oh/ah", -- "ach das" = "oh that"
    ["kollekte"] = "collection/group", -- "jemand ne kollekte" = "someone a collection/group"
    ["verdreckte"] = "dirty/soiled", -- "für verdreckte" = "for dirty/soiled"
    ["schnorren"] = "borrow/beg", -- "eine Tasche schnorren" = "borrow a bag"
    ["spendieren"] = "donate/give", -- "Taschen spendieren" = "donate bags"
    ["besorgen"] = "get/buy", -- "Taschen besorgen" = "get bags"
    ["stört"] = "bothers/is in the way", -- "stört" = "bothers"
    ["würds"] = "would take it", -- "ich würds nehmen" = "I would take it"
    ["brauchbar"] = "usable/useful", -- "ist brauchbar" = "is usable"
    ["händler"] = "vendor/merchant", -- "beim händler" = "at the vendor"
    -- Note: "denn" already defined above as "because/then"
    ["vor"] = "ahead/planned", -- "was hast denn vor?" = "what do you have planned?"
    ["thorium"] = "thorium", -- Material name
    ["schließkassette"] = "lockbox", -- "Thoriumschließkassette" = "Thorium lockbox"
    ["eisengegengewicht"] = "iron counterweight", -- Item name
    ["kriegsaxt"] = "war axe", -- "Feurige Kriegsaxt" = "Fiery War Axe"
    ["ogermagierstab"] = "Ogre Mage Staff", -- Item name
    ["begleiten"] = "accompany/escort", -- "begleiten nach" = "accompany to"
    ["strand"] = "beach/strand", -- "von Westfall strand" = "from Westfall beach"
    ["erlösung"] = "redemption/salvation", -- "Die Erlösung" = "The Redemption"
    ["traumsänger"] = "Dreamsinger", -- "Beinschützer des Traumsängers" = "Leggings of the Dreamsinger"
    ["beinschützer"] = "leggings", -- "Beinschützer" = "leggings"
    ["moorring"] = "Moor Ring", -- Item name
    ["mur"] = "Wall", -- "Mur des morts" = "Wall of the Dead"
    ["morts"] = "dead", -- "Mur des morts" = "Wall of the Dead"
    ["kl"] = "small", -- "kl. Taschen" = "small bags" (abbreviation)
    ["10er"] = "10-slot", -- "10er taschen" = "10-slot bags"
    ["nette"] = "nice/friendly", -- "nette gilde" = "nice guild"
    ["netten"] = "nice/friendly", -- "netten gilde" = "nice guild"
    ["tod"] = "death", -- "Der Tod ist permanent" = "Death is permanent"
    ["am leben"] = "alive", -- "bleibt am Leben" = "stay alive"
    ["ausd"] = "stamina", -- Abbreviation for Ausdauer
    ["umhang"] = "cloak", -- "Umhang" = "cloak"
    ["resi"] = "resistance", -- "Resi" = resistance (abbreviation)
    ["lauftempo"] = "movement speed/speed", -- "Lauftempo" = "movement speed"
    ["bonus"] = "bonus", -- "Bonus" = "bonus"
    ["überragendes"] = "superior/outstanding", -- "Überragendes" = "superior"
    ["willenskraft"] = "spirit", -- "Willenskraft" = "spirit" (stat)
    ["derwischschiftung"] = "Dervish Shoulderpads", -- Item name
    ["falken"] = "Falcon", -- Proper noun
    ["brust"] = "chest", -- "Brust" = "chest" (armor slot)
    ["werte"] = "stats/all stats", -- "alle Werte" = "all stats"
    ["as"] = "attack speed", -- "AS" = attack speed abbreviation
    ["passiv"] = "passive", -- "pet auf passiv" = "pet on passive"
    ["oom"] = "oom", -- "out of mana" (gaming abbreviation, kept as-is)
    ["fd"] = "feign death", -- "FD ready" = "feign death ready"
    ["cd"] = "cooldown", -- "CD ready" = "cooldown ready"
    ["cds"] = "cooldowns",
    ["idc"] = "i don't care",
    ["tbh"] = "to be honest",
    ["imo"] = "in my opinion",
    ["idk"] = "i don't know",
    
    -- More conversational words
    ["wahrscheinlich"] = "probably",
    
    -- More expressions
    ["cool"] = "cool",
    ["geil"] = "awesome/cool", -- Common German slang
    ["lustig"] = "funny",
    ["langweilig"] = "boring",
    ["interessant"] = "interesting",
    
    -- ============================================
    -- WORLD OF WARCRAFT SPECIFIC TERMS
    -- ============================================
    
    -- Zones and Locations (German names)
    ["teldrassil"] = "Teldrassil",
    ["dun morogh"] = "Dun Morogh",
    ["if"] = "Ironforge",
    ["elwynnwald"] = "Elwynn Forest",
    ["sumpfland"] = "Wetlands",
    ["loch modan"] = "Loch Modan",
    ["dunkelküste"] = "Darkshore",
    ["aschfurttal"] = "Ashenvale",
    ["steinkrallengebirge"] = "Stonetalon Mountains",
    ["durotar"] = "Durotar",
    ["mulgore"] = "Mulgore",
    ["tausend nadeln"] = "Thousand Needles",
    ["steppe"] = "Barrens",
    ["die östlichen königreiche"] = "Eastern Kingdoms",
    ["kalimdor"] = "Kalimdor",
    ["arathihochland"] = "Arathi Highlands",
    ["hinterland"] = "Hinterlands",
    ["schwerterhügel"] = "Swords Hill",
    ["desolace"] = "Desolace",
    ["feralas"] = "Feralas",
    ["schmetterschwingenland"] = "Feralas", -- Alternative name
    ["azshara"] = "Azshara",
    ["ungorokrater"] = "Un'Goro Crater",
    ["teufelswald"] = "Felwood",
    ["winterquell"] = "Winterspring",
    ["tirisfal"] = "Tirisfal Glades",
    ["scarabäus"] = "Scarlet",
    ["hügel"] = "hill",
    ["gebirge"] = "mountains",
    ["küste"] = "coast",
    ["insel"] = "island",
    ["ebene"] = "plains",
    ["tal"] = "valley",
    ["sumpf"] = "swamp",
    ["see"] = "lake",
    ["meer"] = "sea",
    
    -- Major Cities and Settlements
    ["gadgetzan"] = "Gadgetzan",
    ["everlook"] = "Everlook",
    ["ratchet"] = "Ratchet",
    ["theramore"] = "Theramore",
    ["menethil"] = "Menethil Harbor",
    ["menethilhafen"] = "Menethil Harbor",
    ["südmeer"] = "Southshore",
    ["tarrens mill"] = "Tarren Mill",
    ["tarrenmühle"] = "Tarren Mill",
    ["brill"] = "Brill",
    ["ogrimmar"] = "Orgrimmar",
    ["sen'jin"] = "Sen'jin Village",
    ["senjindorf"] = "Sen'jin Village",
    ["blutfels"] = "Bloodhoof Village",
    ["kargath"] = "Kargath",
    ["flammenkamm"] = "Flame Crest",
    ["lakeshire"] = "Lakeshire",
    ["seedorf"] = "Lakeshire",
    ["sentinel"] = "Auberdine",
    ["auberdine"] = "Auberdine",
    ["astranaar"] = "Astranaar",
    ["nijel"] = "Nijel's Point",
    ["nijels punkt"] = "Nijel's Point",
    
    -- Dungeons (German names - comprehensive)
    ["dm"] = "Deadmines/Dire Maul", -- Context-dependent
    ["schattenfangklamm"] = "Shadowfang Keep",
    ["blackfathom tiefen"] = "Blackfathom Deeps",
    ["gnomergan"] = "Gnomeregan",
    ["kral"] = "Razorfen Kraul",
    ["scharlachrotkloster"] = "Scarlet Monastery",
    ["sm"] = "Scarlet Monastery",
    ["bibliothek"] = "Library",
    ["armory"] = "Armory",
    ["waffenkammer"] = "Armory",
    ["kathedrale"] = "Cathedral",
    ["versunkener tempel"] = "Sunken Temple",
    ["blackrocktiefen"] = "Blackrock Depths",
    ["untere spitz"] = "Lower Blackrock Spire",
    ["obere spitz"] = "Upper Blackrock Spire",
    ["dire maul"] = "Dire Maul",
    ["nord"] = "North",
    ["süd"] = "South",
    ["ost"] = "East",
    ["west"] = "West",
    ["tribute"] = "Tribute Run",
    
    -- Raids (Classic)
    ["molten core"] = "Molten Core",
    ["geschmolzener kern"] = "Molten Core",
    ["mc"] = "Molten Core",
    ["onyxias höhle"] = "Onyxia's Lair",
    ["ony"] = "Onyxia",
    ["onyxia"] = "Onyxia",
    ["blackwing"] = "Blackwing Lair",
    ["blackwinghöhle"] = "Blackwing Lair",
    ["bwl"] = "Blackwing Lair",
    ["zul'gurub"] = "Zul'Gurub",
    ["tempel von ahn'qiraj"] = "Temple of Ahn'Qiraj",
    ["aq20"] = "Ahn'Qiraj 20",
    ["ruinen von ahn'qiraj"] = "Ruins of Ahn'Qiraj",
    ["aq40"] = "Ahn'Qiraj 40",
    ["naxxramas"] = "Naxxramas",
    ["naxx"] = "Naxxramas",
    
    -- Major NPCs and Bosses (German names where applicable)
    ["ragnaros"] = "Ragnaros",
    ["nefarian"] = "Nefarian",
    ["nefarion"] = "Nefarian", -- Common typo
    ["hakkar"] = "Hakkar",
    ["cthun"] = "C'Thun",
    ["kel'thuzad"] = "Kel'Thuzad",
    ["lord kazzak"] = "Lord Kazzak",
    ["azurgos"] = "Azuregos",
    ["lord lacrimor"] = "Lord Kazzak", -- German name
    ["yenniku"] = "Yenniku",
    ["gan'zulah"] = "Gan'zulah",
    ["nezzliok"] = "Nezzliok",
    ["goblin"] = "goblin",
    ["tauren"] = "tauren",
    ["nachteIf"] = "night elf",
    
    -- Item Types and Equipment (German)
    ["schwert"] = "sword",
    ["schwerter"] = "swords",
    ["zweihender"] = "two-handed sword",
    ["einhänder"] = "one-handed sword",
    ["strebäxte"] = "war axes",
    ["zweihender streitaxt"] = "two-handed war axe",
    ["streithammer"] = "warhammer",
    ["mace"] = "mace",
    ["streitkolben"] = "mace",
    ["stäbe"] = "staves",
    ["zauberstäbe"] = "wands",
    ["bogen"] = "bow",
    ["bögen"] = "bows",
    ["armbrust"] = "crossbow",
    ["armbrüste"] = "crossbows",
    ["faustwaffe"] = "fist weapon",
    ["faustwaffen"] = "fist weapons",
    ["schilde"] = "shields",
    ["rückenschutz"] = "back shield", -- Rare term
    ["fernkampfwaffe"] = "ranged weapon",
    ["wurfwaffe"] = "throwing weapon",
    ["projektil"] = "projectile",
    ["pfeil"] = "arrow",
    ["pfeile"] = "arrows",
    ["kugel"] = "bullet",
    ["kugeln"] = "bullets",
    
    -- Armor Types
    ["panzer"] = "plate",
    ["platte"] = "plate",
    ["kettenrüstung"] = "mail",
    ["kettenpanzer"] = "chainmail",
    ["lederrüstung"] = "leather",
    ["leder"] = "leather",
    ["stoff"] = "cloth",
    ["stoffrüstung"] = "cloth armor",
    
    -- Armor Slots
    ["helme"] = "helmets",
    ["schulterstücke"] = "shoulders",
    ["brustharnisch"] = "chestplate",
    ["robe"] = "robe",
    ["gewand"] = "robe",
    ["handgelenksschutz"] = "wristguards",
    
    -- Accessories
    ["halsketten"] = "necklaces",
    ["trinkets"] = "trinkets",
    ["schmuck"] = "trinket",
    ["kappe"] = "cape",
    ["umhänge"] = "cloaks",
    
    -- Item Quality
    ["grau"] = "poor",
    ["gewöhnlich"] = "common",
    ["grün"] = "uncommon",
    ["ungewöhnlich"] = "uncommon",
    ["selten"] = "rare",
    ["lila"] = "epic",
    ["episch"] = "epic",
    ["orange"] = "legendary",
    ["legendär"] = "legendary",
    ["artefakt"] = "artifact",
    ["verzaubert"] = "enchanted",
    ["vergoldet"] = "gilded",
    
    -- Stats and Attributes
    ["intelligenz"] = "intellect",
    ["int"] = "intellect",
    ["geist"] = "spirit",
    ["spr"] = "spirit",
    ["beweglichkeit"] = "agility",
    ["agi"] = "agility",
    ["abwehr"] = "defense",
    ["parieren"] = "parry",
    ["ausweichen"] = "dodge",
    ["blocken"] = "block",
    ["widerstand"] = "resistance",
    ["feuerwiderstand"] = "fire resistance",
    ["frostwiderstand"] = "frost resistance",
    ["schattenwiderstand"] = "shadow resistance",
    ["naturwiderstand"] = "nature resistance",
    ["arkanswiderstand"] = "arcane resistance",
    ["angriffskraft"] = "attack power",
    ["ap"] = "attack power",
    ["zaubermacht"] = "spell power",
    ["sp"] = "spell power",
    ["heilungskraft"] = "healing power",
    ["zauberdurchschlag"] = "spell penetration",
    ["kritisch"] = "critical",
    ["krit"] = "critical",
    ["kritischer treffer"] = "critical hit",
    ["kritischer zufall"] = "critical strike",
    ["treffer"] = "hit",
    ["trefferwert"] = "hit rating",
    ["tempo"] = "haste",
    ["angriffsgeschwindigkeit"] = "attack speed",
    ["waffenkunde"] = "weapon skill",
    ["waffenfertigkeit"] = "weapon skill",
    
    -- Professions (German names)
    ["schmiedekunst"] = "blacksmithing",
    ["lederverarbeitung"] = "leatherworking",
    ["schneiderei"] = "tailoring",
    ["alchemie"] = "alchemy",
    ["verzauberkunst"] = "enchanting",
    ["ingenieurskunst"] = "engineering",
    ["kräuterkunde"] = "herbalism",
    ["bergbau"] = "mining",
    ["kürschnerei"] = "skinning",
    ["angel"] = "fishing",
    ["fischen"] = "fishing",
    ["erste hilfe"] = "first aid",
    ["kochkunst"] = "cooking",
    ["koch"] = "cook",
    
    -- Materials and Resources
    ["erz"] = "ore",
    ["zinnerz"] = "tin ore",
    ["silbererz"] = "silver ore",
    ["eisenerz"] = "iron ore",
    ["golderz"] = "gold ore",
    ["mithrilerz"] = "mithril ore",
    ["thoriumerz"] = "thorium ore",
    ["dunkeles eisenerz"] = "dark iron ore",
    ["barren"] = "bar",
    ["kupferbarren"] = "copper bar",
    ["zinnbarren"] = "tin bar",
    ["bronzebarren"] = "bronze bar",
    ["silberbarren"] = "silver bar",
    ["eisenbarren"] = "iron bar",
    ["goldbarren"] = "gold bar",
    ["stahlbarren"] = "steel bar",
    ["mithrilbarren"] = "mithril bar",
    ["thoriumbarren"] = "thorium bar",
    ["dunkeles eisen"] = "dark iron",
    ["friedensblume"] = "peacebloom",
    ["silberblatt"] = "silverleaf",
    ["erdwurzel"] = "earthroot",
    ["maguskönigskraut"] = "mage royal",
    ["würgetang"] = "stranglekelp",
    ["lebenswurzel"] = "liferoot",
    ["wilddornrose"] = "wild steelbloom",
    ["königskraut"] = "kingsblood",
    ["grave moss"] = "grave moss",
    ["winterbiss"] = "wintersbite",
    ["lodestone"] = "lodestone",
    ["golthorn"] = "golthorn",
    ["schwarze lotus"] = "black lotus",
    ["leichtes leder"] = "light leather",
    ["mittleres leder"] = "medium leather",
    ["schweres leder"] = "heavy leather",
    ["zartes leder"] = "rugged leather",
    ["dickes leder"] = "thick leather",
    ["leinenstoff"] = "linen cloth",
    ["wollstoff"] = "wool cloth",
    ["seidenstoff"] = "silk cloth",
    ["magiestoff"] = "mageweave cloth",
    ["runenstoff"] = "runecloth",
    
    -- Consumables
    ["heiltrank"] = "healing potion",
    ["manatrank"] = "mana potion",
    ["regenerationstrank"] = "regeneration potion",
    ["verstärkungstrank"] = "elixir",
    ["elixier"] = "elixir",
    ["fläschchen"] = "flask",
    ["essen"] = "food",
    ["getränk"] = "drink",
    ["brot"] = "bread",
    ["fleisch"] = "meat",
    ["fisch"] = "fish",
    ["bandage"] = "bandage",
    ["verband"] = "bandage",
    ["verbände"] = "bandages",
    
    -- Quest Terms
    ["questbelohnung"] = "quest reward",
    ["questgegenstand"] = "quest item",
    ["erfüllt"] = "completed",
    ["abgeschlossen"] = "completed",
    ["gelb"] = "yellow", -- Quest difficulty
    ["rot"] = "red",
    
    -- Combat Terms
    ["kampf"] = "combat",
    ["lebendig"] = "alive",
    ["hp"] = "health points",
    ["mp"] = "mana points",
    ["wut"] = "rage",
    ["energie"] = "energy",
    ["fokussieren"] = "focus",
    ["bedrohung"] = "threat",
    ["agro"] = "aggro",
    ["agro ziehen"] = "pull aggro",
    ["zieht agro"] = "pulls aggro",
    ["bedrohung reduzieren"] = "reduce threat",
    ["tanken"] = "tank",
    ["tankt"] = "tanks",
    ["debuffs"] = "debuffs",
    ["zauberspruch"] = "spell",
    ["zauber"] = "spell",
    ["fähigkeit"] = "ability",
    ["fähigkeiten"] = "abilities",
    ["talent"] = "talent",
    ["talente"] = "talents",
    ["fertigkeit"] = "skill",
    ["fertigkeiten"] = "skills",
    
    -- Group and Raid Terms
    ["gruppen"] = "groups",
    ["trash"] = "trash",
    ["müll"] = "trash",
    ["adds"] = "adds",
    ["pullt"] = "pulls",
    ["start"] = "start",
    ["stop"] = "stop",
    ["stopp"] = "stop",
    
    -- Classes (German names)
    ["druidin"] = "druid",
    
    -- Class Specializations
    ["waffenkrieger"] = "arms warrior",
    ["furor"] = "fury",
    ["furor krieger"] = "fury warrior",
    ["schutzkrieger"] = "protection warrior",
    ["heiliger"] = "holy",
    ["heiliger paladin"] = "holy paladin",
    ["schutzpaladin"] = "protection paladin",
    ["vergeltung"] = "retribution",
    ["vergeltungspaladin"] = "retribution paladin",
    ["tierherrschaft"] = "beast mastery",
    ["treffsicherheit"] = "marksmanship",
    ["überleben"] = "survival",
    ["täuschung"] = "subtlety",
    ["täuschung schurke"] = "subtlety rogue",
    ["kampfschurke"] = "combat rogue",
    ["meucheln"] = "assassination",
    ["meuchelschurke"] = "assassination rogue",
    ["heilungspriester"] = "holy priest",
    ["disziplin"] = "discipline",
    ["disziplinpriester"] = "discipline priest",
    ["schatten"] = "shadow",
    ["schattenpriest"] = "shadow priest",
    ["elementar"] = "elemental",
    ["elementarschamane"] = "elemental shaman",
    ["verstärkung"] = "enhancement",
    ["verstärkungsschamane"] = "enhancement shaman",
    ["wiederherstellung"] = "restoration",
    ["wiederherstellungsschamane"] = "restoration shaman",
    ["arkane magie"] = "arcane",
    ["arkanmagier"] = "arcane mage",
    ["feuer"] = "fire",
    ["feuermagier"] = "fire mage",
    ["frost"] = "frost",
    ["frostmagier"] = "frost mage",
    ["verderbnis"] = "affliction",
    ["verderbnishexenmeister"] = "affliction warlock",
    ["dämonologie"] = "demonology",
    ["dämonologiehexenmeister"] = "demonology warlock",
    ["zerstörung"] = "destruction",
    ["zerstörungshexenmeister"] = "destruction warlock",
    ["gleichgewicht"] = "balance",
    ["gleichgewichtdruide"] = "balance druid",
    ["wildheit"] = "feral",
    ["wildheitsdruide"] = "feral druid",
    ["wiederherstellungdruide"] = "restoration druid",
    
    -- Game Mechanics
    ["würfel"] = "roll",
    ["need"] = "need",
    ["greed"] = "greed",
    ["pass"] = "pass",
    ["verzichten"] = "pass",
    ["plündern"] = "loot",
    ["rollen"] = "roll",
    ["gratulation"] = "congratulations",
    ["gratuliere"] = "congratulations",
    ["g"] = "gold",
    ["s"] = "silver",
    ["c"] = "copper",
    
    -- Common WoW Terms
    ["bindung"] = "binding",
    ["beim aufheben gebunden"] = "binds on pickup",
    ["beim ausrüsten gebunden"] = "binds on equip",
    ["einmalig"] = "unique",
    ["set"] = "set",
    ["satz"] = "set",
    ["satzgegenstände"] = "set items",
    ["xp"] = "experience",
    ["levelbereich"] = "level range",
    ["mindestlevel"] = "minimum level",
    ["erforderliches level"] = "required level",
    
    -- Pet and Hunter terms
    ["pet"] = "pet",
    ["haustier"] = "pet",
    ["unter kontrolle"] = "under control",
    ["drücken"] = "press/push",
    ["drück"] = "press/push",
    ["rückruf"] = "recall/dismiss", -- Pet recall
    ["schießen"] = "shoot",
    ["schießt"] = "shoots",
    ["schieß"] = "shoot",
    ["mausrad"] = "mouse wheel",
    ["hoch"] = "up",
    ["runter"] = "down",
    ["defensiv"] = "defensive",
    ["aggro"] = "aggressive/aggro", -- Pet aggro mode
    ["aggressive"] = "aggressive",
    ["befehl"] = "command",
    ["auf befehl"] = "on command",
    ["makro"] = "macro",
    ["pathing"] = "pathfinding",
    ["fürn"] = "for the", -- Colloquial "für den"
    ["für den"] = "for the",
    ["arsch"] = "ass/butt", -- Vulgar but common gaming slang
    ["funktioniert"] = "worked/functions",
    ["funktionierte"] = "worked",
    ["funktionieren"] = "function/work",
    ["beleidigt"] = "insulted",
    ["beleidigen"] = "insult",
    ["abgehauen"] = "left/ran away", -- Colloquial
    ["abhauen"] = "run away/leave",
    ["hauen"] = "run away/leave",
    ["verdient"] = "deserved",
    ["verdienen"] = "deserve",
    ["egal"] = "doesn't matter/whatever",
    ["keko"] = "keko", -- Gaming slang, keep as-is
    ["nix"] = "nothing", -- Colloquial "nichts"
    ["nächste mal"] = "next time",
    ["nächstes mal"] = "next time",
    ["im call"] = "in call/on voice",
    ["call"] = "call/voice chat",
    ["los gelaufen"] = "ran away",
    ["losgelaufen"] = "ran away",
    ["gelaufen"] = "ran/run",
    ["vorm"] = "in front of", -- Colloquial "vor dem"
    ["vor dem"] = "in front of",
    ["genau vorm"] = "right in front of",
    ["ausgang"] = "exit",
    ["draußen"] = "outside",
    ["wäre draußen"] = "would be outside",
    
    -- Buildings and Structures
    ["turm"] = "tower", -- "auf den Turm" = "on the tower"
    ["türme"] = "towers",
    ["tower"] = "tower", -- Also accept English
    ["berg"] = "mountain", -- "auf den Berg" = "on the mountain"
    ["berge"] = "mountains",
    
    -- More common German words from chat analysis
    ["durfte"] = "was allowed to", -- "ich durfte" = "I was allowed to"
    ["durftest"] = "were allowed to",
    ["durften"] = "were allowed to",
    ["sahen"] = "saw",
    ["nahmen"] = "took",
    ["gaben"] = "gave",
    ["fand"] = "found", -- Past tense: "ich fand" = "I found"
    ["fanden"] = "found",
    ["kaufte"] = "bought", -- Past tense: "ich kaufte" = "I bought"
    ["kauften"] = "bought",
    ["verkaufte"] = "sold", -- Past tense: "ich verkaufte" = "I sold"
    ["verkauften"] = "sold",
    
    -- Common reflexive pronouns and particles
    ["sich"] = "oneself/itself/himself/herself", -- Reflexive pronoun
    
    -- ============================================
    -- MASSIVE VOCABULARY EXPANSION
    -- Organized by category for maintainability
    -- This structure serves as a template for other languages
    -- ============================================
    
    -- ============================================
    -- MODAL VERBS (Expanded)
    -- ============================================
    ["musst"] = "must/have to",
    ["müsst"] = "must/have to",
    ["sollt"] = "should",
    ["dürft"] = "may/are allowed to",
    
    -- ============================================
    -- COMMON ACTION VERBS (Expanded)
    -- ============================================
    ["tun"] = "do",
    ["tut"] = "does",
    ["tust"] = "do",
    ["redest"] = "talk/speak",
    ["reden"] = "talk/speak",
    ["spricht"] = "speaks/talks",
    ["sprechen"] = "speak/talk",
    ["hören"] = "hear/listen",
    ["hört"] = "hears/listens",
    ["hörst"] = "hear/listen",
    ["sehst"] = "see",
    ["schaust"] = "look/watch",
    ["findest"] = "find",
    ["verlierst"] = "lose",
    ["gewinnen"] = "win",
    ["gewinnt"] = "wins",
    ["gewinnst"] = "win",
    ["hilfst"] = "help",
    ["nimmst"] = "take",
    ["bringen"] = "bring",
    ["bringst"] = "bring",
    ["bringt"] = "brings",
    ["holen"] = "get/fetch",
    ["holst"] = "get/fetch",
    ["holt"] = "gets/fetches",
    ["legen"] = "lay/put",
    ["legst"] = "lay/put",
    ["legt"] = "lays/puts",
    ["stellen"] = "place/put",
    ["stellst"] = "place/put",
    ["stellt"] = "places/puts",
    ["setzen"] = "set/sit down",
    ["setzt"] = "set/sit down",
    
    -- ============================================
    -- COGNITION AND PERCEPTION VERBS
    -- ============================================
    ["weißt"] = "know (fact)",
    ["kennen"] = "know (person/thing)",
    ["kennst"] = "know (person/thing)",
    ["kennt"] = "knows (person/thing)",
    ["verstehst"] = "understand",
    ["versteht"] = "understands",
    ["vergessen"] = "forget",
    ["vergisst"] = "forget",
    ["erinnern"] = "remember",
    ["erinnerst"] = "remember",
    ["erinnert"] = "remembers",
    ["denken"] = "think",
    ["denkst"] = "think",
    ["denkt"] = "thinks",
    ["meinst"] = "mean/think",
    ["meint"] = "means/thinks",
    ["hoffen"] = "hope",
    ["hoffst"] = "hope",
    ["hofft"] = "hopes",
    ["wünschen"] = "wish",
    ["wünschst"] = "wish",
    ["wünscht"] = "wishes",
    ["lieben"] = "love",
    ["liebst"] = "love",
    ["liebt"] = "loves",
    ["hassen"] = "hate",
    ["hasst"] = "hate",
    ["fühlen"] = "feel",
    ["fühlst"] = "feel",
    ["fühlt"] = "feels",
    
    -- ============================================
    -- BODY PARTS
    -- ============================================
    ["kopf"] = "head",
    ["augen"] = "eyes",
    ["auge"] = "eye",
    ["ohren"] = "ears",
    ["nase"] = "nose",
    ["mund"] = "mouth",
    ["hand"] = "hand",
    ["hände"] = "hands",
    ["finger"] = "finger",
    ["füße"] = "feet",
    ["bein"] = "leg",
    ["beine"] = "legs",
    ["arm"] = "arm",
    ["armer"] = "poor", -- "armer Zwerg" = "poor dwarf"
    ["arme"] = "poor", -- Feminine form
    ["arme"] = "arms",
    ["rücken"] = "back",
    ["bauch"] = "stomach/belly",
    
    -- ============================================
    -- EMOTIONS AND FEELINGS
    -- ============================================
    ["traurig"] = "sad",
    ["wütend"] = "angry",
    ["ärgerlich"] = "annoyed",
    ["aufgeregt"] = "excited",
    ["unsicher"] = "unsure/uncertain",
    ["ängstlich"] = "afraid/scared",
    ["stolz"] = "proud",
    ["erfreut"] = "pleased",
    ["enttäuscht"] = "disappointed",
    
    -- ============================================
    -- TIME WORDS (Expanded)
    -- ============================================
    ["vorgestern"] = "day before yesterday",
    ["übermorgen"] = "day after tomorrow",
    ["morgens"] = "in the morning",
    ["mittags"] = "at noon",
    ["nachts"] = "at night",
    ["früh"] = "early",
    ["noch nicht"] = "not yet",
    ["meistens"] = "mostly/usually",
    
    -- ============================================
    -- LOCATION AND DIRECTION (Expanded)
    -- ============================================
    ["oben"] = "above/up",
    ["vorn"] = "front",
    ["innen"] = "inside",
    ["außen"] = "outside",
    ["drinnen"] = "inside",
    ["vorwärts"] = "forward",
    ["rückwärts"] = "backward",
    
    -- ============================================
    -- COMMON ADJECTIVES (Expanded)
    -- ============================================
    ["lang"] = "long",
    ["niedrig"] = "low",
    ["breit"] = "wide",
    ["eng"] = "narrow/tight",
    ["frisch"] = "fresh",
    ["warm"] = "warm",
    ["kühl"] = "cool",
    ["hell"] = "bright/light",
    ["sauber"] = "clean",
    ["schmutzig"] = "dirty",
    ["trocken"] = "dry",
    ["nass"] = "wet",
    
    -- ============================================
    -- FOOD AND DRINK
    -- ============================================
    ["isst"] = "eats",
    ["trinken"] = "drink",
    ["trinkt"] = "drinks",
    ["trinkst"] = "drink",
    ["obst"] = "fruit",
    ["gemüse"] = "vegetables",
    ["bier"] = "beer",
    ["kaffee"] = "coffee",
    ["tee"] = "tea",
    
    -- ============================================
    -- FAMILY AND RELATIONSHIPS
    -- ============================================
    ["familie"] = "family",
    ["vater"] = "father",
    ["mutter"] = "mother",
    ["sohn"] = "son",
    ["tochter"] = "daughter",
    ["bruder"] = "brother",
    ["schwester"] = "sister",
    ["nachbar"] = "neighbor",
    ["nachbarin"] = "neighbor (female)",
    
    -- ============================================
    -- NUMBERS (11-100)
    -- ============================================
    ["sechzehn"] = "sixteen",
    ["siebzehn"] = "seventeen",
    ["achtzehn"] = "eighteen",
    ["neunzehn"] = "nineteen",
    ["vierzig"] = "forty",
    ["sechzig"] = "sixty",
    ["siebzig"] = "seventy",
    ["achtzig"] = "eighty",
    ["neunzig"] = "ninety",
    ["tausend"] = "thousand",
    
    -- ============================================
    -- WEATHER AND NATURE
    -- ============================================
    ["wetter"] = "weather",
    ["sonne"] = "sun",
    ["regen"] = "rain",
    ["schnee"] = "snow",
    ["wind"] = "wind",
    ["wolke"] = "cloud",
    ["wolken"] = "clouds",
    ["bäume"] = "trees",
    ["baum"] = "tree",
    ["gras"] = "grass",
    ["blumen"] = "flowers",
    ["blume"] = "flower",
    ["tier"] = "animal",
    ["tiere"] = "animals",
    
    -- ============================================
    -- SCHOOL AND WORK
    -- ============================================
    ["schule"] = "school",
    ["büro"] = "office",
    ["prüfung"] = "exam/test",
    ["unterricht"] = "lesson/class",
    
    -- ============================================
    -- TRANSPORTATION
    -- ============================================
    ["auto"] = "car",
    ["autoinvite"] = "autoinvite", -- Gaming command (keep as English)
    ["fahrrad"] = "bicycle",
    ["zug"] = "train",
    ["bus"] = "bus",
    ["flugzeug"] = "airplane",
    ["schiff"] = "ship",
    ["fahren"] = "drive/travel",
    ["fährst"] = "drive/travel",
    ["fährt"] = "drives/travels",
    ["fliegen"] = "fly",
    ["fliegst"] = "fly",
    ["fliegt"] = "flies",
    
    -- ============================================
    -- COMMON ADVERBS (Expanded)
    -- ============================================
    ["gar"] = "at all",
    ["gar nicht"] = "not at all",
    ["außerdem"] = "besides/moreover",
    ["darum"] = "because of that",
    ["jedoch"] = "however",
    ["allerdings"] = "however/though",
    
    -- ============================================
    -- HOUSEHOLD ITEMS
    -- ============================================
    ["wohnung"] = "apartment",
    ["zimmer"] = "room",
    ["küche"] = "kitchen",
    ["schlafzimmer"] = "bedroom",
    ["tisch"] = "table",
    ["stuhl"] = "chair",
    ["bett"] = "bed",
    ["tür"] = "door",
    ["lampe"] = "lamp",
    
    -- ============================================
    -- CLOTHING
    -- ============================================
    ["kleidung"] = "clothing",
    ["hemd"] = "shirt",
    ["schuhe"] = "shoes",
    ["schuh"] = "shoe",
    ["jacke"] = "jacket",
    ["mantel"] = "coat",
    ["hut"] = "hat",
    ["mütze"] = "cap",
    
    -- ============================================
    -- TECHNOLOGY AND COMMUNICATION
    -- ============================================
    ["computer"] = "computer",
    ["telefon"] = "telephone",
    ["internet"] = "internet",
    ["email"] = "email",
    ["telefonieren"] = "make a phone call",
    ["anrufen"] = "call",
    ["ruft an"] = "calls",
    ["rufst an"] = "call",
    ["schreibst"] = "write",
    
    -- ============================================
    -- HEALTH AND MEDICAL
    -- ============================================
    ["arzt"] = "doctor",
    ["ärztin"] = "doctor (female)",
    ["krankenhaus"] = "hospital",
    ["medizin"] = "medicine",
    ["tablette"] = "pill/tablet",
    ["schmerz"] = "pain",
    ["kopfschmerzen"] = "headache",
    ["weh"] = "pain/ache",
    
    -- ============================================
    -- COLORS (Expanded)
    -- ============================================
    ["schwarz"] = "black",
    ["braun"] = "brown",
    ["rosa"] = "pink",
    ["bunt"] = "colorful",
    
    -- ============================================
    -- MORE PREPOSITIONS (Expanded)
    -- ============================================
    ["hinter"] = "behind",
    ["neben"] = "next to/beside",
    ["zwischen"] = "between",
    ["entlang"] = "along",
    ["gegenüber"] = "opposite",
    
    -- ============================================
    -- CONJUNCTIONS (Expanded)
    -- ============================================
    ["seitdem"] = "since then",
    ["solange"] = "as long as",
    ["sobald"] = "as soon as",
    
    -- ============================================
    -- LEARNING AND EDUCATION VERBS
    -- ============================================
    ["lehren"] = "teach",
    ["lehrt"] = "teaches",
    
    -- ============================================
    -- BODY ACTIONS (Expanded)
    -- ============================================
    ["springen"] = "jump",
    ["springst"] = "jump",
    ["springt"] = "jumps",
    ["schwimmst"] = "swim",
    ["schwimmt"] = "swims",
    ["tanzen"] = "dance",
    ["tanzt"] = "dance",
    ["sitzt"] = "sit",
    ["steht"] = "stands",
    
    -- ============================================
    -- POSSESSION AND OWNERSHIP
    -- ============================================
    ["besitzen"] = "own/possess",
    ["besitzt"] = "own/possess",
    ["gehören"] = "belong",
    ["gehörst"] = "belong",
    ["gehört"] = "belongs",
    ["bezahlen"] = "pay",
    ["zahlst"] = "pay",
    ["zahlt"] = "pays",
    
    -- ============================================
    -- TIME EXPRESSIONS (Expanded)
    -- ============================================
    ["uhr"] = "o'clock/clock",
    ["jahreszeit"] = "season",
    ["frühling"] = "spring",
    ["sommer"] = "summer",
    ["herbst"] = "autumn/fall",
    ["winter"] = "winter",
    
    -- ============================================
    -- DAYS OF THE WEEK
    -- ============================================
    ["montag"] = "Monday",
    ["dienstag"] = "Tuesday",
    ["mittwoch"] = "Wednesday",
    ["donnerstag"] = "Thursday",
    ["freitag"] = "Friday",
    ["samstag"] = "Saturday",
    ["sonntag"] = "Sunday",
    ["wochentag"] = "weekday",
    ["wochenende"] = "weekend",
    
    -- ============================================
    -- MONTHS
    -- ============================================
    ["januar"] = "January",
    ["februar"] = "February",
    ["märz"] = "March",
    ["april"] = "April",
    ["mai"] = "May",
    ["juni"] = "June",
    ["juli"] = "July",
    ["august"] = "August",
    ["september"] = "September",
    ["oktober"] = "October",
    ["november"] = "November",
    ["dezember"] = "December",
    
    -- ============================================
    -- ADDITIONAL VERBS (Continued Expansion)
    -- ============================================
    ["arbeiten"] = "work",
    ["arbeitest"] = "work",
    ["arbeitet"] = "works",
    ["spielst"] = "play",
    ["wohnen"] = "live/reside",
    ["wohnst"] = "live/reside",
    ["wohnt"] = "lives/resides",
    ["gehst"] = "go/walk",
    ["kochen"] = "cook",
    ["kochst"] = "cook",
    ["kocht"] = "cooks",
    ["backen"] = "bake",
    ["backst"] = "bake",
    ["backt"] = "bakes",
    ["waschen"] = "wash",
    ["wäschst"] = "wash",
    ["wäscht"] = "washes",
    ["putzen"] = "clean",
    ["putzt"] = "clean",
    ["aufräumen"] = "tidy up/clean up",
    ["räumst auf"] = "tidy up",
    ["räumt auf"] = "tidies up",
    ["kaufst"] = "buy",
    ["verkaufst"] = "sell",
    ["schenken"] = "give as gift",
    ["schenkst"] = "give as gift",
    ["schenkt"] = "gives as gift",
    ["leihst"] = "lend/borrow",
    ["reparieren"] = "repair",
    ["reparierst"] = "repair",
    ["repariert"] = "repairs",
    ["baust"] = "build",
    ["öffnest"] = "open",
    ["schließen"] = "close",
    ["schließt"] = "close",
    ["beginnst"] = "begin/start",
    ["enden"] = "end",
    ["endest"] = "end",
    ["endet"] = "ends",
    ["aufhören"] = "stop",
    ["hörst auf"] = "stop",
    ["hört auf"] = "stops",
    ["weiter machen"] = "continue",
    ["machst weiter"] = "continue",
    ["macht weiter"] = "continues",
    
    -- ============================================
    -- MOVEMENT AND MOTION VERBS
    -- ============================================
    ["bewegen"] = "move",
    ["bewegst"] = "move",
    ["bewegt"] = "moves",
    ["rennen"] = "run",
    ["rennst"] = "run",
    ["rennt"] = "runs",
    ["steigen"] = "climb/ascend",
    ["steigst"] = "climb/ascend",
    ["steigt"] = "climbs/ascends",
    ["fallen"] = "fall",
    ["fällst"] = "fall",
    ["fällt"] = "falls",
    ["steigst ein"] = "get in",
    ["steigt ein"] = "gets in",
    ["aussteigen"] = "get out/off",
    ["steigst aus"] = "get out",
    ["steigt aus"] = "gets out",
    ["drehen"] = "turn",
    ["drehst"] = "turn",
    ["dreht"] = "turns",
    ["wenden"] = "turn around",
    ["wendest"] = "turn around",
    ["wendet"] = "turns around",
    
    -- ============================================
    -- COMMUNICATION VERBS (Expanded)
    -- ============================================
    ["erzählen"] = "tell/narrate",
    ["erzählst"] = "tell/narrate",
    ["erzählt"] = "tells/narrates",
    ["fragen"] = "ask",
    ["fragst"] = "ask",
    ["fragt"] = "asks",
    ["antworten"] = "answer",
    ["antwortest"] = "answer",
    ["antwortet"] = "answers",
    ["erklären"] = "explain",
    ["erklärst"] = "explain",
    ["erklärt"] = "explains",
    ["beschreiben"] = "describe",
    ["beschreibst"] = "describe",
    ["beschreibt"] = "describes",
    ["zeigen"] = "show",
    ["zeigst"] = "show",
    ["zeigt"] = "shows",
    ["vorstellen"] = "introduce/imagine",
    ["stellst vor"] = "introduce",
    ["stellt vor"] = "introduces",
    ["grüßen"] = "greet",
    ["grüßt"] = "greet",
    ["verabschieden"] = "say goodbye",
    ["verabschiedest"] = "say goodbye",
    ["verabschiedet"] = "says goodbye",
    ["bittest"] = "ask/request",
    ["bittet"] = "asks/requests",
    ["danken"] = "thank",
    ["dankst"] = "thank",
    ["dankt"] = "thanks",
    ["entschuldigen"] = "apologize/excuse",
    ["entschuldigst"] = "apologize",
    ["entschuldigt"] = "apologizes",
    
    -- ============================================
    -- PERCEPTION AND SENSES
    -- ============================================
    ["riechen"] = "smell",
    ["riechst"] = "smell",
    ["riecht"] = "smells",
    ["schmecken"] = "taste",
    ["schmeckst"] = "taste",
    ["schmeckt"] = "tastes",
    ["berühren"] = "touch",
    ["berührst"] = "touch",
    ["berührt"] = "touches",
    
    -- ============================================
    -- EMOTIONAL AND MENTAL STATES
    -- ============================================
    ["lachst"] = "laugh",
    ["lacht"] = "laughs",
    ["weinen"] = "cry",
    ["weinst"] = "cry",
    ["weint"] = "cries",
    ["lächeln"] = "smile",
    ["lächelst"] = "smile",
    ["lächelt"] = "smiles",
    ["sorgen"] = "worry",
    ["sorgst"] = "worry",
    ["sorgt"] = "worries",
    ["freust"] = "be happy",
    ["ärgern"] = "annoy/anger",
    ["ärgerst"] = "annoy",
    ["ärgert"] = "annoys",
    ["aufregen"] = "excite/upset",
    ["regst auf"] = "excite",
    ["regt auf"] = "excites",
    
    -- ============================================
    -- OBJECTS AND THINGS
    -- ============================================
    ["dinge"] = "things",
    ["sache"] = "thing/matter",
    ["gegenstand"] = "object/item",
    ["teil"] = "part",
    ["teile"] = "parts",
    ["stück"] = "piece",
    ["stücke"] = "pieces",
    ["art"] = "type/kind",
    ["arten"] = "types/kinds",
    ["weise"] = "way/manner",
    ["form"] = "form/shape",
    ["formen"] = "forms/shapes",
    ["größe"] = "size",
    ["größen"] = "sizes",
    ["farbe"] = "color",
    ["farben"] = "colors",
    
    -- ============================================
    -- BUILDINGS AND PLACES (Expanded)
    -- ============================================
    ["gebäude"] = "building",
    ["kirche"] = "church",
    ["kirchen"] = "churches",
    ["schulen"] = "schools",
    ["universität"] = "university",
    ["krankenhäuser"] = "hospitals",
    ["geschäft"] = "shop/store",
    ["geschäfte"] = "shops/stores",
    ["laden"] = "shop/store",
    ["läden"] = "shops/stores",
    ["märkte"] = "markets",
    ["restaurant"] = "restaurant",
    ["restaurants"] = "restaurants",
    ["café"] = "cafe",
    ["park"] = "park",
    ["parks"] = "parks",
    ["platz"] = "square/place",
    ["plätze"] = "squares/places",
    ["straße"] = "street",
    ["straßen"] = "streets",
    ["weg"] = "path/way",
    ["wege"] = "paths/ways",
    ["brücke"] = "bridge",
    ["brücken"] = "bridges",
    ["tunnel"] = "tunnel",
    
    -- ============================================
    -- NATURE AND GEOGRAPHY
    -- ============================================
    ["täler"] = "valleys",
    ["seen"] = "lakes",
    ["fluss"] = "river",
    ["flüsse"] = "rivers",
    ["bach"] = "stream/brook",
    ["bäche"] = "streams/brooks",
    ["ozean"] = "ocean",
    ["inseln"] = "islands",
    ["strände"] = "beaches",
    ["küsten"] = "coasts",
    ["wüsten"] = "deserts",
    ["stein"] = "stone/rock",
    ["steine"] = "stones/rocks",
    ["felsen"] = "rock/cliff",
    ["erde"] = "earth/ground",
    ["boden"] = "ground/floor",
    ["himmel"] = "sky/heaven",
    ["stern"] = "star",
    ["sterne"] = "stars",
    ["mond"] = "moon",
    
    -- ============================================
    -- ANIMALS (Expanded)
    -- ============================================
    ["hund"] = "dog",
    ["hunde"] = "dogs",
    ["katze"] = "cat",
    ["katzen"] = "cats",
    ["pferd"] = "horse",
    ["pferde"] = "horses",
    ["kuh"] = "cow",
    ["kühe"] = "cows",
    ["schwein"] = "pig",
    ["schweine"] = "pigs",
    ["schaf"] = "sheep",
    ["schafe"] = "sheep",
    ["ziege"] = "goat",
    ["ziegen"] = "goats",
    ["vogel"] = "bird",
    ["vögel"] = "birds",
    ["fische"] = "fishes",
    ["maus"] = "mouse",
    ["mäuse"] = "mice",
    ["elefant"] = "elephant",
    ["elefanten"] = "elephants",
    ["löwe"] = "lion",
    ["löwen"] = "lions",
    ["tiger"] = "tiger",
    ["wolf"] = "wolf",
    ["wölfe"] = "wolves",
    
    -- ============================================
    -- MATERIALS AND SUBSTANCES
    -- ============================================
    ["holz"] = "wood",
    ["metall"] = "metal",
    ["glas"] = "glass",
    ["papier"] = "paper",
    ["luft"] = "air",
    ["erdgas"] = "natural gas",
    ["öl"] = "oil",
    
    -- ============================================
    -- BODY ACTIONS AND PHYSICAL VERBS
    -- ============================================
    ["triffst"] = "meet/hit",
    ["trifft"] = "meets/hits",
    ["schlagen"] = "hit/strike",
    ["schlägst"] = "hit/strike",
    ["schlägt"] = "hits/strikes",
    ["schützen"] = "protect",
    ["schützst"] = "protect",
    ["schützt"] = "protects",
    ["kämpfen"] = "fight",
    ["kämpfst"] = "fight",
    ["kämpft"] = "fights",
    ["verstecken"] = "hide",
    ["versteckst"] = "hide",
    ["versteckt"] = "hides",
    ["entdecken"] = "discover",
    ["entdeckst"] = "discover",
    ["entdeckt"] = "discovers",
    
    -- ============================================
    -- TIME-RELATED VERBS
    -- ============================================
    ["wartest"] = "wait",
    ["dauern"] = "last/take time",
    ["dauerst"] = "last",
    ["dauert"] = "lasts",
    ["frühstücken"] = "have breakfast",
    ["frühstückst"] = "have breakfast",
    ["frühstückt"] = "has breakfast",
    ["mittagessen"] = "have lunch",
    ["isst mittag"] = "have lunch",
    ["abendessen"] = "have dinner",
    ["isst abend"] = "have dinner",
    
    -- ============================================
    -- MORE ADJECTIVES (Expanded)
    -- ============================================
    ["klug"] = "smart/clever",
    ["dumm"] = "stupid",
    ["faul"] = "lazy",
    ["fleißig"] = "hardworking",
    ["ehrlich"] = "honest",
    ["unehrlich"] = "dishonest",
    ["unfreundlich"] = "unfriendly",
    ["höflich"] = "polite",
    ["unhöflich"] = "impolite",
    ["ruhig"] = "quiet/calm",
    ["laut"] = "loud",
    ["still"] = "silent",
    ["wach"] = "awake",
    ["schlaf"] = "sleep/sleeping",
    ["hungrig"] = "hungry",
    ["durstig"] = "thirsty",
    ["satt"] = "full/satisfied",
    ["reich"] = "rich",
    ["teuer"] = "expensive",
    ["billig"] = "cheap",
    ["kostenlos"] = "free (cost)",
    ["frei"] = "free/available",
    ["besetzt"] = "occupied/busy",
    ["jung"] = "young",
    ["modern"] = "modern",
    ["altmodisch"] = "old-fashioned",
    ["wahr"] = "true",
    ["unwahr"] = "untrue",
    ["wichtig"] = "important",
    ["unwichtig"] = "unimportant",
    ["ernst"] = "serious",
    ["gefährlich"] = "dangerous",
    ["kompliziert"] = "complicated",
    ["ordentlich"] = "neat/tidy",
    ["unordentlich"] = "messy",
    ["unklar"] = "unclear",
    ["pünktlich"] = "on time",
    ["verspätet"] = "late/delayed",
    ["beschäftigt"] = "busy",
    ["verfügbar"] = "available",
    
    -- ============================================
    -- MORE ADVERBS (Expanded)
    -- ============================================
    ["wirklich"] = "really/actually",
    ["tatsächlich"] = "actually/in fact",
    ["sogar"] = "even",
    ["hauptsächlich"] = "mainly",
    ["möglicherweise"] = "possibly",
    ["sicherlich"] = "certainly",
    ["glücklicherweise"] = "fortunately",
    ["hoffentlich"] = "hopefully",
    ["völlig"] = "completely",
    ["ziemlich"] = "quite/rather",
    ["einigermaßen"] = "somewhat",
    ["relativ"] = "relatively",
    ["absolut"] = "absolutely",
    ["ungefähr"] = "approximately/about",
    ["kaum"] = "hardly/scarcely",
    ["ebenfalls"] = "also/as well",
    ["gleichfalls"] = "likewise",
    ["dagegen"] = "against it/on the other hand",
    ["dennoch"] = "nevertheless",
    ["andererseits"] = "on the other hand",
    ["einerseits"] = "on one hand",
    ["zusätzlich"] = "additionally",
    ["darüber hinaus"] = "beyond that/furthermore",
    ["deswegen"] = "because of that",
    ["demnach"] = "accordingly/therefore",
    ["dementsprechend"] = "accordingly",
    ["folglich"] = "consequently",
    ["somit"] = "thus/therefore",
    ["infolgedessen"] = "as a result",
    
    -- ============================================
    -- SPORTS AND ACTIVITIES
    -- ============================================
    ["sport"] = "sport",
    ["fußball"] = "soccer/football",
    ["tennis"] = "tennis",
    ["basketball"] = "basketball",
    ["radfahren"] = "cycling",
    ["wandern"] = "hiking",
    ["klettern"] = "climbing",
    ["musik"] = "music",
    ["instrument"] = "instrument",
    ["gitarre"] = "guitar",
    ["klavier"] = "piano",
    ["singen"] = "sing",
    ["singst"] = "sing",
    ["singt"] = "sings",
    
    -- ============================================
    -- PROFESSIONS AND JOBS (Expanded)
    -- ============================================
    ["beruf"] = "profession/job",
    ["berufe"] = "professions/jobs",
    ["lehrer"] = "teacher",
    ["lehrerin"] = "teacher (female)",
    ["student"] = "student",
    ["studentin"] = "student (female)",
    ["professor"] = "professor",
    ["professorin"] = "professor (female)",
    ["krankenschwester"] = "nurse",
    ["pfleger"] = "nurse/caregiver",
    ["pflegerin"] = "nurse/caregiver (female)",
    ["ingenieurin"] = "engineer (female)",
    ["architekt"] = "architect",
    ["architektin"] = "architect (female)",
    ["künstler"] = "artist",
    ["künstlerin"] = "artist (female)",
    ["musiker"] = "musician",
    ["musikerin"] = "musician (female)",
    ["schriftsteller"] = "writer",
    ["schriftstellerin"] = "writer (female)",
    ["journalist"] = "journalist",
    ["journalistin"] = "journalist (female)",
    ["verkäufer"] = "salesperson",
    ["verkäuferin"] = "salesperson (female)",
    ["kellner"] = "waiter",
    ["kellnerin"] = "waitress",
    ["köchin"] = "cook/chef (female)",
    ["polizist"] = "police officer",
    ["polizistin"] = "police officer (female)",
    ["feuerwehrmann"] = "firefighter",
    ["feuerwehrfrau"] = "firefighter (female)",
    
    -- ============================================
    -- MORE ABSTRACT CONCEPTS
    -- ============================================
    ["liebe"] = "love",
    ["haß"] = "hate",
    ["freundschaft"] = "friendship",
    ["unglück"] = "misfortune",
    ["trauer"] = "sadness/grief",
    ["freude"] = "joy",
    ["angst"] = "fear",
    ["hoffnung"] = "hope",
    ["zweifel"] = "doubt",
    ["vertrauen"] = "trust",
    ["misstrauen"] = "mistrust",
    ["traum"] = "dream",
    ["träume"] = "dreams",
    ["wirklichkeit"] = "reality",
    ["fantasie"] = "fantasy/imagination",
    ["vorstellung"] = "idea/imagination",
    ["gedanke"] = "thought",
    ["gedanken"] = "thoughts",
    ["idee"] = "idea",
    ["ideen"] = "ideas",
    ["plan"] = "plan",
    ["pläne"] = "plans",
    ["wunsch"] = "wish",
    ["wünsche"] = "wishes",
    ["befehle"] = "commands/orders",
    ["regel"] = "rule",
    ["regeln"] = "rules",
    ["gesetz"] = "law",
    ["gesetze"] = "laws",
    ["recht"] = "right/law",
    ["pflicht"] = "duty/obligation",
    ["pflichten"] = "duties/obligations",
    ["verantwortung"] = "responsibility",
    ["freiheit"] = "freedom",
    ["gerechtigkeit"] = "justice",
    ["ungerechtigkeit"] = "injustice",
    ["gleichheit"] = "equality",
    ["ungleichheit"] = "inequality",
    
    -- ============================================
    -- QUANTITY AND AMOUNT WORDS
    -- ============================================
    ["meiste"] = "most",
    ["meisten"] = "most",
    ["einige"] = "some",
    ["etliche"] = "quite a few",
    ["ein paar"] = "a few/a couple",
    ["einpaar"] = "a few/a couple", -- Variant spelling without space
    ["paar"] = "couple/pair",
    ["paare"] = "couples/pairs",
    ["jede"] = "every/each",
    ["jedes"] = "every/each",
    ["manche"] = "some",
    ["irgendwas"] = "anything",
    ["gemeinsam"] = "together",
    ["einzeln"] = "individually/single",
    
    -- ============================================
    -- GAMING-SPECIFIC TERMS (Expanded)
    -- ============================================
    ["spielerin"] = "player (female)",
    ["gegnerin"] = "opponent/enemy (female)",
    ["mannschaft"] = "team",
    ["mannschaften"] = "teams",
    ["sieg"] = "victory/win",
    ["siege"] = "victories/wins",
    ["niederlage"] = "defeat/loss",
    ["niederlagen"] = "defeats/losses",
    ["punkt"] = "point",
    ["punkte"] = "points",
    ["punktzahl"] = "score",
    ["punktezahl"] = "score",
    ["rang"] = "rank",
    ["ränge"] = "ranks",
    ["niveau"] = "level",
    ["niveaus"] = "levels",
    ["erfahrungen"] = "experiences",
    ["rüstungen"] = "armor pieces",
    ["magie"] = "magic",
    ["magisch"] = "magical",
    ["kämpfe"] = "fights/battles",
    ["schlacht"] = "battle",
    ["schlachten"] = "battles",
    ["kriege"] = "wars",
    
    -- ============================================
    -- INTERNET AND COMPUTER TERMS (Expanded)
    -- ============================================
    ["seite"] = "page/site",
    ["seiten"] = "pages/sites",
    ["website"] = "website",
    ["websites"] = "websites",
    ["download"] = "download",
    ["downloaden"] = "download",
    ["hochladen"] = "upload",
    ["uploaden"] = "upload",
    ["datei"] = "file",
    ["dateien"] = "files",
    ["ordner"] = "folder",
    ["programm"] = "program",
    ["programme"] = "programs",
    ["anwendung"] = "application/app",
    ["anwendungen"] = "applications/apps",
    ["app"] = "app",
    ["apps"] = "apps",
    ["software"] = "software",
    ["hardware"] = "hardware",
    ["bildschirm"] = "screen",
    ["bildschirme"] = "screens",
    ["tastatur"] = "keyboard",
    ["tastaturen"] = "keyboards",
    ["drucker"] = "printer",
    ["drucken"] = "print",
    ["druckst"] = "print",
    ["druckt"] = "prints",
    
    -- ============================================
    -- FOOD-RELATED VERBS AND NOUNS (Expanded)
    -- ============================================
    ["frühstück"] = "breakfast",
    ["mahlzeit"] = "meal",
    ["mahlzeiten"] = "meals",
    ["snack"] = "snack",
    ["snacks"] = "snacks",
    ["getränke"] = "drinks/beverages",
    ["kartoffel"] = "potato",
    ["kartoffeln"] = "potatoes",
    ["tomate"] = "tomato",
    ["tomaten"] = "tomatoes",
    ["apfel"] = "apple",
    ["äpfel"] = "apples",
    ["birne"] = "pear",
    ["birnen"] = "pears",
    ["banane"] = "banana",
    ["bananen"] = "bananas",
    ["erdbeere"] = "strawberry",
    ["erdbeeren"] = "strawberries",
    ["milch"] = "milk",
    ["butter"] = "butter",
    ["käse"] = "cheese",
    ["ei"] = "egg",
    ["eier"] = "eggs",
    ["nudeln"] = "noodles/pasta",
    ["reis"] = "rice",
    ["nudel"] = "noodle",
    ["suppe"] = "soup",
    ["suppen"] = "soups",
    ["salat"] = "salad",
    ["salate"] = "salads",
    
    -- ============================================
    -- WEATHER-RELATED WORDS (Expanded)
    -- ============================================
    ["sonnig"] = "sunny",
    ["bewölkt"] = "cloudy",
    ["regnerisch"] = "rainy",
    ["schneit"] = "snowing",
    ["schneien"] = "snow",
    ["regnet"] = "raining",
    ["regnen"] = "rain",
    ["windig"] = "windy",
    ["stürmisch"] = "stormy",
    ["gewitter"] = "thunderstorm",
    ["blitz"] = "lightning",
    ["donner"] = "thunder",
    ["nebel"] = "fog",
    ["nebelig"] = "foggy",
    ["feucht"] = "humid/moist",
    ["temperatur"] = "temperature",
    ["temperaturen"] = "temperatures",
    
    -- ============================================
    -- MORE PREPOSITIONS AND PARTICLE WORDS
    -- ============================================
    ["gemäß"] = "according to",
    ["entsprechend"] = "according to",
    ["zufolge"] = "according to",
    ["zuliebe"] = "for the sake of",
    ["zuwider"] = "contrary to",
    ["entgegen"] = "contrary to/against",
    
    -- ============================================
    -- MORE CONJUNCTIONS AND CONNECTORS
    -- ============================================
    ["beziehungsweise"] = "or respectively",
    ["sowie"] = "as well as",
    ["weder...noch"] = "neither...nor",
    ["sowohl...als auch"] = "both...and",
    ["entweder...oder"] = "either...or",
    ["anstatt"] = "instead of",
    ["stattdessen"] = "instead",
    ["außer"] = "except/besides",
    ["außer wenn"] = "except when",
    ["es sei denn"] = "unless",
    
    -- ============================================
    -- EXPRESSIONS OF CAUSE AND EFFECT
    -- ============================================
    ["aufgrund"] = "due to",
    ["infolge"] = "as a result of",
    ["dank"] = "thanks to",
    ["obgleich"] = "although",
    ["wenn auch"] = "even though",
    ["auch wenn"] = "even if",
    
    -- ============================================
    -- EXPRESSIONS OF PURPOSE AND INTENT
    -- ============================================
    ["um...zu"] = "in order to",
    ["zwecks"] = "for the purpose of",
    ["zweck"] = "purpose",
    ["absichten"] = "intentions",
    
    -- ============================================
    -- MORE VERB PREFIXES AND SEPARABLE VERBS
    -- ============================================
    ["aus"] = "out/from",
    ["über"] = "over/about",
    ["unter"] = "under",
    
    -- ============================================
    -- HOUSEHOLD ITEMS (Expanded)
    -- ============================================
    ["bettdecke"] = "blanket/comforter",
    ["kissen"] = "pillow",
    ["bettwäsche"] = "bedding",
    ["matratze"] = "mattress",
    ["schrank"] = "wardrobe/closet",
    ["schränke"] = "wardrobes/closets",
    ["regal"] = "shelf",
    ["regale"] = "shelves",
    ["schublade"] = "drawer",
    ["schubladen"] = "drawers",
    ["spiegel"] = "mirror",
    ["bild"] = "picture",
    ["bilder"] = "pictures",
    ["foto"] = "photo",
    ["fotos"] = "photos",
    ["vorhang"] = "curtain",
    ["vorhänge"] = "curtains",
    ["teppich"] = "carpet/rug",
    ["teppiche"] = "carpets/rugs",
    ["sofa"] = "sofa",
    ["sofas"] = "sofas",
    ["sessel"] = "armchair",
    ["kühlschrank"] = "refrigerator",
    ["kühlschränke"] = "refrigerators",
    ["herd"] = "stove",
    ["herde"] = "stoves",
    ["ofen"] = "oven",
    ["öfen"] = "ovens",
    ["mikrowelle"] = "microwave",
    ["mikrowellen"] = "microwaves",
    ["geschirrspüler"] = "dishwasher",
    ["waschmaschine"] = "washing machine",
    ["waschmaschinen"] = "washing machines",
    ["trockner"] = "dryer",
    
    -- ============================================
    -- CLOTHING AND ACCESSORIES (Expanded)
    -- ============================================
    ["pullover"] = "sweater",
    ["t-shirt"] = "t-shirt",
    ["t-shirts"] = "t-shirts",
    ["hosen"] = "pants/trousers",
    ["jeans"] = "jeans",
    ["röcke"] = "skirts",
    ["kleid"] = "dress",
    ["kleider"] = "dresses",
    ["socke"] = "sock",
    ["socken"] = "socks",
    ["strumpf"] = "stocking",
    ["strümpfe"] = "stockings",
    ["unterwäsche"] = "underwear",
    ["pyjama"] = "pajamas",
    ["sandalen"] = "sandals",
    ["handschuh"] = "glove",
    ["schal"] = "scarf",
    ["schals"] = "scarves",
    ["hüte"] = "hats",
    ["brille"] = "glasses",
    ["sonnenbrille"] = "sunglasses",
    ["uhren"] = "watches/clocks",
    ["kette"] = "necklace/chain",
    ["ketten"] = "necklaces/chains",
    ["ohrring"] = "earring",
    ["ohrringe"] = "earrings",
    ["rucksack"] = "backpack",
    ["rucksäcke"] = "backpacks",
    
    -- ============================================
    -- SCHOOL AND LEARNING (Expanded)
    -- ============================================
    ["bücher"] = "books",
    ["heft"] = "notebook",
    ["hefte"] = "notebooks",
    ["stift"] = "pen/pencil",
    ["stifte"] = "pens/pencils",
    ["bleistift"] = "pencil",
    ["bleistifte"] = "pencils",
    ["kugelschreiber"] = "ballpoint pen",
    ["radiergummi"] = "eraser",
    ["radiergummis"] = "erasers",
    ["lineal"] = "ruler",
    ["lineale"] = "rulers",
    ["schere"] = "scissors",
    ["scheren"] = "scissors",
    ["taschenrechner"] = "calculator",
    ["tafel"] = "blackboard",
    ["tafeln"] = "blackboards",
    ["kreide"] = "chalk",
    ["marker"] = "marker",
    ["textmarker"] = "highlighter",
    ["klasse"] = "class",
    ["klassen"] = "classes",
    ["kurs"] = "course",
    ["kurse"] = "courses",
    ["pausen"] = "breaks",
    ["hausaufgabe"] = "homework",
    ["hausaufgaben"] = "homework",
    ["prüfungen"] = "exams/tests",
    ["test"] = "test",
    ["tests"] = "tests",
    ["klausur"] = "exam",
    ["klausuren"] = "exams",
    ["note"] = "grade",
    ["noten"] = "grades",
    ["zeugnis"] = "report card/certificate",
    ["zeugnisse"] = "report cards/certificates",
    
    -- ============================================
    -- TIME-RELATED WORDS (Expanded)
    -- ============================================
    ["stunden"] = "hours",
    ["wochen"] = "weeks",
    ["monate"] = "months",
    ["jahrzehnt"] = "decade",
    ["jahrzehnte"] = "decades",
    ["jahrhundert"] = "century",
    ["jahrhunderte"] = "centuries",
    ["moment"] = "moment",
    ["momente"] = "moments",
    ["augenblick"] = "moment/instant",
    ["augenblicke"] = "moments/instants",
    ["zeitpunkte"] = "points in time",
    ["zeitraum"] = "period of time",
    ["zeiträume"] = "periods of time",
    ["dauer"] = "duration",
    ["geschwindigkeit"] = "speed",
    ["geschwindigkeiten"] = "speeds",
    ["tempus"] = "tempo",
    
    -- ============================================
    -- BODY AND HEALTH (Expanded)
    -- ============================================
    ["körper"] = "body",
    ["körperteil"] = "body part",
    ["körperteile"] = "body parts",
    ["gesicht"] = "face",
    ["gesichter"] = "faces",
    ["haut"] = "skin",
    ["haar"] = "hair",
    ["haare"] = "hair",
    ["nagel"] = "nail",
    ["nägel"] = "nails",
    ["zahn"] = "tooth",
    ["zähne"] = "teeth",
    ["zunge"] = "tongue",
    ["zungen"] = "tongues",
    ["lippe"] = "lip",
    ["lippen"] = "lips",
    ["wange"] = "cheek",
    ["wangen"] = "cheeks",
    ["stirn"] = "forehead",
    ["kinn"] = "chin",
    ["kinne"] = "chins",
    ["hals"] = "neck/throat",
    ["hälse"] = "necks/throats",
    ["brüste"] = "chests/breasts",
    ["bäuche"] = "stomachs/bellies",
    ["knie"] = "knife",
    ["knöchel"] = "ankle",
    ["zeh"] = "toe",
    ["zehen"] = "toes",
    ["organ"] = "organ",
    ["organe"] = "organs",
    ["herzen"] = "hearts",
    ["lunge"] = "lung",
    ["lungen"] = "lungs",
    ["leber"] = "liver",
    ["lebern"] = "livers",
    ["magen"] = "stomach",
    ["mägen"] = "stomachs",
    ["blut"] = "blood",
    ["knochen"] = "bone",
    ["muskel"] = "muscle",
    ["muskeln"] = "muscles",
    ["nerv"] = "nerve",
    ["nerven"] = "nerves",
    ["gehirn"] = "brain",
    ["gehirne"] = "brains",
    
    -- ============================================
    -- MEDICAL AND HEALTH TERMS (Expanded)
    -- ============================================
    ["krankheit"] = "disease/illness",
    ["krankheiten"] = "diseases/illnesses",
    ["symptom"] = "symptom",
    ["symptome"] = "symptoms",
    ["fieber"] = "fever",
    ["husten"] = "cough",
    ["hustet"] = "coughs",
    ["niesen"] = "sneeze",
    ["niest"] = "sneezes",
    ["schnupfen"] = "cold/runny nose",
    ["grippe"] = "flu",
    ["allergie"] = "allergy",
    ["allergien"] = "allergies",
    ["verletzung"] = "injury",
    ["verletzungen"] = "injuries",
    ["wunde"] = "wound",
    ["wunden"] = "wounds",
    ["pflaster"] = "band-aid/plaster",
    ["tabletten"] = "pills/tablets",
    ["medikament"] = "medication",
    ["medikamente"] = "medications",
    ["arzneimittel"] = "medicine",
    ["operation"] = "operation/surgery",
    ["operationen"] = "operations/surgeries",
    ["krankenwagen"] = "ambulance",
    
    -- ============================================
    -- FAMILY RELATIONSHIPS (Expanded)
    -- ============================================
    ["familien"] = "families",
    ["eltern"] = "parents",
    ["väter"] = "fathers/dads",
    ["mütter"] = "mothers/moms",
    ["söhne"] = "sons",
    ["töchter"] = "daughters",
    ["brüder"] = "brothers",
    ["schwestern"] = "sisters",
    ["großvater"] = "grandfather",
    ["großväter"] = "grandfathers",
    ["oma"] = "grandmother",
    ["omas"] = "grandmothers",
    ["großmutter"] = "grandmother",
    ["großmütter"] = "grandmothers",
    ["opa"] = "grandfather",
    ["opas"] = "grandfathers",
    ["enkel"] = "grandson",
    ["enkelin"] = "granddaughter",
    ["enkelinnen"] = "granddaughters",
    ["onkel"] = "uncle",
    ["tante"] = "aunt",
    ["tanten"] = "aunts",
    ["cousin"] = "cousin (male)",
    ["cousins"] = "cousins (male)",
    ["cousine"] = "cousin (female)",
    ["cousinen"] = "cousins (female)",
    ["neffe"] = "nephew",
    ["neffen"] = "nephews",
    ["nichte"] = "niece",
    ["nichten"] = "nieces",
    ["schwager"] = "brother-in-law",
    ["schwäger"] = "brothers-in-law",
    ["schwägerin"] = "sister-in-law",
    ["schwägerinnen"] = "sisters-in-law",
    ["schwiegereltern"] = "parents-in-law",
    ["schwiegerkind"] = "child-in-law",
    ["schwiegerkinder"] = "children-in-law",
    
    -- ============================================
    -- RELATIONSHIPS AND SOCIAL (Expanded)
    -- ============================================
    ["freundin"] = "friend/girlfriend",
    ["freundinnen"] = "friends",
    ["bekannter"] = "acquaintance",
    ["bekannte"] = "acquaintances",
    ["kollegin"] = "colleague (female)",
    ["kolleginnen"] = "colleagues (female)",
    ["nachbarn"] = "neighbors",
    ["nachbarinnen"] = "neighbors (female)",
    ["partner"] = "partner",
    ["partnerin"] = "partner (female)",
    ["partnerinnen"] = "partners (female)",
    ["mann"] = "man/husband",
    ["männer"] = "men/husbands",
    ["frau"] = "woman/wife",
    ["frauen"] = "women/wives",
    ["person"] = "person",
    ["kind"] = "child",
    ["kinder"] = "children",
    ["junge"] = "boy",
    ["jungen"] = "boys",
    ["mädchen"] = "girl",
    ["baby"] = "baby",
    ["babys"] = "babies",
    ["jugendlicher"] = "teenager",
    ["jugendliche"] = "teenagers",
    ["erwachsener"] = "adult",
    ["erwachsene"] = "adults",
    
    -- ============================================
    -- EMOTIONS AND FEELINGS (Expanded)
    -- ============================================
    ["gefühl"] = "feeling",
    ["gefühle"] = "feelings",
    ["emotion"] = "emotion",
    ["emotionen"] = "emotions",
    ["stimmung"] = "mood/atmosphere",
    ["stimmungen"] = "moods/atmospheres",
    ["laune"] = "mood",
    ["launen"] = "moods",
    ["ärger"] = "anger/annoyance",
    ["enttäuschung"] = "disappointment",
    ["enttäuschungen"] = "disappointments",
    ["hoffnungen"] = "hopes",
    ["sympathie"] = "sympathy/liking",
    ["antipathie"] = "antipathy/dislike",
    ["bewunderung"] = "admiration",
    ["neid"] = "envy",
    ["eifersucht"] = "jealousy",
    ["scham"] = "shame",
    ["schuld"] = "guilt/fault",
    ["reue"] = "remorse/regret",
    ["erleichterung"] = "relief",
    ["überraschung"] = "surprise",
    ["überraschungen"] = "surprises",
    ["verwirrung"] = "confusion",
    ["verwirrungen"] = "confusions",
    
    -- ============================================
    -- SENSES AND PERCEPTION (Expanded)
    -- ============================================
    ["sinn"] = "sense",
    ["sinne"] = "senses",
    ["geschmack"] = "taste/flavor",
    ["geschmäcker"] = "tastes/flavors",
    ["geruch"] = "smell/scent",
    ["gerüche"] = "smells/scents",
    ["geräusch"] = "sound/noise",
    ["geräusche"] = "sounds/noises",
    ["lärm"] = "noise",
    ["stille"] = "silence",
    ["helligkeit"] = "brightness",
    ["dunkelheit"] = "darkness",
    ["blick"] = "look/glance",
    ["blicke"] = "looks/glances",
    ["ansicht"] = "view/opinion",
    ["ansichten"] = "views/opinions",
    
    -- ============================================
    -- WEATHER PHENOMENA (Expanded)
    -- ============================================
    ["regenbogen"] = "rainbow",
    ["regenbögen"] = "rainbows",
    ["hagel"] = "hail",
    ["eis"] = "ice",
    ["eisregen"] = "freezing rain",
    ["tau"] = "dew",
    ["dunst"] = "haze",
    ["dampf"] = "steam/vapor",
    ["luftdruck"] = "air pressure",
    ["feuchtigkeit"] = "humidity",
    ["luftfeuchtigkeit"] = "air humidity",
    ["niederschlag"] = "precipitation",
    ["niederschläge"] = "precipitations",
    
    -- ============================================
    -- MORE NATURE TERMS (Expanded)
    -- ============================================
    ["pflanze"] = "plant",
    ["pflanzen"] = "plants",
    ["strauch"] = "bush/shrub",
    ["sträucher"] = "bushes/shrubs",
    ["moos"] = "moss",
    ["pilz"] = "mushroom",
    ["pilze"] = "mushrooms",
    ["beere"] = "berry",
    ["beeren"] = "berries",
    ["nuss"] = "nut",
    ["nüsse"] = "nuts",
    ["samen"] = "seed",
    ["wurzel"] = "root",
    ["wurzeln"] = "roots",
    ["blatt"] = "leaf",
    ["blätter"] = "leaves",
    ["zweig"] = "branch",
    ["zweige"] = "branches",
    ["ast"] = "branch",
    ["äste"] = "branches",
    ["rinde"] = "bark",
    ["stamm"] = "trunk/stem",
    ["stämme"] = "trunks/stems",
    
    -- ============================================
    -- VERBS OF CHANGE AND TRANSFORMATION
    -- ============================================
    ["änderst"] = "change",
    ["verändern"] = "change/alter",
    ["veränderst"] = "change/alter",
    ["verändert"] = "changes/alters",
    ["wechseln"] = "change/switch",
    ["wechselst"] = "change/switch",
    ["wechselt"] = "changes/switches",
    ["tauschen"] = "exchange/swap",
    ["tauschst"] = "exchange/swap",
    ["tauscht"] = "exchanges/swaps",
    ["umwandeln"] = "convert/transform",
    ["wandeln um"] = "convert",
    ["wandelt um"] = "converts",
    ["umformen"] = "reshape/transform",
    ["formst um"] = "reshape",
    ["formt um"] = "reshapes",
    ["verwandeln"] = "transform",
    ["verwandelst"] = "transform",
    ["verwandelt"] = "transforms",
    ["entwickeln"] = "develop",
    ["entwickelst"] = "develop",
    ["entwickelt"] = "develops",
    ["wachsen"] = "grow",
    ["wächst"] = "grows",
    ["wachst"] = "grow",
    ["schrumpfen"] = "shrink",
    ["schrumpfst"] = "shrink",
    ["schrumpft"] = "shrinks",
    ["zunehmen"] = "increase/gain",
    ["nimmst zu"] = "increase",
    ["nimmt zu"] = "increases",
    ["abnehmen"] = "decrease/lose",
    ["nimmst ab"] = "decrease",
    ["nimmt ab"] = "decreases",
    
    -- ============================================
    -- VERBS OF CREATION AND DESTRUCTION
    -- ============================================
    ["erstellen"] = "create/make",
    ["erstellst"] = "create",
    ["erstellt"] = "creates",
    ["produzieren"] = "produce",
    ["produzierst"] = "produce",
    ["produziert"] = "produces",
    ["stellst her"] = "make",
    ["konstruieren"] = "construct",
    ["konstruierst"] = "construct",
    ["konstruiert"] = "constructs",
    ["zerstören"] = "destroy",
    ["zerstörst"] = "destroy",
    ["zerstört"] = "destroys",
    ["kaputt machen"] = "break",
    ["machst kaputt"] = "break",
    ["macht kaputt"] = "breaks",
    ["abreißen"] = "tear down/demolish",
    ["reißt ab"] = "tear down",
    ["vernichten"] = "destroy/eliminate",
    ["vernichtest"] = "destroy",
    ["vernichtet"] = "destroys",
    
    -- ============================================
    -- VERBS OF TRANSFER AND MOVEMENT
    -- ============================================
    ["gibst"] = "give",
    ["bekommst"] = "get/receive",
    ["erhalten"] = "receive/get",
    ["erhältst"] = "receive",
    ["erhält"] = "receives",
    ["übergeben"] = "hand over",
    ["gibst über"] = "hand over",
    ["gibt über"] = "hands over",
    ["überreichen"] = "present/hand over",
    ["reichst über"] = "present",
    ["reicht über"] = "presents",
    ["schicken"] = "send",
    ["schickst"] = "send",
    ["senden"] = "send",
    ["sendest"] = "send",
    ["sendet"] = "sends",
    ["versenden"] = "dispatch/send",
    ["versendest"] = "dispatch",
    ["versendet"] = "dispatches",
    ["empfangen"] = "receive",
    ["empfängst"] = "receive",
    ["empfängt"] = "receives",
    ["liefern"] = "deliver",
    ["lieferst"] = "deliver",
    ["liefert"] = "delivers",
    ["transportieren"] = "transport",
    ["transportierst"] = "transport",
    ["transportiert"] = "transports",
    
    -- ============================================
    -- VERBS OF POSSESSION AND CONTROL
    -- ============================================
    ["kontrollieren"] = "control",
    ["kontrollierst"] = "control",
    ["kontrolliert"] = "controls",
    ["steuern"] = "steer/control",
    ["steuerst"] = "steer",
    ["steuert"] = "steers",
    ["verwalten"] = "manage/administer",
    ["verwaltest"] = "manage",
    ["verwaltet"] = "manages",
    ["leiten"] = "lead/direct",
    ["leitest"] = "lead",
    ["leitet"] = "leads",
    ["führen"] = "lead/guide",
    ["führst"] = "lead",
    ["führt"] = "leads",
    ["regieren"] = "govern/rule",
    ["regierst"] = "govern",
    ["regiert"] = "governs",
    ["herrschen"] = "rule/reign",
    ["herrschst"] = "rule",
    ["herrscht"] = "rules",
    
    -- ============================================
    -- MORE COMMON VERBS (Additional)
    -- ============================================
    ["erwartest"] = "expect",
    ["erwartet"] = "expects",
    ["gewartet"] = "waited",
    ["aufgehört"] = "stopped",
    ["fängst an"] = "start",
    ["beenden"] = "end/finish",
    ["beendest"] = "end",
    ["beendet"] = "ends",
    ["fortsetzen"] = "continue",
    ["setzt fort"] = "continue",
    ["setzen fort"] = "continue",
    ["fortgesetzt"] = "continued",
    ["verschieben"] = "move/postpone",
    ["verschiebst"] = "move",
    ["verschiebt"] = "moves",
    ["verschoben"] = "moved",
    ["verbessern"] = "improve",
    ["verbesserst"] = "improve",
    ["verbessert"] = "improves",
    ["löschen"] = "delete/erase",
    ["löschst"] = "delete",
    ["löscht"] = "deletes",
    ["gelöscht"] = "deleted",
    ["kopieren"] = "copy",
    ["kopierst"] = "copy",
    ["kopiert"] = "copies",
    ["einrichten"] = "set up/configure",
    ["richtest ein"] = "set up",
    ["richtet ein"] = "sets up",
    ["eingerichtet"] = "set up",
    ["konfigurieren"] = "configure",
    ["konfigurierst"] = "configure",
    ["konfiguriert"] = "configures",
    ["aktivieren"] = "activate/enable",
    ["aktivierst"] = "activate",
    ["aktiviert"] = "activates",
    ["deaktivieren"] = "deactivate/disable",
    ["deaktivierst"] = "deactivate",
    ["deaktiviert"] = "deactivates",
    ["einloggen"] = "log in",
    ["loggst ein"] = "log in",
    ["loggt ein"] = "logs in",
    ["eingeloggt"] = "logged in",
    ["ausloggen"] = "log out",
    ["loggst aus"] = "log out",
    ["loggt aus"] = "logs out",
    ["ausgeloggt"] = "logged out",
    ["verbinden"] = "connect",
    ["verbindest"] = "connect",
    ["verbindet"] = "connects",
    ["verbunden"] = "connected",
    ["trennen"] = "disconnect/separate",
    ["trennst"] = "disconnect",
    ["trennt"] = "disconnects",
    ["getrennt"] = "disconnected",
    ["gewonnen"] = "won",
    ["bezahlt"] = "paid",
    ["gekostet"] = "cost",
    ["getauscht"] = "traded",
    ["geschenkt"] = "given",
    ["zurückgeben"] = "return/give back",
    ["gibst zurück"] = "return",
    ["gibt zurück"] = "returns",
    ["zurückgegeben"] = "returned",
    ["ausleihen"] = "borrow",
    ["leihst aus"] = "borrow",
    ["leiht aus"] = "borrows",
    ["ausgeliehen"] = "borrowed",
    
    -- ============================================
    -- MORE COMMON NOUNS AND GAMING TERMS
    -- ============================================
    ["zeiten"] = "times",
    ["uhrzeit"] = "time",
    ["mittag"] = "noon/midday",
    ["abende"] = "evenings",
    ["nächte"] = "nights",
    ["vorhin"] = "earlier/before",
    ["innerhalb"] = "within",
    ["außerhalb"] = "outside",
    ["vorne"] = "in front",
    ["rechts"] = "right",
    ["mitte"] = "middle/center",
    ["ecke"] = "corner",
    ["ecken"] = "corners",
    ["rand"] = "edge",
    ["ränder"] = "edges",
    ["anfänge"] = "beginnings",
    ["ende"] = "end",
    ["hälfte"] = "half",
    ["hälften"] = "halves",
    ["zahl"] = "number",
    ["zahlen"] = "numbers",
    ["anzahl"] = "number/quantity",
    ["anzahlen"] = "numbers",
    ["keines"] = "no/none",
    ["irgendetwas"] = "anything",
    ["wenigste"] = "fewest",
    ["wenigsten"] = "fewest",
    ["am meisten"] = "most",
    ["am wenigsten"] = "least",
    ["vieles"] = "much",
    ["weniges"] = "little",
    ["zu viele"] = "too many",
    ["zu wenige"] = "too few",
    ["mehr als"] = "more than",
    ["weniger als"] = "less than",
    ["gleich viel"] = "as much",
    ["gleich viele"] = "as many",
    ["so viel"] = "so much",
    ["so viele"] = "so many",
    ["wie groß"] = "how big",
    ["wie klein"] = "how small",
    ["wie alt"] = "how old",
    ["wie neu"] = "how new",
    ["wie gut"] = "how good",
    ["wie schlecht"] = "how bad",
    ["wie schnell"] = "how fast",
    ["wie langsam"] = "how slow",
    ["wie teuer"] = "how expensive",
    ["wie billig"] = "how cheap",
    ["wie wichtig"] = "how important",
    ["wie unwichtig"] = "how unimportant",
    ["wie nützlich"] = "how useful",
    ["wie unnütz"] = "how useless",
    ["wie möglich"] = "how possible",
    ["wie unmöglich"] = "how impossible",
    ["wie wahrscheinlich"] = "how probable",
    ["wie unwahrscheinlich"] = "how improbable",
    ["wie sicher"] = "how safe",
    ["wie unsicher"] = "how unsafe",
    ["wie gefährlich"] = "how dangerous",
    ["wie ungefährlich"] = "how not dangerous",
    ["wie stark"] = "how strong",
    ["wie schwach"] = "how weak",
    ["wie mächtig"] = "how powerful",
    ["wie machtlos"] = "how powerless",
    ["wie riesig"] = "how huge",
    ["wie winzig"] = "how tiny",
    ["wie hoch"] = "how high",
    ["wie niedrig"] = "how low",
    ["wie tief"] = "how deep",
    ["wie breit"] = "how wide",
    ["wie schmal"] = "how narrow",
    ["wie lang"] = "how long",
    ["wie kurz"] = "how short",
    ["wie jung"] = "how young",
    ["wie frisch"] = "how fresh",
    ["wie altmodisch"] = "how old-fashioned",
    ["wie modern"] = "how modern",
    ["wie kostenlos"] = "how free",
    ["wie wertvoll"] = "how valuable",
    ["wie wertlos"] = "how worthless",
    ["wie reich"] = "how rich",
    ["wie arm"] = "how poor",
    ["wie vollständig"] = "how complete",
    ["wie unvollständig"] = "how incomplete",
    ["wie fertig"] = "how ready",
    ["wie unfertig"] = "how unfinished",
    ["wie bereit"] = "how ready",
    ["wie unbereit"] = "how not ready",
    ["wie frei"] = "how free",
    ["wie besetzt"] = "how occupied",
    ["wie verfügbar"] = "how available",
    ["wie leer"] = "how empty",
    ["wie voll"] = "how full",
    ["wie offen"] = "how open",
    ["wie geschlossen"] = "how closed",
    ["wie zugänglich"] = "how accessible",
    ["wie unzugänglich"] = "how inaccessible",
    ["wie sichtbar"] = "how visible",
    ["wie unsichtbar"] = "how invisible",
    ["wie klar"] = "how clear",
    ["wie unklar"] = "how unclear",
    ["wie deutlich"] = "how clear",
    ["wie undeutlich"] = "how unclear",
    ["wie scharf"] = "how sharp",
    ["wie stumpf"] = "how dull",
    ["wie sauber"] = "how clean",
    ["wie schmutzig"] = "how dirty",
    ["wie hell"] = "how bright",
    ["wie dunkel"] = "how dark",
    ["wie leuchtend"] = "how glowing",
    ["wie glänzend"] = "how shiny",
    ["wie matt"] = "how dull",
    ["wie laut"] = "how loud",
    ["wie leise"] = "how quiet",
    ["wie still"] = "how silent",
    ["wie ruhig"] = "how calm",
    ["wie unruhig"] = "how restless",
    ["wie heiß"] = "how hot",
    ["wie kalt"] = "how cold",
    ["wie warm"] = "how warm",
    ["wie kühl"] = "how cool",
    ["wie trocken"] = "how dry",
    ["wie nass"] = "how wet",
    ["wie feucht"] = "how moist",
    ["wie weich"] = "how soft",
    ["wie hart"] = "how hard",
    ["wie fest"] = "how solid",
    ["wie flüssig"] = "how liquid",
    ["wie gasförmig"] = "how gaseous",
    ["wie glatt"] = "how smooth",
    ["wie rau"] = "how rough",
    ["wie steif"] = "how stiff",
    ["wie flexibel"] = "how flexible",
    ["wie starr"] = "how rigid",
    ["wie beweglich"] = "how mobile",
    ["wie unbeweglich"] = "how immobile",
    ["wie stabil"] = "how stable",
    ["wie instabil"] = "how unstable",
    ["wie harmlos"] = "how harmless",
    ["wie zuverlässig"] = "how reliable",
    ["wie unzuverlässig"] = "how unreliable",
    ["wie genau"] = "how exact",
    ["wie ungenau"] = "how inexact",
    ["wie richtig"] = "how correct",
    ["wie falsch"] = "how wrong",
    ["wie korrekt"] = "how correct",
    ["wie inkorrekt"] = "how incorrect",
    ["wie wahr"] = "how true",
    ["wie echt"] = "how real",
    ["wie unecht"] = "how fake",
    ["wie authentisch"] = "how authentic",
    ["wie original"] = "how original",
    ["wie kopiert"] = "how copied",
    ["wie nachgemacht"] = "how imitated",
    ["wie einzigartig"] = "how unique",
    ["wie gewöhnlich"] = "how common",
    ["wie ungewöhnlich"] = "how unusual",
    ["wie selten"] = "how rare",
    ["wie häufig"] = "how frequent",
    ["wie normal"] = "how normal",
    ["wie unnormal"] = "how abnormal",
    ["wie besonders"] = "how special",
    ["wie speziell"] = "how special",
    ["wie allgemein"] = "how general",
    ["wie spezifisch"] = "how specific",
    ["wie typisch"] = "how typical",
    ["wie untypisch"] = "how atypical",
    ["wie üblich"] = "how usual",
    ["wie unüblich"] = "how unusual",
    ["wie traditionell"] = "how traditional",
    ["wie zeitgemäß"] = "how contemporary",
    ["wie veraltet"] = "how outdated",
    ["wie aktuell"] = "how current",
    ["wie gültig"] = "how valid",
    ["wie ungültig"] = "how invalid",
    ["wie wirksam"] = "how effective",
    ["wie unwirksam"] = "how ineffective",
    ["wie effektiv"] = "how efficient",
    ["wie ineffektiv"] = "how inefficient",
    ["wie produktiv"] = "how productive",
    ["wie unproduktiv"] = "how unproductive",
    ["wie aktiv"] = "how active",
    ["wie inaktiv"] = "how inactive",
    ["wie passiv"] = "how passive",
    ["wie tätig"] = "how active",
    ["wie untätig"] = "how inactive",
    ["wie beschäftigt"] = "how busy",
    
    -- ============================================
    -- VERBS OF ATTEMPT AND SUCCESS
    -- ============================================
    ["schneller"] = "faster",
    ["schnellste"] = "fastest",
    ["langsamste"] = "slowest",
    ["leichter"] = "easier/lighter",
    ["leichteste"] = "easiest/lightest",
    ["schwerer"] = "harder/heavier",
    ["schwerste"] = "hardest/heaviest",
    ["einfacher"] = "simpler/easier",
    ["einfachste"] = "simplest/easiest",
    ["komplizierter"] = "more complicated",
    ["komplizierteste"] = "most complicated",
    ["wichtiger"] = "more important",
    ["wichtigste"] = "most important",
    ["nützlich"] = "useful",
    ["nützlicher"] = "more useful",
    ["nützlichste"] = "most useful",
    ["unnütz"] = "useless",
    ["unbrauchbar"] = "unusable",
    ["möglich"] = "possible",
    ["möglicher"] = "more possible",
    ["möglichste"] = "most possible",
    ["unmöglich"] = "impossible",
    ["wahrscheinlicher"] = "more probable",
    ["wahrscheinlichste"] = "most probable",
    ["unwahrscheinlich"] = "improbable/unlikely",
    ["sicherer"] = "safer/more certain",
    ["sicherste"] = "safest/most certain",
    ["gefährlicher"] = "more dangerous",
    ["gefährlichste"] = "most dangerous",
    ["ungefährlich"] = "not dangerous",
    ["stärker"] = "stronger",
    ["stärkste"] = "strongest",
    ["schwächer"] = "weaker",
    ["schwächste"] = "weakest",
    ["mächtig"] = "powerful",
    ["mächtiger"] = "more powerful",
    ["mächtigste"] = "most powerful",
    ["machtlos"] = "powerless",
    ["schlechter"] = "worse",
    ["schlechteste"] = "worst",
    ["größer"] = "bigger",
    ["größte"] = "biggest",
    ["kleiner"] = "smaller",
    ["kleinste"] = "smallest",
    ["riesig"] = "huge",
    ["riesiger"] = "huger",
    ["riesigste"] = "hugest",
    ["winzig"] = "tiny",
    ["winziger"] = "tinier",
    ["winzigste"] = "tiniest",
    ["höher"] = "higher",
    ["höchste"] = "highest",
    ["niedriger"] = "lower",
    ["niedrigste"] = "lowest",
    ["tief"] = "deep",
    ["tiefer"] = "deeper",
    ["tiefste"] = "deepest",
    ["breiter"] = "wider",
    ["breiteste"] = "widest",
    ["schmal"] = "narrow",
    ["schmaler"] = "narrower",
    ["schmalste"] = "narrowest",
    ["länger"] = "longer",
    ["längste"] = "longest",
    ["kürzer"] = "shorter",
    ["kürzeste"] = "shortest",
    ["neuer"] = "newer",
    ["neueste"] = "newest",
    ["älter"] = "older",
    ["älteste"] = "oldest",
    ["jünger"] = "younger",
    ["jüngste"] = "youngest",
    ["frischer"] = "fresher",
    ["frischste"] = "freshest",
    ["moderner"] = "more modern",
    ["modernste"] = "most modern",
    ["teurer"] = "more expensive",
    ["teuerste"] = "most expensive",
    ["billiger"] = "cheaper",
    ["billigste"] = "cheapest",
    ["wertvoll"] = "valuable",
    ["wertvoller"] = "more valuable",
    ["wertvollste"] = "most valuable",
    ["wertlos"] = "worthless",
    ["reicher"] = "richer",
    ["reichste"] = "richest",
    ["ärmer"] = "poorer",
    ["ärmste"] = "poorest",
    ["vollständig"] = "complete",
    ["vollständiger"] = "more complete",
    ["vollständigste"] = "most complete",
    ["unvollständig"] = "incomplete",
    ["fertiger"] = "more ready",
    ["fertigste"] = "most ready",
    ["unfertig"] = "unfinished",
    ["bereiter"] = "more ready",
    ["bereiteste"] = "most ready",
    ["unbereit"] = "not ready",
    ["freier"] = "freer/more available",
    ["freiste"] = "freest/most available",
    ["verfügbarer"] = "more available",
    ["verfügbarste"] = "most available",
    ["nicht verfügbar"] = "not available",
    ["leerer"] = "emptier",
    ["leerste"] = "emptiest",
    ["voller"] = "fuller",
    ["vollste"] = "fullest",
    ["offen"] = "open",
    ["offener"] = "more open",
    ["offenste"] = "most open",
    ["geschlossen"] = "closed",
    ["zugänglich"] = "accessible",
    ["zugänglicher"] = "more accessible",
    ["zugänglichste"] = "most accessible",
    ["unzugänglich"] = "inaccessible",
    ["sichtbar"] = "visible",
    ["sichtbarer"] = "more visible",
    ["sichtbarste"] = "most visible",
    ["unsichtbar"] = "invisible",
    ["klarer"] = "clearer",
    ["klarste"] = "clearest",
    ["deutlich"] = "clear/distinct",
    ["deutlicher"] = "clearer",
    ["deutlichste"] = "clearest",
    ["undeutlich"] = "unclear",
    ["scharf"] = "sharp",
    ["schärfer"] = "sharper",
    ["schärfste"] = "sharpest",
    ["stumpf"] = "dull",
    ["stumpfer"] = "duller",
    ["stumpfste"] = "dullest",
    ["sauberer"] = "cleaner",
    ["sauberste"] = "cleanest",
    ["schmutziger"] = "dirtier",
    ["schmutzigste"] = "dirtiest",
    ["heller"] = "brighter",
    ["hellste"] = "brightest",
    ["dunkler"] = "darker",
    ["dunkelste"] = "darkest",
    ["leuchtend"] = "glowing/bright",
    ["leuchtender"] = "brighter",
    ["leuchtendste"] = "brightest",
    ["glänzend"] = "shiny",
    ["glänzender"] = "shinier",
    ["glänzendste"] = "shiniest",
    ["matt"] = "dull/matte",
    ["matter"] = "duller",
    ["matteste"] = "dullest",
    ["lauter"] = "louder",
    ["lauteste"] = "loudest",
    ["leise"] = "quiet",
    ["leiser"] = "quieter",
    ["leiseste"] = "quietest",
    ["stiller"] = "quieter",
    ["stillste"] = "quietest",
    ["ruhiger"] = "calmer",
    ["ruhigste"] = "calmest",
    ["unruhig"] = "restless",
    ["heiß"] = "hot",
    ["heißer"] = "hotter",
    ["heißeste"] = "hottest",
    ["kalt"] = "cold",
    ["kälter"] = "colder",
    ["kälteste"] = "coldest",
    ["wärmer"] = "warmer",
    ["wärmste"] = "warmest",
    ["kühler"] = "cooler",
    ["kühlste"] = "coolest",
    ["trockener"] = "drier",
    ["trockenste"] = "driest",
    ["nasser"] = "wetter",
    ["nasseste"] = "wettest",
    ["feuchter"] = "moister",
    ["feuchteste"] = "moistest",
    ["weich"] = "soft",
    ["weicher"] = "softer",
    ["weichste"] = "softest",
    ["hart"] = "hard",
    ["härter"] = "harder",
    ["härteste"] = "hardest",
    ["fest"] = "solid/firm",
    ["fester"] = "firmer",
    ["festeste"] = "firmest",
    ["flüssig"] = "liquid",
    ["flüssiger"] = "more liquid",
    ["flüssigste"] = "most liquid",
    ["gasförmig"] = "gaseous",
    ["glatt"] = "smooth",
    ["glatter"] = "smoother",
    ["glatteste"] = "smoothest",
    ["rau"] = "rough",
    ["rauer"] = "rougher",
    ["raueste"] = "roughest",
    ["steif"] = "stiff",
    ["steifer"] = "stiffer",
    ["steifste"] = "stiffest",
    ["flexibel"] = "flexible",
    ["flexibler"] = "more flexible",
    ["flexibelste"] = "most flexible",
    ["starr"] = "rigid",
    ["starrer"] = "more rigid",
    ["starrste"] = "most rigid",
    ["beweglich"] = "mobile/movable",
    ["beweglicher"] = "more mobile",
    ["beweglichste"] = "most mobile",
    ["unbeweglich"] = "immobile",
    ["stabil"] = "stable",
    ["stabiler"] = "more stable",
    ["stabilste"] = "most stable",
    ["instabil"] = "unstable",
    ["harmlos"] = "harmless",
    ["harmloser"] = "more harmless",
    ["harmloseste"] = "most harmless",
    ["zuverlässig"] = "reliable",
    ["zuverlässiger"] = "more reliable",
    ["zuverlässigste"] = "most reliable",
    ["unzuverlässig"] = "unreliable",
    ["genauer"] = "more exact",
    ["genaueste"] = "most exact",
    ["ungenau"] = "inexact/imprecise",
    ["richtiger"] = "more correct",
    ["richtigste"] = "most correct",
    ["falscher"] = "more wrong",
    ["falschste"] = "most wrong",
    ["korrekt"] = "correct",
    ["korrekter"] = "more correct",
    ["korrekteste"] = "most correct",
    ["inkorrekt"] = "incorrect",
    ["wahrer"] = "truer",
    ["wahrste"] = "truest",
    ["echt"] = "real/genuine",
    ["echter"] = "more real",
    ["echteste"] = "most real",
    ["unecht"] = "fake",
    ["authentisch"] = "authentic",
    ["authentischer"] = "more authentic",
    ["authentischste"] = "most authentic",
    ["unechter"] = "faker",
    ["unechteste"] = "fakest",
    ["original"] = "original",
    ["originaler"] = "more original",
    ["originalste"] = "most original",
    ["nachgemacht"] = "imitated",
    ["einzigartig"] = "unique",
    ["einzigartiger"] = "more unique",
    ["einzigartigste"] = "most unique",
    ["gewöhnlicher"] = "more common",
    ["gewöhnlichste"] = "most common",
    ["seltener"] = "rarer",
    ["seltenste"] = "rarest",
    ["häufig"] = "frequent/common",
    ["häufiger"] = "more frequent",
    ["häufigste"] = "most frequent",
    ["normal"] = "normal",
    ["normaler"] = "more normal",
    ["normalste"] = "most normal",
    ["unnormal"] = "abnormal",
    ["besonderer"] = "more special",
    ["besonderste"] = "most special",
    ["speziell"] = "special",
    ["spezieller"] = "more special",
    ["speziellste"] = "most special",
    ["allgemein"] = "general",
    ["allgemeiner"] = "more general",
    ["allgemeinste"] = "most general",
    ["spezifisch"] = "specific",
    ["spezifischer"] = "more specific",
    ["spezifischste"] = "most specific",
    ["typisch"] = "typical",
    ["typischer"] = "more typical",
    ["typischste"] = "most typical",
    ["untypisch"] = "atypical",
    ["üblich"] = "usual/common",
    ["üblicher"] = "more usual",
    ["üblichste"] = "most usual",
    ["unüblich"] = "unusual",
    ["traditionell"] = "traditional",
    ["traditioneller"] = "more traditional",
    ["traditionellste"] = "most traditional",
    ["zeitgemäß"] = "contemporary",
    ["zeitgemäßer"] = "more contemporary",
    ["zeitgemäßeste"] = "most contemporary",
    ["veraltet"] = "outdated",
    ["aktuell"] = "current/up-to-date",
    ["aktueller"] = "more current",
    ["aktuellste"] = "most current",
    ["abgelaufen"] = "expired",
    ["gültig"] = "valid",
    ["gültiger"] = "more valid",
    ["gültigste"] = "most valid",
    ["ungültig"] = "invalid",
    ["wirksam"] = "effective",
    ["wirksamer"] = "more effective",
    ["wirksamste"] = "most effective",
    ["unwirksam"] = "ineffective",
    ["effektiv"] = "efficient",
    ["effektiver"] = "more efficient",
    ["effektivste"] = "most efficient",
    ["ineffektiv"] = "inefficient",
    ["produktiv"] = "productive",
    ["produktiver"] = "more productive",
    ["produktivste"] = "most productive",
    ["unproduktiv"] = "unproductive",
    ["aktiver"] = "more active",
    ["aktivste"] = "most active",
    ["inaktiv"] = "inactive",
    ["passiver"] = "more passive",
    ["passivste"] = "most passive",
    ["tätig"] = "active/busy",
    ["tätiger"] = "more active",
    ["tätigste"] = "most active",
    ["untätig"] = "inactive",
    ["beschäftigter"] = "busier",
    ["beschäftigtste"] = "busiest",
    ["besetzter"] = "more occupied",
    ["besetzteste"] = "most occupied",
    
    -- ============================================
    -- VERBS OF ATTEMPT AND SUCCESS
    -- ============================================
    ["versuchen"] = "try/attempt",
    ["versuchst"] = "try",
    ["probieren"] = "try/test",
    ["probierst"] = "try",
    ["probiert"] = "tries",
    ["testen"] = "test",
    ["testest"] = "test",
    ["testet"] = "tests",
    ["gelingen"] = "succeed",
    ["gelingt"] = "succeeds",
    ["gelingst"] = "succeed",
    ["erfolgen"] = "succeed",
    ["erfolgst"] = "succeed",
    ["erfolgt"] = "succeeds",
    ["misslingen"] = "fail",
    ["misslingt"] = "fails",
    ["misslingst"] = "fail",
    ["scheitern"] = "fail",
    ["scheiterst"] = "fail",
    ["scheitert"] = "fails",
    ["fehlschlagen"] = "fail",
    ["schlägst fehl"] = "fail",
    ["schlägt fehl"] = "fails",
    
    -- ============================================
    -- VERBS OF DECISION AND CHOICE
    -- ============================================
    ["entscheiden"] = "decide",
    ["entscheidest"] = "decide",
    ["entscheidet"] = "decides",
    ["beschließen"] = "decide/resolve",
    ["beschließt"] = "decides",
    ["beschließst"] = "decide",
    ["wählen"] = "choose/select",
    ["wählst"] = "choose",
    ["wählt"] = "chooses",
    ["auswählen"] = "select/choose",
    ["wählst aus"] = "select",
    ["wählt aus"] = "selects",
    ["preferieren"] = "prefer",
    ["preferierst"] = "prefer",
    ["preferiert"] = "prefers",
    ["bevorzugen"] = "prefer",
    ["bevorzugst"] = "prefer",
    ["bevorzugt"] = "prefers",
    
    -- ============================================
    -- VERBS OF KNOWLEDGE AND UNDERSTANDING
    -- ============================================
    ["begreifen"] = "comprehend/understand",
    ["begreifst"] = "comprehend",
    ["begreift"] = "comprehends",
    ["einsehen"] = "recognize/understand",
    ["siehst ein"] = "recognize",
    ["sieht ein"] = "recognizes",
    ["realisieren"] = "realize",
    ["realisierst"] = "realize",
    ["realisiert"] = "realizes",
    ["merken"] = "notice/remember",
    ["merkst"] = "notice",
    ["merkt"] = "notices",
    ["bemerken"] = "notice",
    ["bemerkst"] = "notice",
    ["bemerkt"] = "notices",
    ["erkennen"] = "recognize",
    ["erkennst"] = "recognize",
    ["erkennt"] = "recognizes",
    ["beibringen"] = "teach/show",
    ["bringst bei"] = "teach",
    ["bringt bei"] = "teaches",
    ["studieren"] = "study",
    ["studierst"] = "study",
    ["studiert"] = "studies",
    
    -- ============================================
    -- VERBS OF COMMUNICATION (Expanded)
    -- ============================================
    ["mitteilen"] = "inform/tell",
    ["teilst mit"] = "inform",
    ["teilt mit"] = "informs",
    ["informieren"] = "inform",
    ["informierst"] = "inform",
    ["informiert"] = "informs",
    ["benachrichtigen"] = "notify",
    ["benachrichtigst"] = "notify",
    ["benachrichtigt"] = "notifies",
    ["ankündigen"] = "announce",
    ["kündigst an"] = "announce",
    ["kündigt an"] = "announces",
    ["verkünden"] = "proclaim/announce",
    ["verkündest"] = "proclaim",
    ["verkündet"] = "proclaims",
    ["verkündigen"] = "proclaim/announce",
    ["verkündigst"] = "proclaim",
    ["verkündigt"] = "proclaims",
    ["versprechen"] = "promise",
    ["versprichst"] = "promise",
    ["verspricht"] = "promises",
    ["versichern"] = "assure/insure",
    ["versicherst"] = "assure",
    ["versichert"] = "assures",
    ["bestätigen"] = "confirm",
    ["bestätigst"] = "confirm",
    ["bestätigt"] = "confirms",
    ["zustimmen"] = "agree",
    ["stimmst zu"] = "agree",
    ["stimmt zu"] = "agrees",
    ["ablehnen"] = "refuse/reject",
    ["lehnst ab"] = "refuse",
    ["lehnt ab"] = "refuses",
    ["widersprechen"] = "contradict",
    ["widersprichst"] = "contradict",
    ["widerspricht"] = "contradicts",
    ["diskutieren"] = "discuss",
    ["diskutierst"] = "discuss",
    ["diskutiert"] = "discusses",
    ["streiten"] = "argue/quarrel",
    ["streitest"] = "argue",
    ["streitet"] = "argues",
    ["debattieren"] = "debate",
    ["debattierst"] = "debate",
    ["debattiert"] = "debates",
    
    -- ============================================
    -- VERBS OF EMOTION AND REACTION
    -- ============================================
    ["schätzen"] = "appreciate/value",
    ["schätzst"] = "appreciate",
    ["schätzt"] = "appreciates",
    ["bewundern"] = "admire",
    ["bewunderst"] = "admire",
    ["bewundert"] = "admires",
    ["respektieren"] = "respect",
    ["respektierst"] = "respect",
    ["respektiert"] = "respects",
    ["verachten"] = "despise",
    ["verachtest"] = "despise",
    ["verachtet"] = "despises",
    ["fürchten"] = "fear",
    ["fürchtest"] = "fear",
    ["fürchtet"] = "fears",
    ["verärgern"] = "annoy/anger",
    ["verärgerst"] = "annoy",
    ["verärgert"] = "annoys",
    ["enttäuschen"] = "disappoint",
    ["enttäuschst"] = "disappoint",
    ["überraschen"] = "surprise",
    ["überraschst"] = "surprise",
    ["überrascht"] = "surprises",
    ["schockieren"] = "shock",
    ["schockierst"] = "shock",
    ["schockiert"] = "shocks",
    
    -- ============================================
    -- VERBS OF BEGINNING AND ENDING
    -- ============================================
    ["startest"] = "start",
    ["aufnehmen"] = "begin/take up",
    ["nimmst auf"] = "begin",
    ["nimmt auf"] = "begins",
    ["fertigstellen"] = "complete/finish",
    ["stellst fertig"] = "complete",
    ["stellt fertig"] = "completes",
    ["vollenden"] = "complete/finish",
    ["vollendest"] = "complete",
    ["vollendet"] = "completes",
    ["abschließen"] = "finish/conclude",
    ["schließt ab"] = "finish",
    
    -- ============================================
    -- VERBS OF CAUSATION AND INFLUENCE
    -- ============================================
    ["verursachen"] = "cause",
    ["verursachst"] = "cause",
    ["verursacht"] = "causes",
    ["bewirken"] = "cause/effect",
    ["bewirkst"] = "cause",
    ["bewirkt"] = "causes",
    ["hervorrufen"] = "cause/bring about",
    ["rufst hervor"] = "cause",
    ["ruft hervor"] = "causes",
    ["auslösen"] = "trigger/cause",
    ["löst aus"] = "trigger",
    ["beeinflussen"] = "influence",
    ["beeinflusst"] = "influence",
    ["beeinträchtigen"] = "affect/impair",
    ["beeinträchtigst"] = "affect",
    ["beeinträchtigt"] = "affects",
    ["wirken"] = "act/work/have effect",
    ["wirkst"] = "act",
    ["wirkt"] = "acts",
    ["einwirken"] = "have an effect on",
    ["wirkst ein"] = "have effect",
    ["wirkt ein"] = "has effect",
    
    -- ============================================
    -- VERBS OF HELP AND SUPPORT
    -- ============================================
    ["beistehen"] = "stand by/support",
    ["stehst bei"] = "stand by",
    ["steht bei"] = "stands by",
    ["beistellen"] = "provide/supply",
    ["stellst bei"] = "provide",
    ["stellt bei"] = "provides",
    ["versorgen"] = "provide/supply",
    ["versorgst"] = "provide",
    ["versorgt"] = "provides",
    ["pflegen"] = "care for/nurse",
    ["pflegst"] = "care for",
    ["pflegt"] = "cares for",
    ["betreuen"] = "care for/supervise",
    ["betreust"] = "care for",
    ["betreut"] = "cares for",
    
    -- ============================================
    -- VERBS OF PREVENTION AND STOPPING
    -- ============================================
    ["verhindern"] = "prevent",
    ["verhinderst"] = "prevent",
    ["verhindert"] = "prevents",
    ["hindern"] = "hinder/prevent",
    ["hinderst"] = "hinder",
    ["hindert"] = "hinders",
    ["aufhalten"] = "stop/halt",
    ["hältst auf"] = "stop",
    ["hält auf"] = "stops",
    ["stoppst"] = "stop",
    ["anhalten"] = "stop/halt",
    ["hältst an"] = "stop",
    ["hält an"] = "stops",
    ["unterbrechen"] = "interrupt",
    ["unterbrichst"] = "interrupt",
    ["unterbricht"] = "interrupts",
    ["blockieren"] = "block",
    ["blockierst"] = "block",
    ["blockiert"] = "blocks",
    ["sperren"] = "block/lock",
    ["sperrst"] = "block",
    ["sperrt"] = "blocks",
    
    -- ============================================
    -- VERBS OF LOOKING AND OBSERVING
    -- ============================================
    ["gucken"] = "look/watch",
    ["guckst"] = "look",
    ["guckt"] = "looks",
    ["beobachten"] = "observe/watch",
    ["beobachtest"] = "observe",
    ["beobachtet"] = "observes",
    ["betrachten"] = "observe/consider",
    ["betrachtest"] = "observe",
    ["betrachtet"] = "observes",
    ["ansehen"] = "look at/watch",
    ["siehst an"] = "look at",
    ["sieht an"] = "looks at",
    ["anschauen"] = "look at",
    ["schaust an"] = "look at",
    ["schaut an"] = "looks at",
    ["blicken"] = "glance/look",
    ["blickst"] = "glance",
    ["blickt"] = "glances",
    ["starren"] = "stare",
    ["starrst"] = "stare",
    ["starrt"] = "stares",
    ["spähen"] = "spy/peep",
    ["spähst"] = "spy",
    ["späht"] = "spies",
    
    -- ============================================
    -- ADDITIONAL WOW-SPECIFIC TERMS (No Duplicates)
    -- ============================================
    
    -- Additional Classes (if not already present)
    ["todesritter"] = "death knight",
    ["dämonenjäger"] = "demon hunter",
    ["mönch"] = "monk",
    
    -- Professions (German names - comprehensive)
    ["angeln"] = "fishing",
    ["wildtierausbildung"] = "beast training",
    
    -- Game Mechanics Terms (German)
    ["schlachtzug"] = "raid",
    ["looten"] = "loot",
    ["lootet"] = "loots",
    ["reittier"] = "mount",
    ["reittiere"] = "mounts",
    ["begleiter"] = "pet/companion",
    ["abklingzeiten"] = "cooldowns",
    
    -- Stats and Attributes (German)
    ["trefferchance"] = "hit",
    ["widerstände"] = "resistances",
    ["zauberkraft"] = "spell power",
    
    -- Abilities and Combat Terms (German)
    ["wiederbelebungszauber"] = "resurrection spell",
    ["wiederbelebungskrankheit"] = "resurrection sickness",
    ["heimlichkeit"] = "stealth",
    ["spott"] = "taunt",
    ["spotten"] = "taunt",
    ["spottet"] = "taunts",
    ["flächenschaden"] = "area of effect/AoE",
    ["aoe"] = "AoE/area of effect",
    ["schaden über zeit"] = "damage over time/DoT",
    ["dot"] = "DoT/damage over time",
    ["heilung über zeit"] = "heal over time/HoT",
    ["hot"] = "HoT/heal over time",
    ["massenkontrolle"] = "crowd control",
    ["cc"] = "crowd control/CC",
    ["immunität"] = "immunity",
    ["immun"] = "immune",
    ["unterbrechung"] = "interruption",
    ["rückstoß"] = "knockback/pushback",
    ["knockback"] = "knockback",
    ["pushback"] = "pushback",
    
    -- Additional Combat Terms
    ["verblassen"] = "fade",
    ["verblasst"] = "fades",
    ["tödlich"] = "lethal/deadly",
    ["schäden"] = "damages",
    ["schaden nehmen"] = "take damage",
    ["nimmt schaden"] = "takes damage",
    ["heilt über zeit"] = "heals over time",
    ["schutzschild"] = "shield",
    ["panzerung"] = "armor",
    ["blockt"] = "blocks",
    ["parrieren"] = "parry",
    ["pariert"] = "parries",
    
    -- Status Effects
    ["betäubt"] = "stunned",
    ["betäubung"] = "stun",
    ["betäuben"] = "stun",
    ["verwirrt"] = "confused",
    ["verlangsamt"] = "slowed",
    ["verlangsamung"] = "slow",
    ["verlangsamen"] = "slow",
    ["wurzelt"] = "roots",
    ["gefroren"] = "frozen",
    ["gefriert"] = "freezes",
    ["verbrannt"] = "burned",
    ["brennt"] = "burns",
    ["vergiftet"] = "poisoned",
    ["verflucht"] = "cursed",
    ["fluch"] = "curse",
    ["verwundet"] = "wounded",
    
    -- Group and Raid Mechanics
    ["markierung"] = "marking",
    ["markierungen"] = "markings",
    ["markieren"] = "mark",
    ["zielen"] = "target",
    ["zielt"] = "targets",
    ["bedrohungen"] = "threats",
    ["bedroht"] = "threatens",
    ["schaden machen"] = "deal damage",
    ["macht schaden"] = "deals damage",
    
    -- Item Quality and Rarity
    ["qualität"] = "quality",
    ["qualitäten"] = "qualities",
    ["seltenheit"] = "rarity",
    ["artefakte"] = "artifacts",
    
    -- Item Types (Additional)
    ["verbrauchbar"] = "consumable",
    ["tränk"] = "potion",
    ["elixiere"] = "elixirs",
    ["essenz"] = "essence",
    ["essenzen"] = "essences",
    ["verbannung"] = "banishment/exile",
    ["verbannungen"] = "banishments/exiles",
    ["reagenz"] = "reagent",
    ["reagenzien"] = "reagents",
    ["material"] = "material",
    ["rohstoff"] = "raw material",
    ["rohstoffe"] = "raw materials",
    
    -- Additional Zones and Locations
    ["minen"] = "mines",
    ["mine"] = "mine",
    ["ruinen"] = "ruins",
    ["ruine"] = "ruin",
    ["festung"] = "fortress",
    ["festungen"] = "fortresses",
    ["burgen"] = "castles/keeps",
    
    -- Additional Dungeon Terms
    ["kerker"] = "dungeon",
    ["verliese"] = "dungeons",
    ["bosskampf"] = "boss fight",
    ["bosskämpfe"] = "boss fights",
    ["patrouillen"] = "patrols",
    
    -- Quest Terms (Additional)
    ["questziel"] = "quest objective",
    ["questziele"] = "quest objectives",
    ["questbelohnungen"] = "quest rewards",
    ["questreihe"] = "quest chain",
    ["questreihen"] = "quest chains",
    ["hauptquest"] = "main quest",
    ["hauptquests"] = "main quests",
    ["nebenquest"] = "side quest",
    ["nebenquests"] = "side quests",
    ["tägliche quest"] = "daily quest",
    ["tägliche quests"] = "daily quests",
    
    -- PvP Terms
    ["pvp"] = "PvP",
    ["pve"] = "PvE",
    ["spieler gegen spieler"] = "player versus player",
    ["spieler gegen umgebung"] = "player versus environment",
    ["duelle"] = "duels",
    ["duellieren"] = "duel",
    
    -- Additional Game Terms
    ["charaktere"] = "characters",
    ["account"] = "account",
    ["accounts"] = "accounts",
    ["realm"] = "realm",
    ["realms"] = "realms",
    ["welt"] = "world",
    ["welten"] = "worlds",
    ["zone"] = "zone",
    ["zonen"] = "zones",
    ["gebiet"] = "area/region",
    ["gebiete"] = "areas/regions",
    
    -- ============================================
    -- NAMING AND IDENTIFICATION
    -- ============================================
    ["heißt"] = "is called/is named",
    ["heißen"] = "are called/are named",
    ["heisse"] = "is called/is named", -- Alternative spelling
    ["heissen"] = "are called/are named", -- Alternative spelling
    ["nähe"] = "vicinity/nearby",
    ["in der nähe"] = "nearby/in the vicinity",
    ["nahe"] = "near/close",
    ["nahe bei"] = "near/close to",
    ["in nähe"] = "near/in vicinity",
    
    -- ============================================
    -- MORE LOCATION/POSITION WORDS
    -- ============================================
    ["umgebung"] = "surroundings/area",
    ["umgebungen"] = "surroundings",
    ["bereich"] = "area/zone",
    ["bereiche"] = "areas/zones",
    ["ort"] = "place/location",
    ["orte"] = "places/locations",
    ["position"] = "position",
    ["positionen"] = "positions",
    ["standort"] = "location/position",
    ["standorte"] = "locations/positions",
    ["plätz"] = "spot/place",
    ["stelle"] = "spot/place",
    ["daneben"] = "next to/beside",
    ["dazwischen"] = "in between",
    ["darüber"] = "above/over",
    ["darunter"] = "below/under",
    ["dahinter"] = "behind",
    ["darin"] = "inside/in it",
    ["darauf"] = "on it/on top",
    ["dadurch"] = "through it/by that",
    ["daran"] = "on it/at it",
    ["daraufhin"] = "after that/thereupon",
    
    -- ============================================
    -- NOTIFICATION/ALERT WORDS
    -- ============================================
    ["benachrichtigung"] = "notification",
    ["benachrichtigungen"] = "notifications",
    ["alert"] = "alert",
    ["alerts"] = "alerts",
    ["warnung"] = "warning",
    ["warnungen"] = "warnings",
    ["hinweis"] = "hint/notice",
    ["hinweise"] = "hints/notices",
    ["anzeige"] = "display/indication",
    ["anzeigen"] = "displays",
    
    -- ============================================
    -- MORE COMMON VERBS (Part 2)
    -- ============================================
    ["siehst"] = "see",
    ["sieh"] = "see",
    ["geschaut"] = "looked",
    ["geguckt"] = "looked",
    ["sprichst"] = "speak",
    ["gesprochen"] = "spoken",
    ["redet"] = "talks",
    ["geredet"] = "talked",
    ["gefragt"] = "asked",
    ["geantwortet"] = "answered",
    ["schreiben"] = "write",
    ["schreibt"] = "writes",
    ["geschrieben"] = "written",
    ["lesen"] = "read",
    ["liest"] = "read",
    ["gelesen"] = "read",
    ["gemeint"] = "meant",
    ["gekannt"] = "known",
    ["lehrst"] = "teach",
    ["gelehrt"] = "taught",
    ["getan"] = "done",
    ["gearbeitet"] = "worked",
    ["gespielt"] = "played",
    ["gekämpft"] = "fought",
    ["greifst an"] = "attack",
    ["greift an"] = "attacks",
    ["angegriffen"] = "attacked",
    ["verteidigen"] = "defend",
    ["verteidigst"] = "defend",
    ["verteidigt"] = "defends",
    ["geschlagen"] = "hit",
    ["getroffen"] = "hit",
    ["tötest"] = "kill",
    ["sterben"] = "die",
    ["stirbst"] = "die",
    ["stirbt"] = "dies",
    ["lebst"] = "live",
    ["gelebt"] = "lived",
    ["läufst"] = "run",
    ["bleibst"] = "stay",
    ["geblieben"] = "stayed",
    ["stehen"] = "stand",
    ["stehst"] = "stand",
    ["gestanden"] = "stood",
    ["sitzen"] = "sit",
    ["gesessen"] = "sat",
    ["liegen"] = "lie/lay",
    ["liegst"] = "lie",
    ["liegt"] = "lies",
    ["gelegen"] = "lain",
    ["gelegt"] = "laid",
    ["gestellt"] = "placed",
    ["gesetzt"] = "sat",
    ["gebracht"] = "brought",
    ["tragen"] = "carry/wear",
    ["trägst"] = "carry",
    ["trägt"] = "carries",
    ["getragen"] = "carried",
    ["hältst"] = "hold",
    ["gehalten"] = "held",
    ["gestartet"] = "started",
    ["gestoppt"] = "stopped",
    ["begonnen"] = "begun",
    ["geendet"] = "ended",
    ["getestet"] = "tested",
    ["prüfen"] = "check/test",
    ["prüfst"] = "check",
    ["prüft"] = "checks",
    ["geprüft"] = "checked",
    ["gezeigt"] = "shown",
    ["benutzen"] = "use",
    ["benutzt"] = "use",
    ["verwenden"] = "use/employ",
    ["verwendest"] = "use",
    ["verwendet"] = "uses",
    ["genutzt"] = "used",
    ["brauchen"] = "need",
    ["gebraucht"] = "needed",
    ["besessen"] = "owned",
    ["gewollt"] = "wanted",
    ["gemocht"] = "liked",
    ["geliebt"] = "loved",
    ["gehasst"] = "hated",
    ["gefallen"] = "please/like",
    ["gefallst"] = "please",
    ["gefällt"] = "pleases",
    ["gerannt"] = "run",
    ["gesprungen"] = "jumped",
    ["geflogen"] = "flown",
    ["geschwommen"] = "swum",
    ["kletterst"] = "climb",
    ["klettert"] = "climbs",
    ["geklettert"] = "climbed",
    ["gegessen"] = "eaten",
    ["getrunken"] = "drunk",
    ["schlafen"] = "sleep",
    ["schläfst"] = "sleep",
    ["schläft"] = "sleeps",
    ["geschlafen"] = "slept",
    ["aufwachen"] = "wake up",
    ["wachst auf"] = "wake up",
    ["wacht auf"] = "wakes up",
    ["aufgewacht"] = "woken up",
    ["wachen"] = "be awake",
    ["wacht"] = "is awake",
    ["geholfen"] = "helped",
    ["schadest"] = "damage",
    ["schadet"] = "damages",
    ["geschadet"] = "damaged",
    ["heilst"] = "heal",
    ["geheilt"] = "healed",
    ["behandeln"] = "treat/handle",
    ["behandelst"] = "treat",
    ["behandelt"] = "treats",
    ["gepflegt"] = "cared",
    ["gekocht"] = "cooked",
    ["bäckst"] = "bake",
    ["bäckt"] = "bakes",
    ["gebacken"] = "baked",
    ["gewaschen"] = "washed",
    ["geputzt"] = "cleaned",
    ["brichst"] = "break",
    ["bricht"] = "breaks",
    ["gebrochen"] = "broken",
    ["gestiegen"] = "climbed",
    ["sinken"] = "sink/fall",
    ["sinkst"] = "sink",
    ["sinkt"] = "sinks",
    ["gesunken"] = "sunk",
    ["gewachsen"] = "grown",
    ["geschrumpft"] = "shrunk",
    ["erhöhen"] = "increase/raise",
    ["erhöhst"] = "increase",
    ["erhöht"] = "increases",
    ["senken"] = "lower/reduce",
    ["senkst"] = "lower",
    ["senkt"] = "lowers",
    ["gesenkt"] = "lowered",
    ["vergrößern"] = "enlarge/increase",
    ["vergrößerst"] = "enlarge",
    ["vergrößert"] = "enlarges",
    ["verkleinern"] = "reduce/shrink",
    ["verkleinerst"] = "reduce",
    ["verkleinert"] = "reduces",
    ["gewechselt"] = "changed",
    ["ersetzen"] = "replace",
    ["ersetzt"] = "replace",
    ["umgewandelt"] = "converted",
    ["wandeln"] = "change/transform",
    ["wandelst"] = "change",
    ["wandelt"] = "changes",
    ["gewandelt"] = "changed",
    ["reduzieren"] = "reduce",
    ["reduzierst"] = "reduce",
    ["reduziert"] = "reduces",
    ["vermindern"] = "reduce/decrease",
    ["vermindert"] = "reduce",
    ["steigern"] = "increase/boost",
    ["steigerst"] = "increase",
    ["steigert"] = "increases",
    ["verschlechtern"] = "worsen",
    ["verschlechterst"] = "worsen",
    ["verschlechtert"] = "worsens",
    ["optimieren"] = "optimize",
    ["optimierst"] = "optimize",
    ["optimiert"] = "optimizes",
    ["maximieren"] = "maximize",
    ["maximierst"] = "maximize",
    ["maximiert"] = "maximizes",
    ["minimieren"] = "minimize",
    ["minimierst"] = "minimize",
    ["minimiert"] = "minimizes",
    ["verstärken"] = "strengthen/amplify",
    ["verstärkst"] = "strengthen",
    ["verstärkt"] = "strengthens",
    ["schwächen"] = "weaken",
    ["schwächst"] = "weaken",
    ["schwächt"] = "weakens",
    ["geschwächt"] = "weakened",
    ["stärken"] = "strengthen",
    ["stärkst"] = "strengthen",
    ["stärkt"] = "strengthens",
    ["gestärkt"] = "strengthened",
    ["trainieren"] = "train/practice",
    ["trainierst"] = "train",
    ["trainiert"] = "trains",
    ["üben"] = "practice",
    ["übst"] = "practice",
    ["übt"] = "practices",
    ["geübt"] = "practiced",
    ["unterrichten"] = "teach/instruct",
    ["unterrichtest"] = "teach",
    ["unterrichtet"] = "teaches",
    ["demonstrieren"] = "demonstrate",
    ["demonstrierst"] = "demonstrate",
    ["demonstriert"] = "demonstrates",
    ["vorführen"] = "demonstrate/show",
    ["führst vor"] = "demonstrate",
    ["führt vor"] = "demonstrates",
    ["vorgeführt"] = "demonstrated",
    ["vorgestellt"] = "introduced",
    ["beschrieben"] = "described",
    ["berichten"] = "report",
    ["berichtest"] = "report",
    ["berichtet"] = "reports",
    ["mitgeteilt"] = "informed",
    ["kommunizieren"] = "communicate",
    ["kommunizierst"] = "communicate",
    ["kommuniziert"] = "communicates",
    ["plaudern"] = "chat/talk",
    ["plauderst"] = "chat",
    ["plaudert"] = "chats",
    ["geplaudert"] = "chatted",
    ["argumentieren"] = "argue",
    ["argumentierst"] = "argue",
    ["argumentiert"] = "argues",
    ["gestritten"] = "argued",
    ["zugestimmt"] = "agreed",
    ["abgelehnt"] = "rejected",
    ["akzeptieren"] = "accept",
    ["akzeptierst"] = "accept",
    ["akzeptiert"] = "accepts",
    ["annehmen"] = "accept/assume",
    ["nimmst an"] = "accept",
    ["nimmt an"] = "accepts",
    ["angenommen"] = "accepted",
    ["verweigern"] = "refuse",
    ["verweigerst"] = "refuse",
    ["verweigert"] = "refuses",
    ["erlauben"] = "allow/permit",
    ["erlaubst"] = "allow",
    ["erlaubt"] = "allows",
    ["verbieten"] = "forbid/prohibit",
    ["verbietest"] = "forbid",
    ["verbietet"] = "forbids",
    ["verboten"] = "forbidden",
    ["gestatten"] = "allow/permit",
    ["gestattest"] = "allow",
    ["gestattet"] = "allows",
    ["permitieren"] = "permit",
    ["permitierst"] = "permit",
    ["permitiert"] = "permits",
    ["genehmigen"] = "approve/authorize",
    ["genehmigst"] = "approve",
    ["genehmigt"] = "approves",
    ["warnen"] = "warn",
    ["warnst"] = "warn",
    ["warnt"] = "warns",
    ["gewarnt"] = "warned",
    ["raten"] = "advise/guess",
    ["rätst"] = "advise",
    ["rät"] = "advises",
    ["geraten"] = "advised",
    ["empfehlen"] = "recommend",
    ["empfiehlst"] = "recommend",
    ["empfiehlt"] = "recommends",
    ["empfohlen"] = "recommended",
    ["vorschlagen"] = "suggest/propose",
    ["schlägst vor"] = "suggest",
    ["schlägt vor"] = "suggests",
    ["vorgeschlagen"] = "suggested",
    ["befehlen"] = "command/order",
    ["befiehlst"] = "command",
    ["befiehlt"] = "commands",
    ["befohlen"] = "commanded",
    ["anordnen"] = "order/arrange",
    ["ordnest an"] = "order",
    ["ordnet an"] = "orders",
    ["angeordnet"] = "ordered",
    ["gebeten"] = "asked",
    ["erwidern"] = "reply/respond",
    ["erwiderst"] = "reply",
    ["erwidert"] = "replies",
    ["reagieren"] = "react/respond",
    ["reagierst"] = "react",
    ["reagiert"] = "reacts",
    ["beantworten"] = "answer/reply",
    ["beantwortest"] = "answer",
    ["beantwortet"] = "answers",
    ["sich beschweren"] = "complain",
    ["beschwerst dich"] = "complain",
    ["beschwert sich"] = "complains",
    ["beschwert"] = "complained",
    ["klagen"] = "complain/lament",
    ["klagst"] = "complain",
    ["klagt"] = "complains",
    ["geklagt"] = "complained",
    ["kritisieren"] = "criticize",
    ["kritisierst"] = "criticize",
    ["kritisiert"] = "criticizes",
    ["loben"] = "praise",
    ["lobst"] = "praise",
    ["lobt"] = "praises",
    ["gelobt"] = "praised",
    ["ehren"] = "honor",
    ["ehrst"] = "honor",
    ["ehrt"] = "honors",
    ["geehrt"] = "honored",
    ["missachten"] = "disregard/disrespect",
    ["achtest nicht"] = "disregard",
    ["achtet nicht"] = "disregards",
    ["missachtet"] = "disregarded",
    ["ignorieren"] = "ignore",
    ["ignorierst"] = "ignore",
    ["ignoriert"] = "ignores",
    ["übersehen"] = "overlook/miss",
    ["übersiehst"] = "overlook",
    ["übersieht"] = "overlooks",
    ["beachten"] = "notice/pay attention",
    ["achtest"] = "notice",
    ["achtet"] = "notices",
    ["beachtet"] = "noticed",
    ["aufmerksam"] = "attentive",
    ["aufmerksamer"] = "more attentive",
    ["aufmerksamste"] = "most attentive",
    ["unaufmerksam"] = "inattentive",
    ["konzentrieren"] = "concentrate/focus",
    ["konzentrierst"] = "concentrate",
    ["konzentriert"] = "concentrates",
    ["fokussierst"] = "focus",
    ["fokussiert"] = "focuses",
    ["ablenken"] = "distract",
    ["lenkst ab"] = "distract",
    ["lenkt ab"] = "distracts",
    ["abgelenkt"] = "distracted",
    ["stören"] = "disturb/disrupt",
    ["störst"] = "disturb",
    ["gestört"] = "disturbed",
    ["brichst unter"] = "interrupt",
    ["bricht unter"] = "interrupts",
    ["unterbrochen"] = "interrupted",
    ["ruhen"] = "rest",
    ["ruhst"] = "rest",
    ["ruht"] = "rests",
    ["geruht"] = "rested",
    ["entspannen"] = "relax",
    ["entspannst"] = "relax",
    ["ausruhen"] = "rest/take a break",
    ["ruhst aus"] = "rest",
    ["ruht aus"] = "rests",
    ["ausgeruht"] = "rested",
    ["pausieren"] = "pause",
    ["pausierst"] = "pause",
    ["pausiert"] = "pauses",
    ["weiterer"] = "further",
    ["weiteres"] = "further",
    ["weitermachen"] = "continue/keep going",
    ["weitergemacht"] = "continued",
    ["angehalten"] = "stopped",
    ["behalten"] = "keep",
    ["behältst"] = "keep",
    ["behält"] = "keeps",
    ["aufgeben"] = "give up",
    ["gibst auf"] = "give up",
    ["gibt auf"] = "gives up",
    ["aufgegeben"] = "given up",
    ["absolvieren"] = "complete/accomplish",
    ["absolvierst"] = "complete",
    ["absolviert"] = "completes",
    ["erfüllen"] = "fulfill/complete",
    ["erfüllst"] = "fulfill",
    ["schaffst"] = "manage",
    ["schafft"] = "manages",
    ["erreichen"] = "reach/achieve",
    ["erreichst"] = "reach",
    ["erreicht"] = "reaches",
    ["zielst"] = "aim",
    ["gezielt"] = "aimed",
    ["anstreben"] = "aim/strive for",
    ["strebst an"] = "aim",
    ["strebt an"] = "aims",
    ["angestrebt"] = "aimed",
    ["streben"] = "strive",
    ["strebst"] = "strive",
    ["strebt"] = "strives",
    ["gestrebt"] = "strived",
    ["überprüfen"] = "check/verify",
    ["prüfst über"] = "check",
    ["prüft über"] = "checks",
    ["überprüft"] = "checked",
    ["nachprüfen"] = "verify/check",
    ["prüfst nach"] = "verify",
    ["prüft nach"] = "verifies",
    ["nachgeprüft"] = "verified",
    ["verifizieren"] = "verify",
    ["verifizierst"] = "verify",
    ["verifiziert"] = "verifies",
    ["zurückweisen"] = "reject/refuse",
    ["weisst zurück"] = "reject",
    ["weist zurück"] = "rejects",
    ["zurückgewiesen"] = "rejected",
    ["gibst ab"] = "hand over",
    ["abgegeben"] = "handed over",
    ["spendest"] = "donate",
    ["spendet"] = "donates",
    ["gespendet"] = "donated",
    ["überreicht"] = "presented",
    ["reichen"] = "reach/hand",
    ["reichst"] = "reach",
    ["reicht"] = "reaches",
    ["gereicht"] = "reached",
    ["werfen"] = "throw",
    ["wirfst"] = "throw",
    ["wirft"] = "throws",
    ["geworfen"] = "thrown",
    ["schmeißen"] = "throw/hurl",
    ["schmeißt"] = "throw",
    ["schmiss"] = "threw",
    ["geschmissen"] = "thrown",
    ["fallen lassen"] = "drop",
    ["lässt fallen"] = "drop",
    ["fallen gelassen"] = "dropped",
    ["lässt"] = "let",
    
    -- ============================================
    -- WOW GAMING SLANG & CHAT TERMS
    -- ============================================
    -- Chat emoticons and reactions
    ["xd"] = "lol/haha",
    ["lol"] = "lol",
    ["rofl"] = "rofl",
    ["lmao"] = "lmao",
    ["haha"] = "haha",
    ["hihi"] = "hehe",
    ["hehe"] = "hehe",
    ["^^"] = "smile/happy",
    [":)"] = "smile",
    [":("] = "sad",
    
    -- Exclamations and reactions
    ["omg"] = "omg",
    ["wtf"] = "wtf",
    ["wtf?"] = "wtf",
    ["wth"] = "what the hell",
    ["ufff"] = "oof",
    ["oops"] = "oops",
    ["ups"] = "oops",
    ["wow"] = "wow",
    ["boah"] = "wow/damn",
    ["oha"] = "wow/oh",
    
    -- Status and actions
    ["re"] = "re",
    ["res"] = "resurrect/res",
    ["rez"] = "resurrect/res",
    ["rezz"] = "resurrect",
    ["rezze"] = "resurrect",
    ["rezzt"] = "resurrects",
    -- Note: "res" already defined above
    ["invite"] = "invite",
    ["pw"] = "password",
    ["pw?"] = "password?",
    ["pw bitte"] = "password please",
    ["code"] = "code/password",
    
    -- Congratulations and thanks
    ["gratz"] = "grats/congratulations",
    ["glückwünsche"] = "congratulations",
    -- Note: "sry" is English abbreviation - handled by universal abbreviations check
    ["sorry"] = "sorry",
    ["tschuldigung"] = "sorry",
    ["entschuldigung"] = "sorry/excuse me",
    
    -- Trading and economy slang
    ["kauf"] = "buy/purchase",
    ["verkauf"] = "sell",
    ["traden"] = "trading",
    ["getradet"] = "traded",
    ["vkp"] = "selling price",
    ["kaufpreis"] = "purchase price",
    ["verkaufspreis"] = "selling price",
    ["nachfrage"] = "demand",
    ["wtt"] = "want to trade",
    ["verkaufe ich"] = "I'm selling",
    ["kaufe ich"] = "I'm buying",
    ["händeln"] = "trade",
    ["rumhändeln"] = "trade around",
    
    -- Raid and dungeon slang
    ["pullen"] = "pulling",
    ["gepullt"] = "pulled",
    -- Note: "tank", "dps", "heal", "heilen" already defined above
    ["dpsen"] = "dpsing",
    ["burst"] = "burst",
    ["burstet"] = "bursts",
    ["nuke"] = "nuke/burst",
    ["nuken"] = "nuking",
    ["kite"] = "kite",
    ["kiten"] = "kiting",
    ["gekitet"] = "kited",
    ["farm"] = "farm",
    ["gefarmt"] = "farmed",
    ["grind"] = "grind",
    ["gegrindet"] = "grinded",
    ["rolled"] = "rolled",
    
    -- Character and progression terms
    ["gelevelt"] = "leveled",
    ["skill"] = "skill",
    ["skillen"] = "skilling",
    ["spec"] = "spec/specification",
    ["build"] = "build",
    ["gear"] = "gear/equipment",
    ["equip"] = "equip",
    ["equipment"] = "equipment",
    ["item"] = "item",
    ["q"] = "quest",
    ["daily"] = "daily",
    ["dailies"] = "dailies",
    
    -- Social gaming terms
    ["guild"] = "guild",
    ["geraidet"] = "raided",
    ["raidlead"] = "raid leader",
    ["raidleiter"] = "raid leader",
    ["raidleitung"] = "raid leadership",
    ["member"] = "member",
    ["newbie"] = "newbie",
    ["noob"] = "noob",
    ["noobie"] = "noobie",
    ["pro"] = "pro",
    ["profi"] = "pro/professional",
    ["reroll"] = "reroll",
    ["rerollen"] = "rerolling",
    ["main"] = "main character",
    ["twink"] = "twink/alt",
    
    -- Combat and PvP terms
    ["pvpen"] = "pvping",
    ["gepvpt"] = "pvped",
    ["duellen"] = "dueling",
    ["geduellt"] = "dueled",
    ["bg"] = "battleground",
    ["schlachtfeld"] = "battleground",
    ["wsg"] = "warsong gulch",
    ["av"] = "alterac valley",
    ["gank"] = "gank",
    ["ganken"] = "ganking",
    ["gegankt"] = "ganked",
    ["camp"] = "camp",
    ["campen"] = "camping",
    ["gecampt"] = "camped",
    ["pk"] = "player kill",
    ["pker"] = "player killer",
    
    -- Status and communication
    ["omw!"] = "on my way!",
    ["w8"] = "wait",
    ["warte kurz"] = "wait a moment",
    ["sec"] = "second/moment",
    ["min"] = "minute/moment",
    ["gleich da"] = "be right there",
    ["bin da"] = "I'm here",
    ["bin weg"] = "I'm gone/leaving",
    ["bin kurz weg"] = "brb",
    
    -- Note: "kannst", "kann", "können" already defined above
    
    -- German gaming slang variations
    ["jop"] = "yep/yes",
    ["jap"] = "yep/yes",
    ["jupp"] = "yep/yes",
    ["nö"] = "no/nope",
    ["nope"] = "nope",
    ["naja"] = "well/meh",
    ["mh"] = "hmm/well",
    ["hmm"] = "hmm",
    ["okey"] = "okay",
    ["k"] = "k/okay",
    ["kay"] = "kay/okay",
    ["mhm"] = "mhm/yes",
    ["aha"] = "aha/I see",
    ["achso"] = "ah I see",
    ["oh"] = "oh",
    ["ah"] = "ah",
    ["ui"] = "wow/oh",
    ["uiui"] = "wow/oh oh",
    
    -- Common gaming phrases (as single tokens)
    ["haste"] = "have you/have",
    ["ham"] = "have",
    -- Note: "bist" already defined above
    ["biste"] = "are you",
    ["machste"] = "do you/do",
    ["gehste"] = "go you/go",
    ["kommste"] = "come you/come",
    -- Note: "kannste", "kannst", "willst" already defined above
    ["willste"] = "want you/want",
    ["musste"] = "must you/must",
    
    -- Numbers as slang
    ["1"] = "one",
    ["2"] = "two",
    ["3"] = "three",
    ["4"] = "four",
    ["5"] = "five",
    ["10"] = "ten",
    ["20"] = "twenty",
    ["50"] = "fifty",
    ["100"] = "hundred",
    
    -- ============================================
    -- MORE WOW GAMING TERMS & CHAT SLANG
    -- ============================================
    -- Combat mechanics
    ["cooldown"] = "cooldown",
    ["crowd control"] = "crowd control",
    ["wipe"] = "wipe",
    ["wipen"] = "wiping",
    ["gewiped"] = "wiped",
    ["reset"] = "reset",
    ["reseten"] = "resetting",
    ["geresetet"] = "reset",
    ["skip"] = "skip",
    ["geskippt"] = "skipped",
    
    -- NPCs and vendors
    ["vendor"] = "vendor",
    ["auction"] = "auction",
    ["auktionshaus"] = "auction house",
    ["mail"] = "mail",
    ["post"] = "mail/post",
    ["briefkasten"] = "mailbox",
    
    -- Communication channels
    ["whisper"] = "whisper",
    ["tell"] = "tell/whisper",
    ["pm"] = "private message",
    ["party"] = "party",
    ["gruppenchat"] = "party chat",
    ["raidchat"] = "raid chat",
    ["gildenchat"] = "guild chat",
    ["handelschat"] = "trade chat",
    ["general"] = "general",
    ["say"] = "say",
    ["yell"] = "yell",
    ["schreien"] = "yell/shout",
    ["emote"] = "emote",
    ["channel"] = "channel",
    ["kanal"] = "channel",
    ["kanäle"] = "channels",
    
    -- Social actions
    ["spam"] = "spam",
    ["spammen"] = "spamming",
    ["gespammt"] = "spammed",
    ["flame"] = "flame",
    ["flamen"] = "flaming",
    ["geflamed"] = "flamed",
    ["kick"] = "kick",
    ["rauswerfen"] = "kick",
    ["ban"] = "ban",
    ["bannen"] = "ban",
    ["gebannt"] = "banned",
    ["report"] = "report",
    ["gemeldet"] = "reported",
    ["ignore"] = "ignore",
    ["friend"] = "friend",
    ["block"] = "block",
    
    -- More German gaming slang
    ["nice"] = "nice",
    ["ultra"] = "ultra/very",
    ["krass"] = "crazy/intense",
    ["hammer"] = "awesome/amazing",
    ["bombe"] = "awesome/bomb",
    ["saugeil"] = "super awesome",
    ["mega geil"] = "mega awesome",
    
    -- More status and actions
    ["ready"] = "ready",
    ["done"] = "done",
    ["fehlt"] = "missing/need",
    ["klappt"] = "works",
    ["passt"] = "works/fits",
    ["alles klar"] = "all clear",
    ["alles gut"] = "all good",
    ["kein problem"] = "no problem",
    ["macht nichts"] = "doesn't matter",
    
    -- More combat terms
    ["dmg"] = "damage",
    ["damage"] = "damage",
    ["healing"] = "healing",
    ["tanking"] = "tanking",
    ["threat"] = "threat",
    ["taunt"] = "taunt",
    ["provozieren"] = "taunt",
    ["interrupt"] = "interrupt",
    ["stun"] = "stun",
    ["root"] = "root",
    ["slow"] = "slow",
    ["snare"] = "snare",
    ["fear"] = "fear",
    ["charm"] = "charm",
    ["verzaubern"] = "charm",
    ["polymorph"] = "polymorph",
    ["silence"] = "silence",
    ["dispel"] = "dispel",
    ["entfernen"] = "dispel/remove",
    ["cleanse"] = "cleanse",
    ["reinigen"] = "cleanse",
    ["purge"] = "purge",
    
    -- More loot and items
    ["drop"] = "drop",
    ["droppen"] = "dropping",
    ["gedroppt"] = "dropped",
    ["passe"] = "pass",
    ["reward"] = "reward",
    
    -- More character terms
    ["toon"] = "character/toon",
    ["hauptchar"] = "main character",
    ["ausrüsten"] = "equip",
    ["ausgerüstet"] = "equipped",
    
    -- More social terms
    ["officer"] = "officer",
    ["offizier"] = "officer",
    ["leader"] = "leader",
    ["führer"] = "leader",
    ["anführer"] = "leader",
    ["guildmaster"] = "guild master",
    ["gildenmeister"] = "guild master",
    
    -- Common phrases and remaining words
    ["übrig"] = "left over/remaining",
    
    -- Colloquial/contracted forms
    ["wär"] = "would be", -- Contraction of "wäre"
    ["wäre"] = "would be",
    
    -- Common typos/variants (handle common misspellings)
    ["gearde"] = "just/just now", -- Typo for "gerade"
    ["gefärhlich"] = "dangerous", -- Typo for "gefährlich"
    
    -- Additional vocabulary
    ["söldner"] = "mercenary",
    ["söldnerquest"] = "mercenary quest",
    
    -- Gaming slang
    ["zocken"] = "playing/gaming", -- German gaming slang for "playing games"
    
    -- ============================================
    -- END OF VOCABULARY EXPANSION
    -- ============================================
}
