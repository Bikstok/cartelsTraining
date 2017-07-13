#include <macro.h>
/*
	File: fn_healHospital.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Doesn't matter, will be revised later.
*/
titleText[localize "STR_NOTF_HS_Healing","PLAIN"];

uiSleep 8;

if(player distance (_this select 0) > 5) exitWith {titleText[localize "STR_NOTF_HS_ToFar","PLAIN"]};
titleText[localize "STR_NOTF_HS_Healed","PLAIN"];
player setVariable["can_revive", nil, true];
player setDamage 0;
[0] call life_fnc_setPain;
[false] call life_fnc_brokenLeg;
life_thirst = 100;
life_hunger = 100;
