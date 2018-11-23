clear all; close all; clc; 

im=38; jm=4; 

url='/home/gadar/Documents/Test_cases/Ducknc_test_zrfix/levels_weconnew/ocean_duck_his_8l.nc'; 
netcdf_load(url);
ocean_time=ncread(url,'ocean_time');
bedu_8l=ncread(url,'bedload_Usand_01');
udelta_8l=ncread(url,'udelta_wbl');
ucrestr_8l=ncread(url,'ucrest_r');
u_8l=ncread(url,'u');
zeta_8l=ncread(url,'zeta');
rr_8l=ncread(url,'RR_asymwave');
beta_8l=ncread(url,'beta_asymwave');
hwave=ncread(url,'Hwave');

url='/home/gadar/Documents/Test_cases/Ducknc_test_zrfix/levels_weconnew/ocean_duck_his_16l.nc'; 
netcdf_load(url);
ocean_time=ncread(url,'ocean_time');
bedu_16l=ncread(url,'bedload_Usand_01'); 
udelta_16l=ncread(url,'udelta_wbl'); 
ucrestr_16l=ncread(url,'ucrest_r');  
u_16l=ncread(url,'u'); 
zeta_16l=ncread(url,'zeta');
rr_16l=ncread(url,'RR_asymwave');
beta_16l=ncread(url,'beta_asymwave');

url='/home/gadar/Documents/Test_cases/Ducknc_test_zrfix/levels_weconnew/ocean_duck_his_32l.nc'; 
netcdf_load(url);
ocean_time=ncread(url,'ocean_time');
bedu_32l=ncread(url,'bedload_Usand_01'); 
udelta_32l=ncread(url,'udelta_wbl'); 
ucrestr_32l=ncread(url,'ucrest_r'); 
u_32l=ncread(url,'u'); 
zeta_32l=ncread(url,'zeta'); 
rr_32l=ncread(url,'RR_asymwave');
beta_32l=ncread(url,'beta_asymwave');

figure(1) 
plot( x_rho(1:end-1,1),squeeze(bedu_8l(:,jm,end)),'r')
hold on
plot( x_rho(1:end-1,1),squeeze(bedu_16l(:,jm,end)),'k--')
hold on
plot( x_rho(1:end-1,1),squeeze(bedu_32l(:,jm,end)),'b')
legend('8l','16l','32l')
ylabel('bed-u')
xlabel('x')
xlim([-110 770])
print('-dpng','-r200','bedu_levels')

figure(2) 
plot( x_rho(1:end,1),squeeze(udelta_8l(:,jm,end)),'r')
hold on
plot( x_rho(1:end,1),squeeze(udelta_16l(:,jm,end)),'k--')
hold on
plot( x_rho(1:end,1),squeeze(udelta_32l(:,jm,end)),'b')
legend('8l','16l','32l')
ylabel('udelta')
xlabel('x')
xlim([-110 770])
print('-dpng','-r200','udelta_levels')


figure(3) 
plot( x_rho(1:end,1),squeeze(ucrestr_8l(:,jm,end)),'r')
hold on
plot( x_rho(1:end,1),squeeze(ucrestr_16l(:,jm,end)),'k--')
hold on
plot( x_rho(1:end,1),squeeze(ucrestr_32l(:,jm,end)),'b')
legend('8l','16l','32l')
ylabel('ucrest') 
xlabel('x')
xlim([-110 770])
print('-dpng','-r200','ucrest_levels')

figure(4) 
plot( x_rho(1:end-1,1),squeeze(u_8l(:,jm,1,end)),'r')
hold on
plot( x_rho(1:end-1,1),squeeze(u_16l(:,jm,1,end)),'k--')
hold on
plot( x_rho(1:end-1,1),squeeze(u_32l(:,jm,1,end)),'b')
ylabel('u') ;
xlabel('x') ; 
legend('8l','16l','32l')
xlim([-110 770])
print('-dpng','-r200','u_atbottomlayer')

figure(5) 
plot( x_rho(1:end,1),squeeze(zeta_8l(:,jm,end)),'r')
hold on
plot( x_rho(1:end,1),squeeze(zeta_16l(:,jm,end)),'ko-')
hold on
plot( x_rho(1:end,1),squeeze(zeta_32l(:,jm,end)),'b*-')
ylabel('zeta') ;
xlabel('x') ; 
legend('8l','16l','32l')
xlim([-110 770])
print('-dpng','-r200','zetar')

figure(6)
plot( x_rho(1:end,1),h(:,jm)+squeeze(zeta_8l(:,jm,end)),'r')
hold on
plot( x_rho(1:end,1),h(:,jm)+squeeze(zeta_16l(:,jm,end)),'ko-')
hold on
plot( x_rho(1:end,1),h(:,jm)+squeeze(zeta_32l(:,jm,end)),'b*-')
ylabel('depth') ;
xlabel('x') ; 
legend('8l','16l','32l')
xlim([-110 770])
print('-dpng','-r200','depth')

figure(7)
plot( x_rho(1:end,1),squeeze(wetdry_mask_rho(:,jm,end)),'r') 
ylabel('wet dry mask') ;
xlabel('x') ;  
xlim([-110 770])
print('-dpng','-r200','wetdry_rho')

figure(8)
plot( x_rho(1:end,1),rr_8l(:,jm,end),'r')
hold on
plot( x_rho(1:end,1),rr_16l(:,jm,end),'ko-')
hold on
plot( x_rho(1:end,1),rr_32l(:,jm,end),'b*-')
hold on
plot( x_rho(1:end,1),beta_8l(:,jm,end),'r')
hold on
plot( x_rho(1:end,1),beta_16l(:,jm,end),'ko-')
hold on
plot( x_rho(1:end,1),beta_32l(:,jm,end),'b*-')
legend('R-8l','R-16l','R-32l','beta-8l','beta-16l','beta-32l')
title('R & beta') ;
xlabel('x') ; 
legend('8l','16l','32l')
xlim([-110 770])
print('-dpng','-r200','rr_beta_wecon')

figure(9)
plot( x_rho(1:end,1),h(:,jm)+squeeze(zeta_8l(:,jm,end)),'r')
hold on
plot( x_rho(1:end,1),h(:,jm)+squeeze(zeta_16l(:,jm,end)),'ko-')
hold on
plot( x_rho(1:end,1),h(:,jm)+squeeze(zeta_32l(:,jm,end)),'b*-')
hold on
plot( x_rho(1:end,1),hwave(:,jm,end),'k--')
%ylabel('depth') ;
xlabel('x') ; 
legend('depth-8l','depth-16l','depth-32l','Hwave')
xlim([-110 770])
print('-dpng','-r200','depth_hwave')
