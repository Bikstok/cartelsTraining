#include <macro.h>
/*
	File: fn_adminDeleteObject.sqf
	Author: Pentax

	Description: Deletes objects in front of cursor.
*/

if(__GETC__(life_adminlevel) < 1) exitWith {
  closeDialog 0;
  systemChat "You need a higher admin level in order to open this.";
};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

deleteVehicle cursorTarget;
