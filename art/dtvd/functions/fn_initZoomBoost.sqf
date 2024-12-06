/*
	File: fn_initZoomBoost.sqf
	Author: Dom
	Description: Starts or stops the zoom boost handler
*/
params [
	["_enable",true,[false]]
];

if (_enable) then {
	DT_viewDistance_OpticsSwitch = player addEventHandler ["OpticsSwitch",DT_fnc_OpticsSwitch];
} else {
	if (isNil "DT_viewDistance_OpticsSwitch") exitWith {};
	player removeEventHandler ["OpticsSwitch",DT_viewDistance_OpticsSwitch];
	DT_viewDistance_OpticsSwitch = nil;
};