function elevStep(lon_sys)

A = lon_sys.A;
B = lon_sys.B;
C = lon_sys.C;
D = lon_sys.D;

% time vector
t = 0:0.1:50;

% input vector
u = zeros(length(t), size(B,2));
u(:,1) = 1;

[y_long, t_long, x_long] = lsim(lon_sys, u, t);

% Combined plot
figure;
plot(t_long, x_long(:,1), 'LineWidth', 1.5); hold on;
plot(t_long, x_long(:,2), 'LineWidth', 1.5);
plot(t_long, x_long(:,3), 'LineWidth', 1.5);
plot(t_long, x_long(:,4), 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('State Response');
title('Open-Loop Longitudinal Step Response to Elevator Input');
legend('u','w','q','\theta','Location','best');

% Individual figures
figure;
plot(t_long, x_long(:,1), 'LineWidth', 1.5);
grid on;
xlabel('Time (s)'); ylabel('u (m/s)');
title('Forward Velocity Response to Elevator Step');

figure;
plot(t_long, x_long(:,2), 'LineWidth', 1.5);
grid on;
xlabel('Time (s)'); ylabel('w (m/s)');
title('Vertical Velocity Response to Elevator Step');

figure;
plot(t_long, x_long(:,3), 'LineWidth', 1.5);
grid on;
xlabel('Time (s)'); ylabel('q (rad/s)');
title('Pitch Rate Response to Elevator Step');

figure;
plot(t_long, x_long(:,4), 'LineWidth', 1.5);
grid on;
xlabel('Time (s)'); ylabel('\theta (rad)');
title('Pitch Angle Response to Elevator Step');

end