#include <macro.h>
/*
	File: fn_adminGodMode.sqf
	Author: Tobias 'Xetoxyc' Sittenauer

	Description: Enables God mode for Admin
*/

if(__GETC__(life_adminlevel) < 2) exitWith {
  closeDialog 0;
  systemChat "You need a higher admin level in order to open this.";
};

if(life_god) then {
	life_god = false;
	titleText ["God mode disabled","PLAIN"]; titleFadeOut 2;
  [[0,format["ADMIN: %1 has DISABLED god mode.",name player]],"life_fnc_broadcast",true,false] spawn BIS_fnc_MP;
	player allowDamage true;
} else {
	life_god = true;
	titleText ["God mode enabled","PLAIN"]; titleFadeOut 2;
  [[0,format["ADMIN: %1 has ENABLED god mode.",name player]],"life_fnc_broadcast",true,false] spawn BIS_fnc_MP;
	player allowDamage false;
};
