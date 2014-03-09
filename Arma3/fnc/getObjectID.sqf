// get ObjectId from object

// _this select 0		object pointer

private["_object","_foundHash","_foundColon","_objectID","_characterArray"];
_object = _this select 0;
_foundHash = false;
_foundColon = false;
_objectID = [];

_characterArray = toArray (str _object);
{
	if (_foundHash && (_x != 32) && !_foundColon) then {
		_objectID = _objectID + [_x];
	};
	if (_item == 35) then {
		_foundHash = true;
	};
	if (_item == 58) then {
		_foundColon = true;
	};
} forEach _characterArray;

(toString _objectID);