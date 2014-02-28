/* This example show how to add a action with icon
 * Author: Florian Kinder
 * License: this file can be used without the owners to inform
 */
private ["_ac_repair"];

_ac_repair = player addAction ["<t color='#DD0000'>Repair</t> <img size='2' image='\a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa'/>", "repair.sqf", [], 10, true, true, "", "(speed _target < 1) && (damage _target > 0.1)"];