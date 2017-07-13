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
"H_ShemagOpen_tan",
"H_Shemag_tan",
"H_Shemag_olive",
"H_Shemag_olive_hs",
"H_ShemagOpen_khk",
"H_Cap_grn_BI",
"H_Cap_blk_ION",
"H_Cap_blk_CMMG",
"H_Cap_brn_SPECOPS",
"H_Cap_tan_specops_US",
"H_Cap_khaki_specops_UK",
"H_Cap_blk_Raven",
"H_Cap_oli_hs",
"H_MilCap_ocamo",
"H_MilCap_mcamo",
"H_MilCap_oucamo",
"H_MilCap_dgtl",
"H_MilCap_gry",
"H_MilCap_blue",
"H_MilCap_tna_F",
"H_MilCap_ghex_F",
"H_Hat_camo",
"H_Cap_headphones",
"H_Booniehat_tna_F",
"H_Booniehat_oli",
"H_Booniehat_mcamo",
"H_Booniehat_grn",
"H_Booniehat_tan",
"H_Booniehat_dgtl",
"H_Booniehat_khk_hs",
"H_Bandanna_camo",
"H_Bandanna_khk_hs",
"H_Bandanna_mcamo",
"H_Watchcap_blk",
"H_Watchcap_sgg",
"H_Watchcap_khk",
"H_Watchcap_camo",
"H_Watchcap_cbr",
"H_HelmetB_light",
"H_HelmetB_light_snakeskin"
];

_availableGoggles = [
"G_Goggles_VR",
"G_Balaclava_blk",
"G_Balaclava_combat",
"G_Balaclava_lowprofile",
"G_Balaclava_TI_blk_F",
"G_Balaclava_TI_G_blk_F",
"G_Balaclava_TI_tna_F",
"G_Balaclava_TI_G_tna_F",
"G_Balaclava_oli",
"G_Bandanna_aviator",
"G_Bandanna_beast",
"G_Bandanna_blk",
"G_Bandanna_khk",
"G_Bandanna_oli",
"G_Bandanna_shades",
"G_Bandanna_sport",
"G_Bandanna_tan",
"G_Shades_Black",
"G_Shades_Blue",
"G_Sport_Blackred",
"G_Sport_Checkered",
"G_Sport_Blackyellow",
"G_Sport_BlackWhite",
"G_Squares",
"G_Lowprofile",
"G_Combat"
];

_availableUniforms = [
"U_IG_Guerilla1_1",
"U_IG_leader",
"U_I_G_resistanceLeader_F",
"U_I_G_Story_Protagonist_F",
"U_I_CombatUniform",
"U_I_CombatUniform_tshirt",
"U_I_OfficerUniform",
"U_OG_Guerrilla_6_1",
"U_MillerBody",
"U_KerryBody",
"U_B_CombatUniform_mcam",
"U_B_CombatUniform_mcam_tshirt",
"U_B_CombatUniform_mcam_vest",
"U_B_CTRG_Soldier_F",
"U_B_CTRG_Soldier_3_F",
"U_B_CTRG_Soldier_2_F",
"U_B_CTRG_Soldier_urb_1_F",
"U_B_CTRG_Soldier_urb_2_F",
"U_B_CTRG_Soldier_urb_3_F",
"U_I_C_Soldier_Para_1_F",
"U_I_C_Soldier_Para_2_F",
"U_I_C_Soldier_Para_3_F",
"U_I_C_Soldier_Para_4_F",
"U_I_C_Soldier_Para_5_F",
"U_B_CTRG_1",
"U_B_CTRG_2",
"U_B_CTRG_3",
"U_I_GhillieSuit",
"U_B_FullGhillie_sard",
"U_B_FullGhillie_ard",
"U_B_FullGhillie_lsh",
"U_B_T_FullGhillie_tna_F",
"U_O_CombatUniform_oucamo",
"U_O_CombatUniform_ocamo",
"U_O_PilotCoveralls"
];

_availableVests = [
"V_TacVest_brn",
"V_TacVest_camo",
"V_TacVest_khk",
"V_TacVest_oli",
"V_I_G_resistanceLeader_F",
"V_Chestrig_rgr",
"V_Chestrig_khk",
"V_HarnessOSpec_brn",
"V_HarnessOSpec_gry",
"V_Chestrig_blk",
"V_Chestrig_oli",
"V_HarnessO_gry",
"V_PlateCarrier1_blk",
"V_PlateCarrier1_rgr_noflag_F",
"V_PlateCarrier1_tna_F"
];

_availableItems = [
"ToolKit",
"FirstAidKit",
"ItemGPS",
"Binocular",
"NVGoggles",
"O_NVGoggles_urb_F",
"O_NVGoggles_hex_F",
"O_NVGoggles_ghex_F",
"ItemMap"
];

_availableBackpacks = [
"B_AssaultPack_dgtl",
"B_AssaultPack_ocamo",
"B_AssaultPack_blk",
"B_AssaultPack_cbr",
"B_AssaultPack_mcamo",
"B_AssaultPack_rgr",
"B_AssaultPack_khk",
"B_AssaultPack_sgg",
"B_AssaultPack_tna_F",
"B_FieldPack_ocamo",
"B_FieldPack_khk",
"B_FieldPack_oucamo",
"B_FieldPack_cbr",
"B_FieldPack_blk",
"B_FieldPack_ghex_F",
"B_Kitbag_rgr",
"B_Kitbag_cbr",
"B_Kitbag_mcamo",
"B_Kitbag_sgg",
"B_TacticalPack_ocamo",
"B_TacticalPack_oli",
"B_Bergen_sgg",
"B_Bergen_mcamo",
"B_Bergen_rgr",
"B_Bergen_blk",
"B_Carryall_oli",
"B_Carryall_ocamo",
"B_Carryall_oucamo",
"B_Carryall_mcamo",
"B_Carryall_cbr",
"B_Carryall_ghex_F",
"B_Carryall_khk",
"B_ViperHarness_blk_F",
"B_ViperHarness_ghex_F",
"B_ViperHarness_hex_F",
"B_ViperHarness_khk_F",
"B_ViperHarness_oli_F",
"B_ViperLightHarness_blk_F",
"B_ViperLightHarness_ghex_F",
"B_ViperLightHarness_hex_F",
"B_ViperLightHarness_khk_F",
"B_ViperLightHarness_oli_F"
];

_availableAttachments = [
"optic_Yorris",
"optic_ACO_grn_smg",
"optic_ACO_grn",
"optic_ACO",
"optic_ACO_smg",
"optic_Holosight",
"optic_Holosight_blk_F",
"optic_Holosight_khk_F",
"optic_Holosight_smg",
"optic_Holosight_smg_blk_F",
"optic_MRCO",
"optic_Hamr",
"optic_Hamr_khk_F",
"optic_Arco",
"optic_Arco_blk_F",
"optic_Arco_ghex_F",
"optic_ERCO_blk_F",
"optic_ERCO_khk_F",
"optic_ERCO_snd_F",
"acc_flashlight"
];

_availableMagazines = [
"16Rnd_9x21_Mag",
"30Rnd_9x21_Mag",
"9Rnd_45ACP_Mag",
"6Rnd_45ACP_Cylinder",
"30Rnd_9x21_Mag_SMG_02",
"30Rnd_45ACP_Mag_SMG_01",
"20Rnd_556x45_UW_mag",
"30Rnd_556x45_Stanag",
"30Rnd_545x39_Mag_F",
"200Rnd_556x45_Box_F",
"30Rnd_580x42_Mag_F",
"30Rnd_65x39_caseless_green",
"200Rnd_65x39_cased_Box",
"30Rnd_762x39_Mag_F",
"10Rnd_762x54_Mag",
"20Rnd_762x51_Mag",
"HandGrenade",
"SmokeShell",
"SmokeShellRed",
"SmokeShellGreen",
"SmokeShellYellow",
"SmokeShellPurple",
"SmokeShellBlue",
"SmokeShellOrange"
];

_availableWeapons = [
"hgun_Rook40_F",
"hgun_PDW2000_F",
"hgun_ACPC2_F",
"hgun_Pistol_heavy_02_F",
"SMG_05_F",
"SMG_01_F",
"arifle_sdar_F",
"arifle_SPAR_01_khk_F",
"arifle_SPAR_01_snd_F",
"arifle_Mk20C_plain_F",
"arifle_Mk20_plain_F",
"arifle_TRG21_F",
"arifle_AKS_F",
"LMG_03_F",
"arifle_CTAR_blk_F",
"arifle_Katiba_F",
"arifle_Katiba_C_F",
"LMG_Mk200_F",
"arifle_AKM_F",
"arifle_AK12_F",
"srifle_DMR_01_F",
"srifle_EBR_F",
"srifle_DMR_03_khaki_F",
"srifle_DMR_03_multicam_F",
"srifle_DMR_03_tan_F",
"srifle_DMR_03_woodland_F",
"srifle_DMR_06_olive_F",
"srifle_DMR_06_camo_F",
"arifle_SPAR_03_khk_F",
"arifle_SPAR_03_snd_F"
];

[_crate,((backpackCargo _crate) + _availableBackpacks)] call BIS_fnc_addVirtualBackpackCargo;
[_crate,((itemCargo _crate) + _availableHeadgear + _availableGoggles + _availableUniforms + _availableVests + _availableAttachments + _availableItems )] call BIS_fnc_addVirtualItemCargo;
[_crate,((magazineCargo _crate) + _availableMagazines )] call BIS_fnc_addVirtualMagazineCargo;
[_crate,((weaponCargo _crate) +_availableWeapons)] call BIS_fnc_addVirtualWeaponCargo;
