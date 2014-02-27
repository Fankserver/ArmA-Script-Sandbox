/* This example will make buildings/houses indestructable
 * Author: Florian Kinder
 * License: this file can be used without the owners to inform
 */
private ["_mapSize","_gridSize","_cursorX","_cursorY","_limit","_curX","_curY"];
_mapSize = getnumber (configFile >> "CfgWorlds" >> (worldName) >> "mapSize");

if (_mapSize == 0) then {
	diag_log "mapSize param not defined";
}
else {
	_gridSize = 512;
	_cursorX = 0;
	_cursorY = 0;
	_limit = _mapSize/_gridSize;

	while {_cursorY < _limit} do {
		_curX = (_cursorX * _gridSize) + (0.5 * _gridSize);
		_curY = (_cursorY * _gridSize) + (0.5 * _gridSize);

		// remove damage handler and disallow damage
		{
			_x removeAllEventHandlers "handleDamage";
			_x addEventHandler ["handleDamage", {false}];
			_x allowDamage false;
		} forEach nearestObjects [[_curX,_curY,0], ["house"], _gridSize];

		// Iterate X cursor (rows)
		_cursorX = _cursorX + 1;

		// If X cursor exceeds the limit, start a new colums
		if (_cursorX > _limit) then {
			_cursorX = 0;
			_cursorY = _cursorY + 1;
		};
		sleep 0.1;
	}

	diag_log "complete"
};