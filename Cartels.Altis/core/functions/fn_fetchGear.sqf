/*#include <macro.h>

if (time - life_last_death_gear < 5) exitWith {life_dead_gear};

private["_primary,_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_headgear","_goggles","_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_primitems = [];
_secitems = [];
_handgunitems = [];
_primary = primaryWeapon _unit;
_launcher = secondaryWeapon _unit;
_handgun = handGunWeapon _unit;
_magazines = [];
_uniform = uniform _unit;
_vest = vest _unit;
_backpack = backpack _unit;
_items = assignedItems _unit;
if(primaryWeapon _unit != "") then {_primitems = primaryWeaponItems _unit;};
if(handgunWeapon _unit != "") then {_handgunItems = handgunItems _unit;};
_headgear = headgear _unit;
_goggles = goggles _unit;
_uitems = [];
_vitems = [];
_bitems = [];
if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems _unit);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems _unit);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems _unit);};

if(primaryWeapon _unit != "" && count (primaryWeaponMagazine _unit) > 0) then
{
	_magazines pushBack ((primaryWeaponMagazine _unit) select 0);
};

if(secondaryWeapon _unit != "" && count (secondaryWeaponMagazine _unit) > 0) then
{
	_magazines pushBack ((secondaryWeaponMagazine _unit) select 0);
};

if(handgunWeapon _unit != "" && count (handgunMagazine _unit) > 0) then
{
	_magazines pushBack ((handgunMagazine _unit) select 0);
};

life_last_death_gear = time;

if(isNil "_handgunItems") then {_handgunItems = ["","",""];};
[_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_headgear,_goggles];*/

/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_fetchGear.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Fetches the players current gear and returns it in the correct formatted array.
*/
private["_primary,_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_headgear","_goggles"];
_primitems = [];
_secitems = [];
_handgunitems = [];
_primary = primaryWeapon player;
_launcher = secondaryWeapon player;
_handgun = handGunWeapon player;
_magazines = [];
_uniform = uniform player;
_vest = vest player;
_backpack = backpack player;
_items = assignedItems player;
if(primaryWeapon player != "") then {_primitems = primaryWeaponItems player;};
if(handgunWeapon player != "") then {_handgunItems = handgunItems player;};
_headgear = headgear player;
_goggles = goggles player;
_uitems = [];
_vitems = [];
_bitems = [];
if(_uniform != "") then {{_uitems set[count _uitems,_x];} foreach (uniformItems player);};
if(_vest != "") then {{_vitems set[count _vitems,_x];} foreach (vestItems player);};
if(_backpack != "") then {{_bitems set[count _bitems,_x];} foreach (backPackItems player);};

if(primaryWeapon player != "") then
{
	player selectWeapon (primaryWeapon player);
	if(currentMagazine player != "") then
	{
		_magazines set[count _magazines,currentMagazine player];
	};
};

if(secondaryWeapon player != "") then
{
	player selectWeapon (secondaryWeapon player);
	if(currentMagazine player != "") then
	{
		_magazines set[count _magazines,currentMagazine player];
	};
};

if(handgunWeapon player != "") then
{
	player selectWeapon (handgunWeapon player);
	if(currentMagazine player != "") then
	{
		_magazines set[count _magazines,currentMagazine player];
	};
};
player selectWeapon (primaryWeapon player);

if(isNil "_handgunItems") then {_handgunItems = ["","",""];};
[_primary,_launcher,_handgun,_magazines,_uniform,_vest,_backpack,_items,_primitems,_secitems,_handgunitems,_uitems,_vitems,_bitems,_headgear,_goggles];
