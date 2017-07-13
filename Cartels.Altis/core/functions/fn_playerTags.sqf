#include <macro.h>

/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Adds the tags above other players heads when close and have visible range.
*/
scopeName "main";
["playerTags", "onEachFrame",
{
	private["_vis","_pos","_near","_name","_icon","_width","_height","_gang"];

	if (life_adminXray == 1) then {
		{
			if (isPlayer _x) then {
				 _pos = visiblePosition _x;
				 _pos set[2,(getPosATL _x select 2) + 2.2];
				 _name = name _x;
				drawIcon3D ["",[1,1,1,1],_pos,0,0,0,_name,0,0.04];
			};
		} forEach allUnits;
		breakTo "main";
	};

    _near = getPos player nearEntities [["Man","Car","Air","Ship"],10];
    {
		if(!(_x isKindOf "Man")) then
		{
			_smallIcon = ["B_G_Van_01_fuel_F","C_Van_01_fuel_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_transport_F","B_G_Van_01_transport_F","C_Van_01_box_F","C_Boat_Civil_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","I_SDV_01_F","O_SDV_01_F","B_SDV_01_F"];
			_icon = getText (configFile >> "CfgVehicles" >> typeOf _x >> "picture");
			if (surfaceIsWater (position _x)) then
					{
						_pos = visiblePositionASL _x;
						_pos set[2,(getPosASL _x select 2) + 2.2];
					} else
					{
						_pos = visiblePosition _x;
						_pos set[2,(getPosATL _x select 2) + 2.2];
					};
			if((typeOf _x) in _smallIcon) then {_width = 1} else {_width = 2};
			_height = 1;
			_color = [1,1,1,0.7];
			_name = "";
			_crew = crew _x;
			if (count _crew > 0 && vehicle player != _x) then
			{
				{if(_name == "") then {_name = name _x } else {_name = _name + ", " + name _x }} forEach _crew;
				drawIcon3D [_icon,_color,_pos,_width,_height,0,_name,0,0.04];
			};

		} else
		{

			_hidden = ((goggles _x) in ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"]);
			_distance = 15;
			if (_hidden) then { _distance = 3; };
			if((player distance _x) < _distance && isPlayer _x && _x != player && !(_x getVariable["isInvisible",false])) then
			{
				_vis = lineIntersects [eyePos player, eyePos _x,player, _x];
				if(!_vis) then
				{
					_icon = "";
					if (surfaceIsWater (position _x)) then
					{
						_pos = visiblePositionASL _x;
						_pos set[2,(getPosASL _x select 2) + 2.2];
					} else
					{
						_pos = visiblePosition _x;
						_pos set[2,(getPosATL _x select 2) + 2.2];
					};
					_width = 0.85;
					_height = 0.85;
					_color = [1,1,1,0.7];
					if (!alive _x ) then { _color = [1,0,0,1]; };
					switch (_x getVariable["coplevel", 0]) do
					{
						case (1) : {_name = format["Police Cadet %1", name _x];_icon = [0,"texture"] call BIS_fnc_rankParams;};
						case (2) : {_name = format["Police Constable %1", name _x];_icon = MISSION_ROOT + "icons\pfc_gs.paa";};
						case (3) : {_name = format["Police Corporal %1", name _x];_icon = [1,"texture"] call BIS_fnc_rankParams;};
						case (4) : {_name = format["Police Sergeant %1", name _x];_icon = [2,"texture"] call BIS_fnc_rankParams;};
						case (5) : {_name = format["Police Lieutenant %1", name _x];_icon = [3,"texture"] call BIS_fnc_rankParams;};
						case (6) : {_name = format["Police Captain %1", name _x];_icon = [4,"texture"] call BIS_fnc_rankParams;};
						default {
							_gang = _x getVariable["gangName",""];
							_name = name _x;
							_width = 0;
							_height = 0;
							if (_gang != "") then {
								_pos2 = +_pos;
								_pos2 set[2,(getPosATL _x select 2) + 2];
								drawIcon3D ["",_color,_pos2,_width,_height,0,format["[%1]", _gang],0,0.03];
							};
						};
					};
					drawIcon3D [_icon,_color,_pos,_width,_height,0,_name,0,0.04];
				};
			};
		};
    } forEach _near;

	if (life_targetTag) then
	{
		if (!isNull cursorTarget) then
		{
			if (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") then
			{
				_vis = lineIntersects [eyePos player, eyePos cursorTarget,player, cursorTarget];
				if (cursorTarget in _near) then { _vis = true };
				if (!_vis) then
				{
					_pos = visiblePosition cursorTarget;
					_pos set[2,(getPosATLVisual cursorTarget select 2) + 2.2];
					if (surfaceIsWater (position cursorTarget)) then
					{
						_pos = visiblePositionASL cursorTarget;
						_pos set[2,(getPosASLVisual cursorTarget select 2) + 2.2];
					};
					_height = 1;
					_color = [1,1,1,1];
					_name = "";
					_crew = crew cursorTarget;
					if (count _crew > 0 && vehicle player != cursorTarget) then
					{
						{if(_name == "") then {_name = name _x } else {_name = _name + ", " + name _x }} forEach _crew;
						drawIcon3D ["",_color,_pos,0,0,0,_name,1,0.04];
					};
				};
			};
			if (cursorTarget isKindOf "Man") then
			{
				_hidden = ((goggles cursorTarget) in ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"]);
				_vis = lineIntersects [eyePos player, eyePos cursorTarget,player, cursorTarget];
				if (cursorTarget in _near && !_hidden) then { _vis = true };
				if (!_vis) then
				{
					_pos = visiblePosition cursorTarget;
					_pos set[2,((getPosATLVisual cursorTarget) select 2) + 2.2];
					if (surfaceIsWater (position cursorTarget)) then
					{
						_pos = visiblePositionASL cursorTarget;
						_pos set[2,((getPosASLVisual cursorTarget) select 2) + 2.2];
					};
					_color = [1,1,1,1];
					_name = name cursorTarget;
					if (!alive cursorTarget ) then { _color = [1,0,0,1]; _name = cursorTarget getVariable ["name", "Unknown Dead Guy"]; };
					switch (cursorTarget getVariable["coplevel", 0]) do
					{
						case (1) : {_name = format["Police Cadet %1", name cursorTarget];};
						case (2) : {_name = format["Police Constable %1", name cursorTarget];};
						case (3) : {_name = format["Police Corporal %1", name cursorTarget];};
						case (4) : {_name = format["Police Sergeant %1", name cursorTarget];};
						case (5) : {_name = format["Police Lieutenant %1", name cursorTarget];};
						case (6) : {_name = format["Police Captain %1", name cursorTarget];};
						default {
							_gang = cursorTarget getVariable["gangName",""];
							if (_hidden && player distance cursorTarget > 20) then { _name = "Unknown" };
							if (_gang != "") then {
								_pos2 = +_pos;
								_pos2 set[2,((getPosATL cursorTarget) select 2) + 2];

								drawIcon3D ["",_color,_pos2,0,0,0,format["[%1]", _gang],0.25,0.01];
							};
						};
					};
					drawIcon3D ["",_color,_pos,0,0,0,_name,1,0.04];
				};
			};
		};
    };
}] call BIS_fnc_addStackedEventHandler;
