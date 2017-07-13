/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	N/A
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

if(time - (player getVariable ["last_revived",-1000]) < 300) exitWith { titleText[format["You were recently revived and cannot be revived again for %1 seconds.",ceil (300 - (time - (player getVariable ["last_revived",-1000])))],"PLAIN"]; };

life_corpse setVariable["Revive",FALSE,TRUE];
life_corpse setVariable["name",profileName,TRUE];

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (2 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};
