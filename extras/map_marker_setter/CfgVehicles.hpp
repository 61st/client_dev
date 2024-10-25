class CBA_Extended_EventHandlers;
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ADDON {
                condition = QUOTE(visibleMap && alive _player && {_player getSlotItemName TYPE_MAP != ''});
                displayName = CSTRING(mapMarkerSetter);
                EXCEPTIONS;

                class GVAR(saveMapMarkers) {
                    condition = QUOTE(true);
                    displayName = "$STR_disp_int_save";
                    EXCEPTIONS;
                    insertChildren = QUOTE(_player call FUNC(profileMenusSave));
                };

                class GVAR(loadMapMarkers) {
                    condition = QUOTE(true);
                    displayName = "$STR_disp_me_load";
                    EXCEPTIONS;
                    insertChildren = QUOTE(_player call FUNC(profileMenusLoad));
                };

                class GVAR(undoMapMarkers) {
                    condition = QUOTE(GVAR(mapMarkers) isNotEqualTo []);
                    displayName = CSTRING(undo);
                    EXCEPTIONS;
                    statement = QUOTE(call FUNC(undoMapMarkers));
                };

                class GVAR(deleteProfile) {
                    condition = QUOTE(GETPRVAR(QQGVAR(profileNames),[]) isNotEqualTo []);
                    displayName = CSTRING(deleteProfile);
                    EXCEPTIONS;
                    icon = ICON_DELETE;
                    statement = QUOTE([ARR_2(FUNC(gui_selectProfile),DELETE_PROFILE)] call CBA_fnc_execNextFrame);
                };

                class GVAR(newProfile) {
                    condition = QUOTE(true);
                    displayName = CSTRING(createImportProfile);
                    EXCEPTIONS;
                    icon = ICON_ADD;
                    statement = QUOTE(FUNC(gui_createProfile) call CBA_fnc_execNextFrame);
                };

                class GVAR(exportProfile) {
                    condition = QUOTE(GETPRVAR(QQGVAR(profileNames),[]) isNotEqualTo []);
                    displayName = CSTRING(exportProfile);
                    EXCEPTIONS;
                    icon = ICON_ADD;
                    statement = QUOTE([ARR_2(FUNC(gui_selectProfile),EXPORT_PROFILE)] call CBA_fnc_execNextFrame);
                };
            };
        };
    };
};