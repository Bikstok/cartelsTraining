/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the revive process on the player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];

_target = cursorTarget;
_targetName = _target getVariable["name","Unknown"];

if(isNull _target) exitWith {};
if(_targetName == "Unknown") exitWith {};
if (vehicle player != player) exitWith {
		hint "You can't revive someone from within a vehicle."
};

_revivable = _target getVariable ["Revive",FALSE];
if(_revivable) exitWith {};

_revivableTime = _target getVariable["can_revive", -1000];
if(_target getVariable ["Reviving",player] != player) exitWith {
    hint "Someone else is already reviving this person"
};
if(time - (_target getVariable ["last_revived",-1000]) < 300) exitWith {
	hint format["The victim was recently revived and cannot be revived again for %1 seconds.",((_target getVariable ["last_revived",-1000]) + 300) - time];
};
if((time - (player getVariable["recent_revive",0]) < 300)) exitWith {
	hint format["You have recently revived someone! Your defibulators need time to recharge! They should be ready in %1 seconds.",((player getVariable ["recent_revive",0]) + 300) - time];
};
if(time - (player getVariable["last_revived",-1000]) < 120) exitWith {
	hint "You cannot revive someone within 2 minutes of being revived yourself."
};


//Fetch their name so we can shout it.
_targetName = _target getVariable["name","Unknown"];
_title = format[localize "STR_Medic_Progress",_targetName];
life_action_in_use = true; //Lockout the controls.

_target setVariable["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

//Lets reuse the same thing!
_continue = true;
[[player,"AinvPknlMstpSnonWnonDr_medic0","switch",4],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;
while {_cP < 1 && _continue} do
{
	sleep .15;
	_cP = _cP + .01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];

	if(!alive player) then {
		_continue = false;
	};
	if(life_istazed) then {
		_continue = false;
	};
	if (!life_action_in_use) then {
		_continue = false;
	};
	if((player getVariable ["restrained",false])) then {
		_continue = false;
	};
	if(player distance _target > 4) then {
	hint "You moved too far from your patient!";
		_continue = false;
	};
	if(_target getVariable["Revive",FALSE]) then {
	hint "This person either respawned or was already revived.";
		_continue = false;
	};
	if(_target getVariable["Reviving",ObjNull] != player) then {
	hint "Someone else is already reviving this person";
		_continue = false;
	};
	if(isNull(_target getVariable["Reviving",ObjNull])) then {
	hint "This person can no longer be saved!";
		_continue = false;
	};
};
life_action_in_use = false;
[[player,""],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";

if(_target getVariable ["Reviving",ObjNull] == player) then {
	_target setVariable["Reviving",NIL,TRUE];
};

if(_continue) then {
	_target setVariable ["Revive",TRUE,TRUE];
	[[profileName],"life_fnc_revived",_target,FALSE] call life_fnc_MP;
	player setVariable["recent_revive",time,true];

	sleep .6;
	player reveal _target;
};

{
if (!isNull _x) then {
			_name = _x getVariable["name","Unknown"];
			if (_name == name player) then {
				_name = "My body";
			};
			_pPos = getPosATL _x;
			_nameID = _name + str(_pPos);
			if (_name == "My body") then {
				deleteMarkerLocal _nameID;
				_mrkr = createMarkerLocal [_nameID,_pPos];
				_mrkr setMarkerTypeLocal "DestroyedVehicle";
				_mrkr setMarkerTextLocal format ["%1",_name];
				_mrkr setMarkerColorLocal "ColorRed";
			} else {
				deleteMarkerLocal _nameID;
			};
		};
	} count allDeadMen;
