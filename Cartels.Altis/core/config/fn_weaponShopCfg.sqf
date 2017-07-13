#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for the weapon shops.

	Return:
	String: Close the menu
	Array:
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",20000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["HandGrenade_Stone","Flashbang",1700],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 2): {"You are not at a patrol officer rank!"};
			default
			{
				["Altis Patrol Officer Shop",
					[
						["arifle_MX_F",nil,35000],
						["SMG_02_ACO_F",nil,30000],
						["HandGrenade_Stone","Flashbang",1700],
						["MineDetector",nil,1000],
						["acc_flashlight",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,2500],
						["muzzle_snds_H",nil,2750],
						["30Rnd_65x39_caseless_mag",nil,130],
						["30Rnd_9x21_Mag",nil,250]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 3): {"You are not at a sergeant rank!"};
			default
			{
				["Altis Sergeant Officer Shop",
					[
						["SMG_02_ACO_F",nil,15000],
						["hgun_ACPC2_F",nil,17500],
						["HandGrenade_Stone","Flashbang",1700],
						["arifle_MXC_F",nil,30000],
						["optic_Arco",nil,2500],
						["muzzle_snds_H",nil,2750],
						["30Rnd_65x39_caseless_mag",nil,100],
						["30Rnd_9x21_Mag",nil,60],
						["9Rnd_45ACP_Mag",nil,200]
					]
				];
			};
		};
	};

	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
				default
			{
				["Weapons and General Stuff",
					[
                        ["hgun_Rook40_F",nil,0],
                        ["hgun_PDW2000_F",nil,0],
                        ["16Rnd_9x21_Mag",nil,0],
                        ["30Rnd_9x21_Mag",nil,0],
                        ["hgun_ACPC2_F",nil,0],
                        ["9Rnd_45ACP_Mag",nil,0],
                        ["hgun_Pistol_heavy_02_F",nil,0],
                        ["6Rnd_45ACP_Cylinder",nil,0],
                        ["SMG_05_F",nil,0],
                        ["30Rnd_9x21_Mag_SMG_02",nil,0],
                        ["SMG_01_F",nil,0],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,0],
                        ["arifle_sdar_F",nil,0],
                        ["20Rnd_556x45_UW_mag",nil,0],
                        ["arifle_SPAR_01_khk_F",nil,0],
                        ["arifle_SPAR_01_snd_F",nil,0],
                        ["arifle_Mk20C_plain_F",nil,0],
                        ["arifle_Mk20_plain_F",nil,0],
                        ["arifle_TRG21_F",nil,0],
                        ["30Rnd_556x45_Stanag",nil,0],
                        ["arifle_AKS_F",nil,0],
                        ["30Rnd_545x39_Mag_F",nil,0],
                        ["LMG_03_F",nil,0],
                        ["200Rnd_556x45_Box_F",nil,0],
                        ["arifle_CTAR_blk_F",nil,0],
                        ["30Rnd_580x42_Mag_F",nil,0],
                        ["arifle_Katiba_F",nil,0],
                        ["arifle_Katiba_C_F",nil,0],
                        ["30Rnd_65x39_caseless_green",nil,0],
                        ["LMG_Mk200_F",nil,0],
                        ["200Rnd_65x39_cased_Box",nil,0],
                        ["arifle_AKM_F",nil,0],
                        ["arifle_AK12_F",nil,0],
                        ["30Rnd_762x39_Mag_F",nil,0],
                        ["srifle_DMR_01_F",nil,0],
                        ["10Rnd_762x54_Mag",nil,0],
                        ["srifle_EBR_F",nil,0],
                        ["srifle_DMR_03_khaki_F",nil,0],
                        ["srifle_DMR_03_multicam_F",nil,0],
                        ["srifle_DMR_03_tan_F",nil,0],
                        ["srifle_DMR_03_woodland_F",nil,0],
                        ["srifle_DMR_06_olive_F",nil,0],
                        ["srifle_DMR_06_camo_F",nil,0],
                        ["arifle_SPAR_03_khk_F",nil,0],
                        ["arifle_SPAR_03_snd_F",nil,0],
                        ["20Rnd_762x51_Mag",nil,0],
                        ["optic_Yorris",nil,0],
                        ["optic_ACO_grn_smg",nil,0],
                        ["optic_ACO_grn",nil,0],
                        ["optic_ACO",nil,0],
                        ["optic_ACO_smg",nil,0],
                        ["optic_Holosight",nil,0],
                        ["optic_Holosight_blk_F",nil,0],
                        ["optic_Holosight_khk_F",nil,0],
                        ["optic_Holosight_smg",nil,0],
                        ["optic_Holosight_smg_blk_F",nil,0],
                        ["optic_MRCO",nil,0],
                        ["optic_Hamr",nil,0],
                        ["optic_Hamr_khk_F",nil,0],
                        ["optic_Arco",nil,0],
                        ["optic_Arco_blk_F",nil,0],
                        ["optic_Arco_ghex_F",nil,0],
                        ["optic_ERCO_blk_F",nil,0],
                        ["optic_ERCO_khk_F",nil,0],
                        ["optic_ERCO_snd_F",nil,0],
                        ["acc_flashlight",nil,0],
                        ["HandGrenade",nil,0],
                        ["ToolKit",nil,0],
                        ["FirstAidKit",nil,0],
                        ["ItemGPS",nil,0],
                        ["Binocular",nil,0],
                        ["NVGoggles",nil,0],
                        ["O_NVGoggles_urb_F",nil,0],
                        ["O_NVGoggles_hex_F",nil,0],
                        ["O_NVGoggles_ghex_F",nil,0],
                        ["ItemMap",nil,0],
                        ["SmokeShell",nil,0],
                        ["SmokeShellRed",nil,0],
                        ["SmokeShellGreen",nil,0],
                        ["SmokeShellYellow",nil,0],
                        ["SmokeShellPurple",nil,0],
                        ["SmokeShellBlue",nil,0],
                        ["SmokeShellOrange",nil,0]
                    ]
                ];
            };
        };
    };

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};

	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};

	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};
