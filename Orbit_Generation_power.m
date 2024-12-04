function[total_calfay]= Orbit_Generation_power(nu,e,i,Om,om,epoch1,time_end)
clc,delete('tt','deggi','calfaxpi','calfaxni','calfaypi','calfayni','calfazpi','calfazni');
global Angle_St Re deg_step h  epoch ...
    Orb_no oelo breaker Hx t_orb ...
    calfaxpi calfaxni calfaypi calfayni calfazpi beat_anglei calfazni tt deggi ii 
breaker=0;
epoch=epoch1;
mu= 3.98600441500*10^5 ;
Re = 6378.1363 ;                                 % Earth mean equatorial radius km
rad=pi/180;
    h=60;% divided time to every 60 sec=1 min
    Hx=600 
              % ;e Eccentricity
              %  i Inclination,rad
              %  Om RAAN,rad
              %  om Arg. of perigee,rad
              %  nu True anomaly,rad 
   % e=0;
    i=i*rad;%97.7 *rad;
    Om=Om*rad;%77.61*rad;
    om=om*rad;%0*rad;
    nu=nu*rad;%0.0*rad;
    
    r=Re+Hx;
    p=r*(1+e*cos(nu));
    a=p/(1-e^2);
    oelo=[a,e,i,Om,om,nu];
%     Yr=2019;
%     Mo=3;
%     D=21;
%     H=0;
%     Mi=0;
%     Se=0;
%     
   % epoch=[Yr Mo D H Mi Se];
   % time_end=  [22 3 2019  00 00 00 ]; 

[NOD,HOD,MOD,SOD]=number_of_day(epoch,time_end);
priode=2*pi*((r^3)/mu)^0.5
numbere=24*60*60/priode

numbere1=NOD*numbere
format long g
    
    Orb_no=numbere1;
    
    main(breaker);
    
    figure(1)
    if Angle_St==1
    deggi=deggi(1:ii);
    xx=deggi'*180/pi;
    cc='Angle ,Deg'
    else
    tt=tt(1:ii);
    xx=tt'/t_orb;
    cc='Time ,Orbit'
    end
    calfaxpi=calfaxpi(1:ii);
    calfaxni=calfaxni(1:ii);
    calfaypi=calfaypi(1:ii);
    calfayni=calfayni(1:ii);
    calfazpi=calfazpi(1:ii);
    calfazni=calfazni(1:ii);
    beat_anglei=beat_anglei(1:ii)
%     beat_angle=beat_angle(1:ii)


    
    subplot(3,2,1),plot(xx,calfaxpi','Color','r','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' x+')
    legend(' x+')
    title('Illumination coefficient in positive x')
    xlim([0 max(xx)])

    subplot(3,2,2),plot(xx,calfaxni','Color','r','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel( 'x-')
    legend(' x-')
    title('Illumination coefficient in negative x')
    xlim([0 max(xx)])
    
    subplot(3,2,3),plot(xx,calfazpi','Color','g','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' y+')
    legend('y+')
    title('Illumination coefficient in positive y')
    xlim([0 max(xx)])
    
    subplot(3,2,4),plot(xx,calfazni','Color','g','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' y-')
    legend(' y-')
    title('Illumination coefficient in negative y')
    xlim([0 max(xx)])
    
    subplot(3,2,5),plot(xx,calfaypi','Color','k','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' z+')
    legend('z+')
    title('Illumination coefficient in positive z')
    xlim([0 max(xx)])
    
    subplot(3,2,6),plot(xx,calfayni','Color','k','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' z-')
    legend(' z-')
    title('Illumination coefficient in negative z')
    xlim([0 max(xx)])
    
    figure(2)
    plot (tt',beat_anglei*(180/pi),'r.')
    xlabel('time ,sec')
    ylabel(' Beatangle')
    legend(' time sec')
    title('change Beatangle with time')
    size(xx)
    total_calfay=calfayni+calfaypi +calfazni+calfazpi+calfaxni+calfaxpi;
        figure(3)
    

   xp=plot(xx,calfaxpi','r')
    hold on
    
    xn=plot(xx,calfaxni','r--')
    hold on
    
    yp=plot(xx,calfazpi','g')
    hold on
    
   yn= plot(xx,calfazni','g--')
    hold on
    
    zp=plot(xx,calfaypi','k')
    hold on
    
   zn= plot(xx,calfayni','k--')
    hold off
set(gca);
xlabel(cc);
ylabel('Illumination coefficient');

legend([xp xn yp yn zp zn],'x+','x-','y+','y-','z+','z-','Location','NorthEast');

    end