#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Saves all map markers to a chosen profile.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Profile name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "Test"] call map_marker_setter_main_fnc_saveMapMarkers
 *
 * Public: No
 */

params ["_unit", "_profile"];

if (!alive _unit) exitWith {};

// If profile is invalid
if (_profile == "") exitWith {
    [LLSTRING(invalidProfile), false, 10, 2] call ace_common_fnc_displayText;
};

private _playerID = getPlayerID _unit; // is persistent through mission restarts

// Check if valid ID
if (_playerID == "-1") exitWith {};

private _prefix = format ["_USER_DEFINED #%1", _playerID];

// Get data from selected profile
private _data = GETPRVAR(FORMAT_1(QGVAR(profile%1),_profile),[]);

_data set [0, []];
_data set [1, worldName];

{
    (_data select 0) pushBack [
        markerAlpha _x,
        markerBrush _x,
        markerColor _x,
        markerDir _x,
        markerPolyline _x,
        markerPos [_x, true],
        markerShadow _x,
        markerShape _x,
        markerSize _x,
        markerText _x,
        markerType _x
    ];
} forEach (allMapMarkers select {_x find _prefix == 0});

SETPRVAR(FORMAT_1(QGVAR(profile%1),_profile),_data);
