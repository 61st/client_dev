class CfgPatches {
    class dtvd {
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.00;
        requiredAddons[] = {"ace_common"};
        author = "DomT602";
    };
};

class CfgFunctions {
    class DT {
        tag = "DT";
        class viewDistance {
            file = "z\lximc\addons\dtvd\functions";
            class changeSingleValue {};
            class changeViewByHotkey {};
            class getInMan {};
            class getOutMan {};
            class initViewDistance {};
            class openViewDistanceMenu {};
            class terrainGridChanged {};
            class viewEditChanged {};
            class viewSliderChanged {};
        };
    };
};

#include "CfgEventHandlers.hpp"
#include "DT_viewDistanceMenu.hpp"
#include "CfgVehicles.hpp"