#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/

//PENTAX ADDITIONS OR CHANGES//


//GENERAL SETTINGS
enableRadio false;
enableSentences false;

//MEDICAL SETTINGS
life_respawned = false;
life_respawn_timer = 0.6; //Scaled in minutes
life_death_timer = 5;
life_dead_gear = [];
life_last_death_gear = -1000;
life_pain = 0;
life_brokenLeg = false;
life_revive_fatigue = 0;
life_corpse = objNull;

//ADMIN SETTINGS
life_invisible = false;
life_god = false;
life_frozen = false;
life_markers = false;

//ITEM SETTINGS
life_redgull_effect = time;
life_loadout = false;
life_gotloadout = false;
EAL_sellSpamTries = 0; /*Counter for how many times the file was accessed per x.*/
EAL_canSell = true; /*Variable to allow sale of an item*/
life_pickup_open = false;

//OTHER SETTINGS
life_disallowedThreatWeapons = ["", "Binocular"];
life_capture_zone = 0;
life_targetTag = false;
life_object_inhand = objNull;
life_holstered = false;
life_action_in_use = false;
life_seatbelt = false;

//ACTIONS
life_show_actions = false;
life_action_time = 0;
life_action_index = [];
life_actions = [];
life_action_delay = time;
life_clothing_store = 0;







life_query_time = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_spikestrip = ObjNull;
life_knockout = false;
life_interrupted = false;
life_removeWanted = false;
life_action_gathering = false;

//Persistent Saving
__CONST__(life_save_civ,FALSE); //Save weapons for civs?
__CONST__(life_save_yinv,FALSE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,0); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,0); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,0); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 90; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 64; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
life_cash = 0;
life_atmbank = 0;
__CONST__(life_impound_car,0);
__CONST__(life_impound_boat,0);
__CONST__(life_impound_air,0);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do {
	case west: {
		life_atmcash = 0;
	};
	case civilian: {
		life_atmcash = 0;
	};

	case independent: {
		life_atmcash = 0;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = [""];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly);

life_inv_items =
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",

	//pentax additions/changes
	"life_inv_painkillers",
	"life_inv_defib",
	"life_inv_splint",
	"life_inv_bloodbag",
	"life_inv_nitro",
	"life_inv_adrenalineShot"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["marijuana",2000],["turtle",3000],["blastingcharge",10000],["boltcutter",500]];


/*
	Sell / buy arrays
*/
sell_array =
[
	["apple",0],
	["heroinu",0],
	["heroinp",0],
	["salema",0],
	["ornate",0],
	["mackerel",0],
	["tuna",0],
	["mullet",0],
	["catshark",0],
	["rabbit",0],
	["oilp",0],
	["turtle",0],
	["water",0],
	["coffee",0],
	["turtlesoup",0],
	["donuts",0],
	["marijuana",0],
	["tbacon",0],
	["lockpick",0],
	["pickaxe",0],
	["redgull",0],
	["peach",0],
	["cocaine",0],
	["cocainep",0],
	["diamond",0],
	["diamondc",0],
	["iron_r",0],
	["copper_r",0],
	["salt_r",0],
	["glass",0],
	["fuelF",0],
	["spikeStrip",0],
	["cement",0],
	["goldbar",0],
	["painkillers",0],
	["bloodbag",0],
	["defib",0],
	["splint",0],
	["nitro",0],
	["adrenalineShot",0]
];
__CONST__(sell_array,sell_array);

buy_array =
[
	["apple",0],
	["rabbit",0],
	["salema",0],
	["ornate",0],
	["mackerel",0],
	["tuna",0],
	["mullet",0],
	["catshark",0],
	["water",0],
	["turtle",0],
	["turtlesoup",0],
	["donuts",0],
	["coffee",0],
	["tbacon",0],
	["lockpick",0],
	["pickaxe",0],
	["redgull",0],
	["fuelF",0],
	["peach",0],
	["spikeStrip",0],
	["blastingcharge",0],
	["boltcutter",0],
	["defusekit",0],
	["storagesmall",0],
	["storagebig",0],
	["painkillers",0],
	["bloodbag",0],
	["defib",0],
	["splint",0],
	["nitro",0],
	["adrenalineShot",0]

];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
["hgun_Rook40_F",0],
["hgun_ACPC2_F",0],
["hgun_PDW2000_F",0],
["hgun_Pistol_heavy_02_F",0],
["SMG_01_F",0],
["SMG_05_F",0],
["arifle_sdar_F",0],
["arifle_SPAR_01_khk_F",0],
["arifle_SPAR_01_snd_F",0],
["arifle_Mk20C_plain_F",0],
["arifle_Mk20_plain_F",0],
["arifle_TRG21_F",0],
["arifle_AKS_F",0],
["arifle_CTAR_blk_F",0],
["arifle_Katiba_F",0],
["arifle_Katiba_C_F",0],
["LMG_03_F",0],
["LMG_Mk200_F",0],
["HandGrenade",0],
["ToolKit",0],
["FirstAidKit",0],
["ItemGPS",0],
["Binocular",0],
["NVGoggles",0],
["ItemMap",0],
["SmokeShell",0],
["SmokeShellRed",0],
["SmokeShellGreen",0],
["SmokeShellYellow",0],
["SmokeShellPurple",0],
["SmokeShellBlue",0],
["SmokeShellOrange",0],
["arifle_AKM_F",0],
["arifle_AK12_F",0],
["srifle_DMR_01_F",0],
["srifle_EBR_F",0],
["srifle_DMR_03_khaki_F",0],
["srifle_DMR_03_multicam_F",0],
["srifle_DMR_03_tan_F",0],
["srifle_DMR_03_woodland_F",0],
["srifle_DMR_06_olive_F",0],
["srifle_DMR_06_camo_F",0],
["arifle_SPAR_03_khk_F",0],
["arifle_SPAR_03_snd_F",0],
["16Rnd_9x21_Mag",0],
["9Rnd_45ACP_Mag",0],
["30Rnd_9x21_Mag",0],
["6Rnd_45ACP_Cylinder",0],
["30Rnd_45ACP_Mag_SMG_01",0],
["20Rnd_556x45_UW_mag",0],
["30Rnd_556x45_Stanag",0],
["30Rnd_65x39_caseless_green",0],
["200Rnd_65x39_cased_Box",0],
["200Rnd_556x45_Box_F",0],
["optic_Yorris",0],
["acc_flashlight_pistol",0],
["optic_ACO_grn_smg",0],
["optic_ACO_grn",0],
["optic_ACO",0],
["optic_ACO_smg",0],
["optic_Holosight",0],
["optic_Holosight_blk_F",0],
["optic_Holosight_khk_F",0],
["optic_Holosight_smg",0],
["optic_Holosight_smg_blk_F",0],
["optic_MRCO",0],
["optic_Hamr",0],
["optic_Hamr_khk_F",0],
["optic_Arco",0],
["optic_Arco_blk_F",0],
["optic_Arco_ghex_F",0],
["optic_ERCO_blk_F",0],
["optic_ERCO_khk_F",0],
["optic_ERCO_snd_F",0],
["acc_flashlight",0],
["10Rnd_762x54_Mag",0],
["30Rnd_762x39_Mag_F",0],
["30Rnd_580x42_Mag_F",0],
["30Rnd_545x39_Mag_F",0],
["30Rnd_9x21_Mag_SMG_02",0],
["20Rnd_762x51_Mag",0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",0],
	["C_Hatchback_01_F",0],
	["C_Offroad_01_F", 0],
	["B_G_Offroad_01_F",0],
	["C_SUV_01_F",0],
	["C_Van_01_transport_F",0],
	["C_Hatchback_01_sport_F",0],
	["C_Van_01_fuel_F",0],
	["I_Heli_Transport_02_F",0],
	["C_Van_01_box_F",0],
	["I_Truck_02_transport_F",0],
	["I_Truck_02_covered_F",0],
	["B_Truck_01_transport_F",0],
	["B_Truck_01_box_F", 0],
	["O_MRAP_02_F",0],
	["B_Heli_Light_01_F",0],
	["O_Heli_Light_02_unarmed_F",0],
	["C_Rubberboat",0],
	["C_Boat_Civil_01_F",0],
	["B_Boat_Transport_01_F",0],
	["C_Boat_Civil_01_police_F",0],
	["B_Boat_Armed_01_minigun_F",0],
	["B_SDV_01_F",0],
	["B_MRAP_01_F",0]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",0],
	["C_Hatchback_01_F",0],
	["C_Offroad_01_F", 0],
	["B_G_Offroad_01_F",0],
	["C_SUV_01_F",0],
	["C_Van_01_transport_F",0],
	["C_Hatchback_01_sport_F",0],
	["C_Van_01_fuel_F",0],
	["I_Heli_Transport_02_F",0],
	["C_Van_01_box_F",0],
	["I_Truck_02_transport_F",0],
	["I_Truck_02_covered_F",0],
	["B_Truck_01_transport_F",0],
	["B_Truck_01_box_F", 0],
	["O_MRAP_02_F",0],
	["B_Heli_Light_01_F",0],
	["O_Heli_Light_02_unarmed_F",0],
	["C_Rubberboat",0],
	["C_Boat_Civil_01_F",0],
	["B_Boat_Transport_01_F",0],
	["C_Boat_Civil_01_police_F",0],
	["B_Boat_Armed_01_minigun_F",0],
	["B_SDV_01_F",0],
	["B_MRAP_01_F",0]
];
__CONST__(life_garage_sell,life_garage_sell);
