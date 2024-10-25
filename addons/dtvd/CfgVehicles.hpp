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
 * [[bob, ted], false] call lximc_main_fnc_example
 *
 * Public: No
 */

class CBA_Extended_EventHandlers;
class CfgVehicles {

    // INTERACTIONS
    class Man;
    class CAManBase: Man {
        // exceptions[] = {"isNotDead", "isNotUnconscious", "isNotSurrendering", "isNotHandcuffed", "isNotCarrying", "isNotDragging", "isNotEscorting", "isNotSwimming", "isNotRefueling", "isNotOnLadder", "isNotSitting", "isNotInside", "isNotInZeus", "notOnMap"};
        class ACE_SelfActions {
            class viewDistanceSelf {
                displayName = "View Distnace";
                condition = "alive Player";
                statement = "[] call DT_fnc_openViewDistanceMenu;";
                exceptions[] = {"isNotDead", "isNotUnconscious"};
                icon = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\scout_ca.paa";
                showDisabled = 0;
            };
        };
    };
};
