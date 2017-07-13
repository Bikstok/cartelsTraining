/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

life_respawned = true;
life_loadout = true;
life_gotloadout = true;

[life_dead_gear] spawn life_fnc_loadDeadGear; //Asylum version

/*_oldGear = [life_corpse] call life_fnc_fetchDeadGear; //Tonics version
[_oldGear] spawn life_fnc_loadDeadGear; //Tonics version
_dir = getDir life_corpse;*/


closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Retexturing of units clothing, vanilla files only retexture the EMS unit.
switch(playerSide) do {
	case independent: {
		[[player,0,"textures\medic_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
	};
};

//Bring me back to life.
//player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable ["realname",nil,true];
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
deleteVehicle life_corpse;

[] spawn
	{
		life_revive_fatigue = time + 40;
		[2,"You have been revived by an unprofessional; you feel weakened."] call life_fnc_broadcast;
		while { time < life_revive_fatigue && alive player } do
		{
			player enableFatigue true;
			player forceWalk true;
			player setFatigue 1
		};
		if (alive player) then { [2,"You feel a bit better now."] call life_fnc_broadcast; };
		player setFatigue 0.5;
		life_revive_fatigue = 0;
		player forceWalk false;
		player setVariable["can_revive",(player getVariable["can_revive", time]) + 600, true];
	};

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["last_revived",time,true];

[] call life_fnc_hudUpdate;
