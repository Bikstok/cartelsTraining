_crate = _this select 0 select 0;
_caller = _this select 0 select 1;
_id = _this select 0 select 2;

_crate removeAction _id;

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

["AmmoboxInit",[_crate,false,{true}]] spawn BIS_fnc_arsenal;

_availableHeadgear = [
"H_Bandanna_camo",
"H_Bandanna_cbr",
"H_Bandanna_gry",
"H_Bandanna_khk",
"H_Bandanna_khk_hs",
"H_Bandanna_mcamo",
"H_Bandanna_sgg",
"H_Bandanna_surfer",
"H_BandMask_blk",
"H_BandMask_demon",
"H_BandMask_khk",
"H_BandMask_reaper",
"H_Beret_02",
"H_Beret_blk",
"H_Beret_blk_POLICE",
"H_Beret_brn_SF",
"H_Beret_Colonel",
"H_Beret_grn",
"H_Beret_grn_SF",
"H_Beret_ocamo",
"H_Beret_red",
"H_Booniehat_dgtl",
"H_Booniehat_dirty",
"H_Booniehat_grn",
"H_Booniehat_indp",
"H_Booniehat_khk",
"H_Booniehat_khk_hs",
"H_Booniehat_mcamo",
"H_Booniehat_tan",
"H_Cap_blk",
"H_Cap_blk_CMMG",
"H_Cap_blk_ION",
"H_Cap_blk_Raven",
"H_Cap_blu",
"H_Cap_brn_SPECOPS",
"H_Cap_grn",
"H_Cap_grn_BI",
"H_Cap_headphones",
"H_Cap_khaki_specops_UK",
"H_Cap_oli",
"H_Cap_oli_hs",
"H_Cap_press",
"H_Cap_red",
"H_Cap_tan",
"H_Cap_tan_specops_US",
"H_Hat_blue",
"H_Hat_brown",
"H_Hat_camo",
"H_Hat_checker",
"H_Hat_grey",
"H_Hat_tan",
"H_MilCap_blue",
"H_MilCap_dgtl",
"H_MilCap_gry",
"H_MilCap_mcamo",
"H_MilCap_ocamo",
"H_MilCap_oucamo",
"H_MilCap_rucamo",
"H_Shemag_khk",
"H_Shemag_olive",
"H_Shemag_olive_hs",
"H_Shemag_tan",
"H_ShemagOpen_khk",
"H_ShemagOpen_tan",
"H_RacingHelmet_1_black_F",
"H_RacingHelmet_1_blue_F",
"H_RacingHelmet_1_F",
"H_RacingHelmet_1_green_F",
"H_RacingHelmet_1_orange_F",
"H_RacingHelmet_1_red_F",
"H_RacingHelmet_1_white_F",
"H_RacingHelmet_1_yellow_F",
"H_RacingHelmet_2_F",
"H_RacingHelmet_3_F",
"H_RacingHelmet_4_F",
"H_StrawHat",
"H_StrawHat_dark",
"H_TurbanO_blk",
"H_Watchcap_blk",
"H_Watchcap_camo",
"H_Watchcap_khk",
"H_Watchcap_sgg",
"H_HelmetB_snakeskin",
"H_HelmetB_grass"
];

_availableGoggles = [
"G_Balaclava_blk",
"G_Balaclava_combat",
"G_Balaclava_lowprofile",
"G_Balaclava_oli",
"G_Bandanna_aviator",
"G_Bandanna_beast",
"G_Bandanna_blk",
"G_Bandanna_khk",
"G_Bandanna_oli",
"G_Bandanna_shades",
"G_Bandanna_sport",
"G_Bandanna_tan",
"G_Combat",
"G_Lowprofile",
"G_Tactical_Black",
"G_Tactical_Clear",
"G_Aviator",
"G_Spectacles",
"G_Spectacles_Tinted",
"G_Squares",
"G_Squares_Tinted",
"G_Shades_Black",
"G_Shades_Blue",
"G_Shades_Green",
"G_Shades_Red",
"G_Sport_Blackred",
"G_Sport_BlackWhite",
"G_Sport_Blackyellow",
"G_Sport_Checkered",
"G_Sport_Greenblack",
"G_Sport_Red",
"G_Lady_Blue",
"G_Lady_Dark",
"G_Lady_Mirror",
"G_Lady_Red",
"G_Goggles_VR",
"G_Diving"
];

_availableUniforms = [
"U_IG_Guerilla1_1",
"U_IG_leader",
"U_I_CombatUniform",
"U_I_CombatUniform_tshirt",
"U_I_OfficerUniform",
"U_MillerBody",
"U_KerryBody",
"U_B_CombatUniform_mcam",
"U_B_CombatUniform_mcam_tshirt",
"U_B_CombatUniform_mcam_vest",
"U_BG_leader",
"U_I_GhillieSuit",
"U_B_FullGhillie_sard",
"U_B_FullGhillie_ard",
"U_B_FullGhillie_lsh",
"U_B_Wetsuit",
"U_O_PilotCoveralls",
"U_O_CombatUniform_oucamo",
"U_O_CombatUniform_ocamo"
];

_availableVests = [
"V_TacVest_brn",
"V_TacVest_camo",
"V_TacVest_khk",
"V_TacVest_oli",
"V_I_G_resistanceLeader_F",
"V_PlateCarrier1_blk",
"V_PlateCarrier1_rgr",
"V_Chestrig_rgr",
"V_Chestrig_khk",
"V_HarnessOSpec_brn",
"V_HarnessOSpec_gry",
"V_Chestrig_blk",
"V_Chestrig_oli",
"V_HarnessO_gry",
"V_RebreatherB"
];

_availableItems = [
		"ItemWatch",
 	"ItemCompass",
 	"ItemGPS",
 	"ItemRadio",
 	"ItemMap",
		"Binocular",
 	"NVGoggles",
 	"NVGoggles_OPFOR",
 	"NVGoggles_INDEP",
 	"FirstAidKit",
 	"ToolKit"
];

_availableBackpacks = [
"B_Kitbag_mcamo",
"B_FieldPack_ocamo",
"B_Bergen_sgg",
"B_Carryall_oucamo",
"B_Carryall_mcamo",
"B_Carryall_ocamo",
"B_Carryall_khk",
"B_Carryall_cbr"
];

_availableAttachments = [
"optic_Yorris",
"optic_Aco",
"optic_Aco_smg",
"optic_Holosight",
"optic_Holosight_smg",
"optic_Hamr",
"optic_MRCO",
"optic_Arco",
"acc_flashlight"
];

_availableMagazines = [
"16Rnd_9x21_Mag",
"9Rnd_45ACP_Mag",
"30Rnd_9x21_Mag",
"6Rnd_45ACP_Cylinder",
"30Rnd_45ACP_Mag_SMG_01",
"20Rnd_556x45_UW_mag",
"30Rnd_556x45_Stanag",
"30Rnd_65x39_caseless_green",
"20Rnd_762x51_Mag",
"10Rnd_762x54_Mag",
"SmokeShell",
"SmokeShellRed",
"SmokeShellGreen",
"SmokeShellYellow",
"SmokeShellPurple",
"SmokeShellBlue",
"SmokeShellOrange",
"30Rnd_762x39_Mag_F",
"30Rnd_762x39_Mag_Green_F",
"30Rnd_762x39_Mag_Tracer_F",
"30Rnd_762x39_Mag_Tracer_Green_F"
];

_availableWeapons = [
"hgun_Rook40_F",
"hgun_ACPC2_F",
"hgun_PDW2000_F",
"hgun_Pistol_heavy_02_F",
"SMG_01_F",
"arifle_sdar_F",
"arifle_Mk20C_plain_F",
"arifle_TRG21_F",
"arifle_Katiba_F",
"arifle_Katiba_C_F",
"srifle_DMR_01_F",
"srifle_EBR_F",
"srifle_DMR_03_F",
"srifle_DMR_03_khaki_F",
"srifle_DMR_03_tan_F",
"srifle_DMR_03_multicam_F",
"srifle_DMR_03_woodland_F",
"srifle_DMR_03_spotter_F",
"srifle_DMR_06_camo_F",
"srifle_DMR_06_olive_F",
"arifle_AK12_F",
"arifle_AKM_F"
];

[_crate,((backpackCargo _crate) + _availableBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
[_crate,((itemCargo _crate) + _availableHeadgear + _availableGoggles + _availableUniforms + _availableVests + _availableAttachments + _availableItems )] call BIS_fnc_addVirtualItemCargo;
[_crate,((magazineCargo _crate) + _availableMagazines )] call BIS_fnc_addVirtualMagazineCargo;
[_crate,((weaponCargo _crate) +_availableWeapons)] call BIS_fnc_addVirtualWeaponCargo;