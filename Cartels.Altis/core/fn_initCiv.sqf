/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos"];
shops_spawn = nearestObjects[getMarkerPos  "shops", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
//civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
//civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
//civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
	[0] call life_fnc_setPain;
	[false] call life_fnc_brokenLeg;
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};
player addRating 9999999;

[] spawn
{
	private ["_uniform","_vest","_gwh","_grenades"];
	while {true} do
	{
		waitUntil { alive player };

		// Disallow CSAT and Carriers
		_uniform = uniform player;
		_vest = vest player;
		if (({_uniform find _x >=0} count ["U_O_Pilot","U_O_Combat"] > 0) && (_vest find "PlateCarrier" >= 0)) then
		{
			_vItems = vestItems player;
			removeVest player;
			_gwh = createVehicle ["GroundWeaponHolder", getPosATL player, [], 0, "CAN_COLLIDE"];
			_gwh addItemCargoGlobal [_vest, 1];
			{
				(((everyContainer _gwh) select 0) select 1) addItemCargoGlobal [_x, 1];
			}forEach _vItems;
			_vest = "";
			hint "You cannot wear CSAT Uniforms and Plate Carriers at the same time!";
		};

		// Disallow multiple grenades
		_grenades = {_x == "HandGrenade"} count magazines player;
		if (_grenades > 1) then {
		    player removeMagazines "HandGrenade";
		    player addMagazine "HandGrenade";
		    hint "You can only carry one grenade. Do you even lift, bro?";
		};

		waitUntil {sleep 10; ((_uniform != uniform player || _vest != vest player || _grenades != {_x == "HandGrenade"} count magazines player) && (typeName life_clothing_store != "STRING"))};
	};
};