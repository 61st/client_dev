#include "script_component.hpp"
/*
 * File: fnc_saveRadioSettings.sqf
 * Author: Darojax, KrippeJaevel, Mildly_Interested
 * Date: 2023-08-24
 * Last Update: 2023-09-24
 * License: License: GNU General Public License v3.0 only - https://www.gnu.org/licenses/gpl-3.0-standalone.html
 *
 * Gets the current radio settings and saves them to the profileNamespace.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Function reached the end [BOOL]
 *
 * Example:
 * call lxim_acre_fnc_saveRadioSettings;
 *
 * Public: No
 */

private _baseRadios = [];
private _channels = [];
private _volumes = [];
private _spatials = [];

// get the current radio list and PTT assignments for each radio
private _radios = [] call acre_api_fnc_getCurrentRadioList;
private _pttAssignment = call acre_api_fnc_getMultiPushToTalkAssignment;

// Check if the player is carrying any radios, if not, show the hint and exit
if (count _radios == 0) exitWith {
	["acre_persistence", "ACRE Persistence", "You are not carrying any radios", "Nothing to save", 3, [1, 0.8, 0, 1]] call acre_sys_list_fnc_displayHint;
};

// Rearrange the radios in the _radios array to set the PTT radios first
private _tempRadios = [];
{
	private _pttRadio = _x;
	{
		if (_pttRadio == _x) then {
			_tempRadios pushBack _x;
		};
	} forEach _radios;
} forEach _pttAssignment;

// Add any remaining radios to the end of the _tempRadios array
{
	if (_tempRadios find _x == -1) then {
		_tempRadios pushBack _x;
	};
} forEach _radios;

_radios = _tempRadios;

// Loop through each radio in the list and extract its base type, channel, volume, and spatial setting into arrays
{
	// Loop through maximum 6 radios
	if (_forEachIndex >= 6) exitWith {};
	_baseRadio = [_x] call acre_api_fnc_getBaseRadio;
	_baseRadios pushBack _baseRadio;
	_channel = [_x] call acre_api_fnc_getRadioChannel;
	_channels pushBack _channel;
	_volume = [_x] call acre_api_fnc_getRadioVolume;
	_volumes pushBack _volume;
	_spatial = [_x] call acre_api_fnc_getRadioSpatial;
	_spatials pushBack _spatial;
} forEach _radios;

// Save the variables/arrays to the profileNamespace
profileNamespace setVariable [QGVAR(baseRadios), _baseRadios];
profileNamespace setVariable [QGVAR(channels), _channels];
profileNamespace setVariable [QGVAR(volumes), _volumes];
profileNamespace setVariable [QGVAR(spatials), _spatials];

["acre_persistence", "ACRE Persistence", "Radio Settings Saved", "", 3, [0.13, 0.61, 0.12, 1]] call acre_sys_list_fnc_displayHint;

true
