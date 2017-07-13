#include <macro.h>
/*
	File: fn_adminSpectate.sqf
	Author: ColinM9991

	Description:
	Spectate the chosen player.
*/
if(__GETC__(life_adminlevel) < 1) exitWith {
  closeDialog 0;
  [[0,format["You need a higher admin level in order to open this."]],"life_fnc_broadcast",true,false] spawn BIS_fnc_MP;
};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};


_unit switchCamera "INTERNAL";
[[0,format["%1 admin started spectating.",name player]],"life_fnc_broadcast",true,false] spawn BIS_fnc_MP;
hint format["You are now spectating %1 \n\n Press F10 to stop Spectating.",_unit getVariable["realname",name _unit]];
AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];player switchCamera 'INTERNAL';hint 'You have stopped spectating';};false"];
