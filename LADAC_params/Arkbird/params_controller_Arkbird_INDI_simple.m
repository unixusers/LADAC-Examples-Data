% ** Parameters of the LQR controller for the quadcopter Muetze **

% Disclamer:
%   SPDX-License-Identifier: GPL-3.0-only
% 
%   Copyright (C) 2020-2022 Yannic Beyer
%   Copyright (C) 2022 TU Braunschweig, Institute of Flight Guidance
% *************************************************************************

% load reference model parameters
params_controller_refMod_Arkbird_INDI;

% load control allocation parameters
params_controller_ca_Arkbird_INDI;

% controller sample time 
cntrl.sample_time = 1/300;

% inverse control matrix
cntrl.ny_du_red(:,:,1) = pinv( [ ...
  122.2142  -15.1862  -19.9628; ...
 -122.2163  -15.1877   19.9631; ...
    4.8836   -0.0002   -0.0021; ...
   -4.8586   -0.0002   -0.0020 ...
    ] );
cntrl.ny_du_red(:,:,2) = pinv( [ ...
    2.4026   -1.8554   12.8136; ...
   -2.4026   -1.8554  -12.8136; ...
    0.1066   -0.0111    5.0690; ...
   -0.1066   -0.0111   -5.0690 ...
   ] );
% AVOID thrust decrease if elevons saturate
cntrl.ny_du_red(2,3:4,:) = 0;

cntrl.ny_du_dt(:,:,1) = [ ...
    0         0   -0.0000    0.0000; ...
    0         0         0         0; ...
    0         0    0.0021   -0.0021 ...
	];
cntrl.ny_du_dt(:,:,2) = [ ...
    0         0   -0.0019    0.0019; ...
    0         0         0         0; ...
    0         0         0         0 ...
    ];

% controller gains
cntrl.K = single( [ ...
   14.3614    0.0000    0.0000  100.0000   -0.0000   -0.0000; ...
    0.0000   14.3614    0.0000   -0.0000  100.0000    0.0000; ...
    0.0000    0.0000    7.5000    0.0000   -0.0000   25.0000 ...
    ] );

cntrl.PWM_motors_hover = 1518;
