private["_veh, _newPos"];

_veh = cursorTarget;
if(isNull _veh) exitWith {};
titleText["Please stay away car will be flipped in 4 seconds.","PLAIN"];
_newPos = getPosASL _veh;
_newPos set [2, (_newPos select 2)+1];
_veh setVectorUp (surfaceNormal _newPos);
_veh setPosASL _newPos;
