// get ObjectId from object

// _this select 0		object pointer

private["_object","_foundHash","_foundColon","_objectID","_characterArray"];
_object = _this select 0;
_foundHash = false;
_foundColon = false;
_objectID = [];

_characterArray = toArray (str _object);
{
	if (_x == 58) then {
		_foundColon = true;
	};
	if (_foundHash && (_x != 32) && !_foundColon) then {
		_objectID = _objectID + [_x];
	};
	if (_x == 35) then {
		_foundHash = true;
	};
} forEach _characterArray;

(toString _objectID);