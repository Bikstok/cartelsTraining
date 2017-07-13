/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName","_test","_delay"];
_veh = cursorTarget;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
    _delay = 0.27; // sec per 1 percent
    if (!("ToolKit" in (items player))) then {
                _delay = _delay * 4;
    };
    _displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
    _upp = format[localize "STR_NOTF_Repairing",_displayName];
    //Setup our progress bar.
    disableSerialization;
    5 cutRsc ["life_progress","PLAIN"];
    _ui = uiNameSpace getVariable "life_progress";
    _progress = _ui displayCtrl 38201;
    _pgText = _ui displayCtrl 38202;
    _pgText ctrlSetText format["%2 (1%1)...","%",_upp];
    _progress progressSetPosition 0.01;
    _cP = 0.01;
    _success = false;

    life_action_in_use = true;

    [[player,"Acts_carFixingWheel","switch",0],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;

    while{true} do
    {
        sleep _delay;
        _cP = _cP + 0.01;
        _progress progressSetPosition _cP;
        _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
        if(_cP >= 1) exitWith {_success = true};
        if(!alive player) exitWith {};
        if(player != vehicle player) exitWith {};
        if (!life_action_in_use) exitWith {};
    };

    [[player,""],"life_fnc_animSync",true,false] spawn BIS_fnc_MP;

    life_action_in_use = false;
    5 cutText ["","PLAIN"];

    if (!_success) exitWith { hint "Your repair has been interrupted and failed." };

    player playActionNow "stop";
    if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
    player removeItem "ToolKit";
    _veh setDamage 0;
    titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
};