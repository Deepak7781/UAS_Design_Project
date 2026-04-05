function rudderStep(lat_sys)

A = lat_sys.A;
B = lat_sys.B;
C = lat_sys.C;
D = lat_sys.D;

% time vector
t = 0:0.1:50;

% input vector
u = zeros(length(t), size(B,2));
u(:,2) = 1; % Unit step input for rudder

[y_lat, t_lat, x_lat] = lsim(lat_sys, u, t);

figure;
plot(t_lat, x_lat(:,1), 'LineWidth', 1.5); hold on;
plot(t_lat, x_lat(:,2), 'LineWidth', 1.5);
plot(t_lat, x_lat(:,3), 'LineWidth', 1.5);
plot(t_lat, x_lat(:,4), 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('State Response');
title('Open-Loop Lateral Response to Rudder Step');
legend('v','p','r','\phi','Location','best');

end