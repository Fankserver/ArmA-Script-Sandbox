//addcargo Script

_laptop = _this select 0;
_caller = _this select 1;
_cargo = _this select 3;

_caller unassignItem "ItemRadio";
_caller removeitem "ItemRadio";
_caller additem _cargo;
_caller assignItem _cargo;