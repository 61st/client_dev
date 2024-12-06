/*
    File: fn_initViewDistance.sqf
    Author: Dom
    Description: Starts or stops the view distance handler
*/
params [
    ["_enable",true,[false]]
];

if (_enable) then {
    private _firstTimeSetup = isNil {profileNamespace getVariable "DT_footViewDistance"};
    DT_viewDistance_GetInMan = player addEventHandler ["GetInMan",DT_fnc_GetInMan];
    DT_viewDistance_getOutMan = player addEventHandler ["GetOutMan",DT_fnc_getOutMan];
    DT_viewDistance_Respawn = player addEventHandler ["Respawn",DT_fnc_getOutMan];

    DT_viewDistance_uavHandle = ["ACE_controlledUAV", {
        ACE_controlledUAV params [["_uav",objNull]];
        if (isNull _uav) then {
            [] call DT_fnc_getOutMan;
        } else {
            [player,nil,_uav] call DT_fnc_GetInMan;
        };
    }] call CBA_fnc_addEventHandler;

    {
        private _variable = profileNamespace getVariable [_x,[5000,5000,25]];
        _variable params ["_viewDistance","_objectDistance","_terrainGrid"];
        if (_viewDistance > DT_viewDistanceMax) then {
            _variable set [0,DT_viewDistanceMax];
        };
        if (_objectDistance > DT_viewDistanceMax) then {
            _variable set [1,DT_viewDistanceMax];
        };
        if (_terrainGrid > DT_terrainGridMax) then {
            _variable set [2,DT_terrainGridMax];
        };
        if (_firstTimeSetup) then {
            profileNamespace setVariable [_x,_variable];
        };
    } forEach [
        "DT_footViewDistance",
        "DT_shipViewDistance",
        "DT_carViewDistance",
        "DT_rotaryViewDistance",
        "DT_airViewDistance"
    ];

    private _vehicle = objectParent player;
    if (isNull _vehicle) then {
        [] call DT_fnc_getOutMan;
    } else {
        [player,nil,_vehicle] call DT_fnc_GetInMan;
    };
} else {
    if (isNil "DT_viewDistance_GetInMan") exitWith {};
    player removeEventHandler ["GetInMan",DT_viewDistance_GetInMan];
    DT_viewDistance_GetInMan = nil;
    player removeEventHandler ["GetInMan",DT_viewDistance_getOutMan];
    DT_viewDistance_getOutMan = nil;
    player removeEventHandler ["Respawn",DT_viewDistance_Respawn];
    DT_viewDistance_Respawn = nil;

    ["ACE_controlledUAV",DT_viewDistance_uavHandle] call CBA_fnc_removeEventHandler;
    DT_viewDistance_uavHandle = nil;
};