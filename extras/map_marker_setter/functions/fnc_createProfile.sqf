#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Creates a new profile.
 *
 * Arguments:
 * 0: Profile name <STRING>
 * 1: Settings <ARRAY> <STRING> (default: [[], [], [], false])
 * 2: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * "Test" call map_marker_setter_main_fnc_createProfile
 *
 * Public: No
 */

params ["_profile", ["_data", [[], worldName], ["", []]], "_display"];

// Remove whitespaces
_profile = _profile splitString WHITESPACE joinString "";

// If the new preset is invalid, exit
if (_profile == "" || {(toLower _profile) in ["names", "none"]}) exitWith {
    [LLSTRING(invalidName), false, 10, 2] call ace_common_fnc_displayText;
};

// If empty string passed, use default
if (_data == "") then {
    _data = [[], worldName];
};

// If settings are left to default, add default preset; Otherwise make string into array
if (_data isEqualType "") then {
    // If failure, parseSimpleArray returns []
    _data = parseSimpleArray _data;
};

// If not array or parsing failed, exit
if !(_data isEqualType []) exitWith {
    [LLSTRING(invalidSettings), false, 10, 2] call ace_common_fnc_displayText;
};

// If wrong type given, exit
if !(_data params [["_markers", [], [[]]], ["_worldName", "", [""]]]) exitWith {
    [LLSTRING(wrongFormatSettings), false, 10, 2] call ace_common_fnc_displayText;
};

private _profiles = GETPRVAR(QGVAR(profileNames),[]);

// If preset isn't in preset list, add it and exit
if ((_profiles findIf {_x == _profile}) == -1) exitWith {
    _profiles pushBack _profile;

    SETPRVAR(FORMAT_1(QGVAR(profile%1),_profile),_data);
};

// Needs to be scheduled because of BIS_fnc_guiMessage
[_profile, _data] spawn {
    params ["_profile", "_data"];

    // Wait for confirmation or setting is not enabled
    if (!GVAR(askOverwriteConfirmation) || {[format [LLSTRING(overwriteConfirmation), _profile], localize "str_a3_a_hub_misc_mission_selection_box_title", localize "str_disp_xbox_hint_yes", localize "str_disp_xbox_hint_no", findDisplay IDD_MAIN_MAP] call BIS_fnc_guiMessage}) then {
        SETPRVAR(FORMAT_1(QGVAR(profile%1),_profile),_data);
    };
};
