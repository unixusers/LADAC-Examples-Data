%  ** conventional airplane parameters **

% Disclamer:
%   SPDX-License-Identifier: GPL-2.0-only
% 
%   Copyright (C) 2020-2022 Yannic Beyer
%   Copyright (C) 2022 TU Braunschweig, Institute of Flight Guidance
% *************************************************************************

% rigid body parameters
airplane.body = rigidBodyLoadParams( 'params_rigid_body_EasyGlider' );

% center of gravity in c frame, m
airplane.config.cg = [-0.33;0;0];
% collision points in c frame, m
airplane.config.hitPoints = [ [0;0;0],[-1.08;0;0],[-0.44;-0.9075;0.1],[-0.44;0.9075;0.1],...
    [-0.1;0;0.05],[-0.95;0;0.05],[-0.25;0;-0.075],[-1;0;-0.26],...
    [-1;-0.22;-0.05],[-1;0.22;-0.05] ];

% aerodynamics parameters
airplane.aero = conventionalAirplaneAeroLoadParams( ...
    'params_conventional_airplane_aero_simple_EasyGlider' );

% propeller parameters
airplane.prop = propMapLoadParams( 'params_propeller_map_based_EasyGlider' );

% propeller configuration parameters
airplane.prop.config.Pos = [0;0;0];
airplane.prop.config.Rot = euler2Dcm(deg2rad([0 -8 0]));

% motor parameters
airplane.motor = motorLoadParams( 'params_motor_bldc_EasyGlider' );

% actuator parameters
airplane.act.ailerons = actuatorsLoadParams('actuators_pt2_params_default');
airplane.act.elevator = actuatorsLoadParams('actuators_pt2_params_default');
airplane.act.rudder = actuatorsLoadParams('actuators_pt2_params_default');
airplane.act.htpTrim = actuatorsLoadParams('actuators_pt2_params_default');

% battery parameters
airplane.bat = loadParams( 'params_battery_EasyGlider' );

% cmd struct/bus
airplane.cmd = struct('aileron_left',0.5,'aileron_right',0.5,'elevator',0.5,'rudder',0.5,'throttle',0,'htp_trim',0.5);
struct2slbus(airplane.cmd,'cmd');

% reference position
airplane.posRef = posRefLoadParams( 'reference_position_params_default' );

% ground contact parameters
airplane.grnd = groundLoadParams( 'params_ground_default' );

%% initial conditions (IC)
% kinematic rotational velocity, rad/s
airplane.ic.omega_Kb = zeros(3,1);
% quaternion attitude from NED to body frame
airplane.ic.q_bg = [1;0;0;0]; %[1;0;0;0]
% kinematic velocity in body frame, m/s
airplane.ic.V_Kb = [0;0;0];
% NED position relative to posRef, m
airplane.ic.s_Kg = [0; 0; -1];
% motor angular velocity, rad/s
airplane.ic.motor_speed = 0;