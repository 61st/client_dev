#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
#define DFUNC(module) TRIPLES(ADDON,fnc,module)
#ifdef DISABLE_COMPILE_CACHE
    #undef PREP
    #define PREP(fncName) DFUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fnc,fncName).sqf)
#else
    #undef PREP
    #define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
#endif

#define GETPRVAR(var1,var2) (profileNamespace getVariable [ARR_2(var1,var2)])
#define SETPRVAR(var1,var2) (profileNamespace setVariable [ARR_2(var1,var2)])

#define ASCII_NEWLINE 10
#define ASCII_CARRIAGE_RETURN 13
#define ASCII_TAB 9
#define ASCII_SPACE 32
#define WHITESPACE toString [ASCII_NEWLINE, ASCII_CARRIAGE_RETURN, ASCII_TAB, ASCII_SPACE]

#define DELETE_PROFILE 0
#define EXPORT_PROFILE 1

#define EXCEPTIONS exceptions[] = {"isNotInside","isNotSitting","isNotSwimming","notOnMap"}

#define ICON_ADD "\A3\ui_f\data\gui\cfg\cursors\add_gs.paa"
#define ICON_DELETE "\A3\ui_f\data\igui\cfg\commandbar\unitcombatmode_ca.paa"

#define IDC_OK 1 // emulate "OK" button
#define IDC_CANCEL 2 // emulate "Cancel" button

#define IDD_MAIN_MAP 12
#define IDD_EDIT_BOX_NAME 20123
#define IDD_EDIT_BOX_SETTINGS 20124
#define IDD_LIST_SELECTED 20125

#define TYPE_MAP 608

#define POS_W(var1) var1 * _wOff
#define POS_H(var1) var1 * _hOff
#define POS_X(var1) POS_W(var1) + _xOff
#define POS_Y(var1) POS_H(var1) + _yOff

// ACE3 reference macros
#define ACE_PREFIX ace
#define ACE_ADDON(module) DOUBLES(ACE_PREFIX,module)

#define ACEGVAR(module,var)         TRIPLES(ACE_PREFIX,module,var)
#define QACEGVAR(module,var)        QUOTE(ACEGVAR(module,var))

#define ACEFUNC(module,function)    TRIPLES(DOUBLES(ACE_PREFIX,module),fnc,function)
#define DACEFUNC(var1,var2) TRIPLES(DOUBLES(ACE_PREFIX,var1),fnc,var2)
#define QACEFUNC(module,function)   QUOTE(ACEFUNC(module,function))

#define ACELSTRING(module,string)   QUOTE(TRIPLES(STR,DOUBLES(ACE_PREFIX,module),string))
#define ACECSTRING(module,string)   QUOTE(TRIPLES($STR,DOUBLES(ACE_PREFIX,module),string))

// LXIMC macros
#define IS_MOD_LOADED(modclass)     (isClass (configFile >> "CfgPatches" >> #modclass))

// Extension macros
#define EXT "61st Mechanized Infantry Battalion_mods"
#define EXT_LOG "61st Mechanized Infantry Battalion_mods_log"

