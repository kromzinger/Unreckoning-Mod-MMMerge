function events.Tick()
	if Game.CurrentScreen==7 then
		local pl=Party[Game.CurrentPlayer]
		local race=Game.CharacterPortraits[Party[Game.CurrentPlayer].Face].Race
		if race==const.Race.Minotaur and not minotaurDetected and (pl.Class<34 or pl.Class>37) then
			local s,m = SplitSkill(pl.Skills[3])
			if m>=2 then
				for i=1,#oneHandedAxes do
					txt=Game.ItemsTxt[oneHandedAxes[i]]
					txt.Skill=2
					txt.EquipStat=0
				end
				for i=1,#twoHandedAxes do
					txt=Game.ItemsTxt[twoHandedAxes[i]]
					txt.Skill=3
					txt.EquipStat=0
				end
			end
			if m>=3 then
				for i=1,#twoHandedAxes do
					txt=Game.ItemsTxt[twoHandedAxes[i]]
					txt.Skill=2
					txt.EquipStat=0
				end
			end
			pl.Skills[2]=1024
			minotaurDetected=true
		elseif race~=const.Race.Minotaur and minotaurDetected then
			for i=1,#oneHandedAxes do
				txt=Game.ItemsTxt[oneHandedAxes[i]]
				txt.Skill=3
				txt.EquipStat=0
			end
			for i=1,#twoHandedAxes do
				txt=Game.ItemsTxt[twoHandedAxes[i]]
				txt.Skill=3
				txt.EquipStat=1
			end
			minotaurDetected=false
		end
	elseif minotaurDetected then
		for i=1,#oneHandedAxes do
			txt=Game.ItemsTxt[oneHandedAxes[i]]
			txt.Skill=3
			txt.EquipStat=0
		end
		for i=1,#twoHandedAxes do
			txt=Game.ItemsTxt[twoHandedAxes[i]]
			txt.Skill=3
			txt.EquipStat=1
		end
		minotaurDetected=false
	end
end

--list of 2h axes and 1h axe
function events.GameInitialized2()
	oneHandedAxes={}
	twoHandedAxes={}
	for i=1, Game.ItemsTxt.High do
		txt=Game.ItemsTxt[i]
		if txt.Skill==3 then
			if txt.EquipStat==1 then
				table.insert(twoHandedAxes,i)
			else
				table.insert(oneHandedAxes,i)
			end
		end
	end
	
end

shieldDamageBonus={1,2,3,4, [0]=0}
function events.CalcStatBonusBySkills(t)
    if t.Stat == const.Stats.MeleeDamageBase then
        if Game.CharacterPortraits[t.Player.Face].Race == const.Race.Dwarf then
            local it=t.Player:GetActiveItem(0)
            if it and it:T().Skill==const.Skills.Shield then
                local s,m = SplitSkill(t.Player:GetSkill(const.Skills.Shield))
                t.Result=t.Result + shieldDamageBonus[m]*s
            end
        end
    end
end
