class life_cartel_locations {
	idd = 5000;
	name= "life_cartel_locations";
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
			idc = 5001;
			text = "Choose Which Cartel";
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
		class Arms : Life_RscButtonMenu {
			idc = 5002;
			text = "Arms";
			onButtonClick = "createDialog ""Life_Cartel_Locations_Arms"";";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		class Drug : Life_RscButtonMenu {
			idc = 5003;
			text = "Drug";
			onButtonClick = "createDialog ""Life_Cartel_Locations_Drug"";";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.88 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};

	};
};
