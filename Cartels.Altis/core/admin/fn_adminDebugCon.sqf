#include <macro.h>
/*
	File: fn_adminDebugCon.sqf
	Author: ColinM9991

	Description:
	Opens the Debug Console.
*/
if(__GETC__(life_adminlevel) < 2) exitWith {
  closeDialog 0;
  systemChat "You need a higher admin level in order to open this.";
};

createDialog "RscDisplayDebugPublic";
