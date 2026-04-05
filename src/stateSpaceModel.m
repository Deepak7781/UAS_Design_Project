function [lon_system, lat_system] = stateSpaceModel()
% Mass of the UAV
m = 4.92; % kg

g = 9.81; % m/s2

U0 = 15; % m/s

Ixx = 0.5226; % kg.m2
Iyy = 1.1125; % kg.m2
Izz = 1.5036; % kg.m2

% Dimesional Derivatives

X_u = -0.0851;
Z_u = -4.2489;
M_u = 0;

X_w = 2.1939;
Z_w = -31.791;
M_w = -0.9661;

X_q = -0.2546;
Z_q = -3.736;
M_q = -2.5898;

X_delE = 0.00317;
Z_delE = -0.34545;
M_delE = -0.28272;

X_delT = 23.33;
Z_delT = 0;
M_delT = -1.446;

Y_v = -2.4092;
L_v = -1.494;
N_v = 1.9647;

Y_p = -1.5318;
Y_r = 2.6075;

L_p = -12.053;
L_r = 3.629;

N_p = -0.4405;
N_r = -2.1948;

Y_delA = -0.09577;
L_delA = -1.3233;
N_delA = 0.1029;

Y_delR = -0.37991;
L_delR = -0.08589;
N_delR = 0.36532;

% Longitudinal State-Space Model

A_lon = [X_u/m X_w/m X_q/m -g;
         Z_u/m Z_w/m (Z_q+ (m*U0))/m 0;
         M_u/Iyy M_w/Iyy M_q/Iyy 0;
         0 0 1 0];
B_lon = [X_delE/m X_delT/m;
         Z_delE/m Z_delT/m;
         M_delE/Iyy M_delT/Iyy;
         0 0];

C_lon = eye(4);
D_lon = zeros(4,2);

lon_system = ss(A_lon, B_lon, C_lon, D_lon);

lon_system.StateName = {'u [m/s]' , 'w[m/s]' , 'q [rad/s]' , 'theta[rad]' };
lon_system.InputName = {'delta_e [ rad ]', 'delta_T' };
lon_system.OutputName = {'u [m/s]' , 'w[m/s]' , 'q [rad/s]' , 'theta[rad]'};

% Lateral-Directional State-Space Model

A_lat = [Y_v/m Y_p/m (Y_r - m*U0)/m g;
         L_v/Ixx L_p/Ixx L_r/Ixx 0;
         N_v/Izz N_p/Izz N_r/Izz 0;
         0 1 0 0];

B_lat = [Y_delA/m Y_delR/m;
         L_delA/Ixx L_delR/Ixx;
         N_delA/Izz N_delR/Izz;
         0 0];

C_lat = eye(4);

D_lat = zeros(4,2);

lat_system = ss(A_lat, B_lat, C_lat, D_lat);

lat_system . StateName = {'v[m/s]' , 'p[rad/s]' , 'r[rad/s]' , 'phi [rad ]' };
lat_system . InputName = {'delta_a[rad]' , 'delta_r[rad]' };

lat_system . OutputName = {'v[m/s]' , 'p[rad/s]' , 'r[ rad/s]' , 'phi [rad ]' };

end