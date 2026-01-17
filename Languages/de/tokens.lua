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
    ["GESUCHT"] = "WANTED", -- Uppercase version for quest/item names: "GESUCHT:" = "WANTED:"
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
    ["fertig"] = "ready",
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
    ["bitte"] = "please",
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
    ["mitglieder"] = "members",
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
    ["aufgaben"] = "quests",
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
    ["level"] = "level",
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
    ["paladin"] = "paladin",
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
    ["einem"] = "a",
    ["eines"] = "a",
    ["nen"] = "a", -- Colloquial form of "einen"
    ["der"] = "the", -- Can mean "who/that" in context, but also "the"
    ["die"] = "the", -- Can mean "who/that" in context, but also "the"
    ["das"] = {
        default = "the",
        pronoun = "that", -- "das geht" = "that works"
    },
    -- Note: "den" is context-aware - handled below
    ["dem"] = "the", -- Also "whom/that"
    ["des"] = "the",
    
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
    ["habe"] = "I have/have", -- "habe" = "I have" or "have"
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
    ["ein"] = "a/an/one", -- "ein" = "a/an" or "one"
    ["willst"] = "want", -- "willst" = "you want" (2nd person singular)
    ["hast"] = "have",
    ["hat"] = "has",
    ["haben"] = "have",
    
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
    ["alle"] = "all",
    ["alles"] = "everything/all",
    ["neuling"] = "newbie",
    ["neulinge"] = "newbies",
    
    -- Pronouns (dative/accusative)
    ["mir"] = "me",
    ["mich"] = "me",
    ["dir"] = "you",
    ["dich"] = "you",
    ["ihm"] = "him",
    ["ihr"] = "her/you",
    ["ihn"] = "him",
    ["uns"] = "us",
    ["euch"] = "you",
    ["ihnen"] = "them",
    
    -- Definite articles (masculine, feminine, neuter)
    ["der"] = "the", -- Masculine article: "der buff" = "the buff"
    ["die"] = "the", -- Feminine article: "die quest" = "the quest"
    ["das"] = "the", -- Neuter article: "das item" = "the item"
    -- Relative pronouns (context-dependent, but default to "the" for articles)
    -- ["der"] = "who/that", -- Only when used as relative pronoun
    -- ["die"] = "who/that", -- Only when used as relative pronoun
    ["den"] = {
        default = "the",
        after = {
            ["hauptstein"] = "the",
            ["buff"] = "the",
            ["quest"] = "the",
        },
    },
    ["dem"] = "whom/that",
    ["dessen"] = "whose",
    ["deren"] = "whose",
    ["diese"] = "this",
    ["dieser"] = "this",
    ["dieses"] = "this",
    
    -- Common connecting words
    ["auch"] = "also",
    ["noch"] = "still",
    ["nochmal"] = "again/another time", -- "nochmal" = "again" or "another time"
    ["nachricht"] = "message",
    ["nachrichten"] = "messages",
    ["brauchst"] = "need/you need", -- "brauchst" = "you need" (2nd person singular)
    ["statistiken"] = "statistics",
    ["statistik"] = "statistics",
    ["bzgl"] = "regarding/concerning", -- "bezüglich" abbreviation
    ["gesagt"] = "said", -- Past participle: "habe gesagt" = "I said/have said"
    ["gesehen"] = "seen", -- Past participle: "habe gesehen" = "I saw/have seen"
    ["hab"] = "have", -- Colloquial form of "habe"
    ["habe"] = "I have/have", -- "habe" = "I have" or "have"
    ["sagten"] = "said", -- Past tense plural: "sie sagten" = "they said"
    ["andere"] = "others/other", -- "andere" = "others" or "other"
    ["anderen"] = "others/other", -- "anderen" = "others" or "other" (dative/accusative)
    ["alle"] = "all/everyone", -- "alle" = "all" or "everyone"
    ["ein"] = "a/an/one", -- "ein" = "a/an" or "one"
    ["willst"] = "want", -- "willst" = "you want" (2nd person singular)
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
    ["genießt"] = "enjoys",
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
    ["macht"] = "does",
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
    ["gut"] = "good",
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
    ["in"] = "in",
    ["zu"] = "to",
    ["auf"] = "on/up/at", -- Context-dependent: "auf süß" might be dialect, "aufmachen" = open
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
    ["lfm"] = "lfm", -- Looking For More
    -- Note: "if" was removed - "IF" in uppercase typically means "Ironforge" location, not "looking for" typo
    -- The typo "if" instead of "lf" is now handled by context or universal abbreviations check
    ["help"] = "help", -- Often used in mixed-language messages
    ["innis"] = "instances/dungeons", -- Abbreviation for Instanzen (dungeons/instances)
    ["instanzen"] = "instances/dungeons",
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
    ["wer"] = "who",
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
    ["leben"] = "life",
    
    -- More common verbs (past tense and participles)
    ["geht"] = "goes",
    ["ging"] = "went",
    ["gegangen"] = "gone",
    ["machte"] = "made",
    ["gemacht"] = "made/done",
    ["gesagt"] = "said", -- Past participle: "habe gesagt" = "have said"
    ["gekommen"] = "come", -- Past participle: "bin gekommen" = "have come"
    ["gegangen"] = "gone", -- Past participle: "bin gegangen" = "have gone"
    ["gewesen"] = "been", -- Past participle: "bin gewesen" = "have been"
    ["gehabt"] = "had", -- Past participle: "habe gehabt" = "have had"
    ["gedacht"] = "thought", -- Past participle: "habe gedacht" = "have thought"
    ["gesehen"] = "seen", -- Past participle: "habe gesehen" = "have seen"
    ["gegeben"] = "given", -- Past participle: "habe gegeben" = "have given"
    ["genommen"] = "taken", -- Past participle: "habe genommen" = "have taken"
    ["gefunden"] = "found", -- Past participle: "habe gefunden" = "have found"
    ["gekauft"] = "bought", -- Past participle: "habe gekauft" = "have bought"
    ["verkauft"] = "sold", -- Past participle: "habe verkauft" = "have sold"
    ["bauen"] = "build",
    ["baut"] = "builds",
    ["gebaut"] = "built",
    ["versuch"] = "attempt/try",
    ["versuche"] = "attempt/try",
    ["versucht"] = "attempts/tries",
    ["geht"] = "goes",
    ["gehts"] = "goes", -- Colloquial: "wie gehts" = "how goes it"
    ["pause"] = "break/pause",
    ["vorsichtig"] = "careful",
    ["kommen"] = "come",
    ["kommt"] = "comes",
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
    ["raus"] = "out",
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
    ["versuch"] = "attempt/try",
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
    ["gibt es"] = "is there",
    ["schaden"] = "damage",
    ["kloster"] = "monastery",
    ["friedhof"] = "graveyard",
    ["verzögerung"] = "delay/lag",
    ["kurz"] = "short/brief",
    ["leid"] = "sorry",
    ["alle"] = "all/everyone",
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
    ["beschwören"] = "summon",
    ["beschwörung"] = "summoning",
    ["beschwöre"] = "summon",
    ["prinzessin"] = "princess",
    ["botschafter"] = "ambassador",
    ["botschafterin"] = "ambassador",
    ["bösen"] = "evil", -- Genitive: "des Bösen" = "of evil"
    ["böse"] = "evil",
    ["einladung"] = "invitation",
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
    ["läuft"] = "run",
    ["spät"] = "late",
    ["gut"] = "good",
    ["trank"] = "potion",
    ["tränke"] = "potions",
    ["abklingzeit"] = "cooldown",
    ["gleichzeitig"] = "at the same time",
    ["angreifen"] = "attack",
    ["angriff"] = "attack",
    ["allein"] = "alone",
    ["sagte"] = "said", -- Past tense: "ich sagte" = "I said"
    ["sagtest"] = "said", -- "du sagtest" = "you said"
    ["machte"] = "made/did", -- Past tense: "ich machte" = "I made/did"
    ["machtest"] = "made/did", -- "du machtest" = "you made/did"
    ["glaubte"] = "thought/believed", -- Past tense: "ich glaubte" = "I thought"
    ["glaubtest"] = "thought/believed",
    ["hatte"] = "had", -- Already exists
    ["hattest"] = "had", -- "du hattest" = "you had"
    ["gesagt"] = "said",
    ["wurde"] = "became/was",
    ["wurden"] = "became/were",
    ["kam"] = "came",
    ["gekommen"] = "come",
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
    ["möchte"] = "would like", -- Already exists
    ["möchtest"] = "would like", -- "du möchtest" = "you would like"
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
    ["sehr"] = "very",
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
    ["sein"] = "his/its",
    ["seine"] = "his/its",
    ["seinen"] = "his/its",
    ["ihr"] = "her/their",
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
    ["hauptstein"] = "main stone",
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
    ["tank"] = "tank", -- Often used as-is in German WoW
    ["heal"] = "heal", -- Often used as-is
    ["healer"] = "healer",
    -- Note: "dd" removed - it's a universal abbreviation that should pass through unchanged
    ["dps"] = "dps",
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
    ["zeit"] = "time",
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
    ["fertig"] = "done/ready",
    ["bereit"] = "ready",
    
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
    ["eisen"] = "iron",
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
    ["willkommen"] = "welcome",
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
    ["warte"] = "wait",
    ["wartet"] = "waits",
    ["grad"] = "currently/right now", -- Colloquial for "gerade" = "currently"
    ["gerade"] = "currently/right now",
    ["bekommt"] = "gets/receives", -- "bekommt geld zurück" = "gets money back"
    ["bekommen"] = "get/receive",
    ["bekomme"] = "get/receive",
    
    -- Additional missing words from guild chat review 2
    ["gestern"] = "yesterday", -- "gestern schon" = "already yesterday"
    ["erwähnt"] = "mentioned", -- "habe erwähnt" = "have mentioned"
    ["erwähnen"] = "mention",
    ["habs"] = "have it", -- Colloquial for "hab es" = "have it"
    ["exile"] = "exile", -- Gaming term, often used as-is
    ["such"] = "look for/search", -- "such dir" = "look for yourself"
    ["suchen"] = "look for/search",
    ["sucht"] = "looks for/searches",
    ["questet"] = "quests", -- "mit dir questet" = "quests with you"
    ["questen"] = "quest",
    ["gequestet"] = "quested", -- Past participle: "leergequestet" = "emptied of quests"
    ["leer"] = "empty", -- "leer" = "empty"
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
    ["bleiben"] = "stay",
    ["bleibt"] = "stays",
    ["Lad"] = "invite", -- "Lad sie ein" = "Invite her"
    ["lad"] = "invite",
    ["einladen"] = "invite",
    ["lädt"] = "invites",
    ["ein"] = "in", -- "Lad sie ein" = "Invite her" (einladen = invite, but "ein" = in)
    ["erst"] = "first/only", -- "erst mit lvl 20" = "first/only at level 20"
    ["im"] = "in the", -- "im exile" = "in the exile"
    
    -- Additional missing words from guild chat review 3
    ["warst"] = "were", -- Past tense of "sein": "warst du" = "were you"
    ["war"] = "was",
    ["waren"] = "were",
    ["flugplatz"] = "airport", -- "am flugplatz" = "at the airport"
    ["westfall"] = "Westfall", -- Location name
    ["passiert"] = "happened", -- "ist passiert" = "has happened", "was passiert" = "what happened"
    ["passieren"] = "happen",
    ["seht"] = "see", -- Plural: "seht ihr" = "do you see"
    ["langsamer"] = "slower", -- "lieber langsamer" = "prefer slower"
    ["langsam"] = "slow",
    ["dafür"] = "instead/for that", -- "dafür safe" = "instead safe"
    ["südlich"] = "south of", -- "südlich der Base" = "south of the base"
    ["base"] = "base", -- Location term
    ["Base"] = "base", -- Capitalized location term
    ["wasser"] = "water", -- "am wasser" = "at the water"
    ["trappern"] = "trappers", -- "vorsicht vor trappern" = "careful of trappers"
    ["trapper"] = "trapper",
    ["pillagern"] = "pillagers", -- "vorsicht vor pillagern" = "careful of pillagers"
    ["pillager"] = "pillager",
    ["besonders"] = "especially", -- "die besonders" = "especially those"
    ["allem"] = "everything/all", -- "vor allem" = "above all/especially"
    ["alle"] = "all",
    ["wollen"] = "want", -- "nicht zuuuu viel wollen" = "don't want too much"
    ["will"] = "want",
    ["willst"] = "want",
    ["also"] = "so/also", -- "also vorsicht" = "so careful"
    
    -- Additional common German gaming terms
    ["oder"] = "or",
    ["aber"] = "but",
    ["denn"] = "because/then", -- "was denn" = "what then"
    ["doch"] = "yet/but/however", -- Common particle
    ["sondern"] = "but rather",
    ["falls"] = "in case/if",
    ["obwohl"] = "although",
    ["weil"] = "because",
    ["damit"] = "so that",
    ["wenn"] = "when/if",
    
    -- More time expressions
    ["später"] = "later",
    ["früher"] = "earlier",
    ["jetzt"] = "now",
    ["gleich"] = "soon",
    ["sofort"] = "immediately",
    ["bald"] = "soon",
    ["vorher"] = "before",
    ["nachher"] = "afterwards",
    ["bisher"] = "so far",
    
    -- More modal verbs
    ["dürfen"] = "may/be allowed to",
    ["darf"] = "may/am allowed to",
    ["darfst"] = "may/are allowed to",
    ["mögen"] = "like/want",
    ["möchte"] = "would like",
    ["möchtest"] = "would you like",
    
    -- Common gaming actions
    ["sammeln"] = "gather/collect",
    ["sammelt"] = "gathers/collects",
    ["farmen"] = "farm/grind",
    ["farmt"] = "farms/grinds",
    ["grinden"] = "grind/farm",
    ["grindet"] = "grinds/farms",
    ["töten"] = "kill",
    ["tötet"] = "kills",
    ["getötet"] = "killed",
    ["sammelt"] = "gathers",
    
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
    ["waffe"] = "weapon",
    ["waffen"] = "weapons",
    ["schild"] = "shield",
    ["helm"] = "helmet",
    ["brustplatte"] = "chestplate",
    ["hose"] = "pants",
    ["stiefel"] = "boots",
    ["handschuhe"] = "gloves",
    ["gürtel"] = "belt",
    ["halskette"] = "necklace",
    ["ring"] = "ring",
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
    ["bereit"] = "ready",
    ["fertig"] = "ready/done",
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
    ["questgeber"] = "quest giver",
    
    -- More verbs (expanded conjugations)
    ["nehmen"] = "take",
    ["nimmt"] = "takes",
    ["nahm"] = "took",
    ["genommen"] = "taken",
    ["geben"] = "give",
    ["gibt"] = "gives",
    ["gab"] = "gave",
    ["gegeben"] = "given",
    ["sehen"] = "see",
    ["sieht"] = "sees",
    ["sah"] = "saw",
    ["gesehen"] = "seen",
    ["wissen"] = "know",
    ["weiß"] = "knows",
    ["wusste"] = "knew",
    ["gewusst"] = "known",
    
    -- More pronouns/possessives
    ["eins"] = "one",
    ["jeder"] = "everyone",
    ["niemand"] = "no one",
    ["etwas"] = "something",
    ["nichts"] = "nothing",
    
    -- More common particles
    ["eben"] = "just/exactly",
    ["gerade"] = "just/right now",
    ["schon"] = "already",
    ["noch"] = "still/yet",
    ["nochmal"] = "again",
    ["nicht"] = "not",
    ["kein"] = "no/not a",
    ["nie"] = "never",
    ["immer"] = "always",
    ["oft"] = "often",
    ["manchmal"] = "sometimes",
    
    -- Common gaming abbreviations (additional)
    ["omw"] = "on my way",
    ["ty"] = "thank you",
    ["thx"] = "thanks",
    ["np"] = "no problem",
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
    ["cleave"] = "cleaves", -- Verb form
    ["yolo"] = "yolo", -- Gaming term
    ["yolo pulls"] = "yolo pulls", -- Gaming phrase
    ["target dummies"] = "target dummies", -- Gaming term
    ["dummy"] = "target dummy", -- Gaming term
    ["town"] = "town", -- Gaming term
    ["inv"] = "inventory", -- Gaming abbreviation
    ["dc"] = "disconnect", -- Gaming abbreviation
    ["eig"] = "actually/really", -- "eigentlich" abbreviation
    ["eigentlich"] = "actually/really",
    ["endboss"] = "final boss", -- Gaming term
    ["mobs"] = "mobs", -- Already exists but checking
    ["mob"] = "mob",
    ["klassiker"] = "classic/classic mistake", -- "Klassiker" = "classic" or "classic mistake"
    ["überzeugend"] = "convincing", -- "überzeugend" = "convincing"
    ["niemals"] = "never", -- "niemals" = "never"
    ["nehme"] = "take/I'll take", -- "nehme" = "I'll take" or "take"
    ["nehm"] = "take", -- Colloquial form of "nehme"
    ["schultern"] = "shoulders", -- "grüne Schultern" = "green shoulders" (item)
    ["schulter"] = "shoulder",
    ["statt"] = "instead of", -- "2 pulls statt 1" = "2 pulls instead of 1"
    ["pulls"] = "pulls", -- Gaming term
    ["pull"] = "pull",
    ["drin"] = "in", -- "alle drin?" = "all in?"
    ["langsam"] = "slowly/slow", -- "pls langsam" = "please slowly"
    ["jaja"] = "yeah yeah", -- "jaja" = "yeah yeah" (colloquial agreement)
    ["versprochen"] = "promised", -- "versprochen" = "promised"
    ["kurz"] = "briefly/short", -- "lag kurz" = "lag briefly"
    ["sowas"] = "such things", -- "sag sowas nicht" = "don't say such things"
    ["herz"] = "heart", -- "mein Herz rast" = "my heart is racing"
    ["rast"] = "races/is racing", -- "rast" = "races"
    ["links"] = "left", -- "patrol links" = "patrol left"
    ["staff"] = "staff", -- "grüner staff" = "green staff" (item)
    ["uff"] = "whew/ugh", -- "uff" = "whew/ugh" (expression of relief)
    ["skippen"] = "skip", -- "skippen wir" = "should we skip"
    ["nie"] = "never", -- "nie wieder" = "never again"
    ["wieder"] = "again", -- "nie wieder" = "never again"
    ["niemand"] = "nobody/no one", -- "niemand gestorben" = "nobody died"
    ["vorhanden"] = "available", -- "Tank vorhanden" = "tank available"
    ["passiert"] = "happened", -- "ist passiert" = "has happened"
    ["flüstert"] = "whisper", -- "flüstert mir" = "whisper me"
    ["flüster"] = "whisper", -- Imperative: "flüster mir" = "whisper me"
    ["flüstern"] = "whisper", -- Infinitive
    ["trinkgeld"] = "tip", -- "Trinkgeld gern gesehen" = "tips appreciated"
    ["proc"] = "proc", -- Gaming term
    ["geprocct"] = "proc'd/procced", -- Past tense of proc
    ["geprocced"] = "proc'd/procced",
    ["geproct"] = "proc'd/procced",
    ["legenden"] = "legendaries/legendary items", -- "kleine legenden" = "small legendaries"
    ["legende"] = "legendary",
    ["niedliche"] = "cute/sweet", -- "niedliche Gnomin" = "cute gnome (female)"
    ["niedlich"] = "cute/sweet",
    ["gnomin"] = "gnome (female)", -- Female gnome
    ["schon"] = "already", -- "schon bald" = "soon/already soon"
    ["schonmal"] = "already/once", -- "schonmal" = "already/once" (colloquial)
    ["bald"] = "soon", -- "schon bald" = "soon/already soon"
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
    ["schaffen"] = "manage/can do",
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
    ["würde"] = "would", -- "würde auch Gold zahlen" = "would also pay gold"
    ["brauchbar"] = "usable/useful", -- "ist brauchbar" = "is usable"
    ["händler"] = "vendor/merchant", -- "beim händler" = "at the vendor"
    ["denn"] = "", -- Particle, often omitted in English
    ["vor"] = "ahead/planned", -- "was hast denn vor?" = "what do you have planned?"
    ["öffnen"] = "open", -- "zum öffnen" = "to open"
    ["thorium"] = "thorium", -- Material name
    ["schließkassette"] = "lockbox", -- "Thoriumschließkassette" = "Thorium lockbox"
    ["eisengegengewicht"] = "iron counterweight", -- Item name
    ["feurige"] = "fiery", -- "Feurige Kriegsaxt" = "Fiery War Axe"
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
    ["gleich"] = "soon/right away", -- "kann mich gleich einer" = "can someone soon"
    ["einer"] = "someone", -- "einer von" = "someone from"
    ["könnte"] = "could", -- "Könnte machen" = "could make"
    ["10er"] = "10-slot", -- "10er taschen" = "10-slot bags"
    ["nette"] = "nice/friendly", -- "nette gilde" = "nice guild"
    ["netten"] = "nice/friendly", -- "netten gilde" = "nice guild"
    ["tod"] = "death", -- "Der Tod ist permanent" = "Death is permanent"
    ["bleibt"] = "stay/stays", -- "bleibt am Leben" = "stay alive"
    ["am leben"] = "alive", -- "bleibt am Leben" = "stay alive"
    ["eure"] = "your", -- "eure Mats" = "your materials"
    ["mats"] = "mats/materials", -- Gaming abbreviation for materials
    ["ausdauer"] = "stamina", -- "Ausdauer" = "stamina"
    ["ausd"] = "stamina", -- Abbreviation for Ausdauer
    ["umhang"] = "cloak", -- "Umhang" = "cloak"
    ["resi"] = "resistance", -- "Resi" = resistance (abbreviation)
    ["stiefel"] = "boots", -- "Stiefel" = "boots"
    ["lauftempo"] = "movement speed/speed", -- "Lauftempo" = "movement speed"
    ["bonus"] = "bonus", -- "Bonus" = "bonus"
    ["überragendes"] = "superior/outstanding", -- "Überragendes" = "superior"
    ["willenskraft"] = "spirit", -- "Willenskraft" = "spirit" (stat)
    ["schaden"] = "damage", -- "Schaden" = "damage"
    ["schnell"] = "fast/quickly", -- "Schnell" = "fast/quickly"
    ["derwischschiftung"] = "Dervish Shoulderpads", -- Item name
    ["des"] = "of the", -- "des Falken" = "of the Falcon"
    ["falken"] = "Falcon", -- Proper noun
    ["armschiene"] = "bracer", -- "Armschiene" = "bracer"
    ["armschienen"] = "bracers",
    ["brust"] = "chest", -- "Brust" = "chest" (armor slot)
    ["werte"] = "stats/all stats", -- "alle Werte" = "all stats"
    ["handschuhe"] = "gloves", -- Already exists but confirming
    ["waffe"] = "weapon", -- Already exists but confirming
    ["schild"] = "shield", -- Already exists but confirming
    ["as"] = "attack speed", -- "AS" = attack speed abbreviation
    ["ausd"] = "stamina", -- Already added above but ensuring
    ["sofort"] = "immediately/right away", -- "sofort" = "immediately"
    ["volle"] = "full", -- "volle mana" = "full mana"
    ["bereit"] = "ready", -- "CD bereit" = "CD ready"
    ["passiv"] = "passive", -- "pet auf passiv" = "pet on passive"
    ["läuft"] = "running/is running", -- "heal läuft" = "heal is running"
    ["oom"] = "oom", -- "out of mana" (gaming abbreviation, kept as-is)
    ["fd"] = "feign death", -- "FD ready" = "feign death ready"
    ["cd"] = "cooldown", -- "CD ready" = "cooldown ready"
    ["cds"] = "cooldowns",
    ["idc"] = "i don't care",
    ["tbh"] = "to be honest",
    ["imo"] = "in my opinion",
    ["idk"] = "i don't know",
    
    -- More conversational words
    ["eigentlich"] = "actually",
    ["wahrscheinlich"] = "probably",
    ["vielleicht"] = "maybe",
    ["bestimmt"] = "definitely",
    ["sicher"] = "sure/certain",
    ["natürlich"] = "of course",
    ["klar"] = "sure/clear",
    ["genau"] = "exactly",
    ["richtig"] = "right/correct",
    ["falsch"] = "wrong",
    
    -- More expressions
    ["super"] = "great/super",
    ["cool"] = "cool",
    ["geil"] = "awesome/cool", -- Common German slang
    ["nett"] = "nice",
    ["lustig"] = "funny",
    ["langweilig"] = "boring",
    ["interessant"] = "interesting",
    
    -- ============================================
    -- WORLD OF WARCRAFT SPECIFIC TERMS
    -- ============================================
    
    -- Zones and Locations (German names)
    ["teldrassil"] = "Teldrassil",
    ["darnassus"] = "Darnassus",
    ["dun morogh"] = "Dun Morogh",
    ["eisenschmiede"] = "Ironforge",
    ["if"] = "Ironforge",
    ["elwynnwald"] = "Elwynn Forest",
    ["sturmwind"] = "Stormwind",
    ["sw"] = "Stormwind",
    ["westfall"] = "Westfall",
    ["rotkammgebirge"] = "Redridge Mountains",
    ["düsterwald"] = "Duskwood",
    ["sumpfland"] = "Wetlands",
    ["loch modan"] = "Loch Modan",
    ["dunkelküste"] = "Darkshore",
    ["aschfurttal"] = "Ashenvale",
    ["steinkrallengebirge"] = "Stonetalon Mountains",
    ["durotar"] = "Durotar",
    ["mulgore"] = "Mulgore",
    ["donnerfels"] = "Thunder Bluff",
    ["tb"] = "Thunder Bluff",
    ["schlingendorntal"] = "Stranglethorn Vale",
    ["stv"] = "Stranglethorn Vale",
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
    ["ungoro"] = "Un'Goro Crater",
    ["ungorokrater"] = "Un'Goro Crater",
    ["teufelswald"] = "Felwood",
    ["felwood"] = "Felwood",
    ["winterspring"] = "Winterspring",
    ["winterquell"] = "Winterspring",
    ["silberwald"] = "Silverpine Forest",
    ["silberwald"] = "Silverpine",
    ["tirisfal"] = "Tirisfal Glades",
    ["tirisfal"] = "Tirisfal",
    ["silberwald"] = "Silverpine",
    ["scarabäus"] = "Scarlet",
    ["hügel"] = "hill",
    ["gebirge"] = "mountains",
    ["wald"] = "forest",
    ["wüste"] = "desert",
    ["küste"] = "coast",
    ["insel"] = "island",
    ["ebene"] = "plains",
    ["tal"] = "valley",
    ["sumpf"] = "swamp",
    ["see"] = "lake",
    ["meer"] = "sea",
    
    -- Major Cities and Settlements
    ["booty bay"] = "Booty Bay",
    ["bb"] = "Booty Bay",
    ["gadgetzan"] = "Gadgetzan",
    ["everlook"] = "Everlook",
    ["ratchet"] = "Ratchet",
    ["theramore"] = "Theramore",
    ["menethil"] = "Menethil Harbor",
    ["menethilhafen"] = "Menethil Harbor",
    ["südmeer"] = "Southshore",
    ["tarrens mill"] = "Tarren Mill",
    ["tarrenmühle"] = "Tarren Mill",
    ["unterstadt"] = "Undercity",
    ["uc"] = "Undercity",
    ["brill"] = "Brill",
    ["ogrimmar"] = "Orgrimmar",
    ["org"] = "Orgrimmar",
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
    ["höhlen des wehklagens"] = "Wailing Caverns",
    ["hdw"] = "Wailing Caverns",
    ["totenminen"] = "Deadmines",
    ["verlies"] = "Deadmines",
    ["dm"] = "Deadmines/Dire Maul", -- Context-dependent
    ["schattenfangklamm"] = "Shadowfang Keep",
    ["sfk"] = "Shadowfang Keep",
    ["blackfathom tiefen"] = "Blackfathom Deeps",
    ["bfd"] = "Blackfathom Deeps",
    ["bsf"] = "Blackfathom Deeps",
    ["gnomergan"] = "Gnomeregan",
    ["gnomer"] = "Gnomeregan",
    ["kral"] = "Razorfen Kraul",
    ["rfk"] = "Razorfen Kraul",
    ["hügel"] = "Razorfen Downs",
    ["rfd"] = "Razorfen Downs",
    ["scharlachrotkloster"] = "Scarlet Monastery",
    ["sm"] = "Scarlet Monastery",
    ["bibliothek"] = "Library",
    ["armory"] = "Armory",
    ["waffenkammer"] = "Armory",
    ["friedhof"] = "Graveyard",
    ["kathedrale"] = "Cathedral",
    ["uldamann"] = "Uldaman",
    ["uld"] = "Uldaman",
    ["zul'farrak"] = "Zul'Farrak",
    ["zf"] = "Zul'Farrak",
    ["maraudon"] = "Maraudon",
    ["mara"] = "Maraudon",
    ["versunkener tempel"] = "Sunken Temple",
    ["st"] = "Sunken Temple",
    ["blackrock"] = "Blackrock",
    ["schwarzfels"] = "Blackrock",
    ["blackrocktiefen"] = "Blackrock Depths",
    ["brd"] = "Blackrock Depths",
    ["untere spitz"] = "Lower Blackrock Spire",
    ["lbrs"] = "Lower Blackrock Spire",
    ["obere spitz"] = "Upper Blackrock Spire",
    ["ubrs"] = "Upper Blackrock Spire",
    ["scholomance"] = "Scholomance",
    ["scholo"] = "Scholomance",
    ["stratholme"] = "Stratholme",
    ["strat"] = "Stratholme",
    ["dire maul"] = "Dire Maul",
    ["dm"] = "Dire Maul/Deadmines", -- Context-dependent
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
    ["zg"] = "Zul'Gurub",
    ["tempel von ahn'qiraj"] = "Temple of Ahn'Qiraj",
    ["aq20"] = "Ahn'Qiraj 20",
    ["ruinen von ahn'qiraj"] = "Ruins of Ahn'Qiraj",
    ["aq40"] = "Ahn'Qiraj 40",
    ["naxxramas"] = "Naxxramas",
    ["naxx"] = "Naxxramas",
    
    -- Major NPCs and Bosses (German names where applicable)
    ["ragnaros"] = "Ragnaros",
    ["onyxia"] = "Onyxia",
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
    ["troll"] = "troll",
    ["goblin"] = "goblin",
    ["ork"] = "orc",
    ["tauren"] = "tauren",
    ["nachteIf"] = "night elf",
    ["nachtelf"] = "night elf",
    ["zwerg"] = "dwarf",
    ["mensch"] = "human",
    ["untoter"] = "undead",
    ["gnom"] = "gnome",
    
    -- Item Types and Equipment (German)
    ["waffe"] = "weapon",
    ["waffen"] = "weapons",
    ["schwert"] = "sword",
    ["schwerter"] = "swords",
    ["zweihender"] = "two-handed sword",
    ["einhänder"] = "one-handed sword",
    ["streitaxt"] = "war axe",
    ["strebäxte"] = "war axes",
    ["zweihender streitaxt"] = "two-handed war axe",
    ["streithammer"] = "warhammer",
    ["mace"] = "mace",
    ["streitkolben"] = "mace",
    ["stab"] = "staff",
    ["stäbe"] = "staves",
    ["zauberstab"] = "wand",
    ["zauberstäbe"] = "wands",
    ["bogen"] = "bow",
    ["bögen"] = "bows",
    ["armbrust"] = "crossbow",
    ["armbrüste"] = "crossbows",
    ["dolch"] = "dagger",
    ["dolche"] = "daggers",
    ["faustwaffe"] = "fist weapon",
    ["faustwaffen"] = "fist weapons",
    ["streitkolben"] = "mace",
    ["schild"] = "shield",
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
    ["rüstung"] = "armor",
    ["panzer"] = "plate",
    ["platte"] = "plate",
    ["kettenrüstung"] = "mail",
    ["kettenpanzer"] = "chainmail",
    ["lederrüstung"] = "leather",
    ["leder"] = "leather",
    ["stoff"] = "cloth",
    ["stoffrüstung"] = "cloth armor",
    
    -- Armor Slots
    ["helm"] = "helmet",
    ["helme"] = "helmets",
    ["schulterstücke"] = "shoulders",
    ["schulter"] = "shoulder",
    ["brustplatte"] = "chest",
    ["brustharnisch"] = "chestplate",
    ["robe"] = "robe",
    ["gewand"] = "robe",
    ["hose"] = "pants",
    ["beinschützer"] = "leggings",
    ["stiefel"] = "boots",
    ["handschuhe"] = "gloves",
    ["armschienen"] = "bracers",
    ["gürtel"] = "belt",
    ["handgelenksschutz"] = "wristguards",
    
    -- Accessories
    ["halskette"] = "necklace",
    ["halsketten"] = "necklaces",
    ["ring"] = "ring",
    ["ringe"] = "rings",
    ["trinket"] = "trinket",
    ["trinkets"] = "trinkets",
    ["schmuck"] = "trinket",
    ["kappe"] = "cape",
    ["umhang"] = "cloak",
    ["umhänge"] = "cloaks",
    
    -- Item Quality
    ["grau"] = "poor",
    ["schlecht"] = "poor",
    ["weiß"] = "common",
    ["gewöhnlich"] = "common",
    ["grün"] = "uncommon",
    ["ungewöhnlich"] = "uncommon",
    ["blau"] = "rare",
    ["selten"] = "rare",
    ["lila"] = "epic",
    ["episch"] = "epic",
    ["orange"] = "legendary",
    ["legendär"] = "legendary",
    ["gold"] = "artifact",
    ["artefakt"] = "artifact",
    ["verzaubert"] = "enchanted",
    ["vergoldet"] = "gilded",
    
    -- Stats and Attributes
    ["stärke"] = "strength",
    ["ausdauer"] = "stamina",
    ["intelligenz"] = "intellect",
    ["int"] = "intellect",
    ["geist"] = "spirit",
    ["spr"] = "spirit",
    ["beweglichkeit"] = "agility",
    ["agi"] = "agility",
    ["rüstung"] = "armor",
    ["verteidigung"] = "defense",
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
    ["heilung"] = "healing",
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
    ["schmied"] = "blacksmith",
    ["lederverarbeitung"] = "leatherworking",
    ["kürschner"] = "leatherworker",
    ["schneiderei"] = "tailoring",
    ["schneider"] = "tailor",
    ["alchemie"] = "alchemy",
    ["alchemist"] = "alchemist",
    ["verzauberkunst"] = "enchanting",
    ["verzauberer"] = "enchanter",
    ["ingenieurskunst"] = "engineering",
    ["ingenieur"] = "engineer",
    ["kräuterkunde"] = "herbalism",
    ["kräuterkundiger"] = "herbalist",
    ["bergbau"] = "mining",
    ["bergmann"] = "miner",
    ["kürschnerei"] = "skinning",
    ["kürschner"] = "skinner",
    ["angel"] = "fishing",
    ["fischen"] = "fishing",
    ["fischer"] = "fisherman",
    ["erste hilfe"] = "first aid",
    ["kochkunst"] = "cooking",
    ["koch"] = "cook",
    
    -- Materials and Resources
    ["erz"] = "ore",
    ["kupfererz"] = "copper ore",
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
    ["kräuter"] = "herbs",
    ["kraut"] = "herb",
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
    ["leder"] = "leather",
    ["leichtes leder"] = "light leather",
    ["mittleres leder"] = "medium leather",
    ["schweres leder"] = "heavy leather",
    ["zartes leder"] = "rugged leather",
    ["dickes leder"] = "thick leather",
    ["stoff"] = "cloth",
    ["leinenstoff"] = "linen cloth",
    ["wollstoff"] = "wool cloth",
    ["seidenstoff"] = "silk cloth",
    ["magiestoff"] = "mageweave cloth",
    ["runenstoff"] = "runecloth",
    
    -- Consumables
    ["trank"] = "potion",
    ["tränke"] = "potions",
    ["heiltrank"] = "healing potion",
    ["manatrank"] = "mana potion",
    ["regenerationstrank"] = "regeneration potion",
    ["verstärkungstrank"] = "elixir",
    ["elixier"] = "elixir",
    ["fläschchen"] = "flask",
    ["buff"] = "buff",
    ["buffs"] = "buffs",
    ["essen"] = "food",
    ["getränk"] = "drink",
    ["wasser"] = "water",
    ["brot"] = "bread",
    ["fleisch"] = "meat",
    ["fisch"] = "fish",
    ["bandage"] = "bandage",
    ["verband"] = "bandage",
    ["verbände"] = "bandages",
    
    -- Quest Terms
    ["quest"] = "quest",
    ["quests"] = "quests",
    ["aufgabe"] = "task/quest",
    ["aufgaben"] = "tasks",
    ["questgeber"] = "quest giver",
    ["questbelohnung"] = "quest reward",
    ["belohnung"] = "reward",
    ["belohnungen"] = "rewards",
    ["questgegenstand"] = "quest item",
    ["questitem"] = "quest item",
    ["erfüllt"] = "completed",
    ["abgeschlossen"] = "completed",
    ["fertig"] = "done",
    ["neu"] = "new",
    ["gelb"] = "yellow", -- Quest difficulty
    ["orange"] = "orange",
    ["rot"] = "red",
    ["grün"] = "green",
    
    -- Combat Terms
    ["kampf"] = "combat",
    ["angriff"] = "attack",
    ["verteidigung"] = "defense",
    ["schaden"] = "damage",
    ["heilung"] = "healing",
    ["heilt"] = "heals",
    ["wiederbeleben"] = "resurrect",
    ["wiederbelebung"] = "resurrection",
    ["tot"] = "dead",
    ["gestorben"] = "died",
    ["lebendig"] = "alive",
    ["leben"] = "health/hp",
    ["hp"] = "health points",
    ["mana"] = "mana",
    ["mp"] = "mana points",
    ["wut"] = "rage",
    ["energie"] = "energy",
    ["fokussieren"] = "focus",
    ["bedrohung"] = "threat",
    ["agro"] = "aggro",
    ["agro ziehen"] = "pull aggro",
    ["zieht agro"] = "pulls aggro",
    ["bedrohung reduzieren"] = "reduce threat",
    ["tank"] = "tank",
    ["tanken"] = "tank",
    ["tankt"] = "tanks",
    ["dps"] = "dps",
    ["heiler"] = "healer",
    ["heilen"] = "heal",
    ["heilung"] = "healing",
    ["heilt"] = "heals",
    ["buff"] = "buff",
    ["buffs"] = "buffs",
    ["debuff"] = "debuff",
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
    ["gruppe"] = "group",
    ["gruppen"] = "groups",
    ["raid"] = "raid",
    ["raids"] = "raids",
    ["instanz"] = "instance",
    ["instanzen"] = "instances",
    ["dungeon"] = "dungeon",
    ["dungeons"] = "dungeons",
    ["boss"] = "boss",
    ["bosse"] = "bosses",
    ["trash"] = "trash",
    ["müll"] = "trash",
    ["add"] = "add",
    ["adds"] = "adds",
    ["patrouille"] = "patrol",
    ["pat"] = "patrol",
    ["pull"] = "pull",
    ["pullt"] = "pulls",
    ["warten"] = "wait",
    ["bereit"] = "ready",
    ["fertig"] = "ready",
    ["los"] = "go",
    ["start"] = "start",
    ["stop"] = "stop",
    ["stopp"] = "stop",
    
    -- Classes (German names)
    ["krieger"] = "warrior",
    ["paladin"] = "paladin",
    ["jäger"] = "hunter",
    ["jägerin"] = "hunter",
    ["schurke"] = "rogue",
    ["priester"] = "priest",
    ["priesterin"] = "priestess",
    ["schamane"] = "shaman",
    ["magier"] = "mage",
    ["hexenmeister"] = "warlock",
    ["druide"] = "druid",
    ["druidin"] = "druid",
    
    -- Class Specializations
    ["waffenkrieger"] = "arms warrior",
    ["furor"] = "fury",
    ["furor krieger"] = "fury warrior",
    ["schutz"] = "protection",
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
    ["kampf"] = "combat",
    ["kampfschurke"] = "combat rogue",
    ["meucheln"] = "assassination",
    ["meuchelschurke"] = "assassination rogue",
    ["heilung"] = "holy",
    ["heilungspriester"] = "holy priest",
    ["disziplin"] = "discipline",
    ["disziplinpriester"] = "discipline priest",
    ["diszi"] = "discipline priest",
    ["schatten"] = "shadow",
    ["schattenpriester"] = "shadow priest",
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
    ["wiederherstellung"] = "restoration",
    ["wiederherstellungdruide"] = "restoration druid",
    
    -- Game Mechanics
    ["loot"] = "loot",
    ["beute"] = "loot",
    ["würfeln"] = "roll",
    ["würfel"] = "roll",
    ["need"] = "need",
    ["greed"] = "greed",
    ["pass"] = "pass",
    ["verzichten"] = "pass",
    ["plündern"] = "loot",
    ["rollen"] = "roll",
    ["gratulation"] = "congratulations",
    ["glückwunsch"] = "congratulations",
    ["gratuliere"] = "congratulations",
    ["trade"] = "trade",
    ["handel"] = "trade",
    ["handeln"] = "trade",
    ["verkaufen"] = "sell",
    ["verkaufe"] = "selling",
    ["kaufen"] = "buy",
    ["kaufe"] = "buying",
    ["preis"] = "price",
    ["gold"] = "gold",
    ["silber"] = "silver",
    ["kupfer"] = "copper",
    ["g"] = "gold",
    ["s"] = "silver",
    ["c"] = "copper",
    
    -- Common WoW Terms
    ["bindung"] = "binding",
    ["beim aufheben gebunden"] = "binds on pickup",
    ["beim ausrüsten gebunden"] = "binds on equip",
    ["einmalig"] = "unique",
    ["legendär"] = "legendary",
    ["episch"] = "epic",
    ["selten"] = "rare",
    ["ungewöhnlich"] = "uncommon",
    ["gewöhnlich"] = "common",
    ["schlecht"] = "poor",
    ["set"] = "set",
    ["satz"] = "set",
    ["satzgegenstände"] = "set items",
    ["stufe"] = "level",
    ["level"] = "level",
    ["lvl"] = "level",
    ["ilvl"] = "item level",
    ["erfahrung"] = "experience",
    ["exp"] = "experience",
    ["xp"] = "experience",
    ["leveln"] = "level",
    ["leveln"] = "leveling",
    ["grinden"] = "grind",
    ["farmen"] = "farm",
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
    ["passiv"] = "passive",
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
    ["burg"] = "castle/keep",
    
    -- More common German words from chat analysis
    ["müsstest"] = "must/would have to", -- "du müsstest" = "you must/would have to"
    ["durfte"] = "was allowed to", -- "ich durfte" = "I was allowed to"
    ["durftest"] = "were allowed to",
    ["durften"] = "were allowed to",
    ["sah"] = "saw", -- Past tense: "ich sah" = "I saw"
    ["sahen"] = "saw",
    ["nahm"] = "took", -- Past tense: "ich nahm" = "I took"
    ["nahmen"] = "took",
    ["gab"] = "gave", -- Past tense: "ich gab" = "I gave"
    ["gaben"] = "gave",
    ["fand"] = "found", -- Past tense: "ich fand" = "I found"
    ["fanden"] = "found",
    ["kaufte"] = "bought", -- Past tense: "ich kaufte" = "I bought"
    ["kauften"] = "bought",
    ["verkaufte"] = "sold", -- Past tense: "ich verkaufte" = "I sold"
    ["verkauften"] = "sold",
    
    -- Common reflexive pronouns and particles
    ["sich"] = "oneself/itself/himself/herself", -- Reflexive pronoun
    ["dir"] = "you", -- Dative: "ich gebe dir" = "I give you"
    ["mir"] = "me", -- Dative: "gib mir" = "give me"
    ["ihm"] = "him/it", -- Dative: "gib ihm" = "give him"
    ["ihr"] = "her/it/you", -- Dative/feminine
    ["uns"] = "us", -- Dative: "gib uns" = "give us"
    ["euch"] = "you", -- Dative plural: "gib euch" = "give you (pl)"
    ["ihnen"] = "them", -- Dative: "gib ihnen" = "give them"
    
    -- ============================================
    -- MASSIVE VOCABULARY EXPANSION
    -- Organized by category for maintainability
    -- This structure serves as a template for other languages
    -- ============================================
    
    -- ============================================
    -- MODAL VERBS (Expanded)
    -- ============================================
    ["müssen"] = "must/have to",
    ["muss"] = "must/have to",
    ["musst"] = "must/have to",
    ["müsst"] = "must/have to",
    ["sollen"] = "should/ought to",
    ["soll"] = "should",
    ["sollst"] = "should",
    ["sollt"] = "should",
    ["dürfen"] = "may/be allowed to",
    ["darf"] = "may/is allowed to",
    ["darfst"] = "may/are allowed to",
    ["dürft"] = "may/are allowed to",
    
    -- ============================================
    -- COMMON ACTION VERBS (Expanded)
    -- ============================================
    ["tun"] = "do",
    ["tut"] = "does",
    ["tust"] = "do",
    ["sagte"] = "said",
    ["sagst"] = "say",
    ["redest"] = "talk/speak",
    ["reden"] = "talk/speak",
    ["spricht"] = "speaks/talks",
    ["sprechen"] = "speak/talk",
    ["hören"] = "hear/listen",
    ["hört"] = "hears/listens",
    ["hörst"] = "hear/listen",
    ["sehst"] = "see",
    ["schauen"] = "look/watch",
    ["schaut"] = "looks/watches",
    ["schaust"] = "look/watch",
    ["findest"] = "find",
    ["verlierst"] = "lose",
    ["gewinnen"] = "win",
    ["gewinnt"] = "wins",
    ["gewinnst"] = "win",
    ["helfen"] = "help",
    ["hilfst"] = "help",
    ["hilft"] = "helps",
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
    ["wissen"] = "know (fact)",
    ["weißt"] = "know (fact)",
    ["kennen"] = "know (person/thing)",
    ["kennst"] = "know (person/thing)",
    ["kennt"] = "knows (person/thing)",
    ["verstehen"] = "understand",
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
    ["meinen"] = "mean/think",
    ["meinst"] = "mean/think",
    ["meint"] = "means/thinks",
    ["hoffen"] = "hope",
    ["hoffst"] = "hope",
    ["hofft"] = "hopes",
    ["wünschen"] = "wish",
    ["wünschst"] = "wish",
    ["wünscht"] = "wishes",
    ["mögen"] = "like",
    ["magst"] = "like",
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
    ["arme"] = "arms",
    ["rücken"] = "back",
    ["bauch"] = "stomach/belly",
    
    -- ============================================
    -- EMOTIONS AND FEELINGS
    -- ============================================
    ["glücklich"] = "happy",
    ["traurig"] = "sad",
    ["müde"] = "tired",
    ["wütend"] = "angry",
    ["ärgerlich"] = "annoyed",
    ["aufgeregt"] = "excited",
    ["entspannt"] = "relaxed",
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
    ["manchmal"] = "sometimes",
    ["oft"] = "often",
    ["selten"] = "rarely",
    ["meistens"] = "mostly/usually",
    
    -- ============================================
    -- LOCATION AND DIRECTION (Expanded)
    -- ============================================
    ["oben"] = "above/up",
    ["unten"] = "below/down",
    ["vorn"] = "front",
    ["hinten"] = "back/behind",
    ["innen"] = "inside",
    ["außen"] = "outside",
    ["drinnen"] = "inside",
    ["dort"] = "there",
    ["weiter"] = "further/continue",
    ["vorwärts"] = "forward",
    ["rückwärts"] = "backward",
    
    -- ============================================
    -- COMMON ADJECTIVES (Expanded)
    -- ============================================
    ["böse"] = "evil/bad",
    ["lang"] = "long",
    ["hoch"] = "high/tall",
    ["niedrig"] = "low",
    ["breit"] = "wide",
    ["eng"] = "narrow/tight",
    ["schwer"] = "heavy/difficult",
    ["leicht"] = "light/easy",
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
    ["essen"] = "eat",
    ["isst"] = "eats",
    ["trinken"] = "drink",
    ["trinkt"] = "drinks",
    ["trinkst"] = "drink",
    ["brot"] = "bread",
    ["fleisch"] = "meat",
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
    ["elf"] = "eleven",
    ["zwölf"] = "twelve",
    ["dreizehn"] = "thirteen",
    ["vierzehn"] = "fourteen",
    ["fünfzehn"] = "fifteen",
    ["sechzehn"] = "sixteen",
    ["siebzehn"] = "seventeen",
    ["achtzehn"] = "eighteen",
    ["neunzehn"] = "nineteen",
    ["zwanzig"] = "twenty",
    ["dreißig"] = "thirty",
    ["vierzig"] = "forty",
    ["fünfzig"] = "fifty",
    ["sechzig"] = "sixty",
    ["siebzig"] = "seventy",
    ["achtzig"] = "eighty",
    ["neunzig"] = "ninety",
    ["hundert"] = "hundred",
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
    ["aufgabe"] = "task/homework",
    ["prüfung"] = "exam/test",
    ["unterricht"] = "lesson/class",
    
    -- ============================================
    -- TRANSPORTATION
    -- ============================================
    ["auto"] = "car",
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
    ["doch"] = "but/yet/after all",
    ["sondern"] = "but rather",
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
    ["fenster"] = "window",
    ["tür"] = "door",
    ["lampe"] = "lamp",
    
    -- ============================================
    -- CLOTHING
    -- ============================================
    ["kleidung"] = "clothing",
    ["hemd"] = "shirt",
    ["hose"] = "pants/trousers",
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
    ["krank"] = "sick/ill",
    ["gesund"] = "healthy",
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
    ["weiß"] = "white",
    ["schwarz"] = "black",
    ["rot"] = "red",
    ["gelb"] = "yellow",
    ["orange"] = "orange",
    ["braun"] = "brown",
    ["grau"] = "gray",
    ["rosa"] = "pink",
    ["lila"] = "purple",
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
    ["damit"] = "so that",
    ["seitdem"] = "since then",
    ["solange"] = "as long as",
    ["sobald"] = "as soon as",
    
    -- ============================================
    -- LEARNING AND EDUCATION VERBS
    -- ============================================
    ["lernen"] = "learn/study",
    ["lernst"] = "learn/study",
    ["lernt"] = "learns/studies",
    ["lehren"] = "teach",
    ["lehrt"] = "teaches",
    
    -- ============================================
    -- BODY ACTIONS (Expanded)
    -- ============================================
    ["springen"] = "jump",
    ["springst"] = "jump",
    ["springt"] = "jumps",
    ["schwimmen"] = "swim",
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
    ["spielen"] = "play",
    ["spielst"] = "play",
    ["spielt"] = "plays",
    ["wohnen"] = "live/reside",
    ["wohnst"] = "live/reside",
    ["wohnt"] = "lives/resides",
    ["kommen"] = "come",
    ["kommst"] = "come",
    ["gehen"] = "go/walk",
    ["gehst"] = "go/walk",
    ["fahren"] = "drive/ride/travel",
    ["fährst"] = "drive/ride/travel",
    ["fliegen"] = "fly",
    ["fliegst"] = "fly",
    ["schwimmen"] = "swim",
    ["schwimmst"] = "swim",
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
    ["putzt"] = "cleans",
    ["aufräumen"] = "tidy up/clean up",
    ["räumst auf"] = "tidy up",
    ["räumt auf"] = "tidies up",
    ["kaufen"] = "buy",
    ["kaufst"] = "buy",
    ["verkaufen"] = "sell",
    ["verkaufst"] = "sell",
    ["schenken"] = "give as gift",
    ["schenkst"] = "give as gift",
    ["schenkt"] = "gives as gift",
    ["leihen"] = "lend/borrow",
    ["leihst"] = "lend/borrow",
    ["leiht"] = "lends/borrows",
    ["reparieren"] = "repair",
    ["reparierst"] = "repair",
    ["repariert"] = "repairs",
    ["bauen"] = "build",
    ["baust"] = "build",
    ["baut"] = "builds",
    ["öffnen"] = "open",
    ["öffnest"] = "open",
    ["schließen"] = "close",
    ["schließt"] = "close",
    ["schließt"] = "closes",
    ["beginnen"] = "begin/start",
    ["beginnst"] = "begin/start",
    ["beginnt"] = "begins/starts",
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
    ["steigen"] = "get in/on",
    ["steigst ein"] = "get in",
    ["steigt ein"] = "gets in",
    ["aussteigen"] = "get out/off",
    ["steigst aus"] = "get out",
    ["steigt aus"] = "gets out",
    ["drehen"] = "turn",
    ["drehst"] = "turn",
    ["dreht"] = "turns",
    ["drehen"] = "rotate",
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
    ["grüßt"] = "greets",
    ["verabschieden"] = "say goodbye",
    ["verabschiedest"] = "say goodbye",
    ["verabschiedet"] = "says goodbye",
    ["bitten"] = "ask/request",
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
    ["fühlen"] = "feel/touch",
    ["fühlst"] = "feel/touch",
    
    -- ============================================
    -- EMOTIONAL AND MENTAL STATES
    -- ============================================
    ["lachen"] = "laugh",
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
    ["freuen"] = "be happy/glad",
    ["freust"] = "be happy",
    ["freut"] = "is happy",
    ["ärgern"] = "annoy/anger",
    ["ärgerst"] = "annoy",
    ["ärgert"] = "annoys",
    ["aufregen"] = "excite/upset",
    ["regst auf"] = "excite",
    ["regt auf"] = "excites",
    
    -- ============================================
    -- OBJECTS AND THINGS
    -- ============================================
    ["ding"] = "thing",
    ["dinge"] = "things",
    ["sache"] = "thing/matter",
    ["sachen"] = "things/stuff",
    ["gegenstand"] = "object/item",
    ["gegenstände"] = "objects/items",
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
    ["gebäude"] = "buildings",
    ["haus"] = "house",
    ["häuser"] = "houses",
    ["turm"] = "tower",
    ["türme"] = "towers",
    ["kirche"] = "church",
    ["kirchen"] = "churches",
    ["schule"] = "school",
    ["schulen"] = "schools",
    ["universität"] = "university",
    ["krankenhaus"] = "hospital",
    ["krankenhäuser"] = "hospitals",
    ["geschäft"] = "shop/store",
    ["geschäfte"] = "shops/stores",
    ["laden"] = "shop/store",
    ["läden"] = "shops/stores",
    ["markt"] = "market",
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
    ["tunnel"] = "tunnels",
    
    -- ============================================
    -- NATURE AND GEOGRAPHY
    -- ============================================
    ["berg"] = "mountain",
    ["berge"] = "mountains",
    ["tal"] = "valley",
    ["täler"] = "valleys",
    ["see"] = "lake",
    ["seen"] = "lakes",
    ["meer"] = "sea",
    ["fluss"] = "river",
    ["flüsse"] = "rivers",
    ["bach"] = "stream/brook",
    ["bäche"] = "streams/brooks",
    ["ozean"] = "ocean",
    ["insel"] = "island",
    ["inseln"] = "islands",
    ["strand"] = "beach",
    ["strände"] = "beaches",
    ["küste"] = "coast",
    ["küsten"] = "coasts",
    ["wüste"] = "desert",
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
    ["sonne"] = "sun",
    
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
    ["fisch"] = "fish",
    ["fische"] = "fishes",
    ["maus"] = "mouse",
    ["mäuse"] = "mice",
    ["elefant"] = "elephant",
    ["elefanten"] = "elephants",
    ["löwe"] = "lion",
    ["löwen"] = "lions",
    ["tiger"] = "tiger",
    ["tiger"] = "tigers",
    ["wolf"] = "wolf",
    ["wölfe"] = "wolves",
    
    -- ============================================
    -- MATERIALS AND SUBSTANCES
    -- ============================================
    ["holz"] = "wood",
    ["stein"] = "stone",
    ["metall"] = "metal",
    ["eisen"] = "iron",
    ["gold"] = "gold",
    ["silber"] = "silver",
    ["kupfer"] = "copper",
    ["glas"] = "glass",
    ["papier"] = "paper",
    ["stoff"] = "fabric/cloth",
    ["leder"] = "leather",
    ["wasser"] = "water",
    ["feuer"] = "fire",
    ["luft"] = "air",
    ["erdgas"] = "natural gas",
    ["öl"] = "oil",
    
    -- ============================================
    -- BODY ACTIONS AND PHYSICAL VERBS
    -- ============================================
    ["treffen"] = "meet/hit",
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
    ["gewinnen"] = "win",
    ["verlieren"] = "lose",
    ["verlierst"] = "lose",
    ["verliert"] = "loses",
    ["suchen"] = "search/look for",
    ["suchst"] = "search/look for",
    ["finden"] = "find",
    ["verlieren"] = "lose",
    ["verstecken"] = "hide",
    ["versteckst"] = "hide",
    ["versteckt"] = "hides",
    ["entdecken"] = "discover",
    ["entdeckst"] = "discover",
    ["entdeckt"] = "discovers",
    
    -- ============================================
    -- TIME-RELATED VERBS
    -- ============================================
    ["warten"] = "wait",
    ["wartest"] = "wait",
    ["dauern"] = "last/take time",
    ["dauerst"] = "last",
    ["dauert"] = "lasts",
    ["frühstücken"] = "have breakfast",
    ["frühstückst"] = "have breakfast",
    ["frühstückt"] = "has breakfast",
    ["mittagessen"] = "have lunch",
    ["isst mittag"] = "have lunch",
    ["isst mittag"] = "has lunch",
    ["abendessen"] = "have dinner",
    ["isst abend"] = "have dinner",
    ["isst abend"] = "has dinner",
    
    -- ============================================
    -- MORE ADJECTIVES (Expanded)
    -- ============================================
    ["klug"] = "smart/clever",
    ["dumm"] = "stupid",
    ["faul"] = "lazy",
    ["fleißig"] = "hardworking",
    ["ehrlich"] = "honest",
    ["unehrlich"] = "dishonest",
    ["freundlich"] = "friendly",
    ["unfreundlich"] = "unfriendly",
    ["höflich"] = "polite",
    ["unhöflich"] = "impolite",
    ["ruhig"] = "quiet/calm",
    ["laut"] = "loud",
    ["still"] = "silent",
    ["stark"] = "strong",
    ["schwach"] = "weak",
    ["müde"] = "tired",
    ["wach"] = "awake",
    ["schlaf"] = "sleep/sleeping",
    ["hungrig"] = "hungry",
    ["durstig"] = "thirsty",
    ["satt"] = "full/satisfied",
    ["reich"] = "rich",
    ["arm"] = "poor",
    ["teuer"] = "expensive",
    ["billig"] = "cheap",
    ["kostenlos"] = "free (cost)",
    ["frei"] = "free/available",
    ["besetzt"] = "occupied/busy",
    ["leer"] = "empty",
    ["voll"] = "full",
    ["neu"] = "new",
    ["alt"] = "old",
    ["jung"] = "young",
    ["modern"] = "modern",
    ["altmodisch"] = "old-fashioned",
    ["richtig"] = "correct/right",
    ["falsch"] = "wrong/false",
    ["wahr"] = "true",
    ["unwahr"] = "untrue",
    ["wichtig"] = "important",
    ["unwichtig"] = "unimportant",
    ["interessant"] = "interesting",
    ["langweilig"] = "boring",
    ["lustig"] = "funny",
    ["ernst"] = "serious",
    ["gefährlich"] = "dangerous",
    ["sicher"] = "safe",
    ["unsicher"] = "unsafe",
    ["leicht"] = "easy/light",
    ["schwer"] = "hard/heavy",
    ["einfach"] = "simple/easy",
    ["kompliziert"] = "complicated",
    ["sauber"] = "clean",
    ["schmutzig"] = "dirty",
    ["ordentlich"] = "neat/tidy",
    ["unordentlich"] = "messy",
    ["klar"] = "clear",
    ["unklar"] = "unclear",
    ["schnell"] = "fast",
    ["langsam"] = "slow",
    ["pünktlich"] = "on time",
    ["verspätet"] = "late/delayed",
    ["fertig"] = "ready/done",
    ["bereit"] = "ready",
    ["beschäftigt"] = "busy",
    ["verfügbar"] = "available",
    
    -- ============================================
    -- MORE ADVERBS (Expanded)
    -- ============================================
    ["wirklich"] = "really/actually",
    ["eigentlich"] = "actually/really",
    ["tatsächlich"] = "actually/in fact",
    ["sogar"] = "even",
    ["besonders"] = "especially",
    ["hauptsächlich"] = "mainly",
    ["besonders"] = "especially",
    ["vielleicht"] = "maybe/perhaps",
    ["möglicherweise"] = "possibly",
    ["wahrscheinlich"] = "probably",
    ["bestimmt"] = "certainly/probably",
    ["sicherlich"] = "certainly",
    ["natürlich"] = "naturally/of course",
    ["klar"] = "clearly/of course",
    ["leider"] = "unfortunately",
    ["glücklicherweise"] = "fortunately",
    ["hoffentlich"] = "hopefully",
    ["wahrscheinlich"] = "probably",
    ["vielleicht"] = "maybe",
    ["völlig"] = "completely",
    ["ganz"] = "quite/completely",
    ["ziemlich"] = "quite/rather",
    ["einigermaßen"] = "somewhat",
    ["relativ"] = "relatively",
    ["absolut"] = "absolutely",
    ["total"] = "totally",
    ["genau"] = "exactly/precisely",
    ["ungefähr"] = "approximately/about",
    ["fast"] = "almost",
    ["kaum"] = "hardly/scarcely",
    ["genug"] = "enough",
    ["zu"] = "too",
    ["auch"] = "also/too",
    ["ebenfalls"] = "also/as well",
    ["gleichfalls"] = "likewise",
    ["dagegen"] = "against it/on the other hand",
    ["trotzdem"] = "nevertheless/anyway",
    ["dennoch"] = "nevertheless",
    ["jedoch"] = "however",
    ["allerdings"] = "however/though",
    ["andererseits"] = "on the other hand",
    ["einerseits"] = "on one hand",
    ["außerdem"] = "besides/moreover",
    ["zusätzlich"] = "additionally",
    ["darüber hinaus"] = "beyond that/furthermore",
    ["deshalb"] = "therefore",
    ["deswegen"] = "because of that",
    ["darum"] = "because of that",
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
    ["schwimmen"] = "swimming",
    ["laufen"] = "running",
    ["radfahren"] = "cycling",
    ["wandern"] = "hiking",
    ["klettern"] = "climbing",
    ["tanzen"] = "dancing",
    ["musik"] = "music",
    ["spielen"] = "play",
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
    ["arzt"] = "doctor",
    ["ärztin"] = "doctor (female)",
    ["krankenschwester"] = "nurse",
    ["pfleger"] = "nurse/caregiver",
    ["pflegerin"] = "nurse/caregiver (female)",
    ["ingenieur"] = "engineer",
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
    ["koch"] = "cook/chef",
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
    ["glück"] = "happiness/luck",
    ["unglück"] = "misfortune",
    ["trauer"] = "sadness/grief",
    ["freude"] = "joy",
    ["angst"] = "fear",
    ["hoffnung"] = "hope",
    ["zweifel"] = "doubt",
    ["vertrauen"] = "trust",
    ["misstrauen"] = "mistrust",
    ["glaube"] = "belief/faith",
    ["zweifel"] = "doubt",
    ["hoffnung"] = "hope",
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
    ["ziel"] = "goal/target",
    ["ziele"] = "goals/targets",
    ["wunsch"] = "wish",
    ["wünsche"] = "wishes",
    ["befehl"] = "command/order",
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
    ["viel"] = "much/many",
    ["viele"] = "many",
    ["wenig"] = "little/few",
    ["wenige"] = "few",
    ["mehr"] = "more",
    ["meiste"] = "most",
    ["meisten"] = "most",
    ["mehrere"] = "several",
    ["einige"] = "some",
    ["etliche"] = "quite a few",
    ["ein paar"] = "a few/a couple",
    ["paar"] = "couple/pair",
    ["paare"] = "couples/pairs",
    ["alle"] = "all/everyone",
    ["jeder"] = "every/each",
    ["jede"] = "every/each",
    ["jedes"] = "every/each",
    ["manche"] = "some",
    ["keine"] = "none/no",
    ["kein"] = "no/none",
    ["keiner"] = "none/no one",
    ["niemand"] = "nobody",
    ["nichts"] = "nothing",
    ["etwas"] = "something",
    ["irgendwas"] = "anything",
    ["irgendjemand"] = "anyone",
    ["jemand"] = "someone",
    ["man"] = "one/you (impersonal)",
    ["allein"] = "alone",
    ["gemeinsam"] = "together",
    ["einzeln"] = "individually/single",
    
    -- ============================================
    -- GAMING-SPECIFIC TERMS (Expanded)
    -- ============================================
    ["spiel"] = "game",
    ["spiele"] = "games",
    ["spieler"] = "player",
    ["spielerin"] = "player (female)",
    ["gegner"] = "opponent/enemy",
    ["gegnerin"] = "opponent/enemy (female)",
    ["mannschaft"] = "team",
    ["mannschaften"] = "teams",
    ["mannschaft"] = "team",
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
    ["erfahrung"] = "experience",
    ["erfahrungen"] = "experiences",
    ["fähigkeit"] = "ability/skill",
    ["fähigkeiten"] = "abilities/skills",
    ["fertigkeit"] = "skill/ability",
    ["fertigkeiten"] = "skills/abilities",
    ["waffe"] = "weapon",
    ["waffen"] = "weapons",
    ["rüstung"] = "armor",
    ["rüstungen"] = "armor pieces",
    ["schild"] = "shield",
    ["schilde"] = "shields",
    ["schwert"] = "sword",
    ["schwerter"] = "swords",
    ["bogen"] = "bow",
    ["bögen"] = "bows",
    ["pfeil"] = "arrow",
    ["pfeile"] = "arrows",
    ["zauber"] = "spell",
    ["zauber"] = "spells",
    ["magie"] = "magic",
    ["magisch"] = "magical",
    ["kampf"] = "fight/battle",
    ["kämpfe"] = "fights/battles",
    ["schlacht"] = "battle",
    ["schlachten"] = "battles",
    ["krieg"] = "war",
    ["kriege"] = "wars",
    
    -- ============================================
    -- INTERNET AND COMPUTER TERMS (Expanded)
    -- ============================================
    ["seite"] = "page/site",
    ["seiten"] = "pages/sites",
    ["website"] = "website",
    ["websites"] = "websites",
    ["link"] = "link",
    ["links"] = "links",
    ["suche"] = "search",
    ["suchen"] = "search",
    ["sucht"] = "searches",
    ["download"] = "download",
    ["downloaden"] = "download",
    ["hochladen"] = "upload",
    ["uploaden"] = "upload",
    ["datei"] = "file",
    ["dateien"] = "files",
    ["ordner"] = "folder",
    ["ordner"] = "folders",
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
    ["maus"] = "mouse",
    ["drucker"] = "printer",
    ["drucker"] = "printers",
    ["drucken"] = "print",
    ["druckst"] = "print",
    ["druckt"] = "prints",
    
    -- ============================================
    -- FOOD-RELATED VERBS AND NOUNS (Expanded)
    -- ============================================
    ["frühstück"] = "breakfast",
    ["mittagessen"] = "lunch",
    ["abendessen"] = "dinner",
    ["mahlzeit"] = "meal",
    ["mahlzeiten"] = "meals",
    ["snack"] = "snack",
    ["snacks"] = "snacks",
    ["getränk"] = "drink/beverage",
    ["getränke"] = "drinks/beverages",
    ["obst"] = "fruit",
    ["gemüse"] = "vegetables",
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
    ["brot"] = "bread",
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
    ["gewitter"] = "thunderstorms",
    ["blitz"] = "lightning",
    ["donner"] = "thunder",
    ["nebel"] = "fog",
    ["nebelig"] = "foggy",
    ["trocken"] = "dry",
    ["feucht"] = "humid/moist",
    ["temperatur"] = "temperature",
    ["temperaturen"] = "temperatures",
    ["grad"] = "degree/degrees",
    ["grad"] = "degrees",
    
    -- ============================================
    -- MORE PREPOSITIONS AND PARTICLE WORDS
    -- ============================================
    ["entlang"] = "along",
    ["gemäß"] = "according to",
    ["entsprechend"] = "according to",
    ["zufolge"] = "according to",
    ["zuliebe"] = "for the sake of",
    ["zuliebe"] = "for",
    ["zufolge"] = "according to",
    ["zuwider"] = "contrary to",
    ["entgegen"] = "contrary to/against",
    ["gegenüber"] = "opposite/toward",
    ["entsprechend"] = "according to",
    
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
    ["wegen"] = "because of",
    ["dank"] = "thanks to",
    ["trotz"] = "despite",
    ["obwohl"] = "although",
    ["obgleich"] = "although",
    ["wenn auch"] = "even though",
    ["auch wenn"] = "even if",
    
    -- ============================================
    -- EXPRESSIONS OF PURPOSE AND INTENT
    -- ============================================
    ["damit"] = "so that",
    ["um...zu"] = "in order to",
    ["zwecks"] = "for the purpose of",
    ["zweck"] = "purpose",
    ["absicht"] = "intention",
    ["absichten"] = "intentions",
    ["ziel"] = "goal/target",
    ["ziele"] = "goals/targets",
    
    -- ============================================
    -- MORE VERB PREFIXES AND SEPARABLE VERBS
    -- ============================================
    ["ab"] = "off/away",
    ["an"] = "on/at",
    ["auf"] = "up/on",
    ["aus"] = "out/from",
    ["ein"] = "in/into",
    ["mit"] = "with/along",
    ["nach"] = "after/to",
    ["über"] = "over/about",
    ["unter"] = "under",
    ["vor"] = "before/in front of",
    ["weg"] = "away",
    ["zu"] = "to/closed",
    ["zurück"] = "back",
    ["zusammen"] = "together",
    ["entgegen"] = "toward/against",
    ["entlang"] = "along",
    ["gegenüber"] = "opposite",
    
    -- ============================================
    -- HOUSEHOLD ITEMS (Expanded)
    -- ============================================
    ["bettdecke"] = "blanket/comforter",
    ["kissen"] = "pillow",
    ["kissen"] = "pillows",
    ["bettwäsche"] = "bedding",
    ["matratze"] = "mattress",
    ["schrank"] = "wardrobe/closet",
    ["schränke"] = "wardrobes/closets",
    ["regal"] = "shelf",
    ["regale"] = "shelves",
    ["schublade"] = "drawer",
    ["schubladen"] = "drawers",
    ["spiegel"] = "mirror",
    ["spiegel"] = "mirrors",
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
    ["sessel"] = "armchairs",
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
    ["trockner"] = "dryers",
    
    -- ============================================
    -- CLOTHING AND ACCESSORIES (Expanded)
    -- ============================================
    ["pullover"] = "sweater",
    ["pullover"] = "sweaters",
    ["t-shirt"] = "t-shirt",
    ["t-shirts"] = "t-shirts",
    ["hose"] = "pants/trousers",
    ["hosen"] = "pants/trousers",
    ["jeans"] = "jeans",
    ["rock"] = "skirt",
    ["röcke"] = "skirts",
    ["kleid"] = "dress",
    ["kleider"] = "dresses",
    ["socke"] = "sock",
    ["socken"] = "socks",
    ["strumpf"] = "stocking",
    ["strümpfe"] = "stockings",
    ["unterwäsche"] = "underwear",
    ["pyjama"] = "pajamas",
    ["schuhe"] = "shoes",
    ["stiefel"] = "boots",
    ["sandalen"] = "sandals",
    ["handschuhe"] = "gloves",
    ["handschuh"] = "glove",
    ["schal"] = "scarf",
    ["schals"] = "scarves",
    ["mütze"] = "cap/beanie",
    ["hut"] = "hat",
    ["hüte"] = "hats",
    ["brille"] = "glasses",
    ["sonnenbrille"] = "sunglasses",
    ["uhr"] = "watch/clock",
    ["uhren"] = "watches/clocks",
    ["ring"] = "ring",
    ["ringe"] = "rings",
    ["kette"] = "necklace/chain",
    ["ketten"] = "necklaces/chains",
    ["ohrring"] = "earring",
    ["ohrringe"] = "earrings",
    ["gürtel"] = "belt",
    ["gürtel"] = "belts",
    ["tasche"] = "bag",
    ["taschen"] = "bags",
    ["rucksack"] = "backpack",
    ["rucksäcke"] = "backpacks",
    
    -- ============================================
    -- SCHOOL AND LEARNING (Expanded)
    -- ============================================
    ["buch"] = "book",
    ["bücher"] = "books",
    ["heft"] = "notebook",
    ["hefte"] = "notebooks",
    ["ordner"] = "binder",
    ["stift"] = "pen/pencil",
    ["stifte"] = "pens/pencils",
    ["bleistift"] = "pencil",
    ["bleistifte"] = "pencils",
    ["kugelschreiber"] = "ballpoint pen",
    ["kugelschreiber"] = "ballpoint pens",
    ["radiergummi"] = "eraser",
    ["radiergummis"] = "erasers",
    ["lineal"] = "ruler",
    ["lineale"] = "rulers",
    ["schere"] = "scissors",
    ["scheren"] = "scissors",
    ["taschenrechner"] = "calculator",
    ["taschenrechner"] = "calculators",
    ["tafel"] = "blackboard",
    ["tafeln"] = "blackboards",
    ["kreide"] = "chalk",
    ["marker"] = "marker",
    ["marker"] = "markers",
    ["textmarker"] = "highlighter",
    ["textmarker"] = "highlighters",
    ["klasse"] = "class",
    ["klassen"] = "classes",
    ["kurs"] = "course",
    ["kurse"] = "courses",
    ["unterricht"] = "class/lesson",
    ["stunde"] = "hour/class period",
    ["pausen"] = "breaks",
    ["pause"] = "break",
    ["hausaufgabe"] = "homework",
    ["hausaufgaben"] = "homework",
    ["prüfung"] = "exam/test",
    ["prüfungen"] = "exams/tests",
    ["test"] = "test",
    ["tests"] = "tests",
    ["klausur"] = "exam",
    ["klausuren"] = "exams",
    ["arbeit"] = "paper/assignment",
    ["arbeiten"] = "papers/assignments",
    ["note"] = "grade",
    ["noten"] = "grades",
    ["zeugnis"] = "report card/certificate",
    ["zeugnisse"] = "report cards/certificates",
    
    -- ============================================
    -- TIME-RELATED WORDS (Expanded)
    -- ============================================
    ["sekunde"] = "second",
    ["sekunden"] = "seconds",
    ["minute"] = "minute",
    ["minuten"] = "minutes",
    ["stunde"] = "hour",
    ["stunden"] = "hours",
    ["tag"] = "day",
    ["tage"] = "days",
    ["woche"] = "week",
    ["wochen"] = "weeks",
    ["monat"] = "month",
    ["monate"] = "months",
    ["jahr"] = "year",
    ["jahre"] = "years",
    ["jahrzehnt"] = "decade",
    ["jahrzehnte"] = "decades",
    ["jahrhundert"] = "century",
    ["jahrhunderte"] = "centuries",
    ["moment"] = "moment",
    ["momente"] = "moments",
    ["augenblick"] = "moment/instant",
    ["augenblicke"] = "moments/instants",
    ["zeitpunkt"] = "point in time",
    ["zeitpunkte"] = "points in time",
    ["zeitraum"] = "period of time",
    ["zeiträume"] = "periods of time",
    ["dauer"] = "duration",
    ["dauern"] = "durations",
    ["geschwindigkeit"] = "speed",
    ["geschwindigkeiten"] = "speeds",
    ["tempus"] = "tempo",
    ["tempus"] = "tempos",
    
    -- ============================================
    -- BODY AND HEALTH (Expanded)
    -- ============================================
    ["körper"] = "body",
    ["körper"] = "bodies",
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
    ["stirn"] = "foreheads",
    ["kinn"] = "chin",
    ["kinne"] = "chins",
    ["hals"] = "neck/throat",
    ["hälse"] = "necks/throats",
    ["schulter"] = "shoulder",
    ["schultern"] = "shoulders",
    ["brust"] = "chest/breast",
    ["brüste"] = "chests/breasts",
    ["bauch"] = "stomach/belly",
    ["bäuche"] = "stomachs/bellies",
    ["rücken"] = "back",
    ["rücken"] = "backs",
    ["knie"] = "knife",
    ["knie"] = "knives",
    ["knöchel"] = "ankle",
    ["knöchel"] = "ankles",
    ["fuß"] = "foot",
    ["füße"] = "feet",
    ["zeh"] = "toe",
    ["zehen"] = "toes",
    ["organ"] = "organ",
    ["organe"] = "organs",
    ["herz"] = "heart",
    ["herzen"] = "hearts",
    ["lunge"] = "lung",
    ["lungen"] = "lungs",
    ["leber"] = "liver",
    ["lebern"] = "livers",
    ["magen"] = "stomach",
    ["mägen"] = "stomachs",
    ["blut"] = "blood",
    ["knochen"] = "bone",
    ["knochen"] = "bones",
    ["muskel"] = "muscle",
    ["muskeln"] = "muscles",
    ["nerv"] = "nerve",
    ["nerven"] = "nerves",
    ["gehirn"] = "brain",
    ["gehirne"] = "brains",
    
    -- ============================================
    -- MEDICAL AND HEALTH TERMS (Expanded)
    -- ============================================
    ["gesundheit"] = "health",
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
    ["verband"] = "bandage",
    ["verbände"] = "bandages",
    ["pflaster"] = "band-aid/plaster",
    ["pflaster"] = "band-aids/plasters",
    ["tablette"] = "pill/tablet",
    ["tabletten"] = "pills/tablets",
    ["medikament"] = "medication",
    ["medikamente"] = "medications",
    ["arzneimittel"] = "medicine",
    ["arzneimittel"] = "medicines",
    ["operation"] = "operation/surgery",
    ["operationen"] = "operations/surgeries",
    ["krankenwagen"] = "ambulance",
    ["krankenwagen"] = "ambulances",
    
    -- ============================================
    -- FAMILY RELATIONSHIPS (Expanded)
    -- ============================================
    ["familie"] = "family",
    ["familien"] = "families",
    ["eltern"] = "parents",
    ["vater"] = "father/dad",
    ["väter"] = "fathers/dads",
    ["mutter"] = "mother/mom",
    ["mütter"] = "mothers/moms",
    ["sohn"] = "son",
    ["söhne"] = "sons",
    ["tochter"] = "daughter",
    ["töchter"] = "daughters",
    ["bruder"] = "brother",
    ["brüder"] = "brothers",
    ["schwester"] = "sister",
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
    ["enkel"] = "grandsons",
    ["enkelin"] = "granddaughter",
    ["enkelinnen"] = "granddaughters",
    ["onkel"] = "uncle",
    ["onkel"] = "uncles",
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
    ["schwiegereltern"] = "parents-in-law",
    ["schwiegerkind"] = "child-in-law",
    ["schwiegerkinder"] = "children-in-law",
    
    -- ============================================
    -- RELATIONSHIPS AND SOCIAL (Expanded)
    -- ============================================
    ["freund"] = "friend/boyfriend",
    ["freunde"] = "friends",
    ["freundin"] = "friend/girlfriend",
    ["freundinnen"] = "friends",
    ["bekannter"] = "acquaintance",
    ["bekannte"] = "acquaintances",
    ["kollege"] = "colleague",
    ["kollegen"] = "colleagues",
    ["kollegin"] = "colleague (female)",
    ["kolleginnen"] = "colleagues (female)",
    ["nachbar"] = "neighbor",
    ["nachbarn"] = "neighbors",
    ["nachbarin"] = "neighbor (female)",
    ["nachbarinnen"] = "neighbors (female)",
    ["partner"] = "partner",
    ["partner"] = "partners",
    ["partnerin"] = "partner (female)",
    ["partnerinnen"] = "partners (female)",
    ["mann"] = "man/husband",
    ["männer"] = "men/husbands",
    ["frau"] = "woman/wife",
    ["frauen"] = "women/wives",
    ["mensch"] = "human/person",
    ["menschen"] = "humans/people",
    ["person"] = "person",
    ["personen"] = "persons/people",
    ["leute"] = "people",
    ["kind"] = "child",
    ["kinder"] = "children",
    ["junge"] = "boy",
    ["jungen"] = "boys",
    ["mädchen"] = "girl",
    ["mädchen"] = "girls",
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
    ["freude"] = "joy/happiness",
    ["trauer"] = "sadness/grief",
    ["angst"] = "fear/anxiety",
    ["wut"] = "anger/rage",
    ["ärger"] = "anger/annoyance",
    ["enttäuschung"] = "disappointment",
    ["enttäuschungen"] = "disappointments",
    ["hoffnung"] = "hope",
    ["hoffnungen"] = "hopes",
    ["zweifel"] = "doubt",
    ["zweifel"] = "doubts",
    ["vertrauen"] = "trust",
    ["misstrauen"] = "mistrust",
    ["liebe"] = "love",
    ["haß"] = "hate",
    ["sympathie"] = "sympathy/liking",
    ["antipathie"] = "antipathy/dislike",
    ["bewunderung"] = "admiration",
    ["neid"] = "envy",
    ["eifersucht"] = "jealousy",
    ["stolz"] = "pride",
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
    ["sehen"] = "sight/seeing",
    ["hören"] = "hearing/listening",
    ["riechen"] = "smell/smelling",
    ["schmecken"] = "taste/tasting",
    ["berühren"] = "touch/touching",
    ["geschmack"] = "taste/flavor",
    ["geschmäcker"] = "tastes/flavors",
    ["geruch"] = "smell/scent",
    ["gerüche"] = "smells/scents",
    ["geräusch"] = "sound/noise",
    ["geräusche"] = "sounds/noises",
    ["lärm"] = "noise",
    ["stille"] = "silence",
    ["ruhe"] = "quiet/peace",
    ["helligkeit"] = "brightness",
    ["dunkelheit"] = "darkness",
    ["blick"] = "look/glance",
    ["blicke"] = "looks/glances",
    ["ansicht"] = "view/opinion",
    ["ansichten"] = "views/opinions",
    
    -- ============================================
    -- WEATHER PHENOMENA (Expanded)
    -- ============================================
    ["wolke"] = "cloud",
    ["wolken"] = "clouds",
    ["regenbogen"] = "rainbow",
    ["regenbögen"] = "rainbows",
    ["hagel"] = "hail",
    ["frost"] = "frost",
    ["eis"] = "ice",
    ["eisregen"] = "freezing rain",
    ["tau"] = "dew",
    ["nebel"] = "fog/mist",
    ["dunst"] = "haze",
    ["rauch"] = "smoke",
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
    ["blume"] = "flower",
    ["blumen"] = "flowers",
    ["baum"] = "tree",
    ["bäume"] = "trees",
    ["strauch"] = "bush/shrub",
    ["sträucher"] = "bushes/shrubs",
    ["gras"] = "grass",
    ["moos"] = "moss",
    ["pilz"] = "mushroom",
    ["pilze"] = "mushrooms",
    ["beere"] = "berry",
    ["beeren"] = "berries",
    ["nuss"] = "nut",
    ["nüsse"] = "nuts",
    ["samen"] = "seed",
    ["samen"] = "seeds",
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
    ["ändern"] = "change",
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
    ["herstellen"] = "manufacture/make",
    ["stellst her"] = "make",
    ["stellt her"] = "makes",
    ["bauen"] = "build",
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
    ["reißt ab"] = "tears down",
    ["vernichten"] = "destroy/eliminate",
    ["vernichtest"] = "destroy",
    ["vernichtet"] = "destroys",
    
    -- ============================================
    -- VERBS OF TRANSFER AND MOVEMENT
    -- ============================================
    ["geben"] = "give",
    ["gibst"] = "give",
    ["gibt"] = "gives",
    ["bekommen"] = "get/receive",
    ["bekommst"] = "get/receive",
    ["bekommt"] = "gets/receives",
    ["erhalten"] = "receive/get",
    ["erhältst"] = "receive",
    ["erhält"] = "receives",
    ["schenken"] = "give as gift",
    ["übergeben"] = "hand over",
    ["gibst über"] = "hand over",
    ["gibt über"] = "hands over",
    ["überreichen"] = "present/hand over",
    ["reichst über"] = "present",
    ["reicht über"] = "presents",
    ["schicken"] = "send",
    ["schickst"] = "send",
    ["schickt"] = "sends",
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
    ["besitzen"] = "own/possess",
    ["besitzt"] = "own/possess",
    ["gehören"] = "belong",
    ["haben"] = "have",
    ["besitzen"] = "possess",
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
    -- VERBS OF ATTEMPT AND SUCCESS
    -- ============================================
    ["versuchen"] = "try/attempt",
    ["versuchst"] = "try",
    ["versucht"] = "tries",
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
    ["wählen"] = "elect/vote",
    ["auswählen"] = "pick out",
    ["preferieren"] = "prefer",
    ["preferierst"] = "prefer",
    ["preferiert"] = "prefers",
    ["bevorzugen"] = "prefer",
    ["bevorzugst"] = "prefer",
    ["bevorzugt"] = "prefers",
    
    -- ============================================
    -- VERBS OF KNOWLEDGE AND UNDERSTANDING
    -- ============================================
    ["verstehen"] = "understand",
    ["verstehst"] = "understand",
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
    ["lernen"] = "learn",
    ["lehren"] = "teach",
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
    ["lieben"] = "love",
    ["liebst"] = "love",
    ["hassen"] = "hate",
    ["mögen"] = "like",
    ["magst"] = "like",
    ["bevorzugen"] = "prefer",
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
    ["sorgen"] = "worry",
    ["freuen"] = "be happy/glad",
    ["freust"] = "be happy",
    ["ärgern"] = "annoy/anger",
    ["verärgern"] = "annoy/anger",
    ["verärgerst"] = "annoy",
    ["verärgert"] = "annoys",
    ["aufregen"] = "excite/upset",
    ["enttäuschen"] = "disappoint",
    ["enttäuschst"] = "disappoint",
    ["enttäuscht"] = "disappoints",
    ["überraschen"] = "surprise",
    ["überraschst"] = "surprise",
    ["überrascht"] = "surprises",
    ["schockieren"] = "shock",
    ["schockierst"] = "shock",
    ["schockiert"] = "shocks",
    
    -- ============================================
    -- VERBS OF BEGINNING AND ENDING
    -- ============================================
    ["beginnen"] = "begin/start",
    ["anfangen"] = "begin/start",
    ["fängst an"] = "begin",
    ["fängt an"] = "begins",
    ["starten"] = "start",
    ["startest"] = "start",
    ["startet"] = "starts",
    ["beginnen"] = "commence",
    ["aufnehmen"] = "begin/take up",
    ["nimmst auf"] = "begin",
    ["nimmt auf"] = "begins",
    ["enden"] = "end",
    ["beenden"] = "end/finish",
    ["beendest"] = "end",
    ["beendet"] = "ends",
    ["aufhören"] = "stop/cease",
    ["fertigstellen"] = "complete/finish",
    ["stellst fertig"] = "complete",
    ["stellt fertig"] = "completes",
    ["vollenden"] = "complete/finish",
    ["vollendest"] = "complete",
    ["vollendet"] = "completes",
    ["abschließen"] = "finish/conclude",
    ["schließt ab"] = "finish",
    ["schließt ab"] = "finishes",
    
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
    ["löst aus"] = "triggers",
    ["beeinflussen"] = "influence",
    ["beeinflusst"] = "influence",
    ["beeinflusst"] = "influences",
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
    ["helfen"] = "help",
    ["unterstützen"] = "support",
    ["unterstützt"] = "support",
    ["unterstützt"] = "supports",
    ["beistehen"] = "stand by/support",
    ["stehst bei"] = "stand by",
    ["steht bei"] = "stands by",
    ["beistehen"] = "assist",
    ["beistellen"] = "provide/supply",
    ["stellst bei"] = "provide",
    ["stellt bei"] = "provides",
    ["versorgen"] = "provide/supply",
    ["versorgst"] = "provide",
    ["versorgt"] = "provides",
    ["sorgen"] = "take care of",
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
    ["stoppen"] = "stop",
    ["stoppst"] = "stop",
    ["stoppt"] = "stops",
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
    ["schauen"] = "look/watch",
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
    ["gucken"] = "peek/peep",
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
    ["alchemie"] = "alchemy",
    ["schmiedekunst"] = "blacksmithing",
    ["kochkunst"] = "cooking",
    ["verzauberkunst"] = "enchanting",
    ["schneiderei"] = "tailoring",
    ["kräuterkunde"] = "herbalism",
    ["bergbau"] = "mining",
    ["angeln"] = "fishing",
    ["kürschnerei"] = "skinning",
    ["wildtierausbildung"] = "beast training",
    
    -- Game Mechanics Terms (German)
    ["schlachtzug"] = "raid",
    ["beute"] = "loot",
    ["looten"] = "loot",
    ["lootet"] = "loots",
    ["reittier"] = "mount",
    ["reittiere"] = "mounts",
    ["begleiter"] = "pet/companion",
    ["begleiter"] = "pets/companions",
    ["abklingzeit"] = "cooldown",
    ["abklingzeiten"] = "cooldowns",
    
    -- Stats and Attributes (German)
    ["stärke"] = "strength",
    ["beweglichkeit"] = "agility",
    ["intelligenz"] = "intellect",
    ["willenskraft"] = "spirit",
    ["trefferchance"] = "hit",
    ["widerstand"] = "resistance",
    ["widerstände"] = "resistances",
    ["angriffskraft"] = "attack power",
    ["zaubermacht"] = "spell power",
    ["zauberkraft"] = "spell power",
    ["kritischer treffer"] = "critical strike",
    ["krit"] = "crit/critical",
    ["kritisch"] = "critical",
    
    -- Abilities and Combat Terms (German)
    ["wiederbelebung"] = "resurrection",
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
    ["unterbrechen"] = "interrupt",
    ["unterbrechung"] = "interruption",
    ["rückstoß"] = "knockback/pushback",
    ["knockback"] = "knockback",
    ["pushback"] = "pushback",
    
    -- Additional Combat Terms
    ["verblassen"] = "fade",
    ["verblasst"] = "fades",
    ["tödlich"] = "lethal/deadly",
    ["schaden"] = "damage",
    ["schäden"] = "damages",
    ["schaden nehmen"] = "take damage",
    ["nimmt schaden"] = "takes damage",
    ["heilung"] = "healing",
    ["heilt"] = "heals",
    ["heilt über zeit"] = "heals over time",
    ["schutz"] = "protection/shield",
    ["schutzschild"] = "shield",
    ["schild"] = "shield",
    ["schild"] = "shields",
    ["panzerung"] = "armor",
    ["panzer"] = "armor",
    ["verteidigung"] = "defense",
    ["abwehr"] = "defense/parry",
    ["ausweichen"] = "dodge",
    ["blocken"] = "block",
    ["blockt"] = "blocks",
    ["blockiert"] = "blocks",
    ["parrieren"] = "parry",
    ["pariert"] = "parries",
    
    -- Status Effects
    ["betäubt"] = "stunned",
    ["betäubung"] = "stun",
    ["betäuben"] = "stun",
    ["betäubt"] = "stuns",
    ["verzaubert"] = "charmed",
    ["verzauberung"] = "charm",
    ["verwirrt"] = "confused",
    ["verwirrung"] = "confusion",
    ["verlangsamt"] = "slowed",
    ["verlangsamung"] = "slow",
    ["verlangsamen"] = "slow",
    ["verlangsamt"] = "slows",
    ["wurzeln"] = "roots",
    ["wurzel"] = "root",
    ["wurzelt"] = "roots",
    ["gefroren"] = "frozen",
    ["frost"] = "frost",
    ["gefriert"] = "freezes",
    ["verbrannt"] = "burned",
    ["brennt"] = "burns",
    ["vergiftet"] = "poisoned",
    ["gift"] = "poison",
    ["vergiftet"] = "poisons",
    ["verflucht"] = "cursed",
    ["fluch"] = "curse",
    ["verflucht"] = "curses",
    ["verwundet"] = "wounded",
    ["wunde"] = "wound",
    ["wunden"] = "wounds",
    
    -- Group and Raid Mechanics
    ["markierung"] = "marking",
    ["markierungen"] = "markings",
    ["markiert"] = "marked",
    ["markieren"] = "mark",
    ["markiert"] = "marks",
    ["ziel"] = "target",
    ["ziele"] = "targets",
    ["zielen"] = "target",
    ["zielt"] = "targets",
    ["aggro"] = "aggro/threat",
    ["bedrohung"] = "threat",
    ["bedrohungen"] = "threats",
    ["bedroht"] = "threatens",
    ["tank"] = "tank",
    ["tanken"] = "tank",
    ["tankt"] = "tanks",
    ["tankt"] = "tanks",
    ["heilt"] = "heals",
    ["heiler"] = "healer",
    ["heilt"] = "heals",
    ["dps"] = "DPS",
    ["schaden"] = "damage",
    ["schaden machen"] = "deal damage",
    ["macht schaden"] = "deals damage",
    
    -- Item Quality and Rarity
    ["qualität"] = "quality",
    ["qualitäten"] = "qualities",
    ["selten"] = "rare",
    ["seltenheit"] = "rarity",
    ["episch"] = "epic",
    ["legendär"] = "legendary",
    ["legendär"] = "legendary",
    ["artefakt"] = "artifact",
    ["artefakte"] = "artifacts",
    ["einzigartig"] = "unique",
    ["einzigartig"] = "unique",
    ["ungewöhnlich"] = "uncommon",
    ["gewöhnlich"] = "common",
    ["verzaubert"] = "enchanted",
    ["verzauberung"] = "enchantment",
    ["verzauberungen"] = "enchantments",
    
    -- Item Types (Additional)
    ["verbrauchbar"] = "consumable",
    ["verbrauchbar"] = "consumables",
    ["tränk"] = "potion",
    ["tränke"] = "potions",
    ["elixier"] = "elixir",
    ["elixiere"] = "elixirs",
    ["trank"] = "potion/drink",
    ["tränke"] = "potions/drinks",
    ["essenz"] = "essence",
    ["essenzen"] = "essences",
    ["reagenz"] = "reagent",
    ["reagenzien"] = "reagents",
    ["material"] = "material",
    ["materialien"] = "materials",
    ["mats"] = "materials",
    ["rohstoff"] = "raw material",
    ["rohstoffe"] = "raw materials",
    
    -- Additional Zones and Locations
    ["höhlen"] = "caverns",
    ["minen"] = "mines",
    ["mine"] = "mine",
    ["tempel"] = "temple",
    ["tempel"] = "temples",
    ["ruinen"] = "ruins",
    ["ruine"] = "ruin",
    ["festung"] = "fortress",
    ["festungen"] = "fortresses",
    ["burg"] = "castle/keep",
    ["burgen"] = "castles/keeps",
    ["turm"] = "tower",
    ["türme"] = "towers",
    ["turm"] = "tower",
    ["turm"] = "towers",
    ["turm"] = "tower",
    ["turm"] = "towers",
    
    -- Additional Dungeon Terms
    ["kerker"] = "dungeon",
    ["kerker"] = "dungeons",
    ["verlies"] = "dungeon",
    ["verliese"] = "dungeons",
    ["instanz"] = "instance",
    ["instanzen"] = "instances",
    ["bosskampf"] = "boss fight",
    ["bosskämpfe"] = "boss fights",
    ["trash"] = "trash",
    ["müll"] = "trash",
    ["add"] = "add",
    ["adds"] = "adds",
    ["patrouille"] = "patrol",
    ["patrouillen"] = "patrols",
    ["pull"] = "pull",
    ["pulls"] = "pulls",
    ["pullt"] = "pulls",
    
    -- Quest Terms (Additional)
    ["questgeber"] = "quest giver",
    ["questgeber"] = "quest givers",
    ["questziel"] = "quest objective",
    ["questziele"] = "quest objectives",
    ["questbelohnung"] = "quest reward",
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
    ["duell"] = "duel",
    ["duelle"] = "duels",
    ["duellieren"] = "duel",
    ["duelliert"] = "duels",
    ["kampf"] = "battle/fight",
    ["kämpfe"] = "battles/fights",
    ["sieg"] = "victory",
    ["siege"] = "victories",
    ["niederlage"] = "defeat",
    ["niederlagen"] = "defeats",
    
    -- Additional Game Terms
    ["spieler"] = "player",
    ["spieler"] = "players",
    ["charakter"] = "character",
    ["charaktere"] = "characters",
    ["account"] = "account",
    ["accounts"] = "accounts",
    ["server"] = "server",
    ["server"] = "servers",
    ["realm"] = "realm",
    ["realms"] = "realms",
    ["welt"] = "world",
    ["welten"] = "worlds",
    ["zone"] = "zone",
    ["zonen"] = "zones",
    ["gebiet"] = "area/region",
    ["gebiete"] = "areas/regions",
    
    -- ============================================
    -- END OF VOCABULARY EXPANSION
    -- ============================================
}
