# jcLifting_AttackChopers_QoL
Simple scripts to make  life easy for gunship pilots

=======================
INSTALLATION and CONFIGURATION

You can either add these actions straight into your running settings of scripts, or to call them from config.cpp if you are running your own mod.

-Add the "fn_initAttackHeloActions.sqf" inside your "functions" folder;

-Add this Extended Event Handlers section inside your config.cpp or description ext:
class Extended_Init_EventHandlers {	
  class Heli_Attack_01_base_F { 
      class JC_Gunner_Management_System { init = "(_this select 0) execVM 'JC_Lifting\functions\fn_initAttackHeloActions.sqf';"; }; 
   }; 
};

// The "Heli_Attack_01_base_F" reaches all the "Blackfoot" family - modify it accordingly to the choppers you want to use these features.

=====================

WHAT DO THESE ACTIONS DO AND WHAT DO THEY NEED TO WORK?

ZEROING TARGET:
This will only appear in the menu if you TURN MANUAL FIRE ON for the pilot.
Its expected result is to perfectly center the gatling gun crosshair to the pilot's center view, without the need to disembark, mount as gunner, adjust the aiming and board again as pilot.
The action will temporarily create a fake/invisible gunner, make it center the aiming and disappear. You might need to execute it twice or more times, eventually.
It will NOT work if there is any troops (player or A.I.) sitting on gunner slot, because that will forbid the script to put the fake gunner in there.
Once you click it
