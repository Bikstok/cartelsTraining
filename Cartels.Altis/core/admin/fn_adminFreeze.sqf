#include <macro.h>
/*
	File: fn_adminFreeze.sqf
	Author: ColinM9991

	Description: Freezes selected player
*/
if(__GETC__(life_adminlevel) < 2) exitWith {
  closeDialog 0;
  systemChat "You need a higher admin level in order to open this.";
};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

[[player],"life_fnc_freezePlayer",_unit,false] spawn life_fnc_MP;
