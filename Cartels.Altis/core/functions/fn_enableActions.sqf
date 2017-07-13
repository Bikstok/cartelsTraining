/*
	File: fn_enableActions.sqf

	Description:
	Enable actions for several seconds.
*/

if (player getVariable["restrained",false]) exitWith {};

if (!life_show_actions) then {
	[] spawn
	{
		while {life_show_actions} do {
			_pos = screenToWorld [0.5,0.5];
			_camPos = ATLToASL (positionCameraToWorld [0,0,0]);
			_intersectTarget = [_pos select 0,_pos select 1,getTerrainHeightASL _pos];
			_objects = lineIntersectswith [
				_camPos,
				_intersectTarget,
				objNull,
				objNull,
				true
			];
			life_cursorTarget = if (count _objects > 0) then { _objects select (count _objects - 1) } else { objNull };

			sleep 0.2;
		};
		life_cursorTarget = objNull;
	};
	[] spawn life_fnc_setupActions;
};
life_show_actions = true;
if (time > life_action_time) exitWith { life_action_time = time + 9; };
life_action_time = time + 9;

waitUntil { life_action_time < time };

{ player removeAction _x; } foreach life_actions;
life_actions = [];
life_show_actions = false;
