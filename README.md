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
