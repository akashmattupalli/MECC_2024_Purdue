%Example of user input MATLAB file for post processing

%Plot waves
waves.plotElevation(simu.rampTime);
try 
    waves.plotSpectrum();
catch
end

%Plot heave response for body 1
%output.plotResponse(1,3);

%Plot heave response for body 2
%output.plotResponse(2,3);

%Plot heave forces for body 1
output.plotForces(1,3);

heave = output.bodies.forceTotal(:,3);
time = output.bodies.time;
figure
plot(time, heave)
xlabel('Time (s)')
ylabel('Forces (N)')
title('Total Heave Force on Buoy against Time')
hold on 
grid on 
wave_elev = waves.waveAmpTime(:,2);
heave_filter = heave(wave_elev > 0);
time_filter = time(wave_elev > 0);
scatter(time_filter, heave_filter, 5)
legend('Unfiltered Heave Forces', 'Filtered Heave Forces')

figure
velocity = output.bodies.velocity(:,3);
plot(time, velocity)
hold on 
TF = islocalmax(velocity);
time_filter = time(TF);
mean_period = mean(diff(time_filter));
scaling_factor = 3.3684;
plot(time(TF), velocity(TF), 'r*')
xlabel('Time (s)')
ylabel('Velocity (m/s)')
hold on
vel_gear = velocity ./ scaling_factor;
time_gear = [0: 0.01*scaling_factor: 100*scaling_factor];
disp_int = 0.01*scaling_factor*cumtrapz(vel_gear);
plot(time_gear, vel_gear)
xlim([0 100])
hold on 
plot(time_gear, disp_int)

figure
displacement = output.bodies.position(:,3);
plot(time, displacement)
xlabel('Time (s)')
ylabel('Displacement (m)')

figure
moor_force = output.moorDyn.Lines.FairTen1;
moor_time = output.moorDyn.Lines.Time;
plot(moor_time, moor_force)
xlabel('Time (s)')
ylabel('Mooring Force (N)')


%TF = islocalmin(heave_filter);
%plot(time(TF), heave_filter(TF), 'r*')
%Plot heave forces for body 2
%output.plotForces(2,3);


%Save waves and response as video
% output.saveViz(simu,body,waves,...
%     'timesPerFrame',5,'axisLimits',[-150 150 -150 150 -50 20],...
%     'startEndTime',[100 125]);
