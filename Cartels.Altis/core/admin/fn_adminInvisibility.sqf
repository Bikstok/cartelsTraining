#include <macro.h>
/*
	File: fn_adminInvisibility.sqf
	Author: Pentax

	Description: Turns on/off admin invisible.
*/

if(__GETC__(life_adminlevel) < 2) exitWith {
  closeDialog 0;
  systemChat "You need a higher admin level in order to open this.";
};

if(life_invisible) then {
	life_invisible = false;
  [[0,format["ADMIN: %1 DISABLED invisbility mode.",name player]],"life_fnc_broadcast",true,false] spawn BIS_fnc_MP;
	titleText ["People can see you.","PLAIN"]; titleFadeOut 2;
	vehicle player hideObject false;
} else {
	life_invisible = true;
  [[0,format["ADMIN: %1 ENABLED invisbility mode.",name player]],"life_fnc_broadcast",true,false] spawn BIS_fnc_MP;
	vehicle player hideObject true;
};
