//addcargo Script
private ["_caller","_cargo"];

_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_cargo = [_this, 3, "tf_anprc154", [""]] call BIS_fnc_param;


_caller unassignItem "ItemRadio";
_caller removeitem "ItemRadio";
_caller additem _cargo;
_caller assignItem _cargo;