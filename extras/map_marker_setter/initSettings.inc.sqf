#include "script_component.hpp"
/*
 * Author: AUTHOR
 * Function description
 *
 * Arguments:
 * 0: Objects <ARRAY>
 * 1: All <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[bob, ted], false] call lxim_main_fnc_example
 *
 * Public: No
 */

[
    QGVAR(enable),
    "CHECKBOX",
    [LSTRING(enable), LSTRING(enableDesc)],
    [COMPONENT_NAME, LSTRING(functionalityCategory)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(askSaveConfirmation),
    "CHECKBOX",
    [LSTRING(askSaveConfirmation), LSTRING(askSaveConfirmationDesc)],
    [COMPONENT_NAME, LSTRING(profilesCategory)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(askLoadConfirmation),
    "CHECKBOX",
    [LSTRING(askLoadConfirmation), LSTRING(askLoadConfirmationDesc)],
    [COMPONENT_NAME, LSTRING(profilesCategory)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(askUndoConfirmation),
    "CHECKBOX",
    [LSTRING(askUndoConfirmation), LSTRING(askUndoConfirmationDesc)],
    [COMPONENT_NAME, LSTRING(profilesCategory)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(askDeleteConfirmation),
    "CHECKBOX",
    [LSTRING(askDeleteConfirmation), LSTRING(askDeleteConfirmationDesc)],
    [COMPONENT_NAME, LSTRING(profilesCategory)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(askOverwriteConfirmation),
    "CHECKBOX",
    [LSTRING(askOverwriteConfirmation), LSTRING(askOverwriteConfirmationDesc)],
    [COMPONENT_NAME, LSTRING(profilesCategory)],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(loadColorIcon),
    "COLOR",
    [LSTRING(loadColorIcon), LSTRING(loadColorIconDesc)],
    [COMPONENT_NAME, LSTRING(profilesCategory)],
    [1, 1, 1]
] call CBA_fnc_addSetting;
