#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Makes all subentries of the interaction menu for loading from profiles.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * All interaction submenus for saving to all profiles <ARRAY>
 *
 * Example:
 * player call map_marker_setter_main_fnc_profileMenusSave
 *
 * Public: No
 */

private _profileNames = GETPRVAR(QGVAR(profileNames),[]);

// If there are no profiles
if (_profileNames isEqualTo []) exitWith {[]};

params ["_unit"];

private _playerID = getPlayerID _unit; // is persistent through mission restarts

// Check if valid ID
if (_playerID == "-1") exitWith {};

private _prefix = format ["_USER_DEFINED #%1", _playerID];

// Check if there are any map markers that belong to the player
if (allMapMarkers findIf {_x find _prefix == 0} == -1) exitWith {[]};

// Make menus
_profileNames apply {[
    [
        format [QGVAR(profileSave_%1), _x], // Action name
        _x, // Display name
        "", // Icon
        { // Statement
            // All action parameters are passed; Needs to be scheduled because of BIS_fnc_guiMessage
            (_this select 2) spawn {
                // Wait for confimation or setting is not enabled
                if (!GVAR(askSaveConfirmation) || {[format [LLSTRING(saveConfirmation), _this select 1], localize "str_a3_a_hub_misc_mission_selection_box_title", localize "str_disp_xbox_hint_yes", localize "str_disp_xbox_hint_no"] call BIS_fnc_guiMessage}) then {
                    _this call FUNC(saveMapMarkers);
                };
            };
        },
        {GVAR(enable)}, // Condition
        nil, // Children actions
        [_unit, _x] // Action parameters
    ] call ace_interact_menu_fnc_createAction, [], _unit];
}
