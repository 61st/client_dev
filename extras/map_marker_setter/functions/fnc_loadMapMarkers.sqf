#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Saves all map markers from a unit to a chosen profile.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Profile name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Test"] call map_marker_setter_main_fnc_loadMapMarkers
 *
 * Public: No
 */

params ["_unit", "_profile"];

private _playerID = getPlayerID _unit; // is persistent through mission restarts

// Check if valid ID
if (_playerID == "-1") exitWith {};

GVAR(mapMarkers) = [];
private _data = GETPRVAR(FORMAT_1(QGVAR(profile%1),_profile),[[]]);
private _hashValue = hashValue _unit;
private _currentChannel = currentChannel;
private _marker = "";

{
    _x params [
        "_markerAlpha",
        "_markerBrush",
        "_markerColor",
        "_markerDir",
        "_markerPolyline",
        "_markerPos",
        "_markerShadow",
        "_markerShape",
        "_markerSize",
        "_markerText",
        "_markerType"
    ];

    // Index + hashValue act as a unique ID
    _marker = createMarkerLocal [format ["_USER_DEFINED #%1/%2/%3-4", _playerID, GVAR(index), _currentChannel, _hashValue], _markerPos, _currentChannel, _unit];

    GVAR(index) = GVAR(index) + 1;

    // Needs to be done first
    _marker setMarkerTypeLocal _markerType;
    _marker setMarkerShapeLocal _markerShape;

    _marker setMarkerAlphaLocal _markerAlpha;
    _marker setMarkerBrushLocal _markerBrush;
    _marker setMarkerColorLocal _markerColor;
    _marker setMarkerDirLocal _markerDir;

    if (count _markerPolyline >= 4) then {
        _marker setMarkerPolylineLocal _markerPolyline;
    };

    _marker setMarkerShadowLocal _markerShadow;
    _marker setMarkerSizeLocal _markerSize;
    _marker setMarkerText _markerText; // broadcast marker globally

    GVAR(mapMarkers) pushBack _marker;
} forEach (_data select 0);
