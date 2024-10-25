#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Makes all subentries of the interaction menu for loading from profiles.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * All interaction submenus for loading from all profiles <ARRAY>
 *
 * Example:
 * player call map_marker_setter_main_fnc_profileMenusLoad
 *
 * Public: No
 */

private _profileNames = GETPRVAR(QGVAR(profileNames),[]);

// If there are no profiles
if (_profileNames isEqualTo []) exitWith {[]};

params ["_unit"];

// Make menus
_profileNames apply {[
    [
        format [QGVAR(profileLoad_%1), _x], // Action name
        _x, // Display name
        "", // Icon
        { // Statement
            // All action parameters are passed; Needs to be scheduled because of BIS_fnc_guiMessage
            (_this select 2) spawn {
                // Wait for confimation or setting is not enabled
                if (!GVAR(askLoadConfirmation) || {[format [LLSTRING(loadConfirmation), _this select 1], localize "str_a3_a_hub_misc_mission_selection_box_title", localize "str_disp_xbox_hint_yes", localize "str_disp_xbox_hint_no"] call BIS_fnc_guiMessage}) then {
                    _this call FUNC(loadMapMarkers);
                };
            };
        },
        { // Condition
            private _args = _this select 2;

            GVAR(enable) && {(GETPRVAR(FORMAT_1(QGVAR(profile%1),_args select 1),[]) param [0, []]) isNotEqualTo []}
        },
        nil, // Children actions
        [_unit, _x] // Action parameters
    ] call ace_interact_menu_fnc_createAction, [], _unit];
}
