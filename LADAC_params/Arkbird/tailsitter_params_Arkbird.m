%  ** Parameter file of tailsitter Arkbird (AKAMAV) **

% Disclamer:
%   SPDX-License-Identifier: GPL-3.0-only
% 
%   Copyright (C) 2020-2022 Yannic Beyer
%   Copyright (C) 2022 TU Braunschweig, Institute of Flight Guidance
% *************************************************************************

% rigid body parameters
% mass, kg
tailsitter.body.m = 1.1;
% inertia matrix, kg*m^2
tailsitter.body.I = diag([ 0.0179, 0.0113, 0.0287 ]);

% configuration parameters
% center of gravity position in c frame, in m
tailsitter.config.CoG_Pos_c = [-0.215; 0; 0];
% position of the first wing coordinate frame (c/4 root) in c frame, m
tailsitter.config.xyz_c_wing = [-0.165; 0; 0];
% neutral point of the fuselage in c frame
tailsitter.config.xyz_c_np_fuselage = [-0.22; 0; 0];
% position of all propellers in c frame, in m
tailsitter.config.propPos_c = [-0.115 -0.165 0; ...
                            -0.115 0.165 0 ...
                            ]';
% direction of all propeller rotations, -1: right, 1 left
tailsitter.config.propDir = [1;-1];
% orientation of the motors relative to the body
tailsitter.config.M_b_prop1 = euler2Dcm([0,0,0]);
tailsitter.config.M_b_prop2 = euler2Dcm([0,0,0]);
% hit points for ground model
tailsitter.config.hitPoints_c = [ ...
                    0 0 0;...
                    0 0 0.04;...
                    0 0 -0.04;...
                    -0.215 0 0.05;...
                    -0.215 0 -0.05;...
                    -0.5 0.45 0.18;...
                    -0.5 0.45 -0.18;...
                    -0.5 -0.45 0.18;...
                    -0.5 -0.45 -0.18;...
                    ]';

% propeller parameters
tailsitter.prop = propMapLoadParams( 'propMap_params_default' );

% motor parameters
tailsitter.motor = loadParams( 'motor_bldc_params_Arkbird' );

% battery parameters
tailsitter.bat = loadParams( 'battery_params_Arkbird' );

% actuator parameters
tailsitter.act.elevons = loadParams('actuators_pt2_params_Arkbird');

% reference position
tailsitter.posRef = posRefLoadParams( 'reference_position_params_default' );
tailsitter.posRef.alt = 6.3;

% ground contact parameters
tailsitter.grnd = groundLoadParams( 'params_ground_default' );

% aerodynamics parameters
% propeller induced velocity gain, -
tailsitter.aero.v_i_gain = 2;
% parameters of the first wing
tailsitter.aero.wing = simpleWingLoadParams( 'simple_wing_params_Arkbird' );
% parameters of wet wing
tailsitter.aero.wing_wet = getWetWing( tailsitter );
% reduce wing surface of dry wing
tailsitter.aero.wing.geometry.S = tailsitter.aero.wing.geometry.S - tailsitter.aero.wing_wet.geometry.S;
% fuselage aerodynamics parameters
tailsitter.aero.fuse = simpleFuselageCreate('simpleFuselage_params_Arkbird', 0);

% initial conditions
% initial angular velocity vector (body rel. to earth) in body frame, rad/s
tailsitter.ic.omega_kb_b = [ 0; 0; 0 ];
% compute the initial quaternion from Euler angles
tailsitter.ic.q_bg = euler2Quat([ 0; 1.5; 0 ]);
% initial velocity vector (body rel. to earth) in body frame, m/s
tailsitter.ic.V_kb_b = [ 0; 0; 0 ];
% initial position vector in NED frame
tailsitter.ic.s_g = [ 0; 0; 0 ];
tailsitter.ic.alt = 0;
% initial elevon states
tailsitter.ic.eta = [ 0; 0 ];
tailsitter.ic.dot_eta = [ 0; 0 ];
% initial motor angular velocity, rad/s
tailsitter.ic.motor_speed = [0;0];
