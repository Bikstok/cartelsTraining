/*
	File: fn_drugHeroinPool.sqf
	Author: Pentax

	Description:
	Changes Drug Cartel's location.
*/

#include <macro.h>

if(__GETC__(life_adminlevel) == 0) exitWith {
  systemChat "You need to be an admin to use this function.";
};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

"capture_label_2" setMarkerPos getMarkerPos "capture_2_heroinpool";
"capture_area_2" setMarkerPos getMarkerPos "capture_2_heroinpool";
capture_2 setpos (getMarkerpos "capture_2_heroinpool");

[[0,format["ADMIN: %1 has changed Drug Cartel location. New location: Heroin Pool.",name player]],"life_fnc_broadcast",true,false] spawn BIS_fnc_MP;