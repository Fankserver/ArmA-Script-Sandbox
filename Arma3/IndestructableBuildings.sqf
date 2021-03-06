/* This example will make houses/ruins indestructable
 * Author: Florian Kinder
 * License: this file can be used without the owners to inform
 */
private ["_mapSize","_gridSize","_gridRadius","_cursorX","_cursorY","_limit","_curX","_curY"];
_mapSize = getnumber (configFile >> "CfgWorlds" >> (worldName) >> "mapSize");

if (_mapSize == 0) then {
	diag_log "mapSize param not defined";
}
else {
	_gridSize = 512;
	_gridRadius = ceil(sqrt((_gridSize * _gridSize) + (_gridSize * _gridSize)) / 2);
	_cursorX = 0;
	_cursorY = 0;
	_limit = _mapSize/_gridSize;

	while {_cursorY < _limit} do {
		// Get new grid center position
		_curX = (_cursorX * _gridSize) + (0.5 * _gridSize);
		_curY = (_cursorY * _gridSize) + (0.5 * _gridSize);

		// remove damage handler and disallow damage
		{
			_x removeAllEventHandlers "handleDamage";
			_x addEventHandler ["handleDamage", {false}];
			_x allowDamage false;
		} forEach nearestObjects [[_curX,_curY,0], ["House","Ruins"], _gridRadius];

		// Iterate X cursor (rows)
		_cursorX = _cursorX + 1;

		// If X cursor exceeds the limit, start a new colums
		if (_cursorX > _limit) then {
			_cursorX = 0;
			_cursorY = _cursorY + 1;
		};
	};

	diag_log "complete";
};
