#include "script_component.hpp"
/*
 * File: fnc_createDiaryInstructions.sqf
 * Author: Mildly_Interested
 * Date: 2023-09-22
 * Last Update: 2023-09-24
 * License: License: GNU General Public License v3.0 only - https://www.gnu.org/licenses/gpl-3.0-standalone.html
 *
 * Creates a diary record with instructions on how to use the save and restore radio settings feature.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Function reached the end [BOOL]
 *
 * Example:
 * call lxim_acre_fnc_createDiaryInstructions;
 *
 * Public: No
 */

player createDiarySubject [QUOTE(ADDON), "ACRE Persistence"];
player createDiaryRecord [QUOTE(ADDON), ["Instructions", "<font size='15'>HOW TO USE</font><br/>
Setup your current radios with desired channel, volume, stereo and PTT key. Then ACE self interact and select <font color='#ffa4a4'>Save Radio Settings -> Confirm</font>.<br/><br/>
The next time you load into the server select <font color='#98d7ff'>Restore Radio Settings -> Confirm</font> to automatically load your previously saved channels, volumes, stereo and PTTs.<br/><br/>
Select 'Show Radio Settings' to see what Radio Settings were saved previously.<br/><br/>
Keep in mind you will need to carry the same types of radios in your inventory in order to restore all settings properly - only settings are restored, not the radios themselves. Saved settings will be restored per best effort even if some radios are missing from your inventory.<br/><br/>
<font size='15'>LIMITATIONS</font><br/>
The power state of the radios is not saved. If you save your radios while they are turned off, they will be restored turned on.<br/>
Set their volume to zero as a workaround."]];

true
