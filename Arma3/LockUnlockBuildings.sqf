// Lock/Unlock the doors of a building

// _this select 0		object pointer
// _this select 1		lock state

private["_building","_return","_numberOfDoors"];
_building = _this select 0;
_return = false;

if (isNumber (configFile >> "cfgVehicles" >> (typeOf _building) >> "numberOfDoors")) then {
	_numberOfDoors = getNumber (configFile >> "cfgVehicles" >> (typeOf _building) >> "numberOfDoors");

	if (_numberOfDoors > 0) then {
		switch (_this select 1) do {
			case "lock": {
				for [{_x=1},{_x<=_numberOfDoors},{_x=_x+1}] do {
					_building setVariable [format ['bis_disabled_Door_%1', _x], 1, true];
				};

				_return = true;
			};
			case "unlock": {
				for [{_x=1},{_x<=_numberOfDoors},{_x=_x+1}] do {
					_building setVariable [format ['bis_disabled_Door_%1', _x], 0, true];
				};

				_return = true;
			};
			default: {
				diag_log (format ["LockUnlockBuildings: lock state unknown: %1", (_this select 1)]);
			};
		};
	}
	else {
		// building has no doors
	};
}
else {
	// building has no doors
};

_return;