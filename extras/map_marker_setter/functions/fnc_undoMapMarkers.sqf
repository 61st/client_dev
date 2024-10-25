#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Undoes the last map marker load.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call map_marker_setter_main_fnc_undoMapMarkers
 *
 * Public: No
 */

[] spawn {
    // Wait for confimation or setting is not enabled
    if (!GVAR(askUndoConfirmation) || {[LLSTRING(undoConfirmation), localize "str_a3_a_hub_misc_mission_selection_box_title", localize "str_disp_xbox_hint_yes", localize "str_disp_xbox_hint_no"] call BIS_fnc_guiMessage}) then {
        {
            deleteMarker _x;
        } forEach GVAR(mapMarkers);

        GVAR(mapMarkers) = [];
    };
};
