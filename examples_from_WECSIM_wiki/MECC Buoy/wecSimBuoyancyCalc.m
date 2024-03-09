%constants
rho_metric = 1025; %kg/m3
buoy_mass_kg = 72.7; %kg
RO_mass_kg = 50;     %kg
r_feet = 1.5;        %ft
theta = asind(1.5/2.5); %degrees
h_feet = 0:0.001:2;
g  = 9.81; %metric

%equations that define relations in the frustum base of buoy
R_feet = h_feet.*tand(theta) + r_feet;
Volume_ft3 = (pi .* h_feet ./ 3) .* (R_feet.^2 + R_feet.*r_feet + r_feet^2);

Volume_req_m3 = (buoy_mass_kg + RO_mass_kg) / rho_metric;
Volume_req_ft3 = Volume_req_m3 * 35.3147;

%Determining the height and major radius of the frustum immersed in the
%water based on buoyancy
[Volume_val index] = min(abs(Volume_req_ft3 - Volume_ft3));
R_val_feet = R_feet(index);
h_val_feet = h_feet(index);
R_val_m = R_val_feet / 3.281
h_val_m = h_val_feet / 3.281


