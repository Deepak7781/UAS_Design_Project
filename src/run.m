
%% Get the State-Space Model
[lon_system, lat_system] = stateSpaceModel();


%% Compute eigenvalues for longitudinal system
[eigenvalues_lon, eigenvalues_lat] = dynModes(lon_system, lat_system);
disp('Eigenvalues of the longitudinal system:');
disp(eigenvalues_lon);
disp('Eigenvalues of the lateral-directional system:');
disp(eigenvalues_lat);

%% Open Loop Resposne
openLoopResponse(lon_system, lat_system);

%% Elevator Step Input
elevStep(lon_system);

%% Aileron Step Input
aileStep(lat_system);

%% Rudder Step Input
rudderStep(lat_system);

%% Transfer fcn
G_lon = tf(lon_system);
G_elev_to_theta = G_lon(4,1);

G_lat = tf(lat_system);
G_ail_to_phi = G_lat(4,1);

%% Auto-tune PID controller using MATLAB
C_lon_pid = pidtune(G_elev_to_theta, 'PID');


Kp_lon = C_lon_pid.Kp;
Ki_lon = C_lon_pid.Ki;
Kd_lon = C_lon_pid.Kd;

disp(['Kp_lon = ', num2str(Kp_lon)]);
disp(['Ki_lon = ', num2str(Ki_lon)]);
disp(['Kd_lon = ', num2str(Kd_lon)]);

%% Auto-tune PID controller using MATLAB
C_lat_pid = pidtune(G_ail_to_phi, 'PID');

Kp_lat = C_lat_pid.Kp;
Ki_lat = C_lat_pid.Ki;
Kd_lat = C_lat_pid.Kd;

disp(['Kp_lat = ', num2str(Kp_lat)]);
disp(['Ki_lat = ', num2str(Ki_lat)]);
disp(['Kd_lat = ', num2str(Kd_lat)]);


%% Longitudinal closed-loop system (theta feedback)
CL_lon = feedback(C_lon_pid * G_elev_to_theta, 1);
CL_lon.InputName = "\delta_e (rad)";
CL_lon.OutputName = 'Pitch Angle \theta (rad)';

%% Lateral closed-loop system (phi feedback)
CL_lat = feedback(C_lat_pid * G_ail_to_phi, 1);
CL_lat.InputName = "\delta_a (rad)";
CL_lat.OutputName = "Bank Angle \phi (rad)";

disp('Closed-loop longitudinal system created.');
disp('Closed-loop lateral system created.');

%% Plotting the Closed Loop Response
figure;
step(CL_lon, 50);
grid on;
title('Closed-Loop Longitudinal Response with PID Controller');
xlabel('Time (s)');
ylabel('\theta (rad)');

figure;
step(CL_lat, 50);
grid on;
title('Closed-Loop Lateral Response with PID Controller');
xlabel('Time (s)');
ylabel('\phi (rad)');

%% Poles of the Closed Loop System
poles_lon_cl = pole(CL_lon);
poles_lat_cl = pole(CL_lat);

disp('Closed-loop poles of longitudinal system:');
disp(poles_lon_cl);

disp('Closed-loop poles of lateral system:');
disp(poles_lat_cl);