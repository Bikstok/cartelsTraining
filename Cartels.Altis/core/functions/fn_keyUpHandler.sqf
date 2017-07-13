/*
	File: fn_keyUpHandler.sqf
	Author: Skalicon & Paratus

	Description:
	Main key handler for event 'keyUp'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_owners","_index","_weapon","_items","_primary","_ammo"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

if(life_action_in_use && _code != 1) exitWith {
	_handled
};

switch (_code) do {


	//H/4 Holster
	case 5;
	case 35: {
		if(!_alt && !_ctrlKey && !dialog && vehicle player == player) then {
			if ((currentWeapon player) != "") then {
				[true,true,true,true] spawn life_fnc_holsterWeapon;
			} else {
				[false,false,false,false] spawn life_fnc_holsterWeapon;
			};
		};
	};

	//6 Nitro
	case 7: {
		if(!_alt && !_ctrlKey) then {
			[] spawn life_fnc_activateNitro;
		};
	};


};

if (_code in (actionKeys "NextAction") || _code in (actionKeys "PrevAction")) then {
	if (!life_show_actions) then {
		[] spawn life_fnc_enableActions;
	};
};

if (_code in (actionKeys "TacticalView")) then {
	hint "Command camera is disabled." ;
	_handled = true;
};

if (_code in (actionKeys "Diary")) then {
	hint "Diary is disabled to prevent abuse." ;
	_handled = true;
};

if (life_brokenLeg && (_code in (actionKeys "MoveUp") || _code in (actionKeys "MoveDown") || _code in (actionKeys "Stand") || _code in (actionKeys "Crouch"))) then {
	systemChat "Your leg is broken!" ;
	_handled = true;
};


/*if (_code in (actionKeys "User2")) then {
	if(!_alt && !_ctrlKey) then {
		if(player getVariable ["restrained", false]) then {
			hint "You cannot pick up items while you're restrained!";
		} else {
			closeDialog 0;
			createDialog "life_pickup_items";
			_handled = true;
		};
	};
};*/

if (_code in (actionKeys "User10")) then {
	if (soundVolume < 0.21) then {
		0 fadeSound 1;
	} else {
		0 fadeSound 0.2;
	};
	systemChat format["Sound volume changed to %1%2.", soundVolume * 100, "%"];
	_handled = true;
};


if (_code in (actionKeys "User11")) then {
	closeDialog 0;
	if(([false,"redgull",1] call life_fnc_handleInv)) then {
		life_thirst = 100;
		player setFatigue 0;
		life_redgull_effect = time;
		titleText["You can now run farther for 3 minutes","PLAIN"];
		player enableFatigue false;
		[] spawn {
			waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
			player enableFatigue true;
		};
		[] call life_fnc_hudUpdate;
	};
	_handled = true;
};


if (_code==41 || _code in (actionKeys "SelectAll") || _code in (actionKeys "SwitchCommand")) then {
	if (life_targetTag) then {
		life_targetTag = false
	};
	_handled = true;
};

_handled;
