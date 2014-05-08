//addcargo Script
private ["_caller","_cargo"];

_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_cargo = [_this, 3, "tf_anprc155", [""]] call BIS_fnc_param;

removebackpack _caller;
_caller addbackpack _cargo;