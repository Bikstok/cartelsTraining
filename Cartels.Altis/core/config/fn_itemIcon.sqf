/*
File: fn_itemIcon.sqf
Author: EdgeKiller
Description:	Return the icon for each altis life item.
*/

private["_var"];

_var = [_this,0,"",[""]] call BIS_fnc_param;

if(_var == "") exitWith {""};
switch (_var) do {
	case "life_inv_water": {("icons\items\water.paa")};
	case "life_inv_coffee": {("icons\items\coffee.paa")};
	case "life_inv_donuts": {("icons\items\donuts.paa")};
	case "life_inv_fuelE": {("icons\items\fuel_can.paa")};
	case "life_inv_fuelF": {("icons\items\fuel_can.paa")};
	case "life_inv_tbacon": {("icons\items\tbacon.paa")};
	case "life_inv_redgull": {("icons\items\redgull.paa")};
	case "life_inv_lockpick": {("icons\items\lockpick.paa")};
	case "life_inv_defib": {("icons\items\defib.paa")};
	case "life_inv_painkillers": {("icons\items\painkillers.paa")};
 case "life_inv_bloodbag": {("icons\items\bloodbag.paa")};
	case "life_inv_splint": {("icons\items\splint.paa")};
	case "life_inv_nitro": {("icons\items\nitro.paa")};
};
