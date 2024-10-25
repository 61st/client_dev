#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Set array, so it can be modified by reference later
if (isNil {GETPRVAR(QGVAR(profileNames),nil)}) then {
    SETPRVAR(QGVAR(profileNames),[]);
};

GVAR(mapMarkers) = [];

// CBA Settings
#include "initSettings.inc.sqf"

GVAR(index) = 0;

ADDON = true;
