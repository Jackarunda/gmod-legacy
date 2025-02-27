AddCSLuaFile()
ENT.Type 			= "anim"
ENT.PrintName		= "Antlions"
ENT.Author			= "Jackarunda"
ENT.Information		= ""
ENT.Category		= "JMod - LEGACY NPCs"

ENT.Spawnable		= true
ENT.AdminSpawnable	= true
if(SERVER)then
	local SquadName="JackyAntlionOpSquad"
	function ENT:SpawnFunction(ply,tr)
		local selfpos=tr.HitPos+tr.HitNormal*16
		util.PrecacheModel("models/antlion_guard.mdl")
		util.PrecacheModel("models/antlion.mdl")
		util.PrecacheModel("models/antlion_worker.mdl")
		local npc1
		local npc2
		local npc3
		local npc4
		local npc5
		local npc6
		local npc7
		local npc8
		local npc9
		local npc10
		local npc11
		local npc12
		local npc13
		local npc14
		local npc15
		local npc16
		local npc17
		local npc18
		local npc19
		local npc20
		local npc21
		local npc22
		local npc23
		local npc24
		local npc25
		local npc26
		local npc27
		local npc28
		local npc29
		local npc30
		local npc=ents.Create("npc_antlionguard")
		npc:SetPos(selfpos+Vector(0,50,0))
		npc:SetAngles(Angle(0,90,0))
		npc:SetKeyValue("allowbark","1")
		npc:Spawn()
		npc:Activate()
		npc:SetKeyValue("SquadName",SquadName)
		npc.JackyDamageGroup=SquadName
		JackyOpSquadSpawnEvent(npc)
		npc1=npc
		local npc=ents.Create("npc_antlionguard")
		npc:SetPos(selfpos+Vector(0,-50,0))
		npc:SetAngles(Angle(0,-90,0))
		npc:SetKeyValue("cavernbreed","1")
		npc:SetMaterial("valvescavernbreed")
		npc:SetKeyValue("incavern","1")
		npc:SetKeyValue("allowbark","1")
		npc:Spawn()
		npc:Activate()
		npc:SetKeyValue("SquadName",SquadName)
		npc.JackyDamageGroup=SquadName
		JackyOpSquadSpawnEvent(npc)
		npc30=npc
		timer.Simple(0.05,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(100,0,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc2=npc
		end)
		timer.Simple(0.1,function()
			local npc=ents.Create("npc_antlion_worker")
			npc:SetPos(selfpos+Vector(100,100,0))
			npc:SetAngles(Angle(0,45,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc3=npc
		end)
		timer.Simple(0.15,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(75,0,0))
			npc:SetAngles(Angle(0,0,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc4=npc
		end)
		timer.Simple(0.2,function()
			local npc=ents.Create("npc_antlion_worker")
			npc:SetPos(selfpos+Vector(-100,100,0))
			npc:SetAngles(Angle(0,135,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc5=npc
		end)
		timer.Simple(0.25,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(-100,0,0))
			npc:SetAngles(Angle(0,180,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc6=npc
		end)
		timer.Simple(0.3,function()
			local npc=ents.Create("npc_antlion_worker")
			npc:SetPos(selfpos+Vector(-100,-100,0))
			npc:SetAngles(Angle(0,225,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc7=npc
		end)
		timer.Simple(0.35,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(-75,0,0))
			npc:SetAngles(Angle(0,180,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc8=npc
		end)
		timer.Simple(0.4,function()
			local npc=ents.Create("npc_antlion_worker")
			npc:SetPos(selfpos+Vector(100,-100,0))
			npc:SetAngles(Angle(0,315,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc9=npc
		end)
		timer.Simple(0.45,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(187.5,0,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc10=npc
		end)
		timer.Simple(0.5,function()
			local npc=ents.Create("npc_antlion_worker")
			npc:SetPos(selfpos+Vector(187.5,187.5,0))
			npc:SetAngles(Angle(0,45,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc11=npc
		end)
		timer.Simple(0.55,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(0,187.5,0))
			npc:SetAngles(Angle(0,90,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc12=npc
		end)
		timer.Simple(0.6,function()
			local npc=ents.Create("npc_antlion_worker")
			npc:SetPos(selfpos+Vector(-187.5,187.5,0))
			npc:SetAngles(Angle(0,135,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc13=npc
		end)
		timer.Simple(0.65,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(-187.5,0,0))
			npc:SetAngles(Angle(0,180,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc14=npc
		end)
		timer.Simple(0.7,function()
			local npc=ents.Create("npc_antlion_worker")
			npc:SetPos(selfpos+Vector(-187.5,-187.5,0))
			npc:SetAngles(Angle(0,225,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc15=npc
		end)
		timer.Simple(0.75,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(0,-187.5,0))
			npc:SetAngles(Angle(0,270,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc16=npc
		end)
		timer.Simple(0.8,function()
			local npc=ents.Create("npc_antlion_worker")
			npc:SetPos(selfpos+Vector(187.5,-187.5,0))
			npc:SetAngles(Angle(0,315,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc17=npc
		end)
		timer.Simple(0.85,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(187.5,-100,0))
			npc:SetAngles(Angle(0,337.5,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)

			JackyOpSquadSpawnEvent(npc)
			npc18=npc
		end)
		timer.Simple(0.9,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(281.25,0,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc19=npc
		end)
		timer.Simple(0.95,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(187.5,100,0))
			npc:SetAngles(Angle(0,22.5,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc20=npc
		end)
		timer.Simple(1,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(100,187.5,0))
			npc:SetAngles(Angle(0,67.5,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc21=npc
		end)
		timer.Simple(1.05,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(0,281.25,0))
			npc:SetAngles(Angle(0,90,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc22=npc
		end)
		timer.Simple(1.1,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(-100,187.5,0))
			npc:SetAngles(Angle(0,112.5,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc23=npc
		end)
		timer.Simple(1.15,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(-187.5,100,0))
			npc:SetAngles(Angle(0,157.5,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc24=npc
		end)
		timer.Simple(1.2,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(-281.25,0,0))
			npc:SetAngles(Angle(0,180,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc25=npc
		end)
		timer.Simple(1.25,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(-187.5,-100,0))
			npc:SetAngles(Angle(0,202.5,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc26=npc
		end)
		timer.Simple(1.3,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(-100,-187.5,0))
			npc:SetAngles(Angle(0,247.5,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc27=npc
		end)
		timer.Simple(1.35,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(0,-281.25,0))
			npc:SetAngles(Angle(0,270,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc28=npc
		end)
		timer.Simple(1.4,function()
			local npc=ents.Create("npc_antlion")
			npc:SetPos(selfpos+Vector(100,-187.5,0))
			npc:SetAngles(Angle(0,292.5,0))
			npc:SetKeyValue("startburrowed","1")
			npc:Spawn()
			npc:Activate()
			npc:SetKeyValue("SquadName",SquadName)
			npc.JackyDamageGroup=SquadName
			npc:Fire("unburrow","",0)
			JackyOpSquadSpawnEvent(npc)
			npc29=npc
		end)
		timer.Simple(1.45,function()
			undo.Create("Antlion Opposition Squad")
			undo.SetPlayer(ply)
			if(IsValid(npc1))then undo.AddEntity(npc1) end
			if(IsValid(npc2))then undo.AddEntity(npc2) end
			if(IsValid(npc3))then undo.AddEntity(npc3) end
			if(IsValid(npc4))then undo.AddEntity(npc4) end
			if(IsValid(npc5))then undo.AddEntity(npc5) end
			if(IsValid(npc6))then undo.AddEntity(npc6) end
			if(IsValid(npc7))then undo.AddEntity(npc7) end
			if(IsValid(npc8))then undo.AddEntity(npc8) end
			if(IsValid(npc9))then undo.AddEntity(npc9) end
			if(IsValid(npc10))then undo.AddEntity(npc10) end
			if(IsValid(npc11))then undo.AddEntity(npc11) end
			if(IsValid(npc12))then undo.AddEntity(npc12) end
			if(IsValid(npc13))then undo.AddEntity(npc13) end
			if(IsValid(npc14))then undo.AddEntity(npc14) end
			if(IsValid(npc15))then undo.AddEntity(npc15) end
			if(IsValid(npc16))then undo.AddEntity(npc16) end
			if(IsValid(npc17))then undo.AddEntity(npc17) end
			if(IsValid(npc18))then undo.AddEntity(npc18) end
			if(IsValid(npc19))then undo.AddEntity(npc19) end
			if(IsValid(npc20))then undo.AddEntity(npc20) end
			if(IsValid(npc21))then undo.AddEntity(npc21) end
			if(IsValid(npc22))then undo.AddEntity(npc22) end
			if(IsValid(npc23))then undo.AddEntity(npc23) end
			if(IsValid(npc24))then undo.AddEntity(npc24) end
			if(IsValid(npc25))then undo.AddEntity(npc25) end
			if(IsValid(npc26))then undo.AddEntity(npc26) end
			if(IsValid(npc27))then undo.AddEntity(npc27) end
			if(IsValid(npc28))then undo.AddEntity(npc28) end
			if(IsValid(npc29))then undo.AddEntity(npc29) end
			if(IsValid(npc30))then undo.AddEntity(npc30) end
			undo.SetCustomUndoText("Undone Antlion Opposition Squad")
			undo.Finish()
		end)
	end
	JackieNPCSpawningTable.Enhanced["Antlion Guard"]=function(selfpos)
		local npc=ents.Create("npc_antlionguard")
		npc:SetPos(selfpos)
		npc:SetAngles(Angle(0,0,0))
		npc:SetKeyValue("allowbark","1")
		npc:Spawn()
		npc:Activate()
		npc:SetKeyValue("SquadName",SquadName)
		npc.JackyDamageGroup=SquadName
		JackyOpSquadSpawnEvent(npc)
		return npc
	end
	JackieNPCSpawningTable.Enhanced["Cavern Guard"]=function(selfpos)
		local npc=ents.Create("npc_antlionguard")
		npc:SetPos(selfpos)
		npc:SetAngles(Angle(0,0,0))
		npc:SetKeyValue("cavernbreed","1")
		npc:SetMaterial("valvescavernbreed")
		npc:SetKeyValue("incavern","1")
		npc:SetKeyValue("allowbark","1")
		npc:Spawn()
		npc:Activate()
		npc:SetKeyValue("SquadName",SquadName)
		npc.JackyDamageGroup=SquadName
		JackyOpSquadSpawnEvent(npc)
		return npc
	end
end