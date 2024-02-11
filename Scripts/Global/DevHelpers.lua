function FindNPC(substring)
	for i, npc in Game.NPC do
		if string.find(npc.Name, substring) then
			print("npc index", i)
			print(dump(npc))
		end
	end
end

function FindNPCByHouseId(house)
	for i, npc in Game.NPC do
		if npc.House == house then
			print("npc index", i)
			print(dump(npc))
		end
	end
end


function FindTopicIndex(topicName) 
	for i, topic in Game.NPCTopic do
		if topic == "Hunter" then
			print("topic index", i)
		end
	end
end

function FindNPCText(substring)
	for i, text in Game.NPCText do
		if string.find(text, substring) then
			print("topic index", i)
			print(text)
		end
	end
end


function FindNPCGreeting(substring)
    for i, npc in Game.NPCGreet do
        for j, greeting in npc do
            if string.find(greeting, substring) then
                print("Substring found in Game.NPCGreet["..i.."]["..j.."]")
            end
        end
    end
end


function AddTenOf(itemId)
    for i = 0, 9 do
        evt.Add("Inventory", itemId)
    end
end

function AddXOf(itemId, x)
    for i = 0, x do
        evt.Add("Inventory", itemId)
    end
end
