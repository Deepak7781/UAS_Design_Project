function openLoopResponse(lon_sys, lat_sys)

    x0_lon = [0.1 0 0 0]; % example perturbation
    t = 0:0.01:50;
    [~,t_lon,x_lon] = initial(lon_sys,x0_lon,t);
    plot(t_lon,x_lon,  'LineWidth', 1.5)
    legend('u','w','q','theta')
    grid on;
    xlabel('Time (s)');
    ylabel('States');
    title('Open-Loop Longitudinal Response');
    
    % Lateral system
    
    % Initial condition
    x0_lat = [0.1 0 0 0]; % v disturbance
    t = 0:0.01:50;
    % Open-loop response
    [~, t_lat, x_lat] = initial(lat_sys, x0_lat, t);
    figure;
    plot(t_lat, x_lat, 'LineWidth', 1.5);
    grid on;
    xlabel('Time (s)');
    ylabel('States');
    title('Open-Loop Lateral-Directional Response');
    legend('v','p','r','\phi');
end