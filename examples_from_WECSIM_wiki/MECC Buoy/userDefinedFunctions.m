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
%scatter(time_filter, heave_filter, 5)
legend('Unfiltered Heave Forces')

%TF = islocalmin(heave_filter);
%plot(time(TF), heave_filter(TF), 'r*')
%Plot heave forces for body 2
%output.plotForces(2,3);


%Save waves and response as video
% output.saveViz(simu,body,waves,...
%     'timesPerFrame',5,'axisLimits',[-150 150 -150 150 -50 20],...
%     'startEndTime',[100 125]);
