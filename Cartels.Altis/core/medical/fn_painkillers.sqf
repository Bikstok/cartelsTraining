/*
		File: fn_painkillers.sqf
		Author: John "Paratus" VanderZwet

		Description: Removes pain effects
*/

_unit = [_this,3,objNull,[objNull]] call BIS_fnc_param; // index 3 due to addAction

if (isNull _unit) exitWith {};
if (_unit == player) then {
	[0] spawn life_fnc_setPain;
	titleText["You consume pain killers.","PLAIN"];
} else {
	[[0],"life_fnc_setPain",_unit,false] spawn BIS_fnc_MP;
	titleText[format["You feed painkillers to %1.", name _unit],"PLAIN"];
};
