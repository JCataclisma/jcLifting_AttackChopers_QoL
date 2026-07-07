/*
    Author: JCataclisma
    Description: Server-side execution of QoL stuff for gunships. 
*/
params ["_vehicle"];
if (isNull _vehicle || {!alive _vehicle}) exitWith {};

// 1. ZEROING TARGET ACTION
_vehicle addAction [
    "<t color='#ff0000'>Zeroing Target</t>",
    {
        params ["_target", "_caller"];
        if (isManualFire _target) then {
            private _fakeGunner = createAgent ["B_UAV_AI", [0,0,0], [], 0, "NONE"]; 
            sleep 0.25; 
            _fakeGunner moveInGunner _target;
            _fakeGunner lockCameraTo [_target, [0], false];
            _fakeGunner spawn {
                sleep 2;
                deleteVehicle _this;
            };
        };
    },
    nil, -7, false, true, "",
    "_this == _target turretUnit [-1] && isManualFire _target",
    10, false
];

// 2. RECRUIT AI GUNNER ACTION
_vehicle addAction [
    "<t color='#f0cc0f'>Recruit AI Gunner</t>",
    {
        params ["_target", "_caller"];
        private _aiGunner = (group _caller) createUnit ["B_helicrew_F", [0,0,0], [], 0, "NONE"];
        sleep 0.25; 
        _aiGunner moveInGunner _target;
        _aiGunner setCombatBehaviour "COMBAT";
        _aiGunner setCombatMode "RED";
    },
    nil, -8, false, true, "",
    "_this == _target turretUnit [-1] && isNull (_target turretUnit [0])",
    10, false
];

// 3. DISMISS AI GUNNER ACTION
_vehicle addAction [
    "<t color='#00000f'>Dismiss AI Gunner</t>",
    {
        params ["_target"];
        private _aiGunner = _target turretUnit [0];
        if (!isNull _aiGunner && {!isPlayer _aiGunner}) then {
            _aiGunner spawn {
                sleep 0.25;
                if (local _this) then {
                    deleteVehicle _this;
                } else {
                    [_this] remoteExec ["deleteVehicle", 2];
                };
            };
        };
    },
    nil, -9, false, true, "",
    "_this == _target turretUnit [-1] && {!isNull (_target turretUnit [0])} && {!isPlayer (_target turretUnit [0])}",
    10, false
];