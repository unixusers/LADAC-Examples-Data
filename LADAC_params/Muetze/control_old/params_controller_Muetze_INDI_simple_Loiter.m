% ** Parameters of the LQR controller for the quadcopter Muetze **

% Disclamer:
%   SPDX-License-Identifier: GPL-2.0-only
% 
%   Copyright (C) 2020-2022 Yannic Beyer
%   Copyright (C) 2022 TU Braunschweig, Institute of Flight Guidance
% *************************************************************************

% load reference model parameters
params_controller_refMod_Muetze_INDI;

% load control allocation parameters
params_controller_ca_Muetze_INDI;

% controller sample time 
cntrl.sample_time = 0.0025;

% motor commands corresponding to control effectiveness (for scaling)
cntrl.u_trim = [ ...
    0.5374; ...
    0.5374; ...
    0.5374; ...
    0.5374 ...
    ];

% control effectiveness matrix
cntrl.ny_du_red = 1.2 * [ ...
  -50.3212  -50.3212   50.3212   50.3212; ...
   65.2049  -65.2049  -58.1174   58.1174; ...
   -3.1013    3.1013   -3.1013    3.1013; ...
   -7.9922   -7.9922   -7.9922   -7.9922 ...
   ];

cntrl.ny_du_dt = 1.5 * [ ...
   -0.0000    0.0000   -0.0000    0.0000; ...
   -0.0000    0.0000   -0.0000    0.0000; ...
   -1.5614    1.5614   -1.5614    1.5614; ...
         0         0         0         0 ...
     ];

% controller gains
cntrl.K = single( [ ...
   50.0000         0         0         0   15.1600         0         0         0    0.2132         0         0         0; ...
         0   50.0000    0.0000    0.0000         0   15.1600    0.0000    0.0000         0    0.2132    0.0000    0.0000; ...
         0    0.0000   50.0000   -0.0000         0    0.0000   15.1600   -0.0000         0    0.0000    0.2132   -0.0000; ...
         0   -0.0000    0.0000    1.5000         0    0.0000   -0.0000    2.0221         0    0.0000   -0.0000    0.0297 ...
    ] );

% controller gains (position)
cntrl.Kpos = single( [ ...
    1.3067         0    2.2512         0    0.1610         0; ...
         0    1.3067         0    2.2512         0    0.1610 ...
     ] );
 
  % controller gains (position)
cntrl.Kpos_NDI = single( [ ...
    2.1434         0    2.8016         0    0.3455         0; ...
    0    2.1434         0    2.8016         0    0.3455 ...
     ] );
 
  % I controller gains (position)
cntrl.Kpos_I_NDI = single( [ ...
    0.4224         0 ; ...
         0    0.4224 ...
     ] );
 
%%

cntrl.e_xy_max = diag(cntrl.Kpos(:,3:4))*cntrl.rm.uv_max*0.7./diag(cntrl.Kpos(:,1:2));
