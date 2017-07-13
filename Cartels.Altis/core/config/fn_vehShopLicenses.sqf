/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.

	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	case "med_shop": {_ret = true;};
	case "kart_shop": {_ret = true;};
	case "med_air_hs": {_ret = true;};
	case "civ_car": {_ret = true;};
	case "civ_ship": {_ret = true;};
	case "reb_air": {_ret = true;};
	case "reb_water": {_ret = true;};
	case "reb_car": {_ret = true;};
	case "cop_air": {_ret = true;};
	case "cop_airhq": {_ret = true;};
	case "civ_truck":	{_ret = true;};
	case "cop_car": {_ret = true;};
	case "cop_ship":
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;
