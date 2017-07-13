#include <macro.h>
/*
	File: fn_adminHealTarget.sqf
	Author: Pentax

	Description: Admin heals target.
*/

if(__GETC__(life_adminlevel) < 1) exitWith {
  closeDialog 0;
  systemChat "You need a higher admin level in order to open this.";
};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
//if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

[[player],"life_fnc_admingetUIDAction",_unit,false] spawn life_fnc_MP;
