#include <macro.h>
/*
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;
diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::Life Client:: Received server functions.";
0 cutText ["Waiting for the server to be ready...","BLACK FADED"];
0 cutFadeOut 99999999;
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	diag_log "::Life Client:: Server did not load extDB";
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;

//diag_log "::Life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;
//[] spawn SRS_fnc_init;

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};

	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
	case sideLogic:
	{
		_handle = [] spawn life_fnc_initZeus;
		waitUntil {scriptDone _handle};
};
};

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyUp", "_this call life_fnc_keyUpHandler"];
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyDownHandler"];
(findDisplay 46) displayAddEventHandler ["MouseZchanged", "_this spawn life_fnc_enableActions"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;
[] call life_fnc_playerTags; //Enable tags by default?
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call life_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

life_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	life_atmcash = life_atmcash + _price;
";

[] execVM "core\init_survival.sqf";

[] spawn
{
	while {true} do {
		if (cameraView == "GROUP") then {
			hint "Reported to admins, don't try this anymore!";
			player switchCamera "EXTERNAL";
		};
		waitUntil {sleep 2; cameraView == "GROUP"};
	};
};

[] spawn
{
	while {true} do {
		waitUntil{!isNull(findDisplay 49)}; //Wait for ESC menu to be opened
		((findDisplay 49) displayCtrl 122) ctrlEnable false;
		((findDisplay 49) displayCtrl 122) ctrlShow false;
		waitUntil {isNull (findDisplay 49)}; //Wait for it to be closed
		showChat true; //Restore chat
	};
};

// Vehicle change monitor
[] spawn
{
	private ["_prev", "_diff"];
	while {true} do
	{
		_prev = vehicle player;
		_diff = str difficultyEnabledRTD;
		if ((vehicle player) isKindOf "Car" && life_seatbelt) then
		{
			life_seatbelt = false;
		};
		if ((vehicle player) isKindOf "Air" && driver (vehicle player) == player) then
		{
			//(vehicle player) enableRopeAttach difficultyEnabledRTD;
			//(vehicle player) enableCopilot !difficultyEnabledRTD;
			if (difficultyEnabledRTD && uniform player == "U_B_HeliPilotCoveralls" && headgear player == "") then { player addHeadgear "H_PilotHelmetHeli_O"; };
			while {_prev == (vehicle player) && driver (vehicle player) == player } do
			{
				_ropes = ropes (vehicle player);
				if (!(isNull (gunner (getSlingLoad (vehicle player)))) && (count _ropes) > 0) then
				{
					{
						deleteVehicle _x;
					} forEach _ropes;
					hint "Your vehicle ropes snapped from someone in the gunner seat!";
				};
				sleep 4;
			};
		};
		if(vehicle player != player) then {
			if (typeOf (vehicle player) == "B_G_Offroad_01_armed_F" && gunner (vehicle player) == player) then {
				(vehicle player) enableRopeAttach false;
			} else {
				//(vehicle player) enableRopeAttach true;
			};
			//if(!isNull life_holding_barrel) exitWith {[true,true,dropOilAction,_barrel] call life_fnc_dropOil;};
		};
		if (!((vehicle player) isKindOf "Air") && headgear player == "H_PilotHelmetHeli_O") then { removeHeadgear player; };
		waitUntil {sleep 2; (_prev != (vehicle player) || _diff != (str difficultyEnabledRTD))};
	};
};

[] spawn
{
	while {true} do
	{
		waitUntil { !isNull (findDisplay 602) };
		systemChat "Press CTRL+R to repack magazine ammo.";
		waitUntil { isNull (findDisplay 602) };
	};
};
