% Hip Marker
H = [396, 653]; % mm
dH = [1086, -229]; % mm/s
ddH = [1546, 381]; % mm/s^2

% Knee data
K = [327, 364];
dK = [753, -211];
ddK = [2481, 632];

% Ankle data
A = [134,80];
dA = [144, 212];
ddA = [1536, 2235];

% Center of Mass
CoM_FS = K + 0.606*(A-K); 
ddCoM_FS = ddK + 0.606*(ddA-ddK);

% Alpha Calculation 
Acc_A_wrt_K = ddA-ddK;

% unit vector from A to K
Runit_K_wrt_A = [K-A]./sqrt(sum((K-A).^2));
R_K_wrt_A  = [K-A];
A_norm = dot(Runit_K_wrt_A, Acc_A_wrt_K)*Runit_K_wrt_A;
A_tan = Acc_A_wrt_K - A_norm;

% Magnitude of the tangental component of acceleration
Mag_A_tan = sqrt(sum(A_tan.^2));
% Length of the segment
Mag_A_wrt_K = sqrt(sum([A-K].^2));

% Get alpha
Alpha = Mag_A_tan / Mag_A_wrt_K;
















