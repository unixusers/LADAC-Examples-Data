% ** INDI loiter flight mode parameters (Bebop2) **

% Disclamer:
%   SPDX-License-Identifier: GPL-3.0-only
% 
%   Copyright (C) 2020-2022 Yannic Beyer
%   Copyright (C) 2022 TU Braunschweig, Institute of Flight Guidance
% *************************************************************************

% attitude controller
param.atc = loadParams( 'cntrlAttiRedIndi_params_bebop2');

%  position controller
param.psc = loadParams( 'cntrlPosNdi_params_bebop2' );

% propeller control effectiveness
param.cep = loadParams( 'indiCeProp_params_bebop2' );

% body control effectiveness
param.ceb = loadParams( 'indiCeBody_params_bebop2' );

% control allocation
param.ca = loadParams( 'control_allocation_wls_params_quadcopter' );

% sensor filter
param.sflt = loadParams( 'indiSensFilt_params_default' );

% motor time constant, in s
param.mtc = 0.0138;

% flight mode sample time, in s
param.ts = 0.0025;
