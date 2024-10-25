#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Deletes a chosen profile of given index.
 *
 * Arguments:
 * 0: Profile index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * 0 call map_marker_setter_main_fnc_deleteProfile
 *
 * Public: No
 */

params ["_index"];

// If index is invalid
if (_index == -1) exitWith {
    [LLSTRING(invalidProfile), false, 10, 2] call ace_common_fnc_displayText;
};

// Needs to be scheduled because of BIS_fnc_guiMessage
[_index] spawn {
    params ["_index", "_display"];

    private _presets = GETPRVAR(QGVAR(profileNames),[]);
    private _profile = _presets select _index;

    // Wait for confimation or setting is not enabled
    if (!GVAR(askDeleteConfirmation) || {[format [LLSTRING(deleteConfirmation), _profile], localize "str_a3_a_hub_misc_mission_selection_box_title", localize "str_disp_xbox_hint_yes", localize "str_disp_xbox_hint_no", findDisplay IDD_MAIN_MAP] call BIS_fnc_guiMessage}) then {
        // Set the profile to nil to delete variable
        SETPRVAR(FORMAT_1(QGVAR(profile%1),_profile),nil);

        // Delete the preset from the list
        _presets deleteAt _index;
    };
};
