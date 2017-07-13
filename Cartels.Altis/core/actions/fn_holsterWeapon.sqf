private["_state","_text"];
_state = [_this,0,true,[true]] call BIS_fnc_param;
if (vehicle player != player) exitWith {};
if (!_state && !isNull life_object_inhand) exitWith {};
if (_state) then
{
	if (currentWeapon player == primaryWeapon player) then
	{
		_text = getText(configFile >> "cfgWeapons" >> (currentWeapon player) >> "displayName");
	};
	player action ["hideWeapon",player,player,100];
}
else
{
	removeAllActions player;
	[] call life_fnc_setupActions;
	player action ["hideWeapon",player,player,0];
};
life_holstered = _state;
