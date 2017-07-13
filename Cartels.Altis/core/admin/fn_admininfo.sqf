#include <macro.h>
/*
	File: fn_admininfo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Output information received to admin menu.
*/
private["_text","_display","_ret","_unit","_prim","_sec","_vest","_uni","_bp","_attach","_uid"];
_ret = _this;
disableSerialization;
_display = findDisplay 2900;
_text = _display displayCtrl 2903;
_unit = _ret select 3;
_uid = getPlayerUID _unit;
/*_prim = if(!(EQUAL(primaryWeapon _unit,""))) then { FETCH_CONFIG2(getText,CONFIG_WEAPONS,primaryWeapon _unit,"displayName")} else {"None"};
_sec = if(!(EQUAL(handgunWeapon _unit,""))) then { FETCH_CONFIG2(getText,CONFIG_WEAPONS,handgunWeapon _unit,"displayName")} else {"None"};
_vest = if(!(EQUAL(vest _unit,""))) then { FETCH_CONFIG2(getText,CONFIG_WEAPONS,vest _unit,"displayName")} else {"None"};
_uni = if(!(EQUAL(uniform _unit,""))) then { FETCH_CONFIG2(getText,CONFIG_WEAPONS,uniform _unit,"displayName")} else {"None"};
_bp = if(!(EQUAL(backpack _unit,""))) then {FETCH_CONFIG2(getText,CONFIG_VEHICLES,backpack _unit,"displayName")} else {"None"};

_attach = [];
if(!(EQUAL(primaryWeapon _unit,""))) then {
	{
		if(!(EQUAL(_x,""))) then {
			_attach pushBack (FETCH_CONFIG2(getText,CONFIG_WEAPONS,_x,"displayName"));
		};
	} foreach (primaryWeaponItems _unit);
};

if(EQUAL(count _attach,0)) then {_attach = "None"};*/
_text ctrlSetStructuredText parseText format["Name: %1<br/>UID: %2", _unit getVariable ["realname",name _unit],_uid];
//CONTROL(2900,2903) ctrlSetStructuredText parseText format["Name: %1<br/>Bank: %2<br/>Money: %3<br/>Uniform: %4<br/>Vest: %5<br/>Backpack: %6<br/>Primary: %7<br/>Handgun: %8<br/><t align='center'>Primary Attachments</t><br/>%9", _unit GVAR ["realname",name _unit],[SEL(_ret,0)] call life_fnc_numberText,[SEL(_ret,1)] call life_fnc_numberText, >/*_uni,*/_uid/*_vest,_bp,_prim,_sec,_attach*/];
