samples_per_sec = 1000;

figure(1);

theta = out.simout.theta.Data;
x = out.simout.x.Data;
x_min = min(x);
x_max = max(x);

for k = 1:50:size(out.tout,1)
    tic;
    clf;

    ang = -theta(k);
    pos = x(k);

    plot(pos, 0, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 15);
    hold on;
    rod_x = pos + sin(ang)*l;
    rod_y = cos(ang)*l;

    plot(rod_x, rod_y, 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 10);

    plot([pos rod_x], [0 rod_y], 'b-', 'MarkerFaceColor', 'b', 'MarkerSize', 10);

    str = ['Pendulum Simulation, t=' num2str(k/1000 - 0.001, 2) 's'];
    title(str);
    xlim([x_min - 0.5, x_max + 0.5]);
    ylim([-2, 2]);
    drawnow;

    elapsed = toc;
    pause(0.05 - elapsed);
end


