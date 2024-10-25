#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"lxim_main"};
        author = QAUTHOR;
        authors[] = {"Timi007"};
        url = URL;
        VERSION_CONFIG;
    };
};

#include "CfgWorlds.hpp"
#include "CfgVehicles.hpp"
