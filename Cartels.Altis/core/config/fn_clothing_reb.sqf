/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Clothing Store"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,0],
			["U_IG_leader",nil,0],
			["U_I_G_resistanceLeader_F",nil,0],
			["U_I_G_Story_Protagonist_F",nil,0],
			["U_I_CombatUniform",nil,0],
			["U_I_CombatUniform_tshirt",nil,0],
			["U_I_OfficerUniform",nil,0],
			["U_OG_Guerrilla_6_1",nil,0],
			["U_MillerBody",nil,0],
			["U_KerryBody",nil,0],
			["U_B_CombatUniform_mcam",nil,0],
			["U_B_CombatUniform_mcam_tshirt",nil,0],
			["U_B_CombatUniform_mcam_vest",nil,0],
			["U_B_CTRG_Soldier_F",nil,0],
			["U_B_CTRG_Soldier_3_F",nil,0],
			["U_B_CTRG_Soldier_2_F",nil,0],
			["U_B_CTRG_Soldier_urb_1_F",nil,0],
			["U_B_CTRG_Soldier_urb_2_F",nil,0],
			["U_B_CTRG_Soldier_urb_3_F",nil,0],
			["U_I_C_Soldier_Para_1_F",nil,0],
			["U_I_C_Soldier_Para_2_F",nil,0],
			["U_I_C_Soldier_Para_3_F",nil,0],
			["U_I_C_Soldier_Para_4_F",nil,0],
			["U_I_C_Soldier_Para_5_F",nil,0],
			["U_B_CTRG_1",nil,0],
			["U_B_CTRG_2",nil,0],
			["U_B_CTRG_3",nil,0],
			["U_I_GhillieSuit",nil,0],
            ["U_B_FullGhillie_sard",nil,0],
            ["U_B_FullGhillie_ard",nil,0],
            ["U_B_FullGhillie_lsh",nil,0],
            ["U_B_T_FullGhillie_tna_F",nil,0],
			["U_O_CombatUniform_oucamo",nil,0],
            ["U_O_CombatUniform_ocamo",nil,0],
            ["U_O_PilotCoveralls",nil,0]
		];
	};

	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,0],
			["H_Shemag_tan","Shemag (Pattern)",0],
			["H_Shemag_olive",nil,0],
			["H_Shemag_olive_hs",nil,0],
			["H_ShemagOpen_khk",nil,0],
			["H_Cap_grn_BI",nil,0],
			["H_Cap_blk_ION",nil,0],
			["H_Cap_blk_CMMG",nil,0],
			["H_Cap_brn_SPECOPS",nil,0],
			["H_Cap_tan_specops_US",nil,0],
			["H_Cap_khaki_specops_UK",nil,0],
			["H_Cap_blk_Raven",nil,0],
			["H_Cap_oli_hs",nil,0],
			["H_MilCap_ocamo",nil,0],
			["H_MilCap_mcamo",nil,0],
			["H_MilCap_oucamo",nil,0],
			["H_MilCap_dgtl",nil,0],
			["H_MilCap_gry",nil,0],
			["H_MilCap_blue",nil,0],
			["H_MilCap_tna_F",nil,0],
			["H_MilCap_ghex_F",nil,0],
			["H_Hat_camo",nil,0],
			["H_Cap_headphones",nil,0],
			["H_Booniehat_tna_F",nil,0],
			["H_Booniehat_oli",nil,0],
			["H_Booniehat_mcamo",nil,0],
			["H_Booniehat_grn",nil,0],
			["H_Booniehat_tan",nil,0],
			["H_Booniehat_dgtl",nil,0],
			["H_Booniehat_khk_hs",nil,0],
			["H_Bandanna_camo",nil,0],
			["H_Bandanna_khk_hs",nil,0],
			["H_Bandanna_mcamo",nil,0],
			["H_Watchcap_blk",nil,0],
			["H_Watchcap_sgg",nil,0],
			["H_Watchcap_khk",nil,0],
			["H_Watchcap_camo",nil,0],
			["H_Watchcap_cbr",nil,0],
			["H_HelmetB_light",nil,0],
			["H_HelmetB_light_snakeskin",nil,0]
		];
	};

	//Glasses
	case 2:
	{
		[
			["G_Goggles_VR",nil,0],
			["G_Balaclava_blk",nil,0],
			["G_Balaclava_combat",nil,0],
			["G_Balaclava_lowprofile",nil,0],
			["G_Balaclava_TI_blk_F",nil,0],
			["G_Balaclava_TI_G_blk_F",nil,0],
			["G_Balaclava_TI_tna_F",nil,0],
			["G_Balaclava_TI_G_tna_F",nil,0],
			["G_Balaclava_oli",nil,0],
			["G_Bandanna_aviator",nil,0],
			["G_Bandanna_beast",nil,0],
			["G_Bandanna_blk",nil,0],
			["G_Bandanna_khk",nil,0],
			["G_Bandanna_oli",nil,0],
			["G_Bandanna_shades",nil,0],
			["G_Bandanna_sport",nil,0],
			["G_Bandanna_tan",nil,0],
			["G_Shades_Black",nil,0],
			["G_Shades_Blue",nil,0],
			["G_Sport_Blackred",nil,0],
			["G_Sport_Checkered",nil,0],
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_BlackWhite",nil,0],
			["G_Squares",nil,0],
			["G_Lowprofile",nil,0],
			["G_Combat",nil,0]
		];
	};

	//Vest
	case 3:
	{
		[
			["V_TacVest_brn",nil,0],
			["V_TacVest_camo",nil,0],
			["V_TacVest_khk",nil,0],
			["V_TacVest_oli",nil,0],
			["V_I_G_resistanceLeader_F",nil,0],
			["V_Chestrig_rgr",nil,0],
			["V_Chestrig_khk",nil,0],
			["V_HarnessOSpec_brn",nil,0],
			["V_HarnessOSpec_gry",nil,0],
			["V_Chestrig_blk",nil,0],
			["V_Chestrig_oli",nil,0],
			["V_HarnessO_gry",nil,0],
			["V_PlateCarrier1_blk",nil,0],
			["V_PlateCarrier1_rgr_noflag_F",nil,0],
			["V_PlateCarrier1_tna_F",nil,0]
		];
	};

	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_dgtl",nil,0],
			["B_AssaultPack_ocamo",nil,0],
			["B_AssaultPack_blk",nil,0],
			["B_AssaultPack_cbr",nil,0],
			["B_AssaultPack_mcamo",nil,0],
			["B_AssaultPack_rgr",nil,0],
			["B_AssaultPack_khk",nil,0],
			["B_AssaultPack_sgg",nil,0],
			["B_AssaultPack_tna_F",nil,0],
			["B_FieldPack_ocamo",nil,0],
			["B_FieldPack_khk",nil,0],
			["B_FieldPack_oucamo",nil,0],
			["B_FieldPack_cbr",nil,0],
			["B_FieldPack_blk",nil,0],
			["B_FieldPack_ghex_F",nil,0],
			["B_Kitbag_rgr",nil,0],
			["B_Kitbag_cbr",nil,0],
			["B_Kitbag_mcamo",nil,0],
			["B_Kitbag_sgg",nil,0],
			["B_TacticalPack_ocamo",nil,0],
			["B_TacticalPack_oli",nil,0],
			["B_Bergen_sgg",nil,0],
			["B_Bergen_mcamo",nil,0],
			["B_Bergen_rgr",nil,0],
			["B_Bergen_blk",nil,0],
			["B_Carryall_oli",nil,0],
			["B_Carryall_ocamo",nil,0],
			["B_Carryall_oucamo",nil,0],
			["B_Carryall_mcamo",nil,0],
			["B_Carryall_cbr",nil,0],
			["B_Carryall_ghex_F",nil,0],
			["B_Carryall_khk",nil,0],
			["B_ViperHarness_blk_F",nil,0],
			["B_ViperHarness_ghex_F",nil,0],
			["B_ViperHarness_hex_F",nil,0],
			["B_ViperHarness_khk_F",nil,0],
			["B_ViperHarness_oli_F",nil,0],
			["B_ViperLightHarness_blk_F",nil,0],
			["B_ViperLightHarness_ghex_F",nil,0],
			["B_ViperLightHarness_hex_F",nil,0],
			["B_ViperLightHarness_khk_F",nil,0],
			["B_ViperLightHarness_oli_F",nil,0]
		];
	};
};
