class life_cartel_locations_drug {
	idd = 5050;
	name= "life_cartel_locations_drug";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "";

	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};

		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.8;
			h = 0.6 - (2 / 250);
		};
	};

	class controls {


		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = 5051;
			text = "Choose Drug Cartel Locations";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};

		//FIRST LINE------------------------------ STARTS

		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class DrugDefault : Life_RscButtonMenu {
			idc = 5052;
			text = "Default";
			onButtonClick = "[] call life_fnc_drugDefault;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class DrugMethFence : Life_RscButtonMenu {
			idc = 5053;
			text = "MethFence";
			onButtonClick = "[] call life_fnc_drugMethFence;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		class DrugMethHouse : Life_RscButtonMenu {
			idc = 5054;
			text = "MethHouse";
			onButtonClick = "[] call life_fnc_drugMethHouse;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class DrugHeroin : Life_RscButtonMenu {
			idc = 5055;
			text = "HeroinMain";
			onButtonClick = "[] call life_fnc_drugHeroin;";
			x = 0.58 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

		//FIRST LINE------------------------------ ENDS

		//SECOND LINE------------------------------ STARTS

		class DrugHeroinHouses : Life_RscButtonMenu {
			idc = 5056;
			text = "HeroinHouse";
			onButtonClick = "[] call life_fnc_drugHeroinHouses;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class DrugHeroinPool : Life_RscButtonMenu {
			idc = 5057;
			text = "HeroinPool";
			onButtonClick = "[] call life_fnc_drugHeroinPool;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class DrugCokeMain : Life_RscButtonMenu {
			idc = 5058;
			text = "CokeMain";
			onButtonClick = "[] call life_fnc_drugCoke;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class DrugCokeIsland : Life_RscButtonMenu {
			idc = 5059;
			text = "CokeIsland";
			onButtonClick = "[] call life_fnc_drugCokeIsland;";
			x = 0.42 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.885;
			w = (6.25 / 40);
			h = (1 / 25);
		};

	};
};
