clear all; close all; clc; 

im=38; jm=4; 
 

url='/home/gadar/Documents/Test_cases/Ducknc_test_zrfix/levels_wecon/ocean_duck_his_8l.nc'; 
netcdf_load(url);
x_rho=ncread(url,'x_rho'); 
Hwave=ncread(url,'Hwave'); 

url='/home/gadar/Documents/Test_cases/Ducknc_test_zrfix/levels_wecon/wave_forcing_1_112slope_0_3m.nc'; 
netcdf_load(url);
Dissip_break=ncread(url,'Dissip_break'); 
Dissip_fric=ncread(url,'Dissip_fric') ;
Wave_break=ncread(url,'Wave_break') ; 

figure(1) 
plot(x_rho(:,jm), Hwave(:,jm,end),'r')
xlim([-106 750])
title('Wave height (m)')
xlabel('x')
print('-dpng','-r200','Hwave_wave')


figure(2) 
plot(x_rho(:,jm), Dissip_break(:,jm,end),'r')
xlim([-106 750])
title('Dissip-break')
xlabel('x')
print('-dpng','-r200','dissip_break')

figure(3) 
plot(x_rho(:,jm), Dissip_fric(:,jm,end),'r')
xlim([-106 750])
title('Dissip-fric')
xlabel('x')
print('-dpng','-r200','dissip_fric')


figure(4) 
plot(x_rho(:,jm), Wave_break(:,jm,end),'r')
xlim([-106 750])
title('wave-break')
xlabel('x')
print('-dpng','-r200','wave_break')