#include <macro.h>
/*
	File: fn_setupActions.sqf

	Description:
	Master addAction file handler for all client-based actions.
*/

//Revive Target
life_actions pushBack (player addAction["<t color='#FF0000'>Use Defibrillator</t>",life_fnc_revivePlayer,cursorTarget,-1,false,true,"",'!isNull cursorTarget && (cursorTarget isKindOf "Man") && !(alive cursorTarget) && !(cursorTarget getVariable ["Revive",true]) && (life_inv_defib > 0) && (player distance cursorTarget < 3.5)']);


//Blood Bag Self
life_actions pushBack (player addAction["<t color='#FF0000'>Blood Transfusion Self</t>",life_fnc_bloodbag,player,-1,false,true,"",'(damage player > 0) && (life_inv_bloodbag > 0)']);
//Blood Bag Target
life_actions pushBack (player addAction["<t color='#FF0000'>Give Blood Transfusion</t>",life_fnc_bloodbag,cursorTarget,-1,false,true,"",'isNull cursorTarget && (isPlayer cursorTarget) && (alive cursorTarget) && (damage cursorTarget > 0) && (life_inv_bloodbag > 0)']);
//Pain Killers Self
life_actions pushBack (player addAction["<t color='#FF0000'>Use Pain Killers</t>",life_fnc_painkillers,player,-1,false,true,"",'(life_pain > 0) && (life_inv_painkillers > 0)']);
//Pain Killers Target
life_actions pushBack (player addAction["<t color='#FF0000'>Give Pain Killers</t>",life_fnc_painkillers,cursorTarget,-1,false,true,"",'!isNull cursorTarget && (isPlayer cursorTarget) && (alive cursorTarget) && ((cursorTarget getVariable ["pain",0]) > 0) && (life_inv_painkillers > 0)']);
//Splint Self
life_actions pushBack (player addAction["<t color='#FF0000'>Apply Splint to Self</t>",life_fnc_splint,player,-1,false,true,"",'(life_brokenLeg) && (life_inv_splint > 0)']);
//Splint Target
life_actions pushBack (player addAction["<t color='#FF0000'>Apply Splint</t>",life_fnc_splint,cursorTarget,-1,false,true,"",'!isNull cursorTarget && (isPlayer cursorTarget) && (alive cursorTarget) && (cursorTarget getVariable ["broken",false]) && (life_inv_splint > 0)']);
//Execution
life_actions pushBack (player addAction["<t color='#FF0000'>Execute!</t>",life_fnc_execute,false,-1,false,true,"",'!isNull cursorTarget && !(alive cursorTarget) && cursorTarget isKindOf "Man" && !(typeOf cursorTarget in ["Goat_random_F", "Cock_random_F", "Hen_random_F", "Sheep_random_F","Alsatian_Random_F"]) && !(currentWeapon player in life_disallowedThreatWeapons) && player distance cursorTarget < 2 ']);
//Suicide vest
//life_actions pushBack (player addAction["Activate Suicide Vest",life_fnc_suicideBomb,"",0,false,true,"",'(vest player == "V_HarnessOGL_brn") && (alive player) && (playerSide == civilian) && !(player getVariable ["restrained",false]) && !(player getVariable ["Escorting",false]) && !(player getVariable ["transporting",false])']);
//Seatbelt
life_actions pushBack (player addAction ["<t color='#BBBB00'>Put Seatbelt On</t>", {life_seatbelt=true}, "", 3, true, true, "", 'vehicle player isKindOf "Car" && !life_seatbelt']);
life_actions pushBack (player addAction ["<t color='#BBBB00'>Take Seatbelt Off</t>", {life_seatbelt=false}, "", 3, true, true, "", 'vehicle player isKindOf "Car" && life_seatbelt']);
//Nitro
life_actions pushBack (player addAction["<t color='#00FF00'>Activate Nitro</t>",life_fnc_activateNitro,false,2,false,false,"",
' (vehicle player != player) && (driver vehicle player == player) && (((vehicle player) getVariable["nitro", 0]) > 0) ']);
//Unflip
life_actions pushBack (player addAction["Unflip Vehicle",life_fnc_flip,"",-1,false,false,"",'(cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air") && (vehicle player == player) && (player distance cursorTarget < 8) && (vectorUp cursorTarget select 2 < 0.6 || vectorUp cursorTarget select 1 > 0.2 || vectorUp cursorTarget select 1 < -0.2) && (speed cursorTarget < 1)']);
//Repair
life_actions pushBack (player addAction["<t color='#FF0000'>Repair Vehicle</t>",life_fnc_repairTruck,"",99,false,true,"", ' vehicle player == player && !isNull cursorTarget && ((cursorTarget isKindOf "Car") OR (cursorTarget isKindOf "Air") OR (cursorTarget isKindOf "Ship")) && (player distance cursorTarget < 4.5) ']);
//Lockpicking
life_actions pushBack (player addAction["Pick Vehicle's Lock",life_fnc_lockpick,cursorTarget,-1,false,true,"",'!isNull cursorTarget && (player distance cursorTarget) < 4 && life_inv_lockpick > 0 && (locked cursorTarget != 0) && (count crew cursorTarget) > 0 && speed cursorTarget < 2 && (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") && !(cursorTarget in life_vehicles)']);
//Eject from heli while engine still running
life_actions pushBack (player addAction ["Eject", {_veh = vehicle player; if(_veh != player) then {_engineOn = isEngineOn _veh; player action ["GetOut", _veh]; sleep 1; [[_veh, "engineOn", _engineOn], "life_fnc_multiargMP", _veh] spawn BIS_fnc_MP;};}, "", 6, false, false, "", 'vehicle player isKindOf "Air" && driver vehicle player == player;']);

//Pickup Item
life_actions pushBack (player addAction["Pickup Item(s)",{createDialog "life_pickup_items"},"",0,false,false,"",' !isNull cursorObject && count (cursorObject getVariable ["item",[]]) > 0 && player distance cursorObject < 5 ']);