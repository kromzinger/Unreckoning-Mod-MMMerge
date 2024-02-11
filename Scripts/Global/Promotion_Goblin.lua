-- topics when speaking with npc
local A, B, C, D, E, F = 0, 1, 2, 3, 4, 5

local EbednezerIndex = 384
local gazloweIndex = 389 -- Anthony Green
Game.NPC[gazloweIndex].Name = "Gazlowe"
Game.NPC[gazloweIndex].Pic = 1031 -- Goblin portrait

local AnthonyGreenHouse = Game.NPC[gazloweIndex].House
-- Move Goblin leader into Ebednezers house.
Game.NPC[gazloweIndex].House = Game.NPC[EbednezerIndex].House
-- Move Ebednezer into Anthony Greens house
Game.NPC[EbednezerIndex].House = Game.NPC[AnthonyGreenHouse].House


Game.NPCGreet[195][0] = [[
[Gazlowe sniffs the air]

What do we have here?
]]

Quest{ 
	"GoblinPromotion",
    NPC = gazloweIndex,
    Slot = A, -- change to correct slot (for instance the slot you want to replace)
    QuestItem = {
		{653, Count = 10},  
	},
    Exp = 15000,
    Done = function(t)
        for _, player in Party do
            if player.Class == 30 then
                player.Class = Party.Players[0].Class + 1
            end
        end
	end
}
.SetTexts{
	Topic = "Headhunter",
    Quest = "Kill the ogres and rip of their ears!",
	Give = [[
To become a Headhunter you need that sense of vengeance
Ya know who did us goblin bad?
Them OGRES! They drove us off Jadame and now they placed a scouting party in tidewater island?!
Kill the ogres and bring me 10 Ogre ears as proof of they're demise
Yo will then be promoted to Headhunter status. 
The rest of you will be honorary Headhunter
]],
    Undone = "Yo have still to bring me 10 Ogre ears!",
    Done = [[
Ahahahah! great! ill eat them right away, you are now known as Headhunters! those of you of none goblins and other lesser races are Honorary Headhunters!
]],
    After = [[
Ha! fallow ogre slayers! couldn't done it without me could ya now?! What else do ya want?
]],
    Award = "Received promotion to Honorary Headhunter",
}

-- 
-- to get ears do the following: AddXOf(653, 10)
--

-- Gazlowe before change
-- npc index	389
-- {
-- 	Bits = 0,
-- 	EventA = 849,
-- 	EventB = 851,
-- 	EventC = 0,
-- 	EventD = 0,
-- 	EventE = 0,
-- 	EventF = 0,
-- 	Events = {
-- 		849,
-- 		851,
-- 		0,
-- 		0,
-- 		0,
-- 		0
-- 	},
-- 	Exist = true,
-- 	Fame = 0,
-- 	Greet = 196,
-- 	Hired = false,
-- 	House = 950,
-- 	Joins = 0,
-- 	Name = "Anthony Green",
-- 	NewsTopic = 0,
-- 	Pic = 921,
-- 	Profession = 0,
-- 	Rep = 0,
-- 	Sex = 0,
-- 	TalkedBefore = false,
-- 	TalkedOnce = false,
-- 	TellsNews = 0,
-- 	ThreatenedBefore = false,
-- 	UsedSpell = 0
-- }