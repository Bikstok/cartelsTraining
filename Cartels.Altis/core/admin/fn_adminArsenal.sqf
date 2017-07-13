#include <macro.h>
/*
	File: fn_adminArsenal.sqf
	Author: Pentax

	Description: Opens Arsenal fro admins
*/

if(__GETC__(life_adminlevel) < 3) exitWith {
  closeDialog 0;
  systemChat "You need a higher admin level in order to open this.";
};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

["Open",true] call BIS_fnc_arsenal;
