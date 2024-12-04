clc,delete('tt','deggi','calfaxpi','calfaxni','calfaypi','calfayni','calfazpi','calfazni');
global Angle_St Re deg_step h epoch Orb_no oelo breaker Hx t_orb ...
    calfaxpi calfaxni calfaypi calfayni calfazpi calfazni tt deggi ii
breaker=0;
% Orb_no=14;
Re     = 6378.1363 ;                                 % Earth mean equatorial radius km
mu= 3.98600441500*10^5;
rad=pi/180;
  h=60;%sec
    Hx=680;
    e=0;
    i=98*rad;
    Om=0*rad;
    om=0*rad;
    nu=0*rad;
    r=Re+Hx;
    p=r*(1+e*cos(nu));
    a=p/(1-e^2);
    oelo=[a,e,i,Om,om,nu];
    
    Yr=2015;
    Mo=2;
    D=10;
    H=0;
    Mi=0;
    Se=0;
    
    epoch=[Yr Mo D H Mi Se];
    time_end=  [11 2 2015  03 00 00 ]; 
% ----------------------------------------------
 

[NOD,HOD,MOD,SOD]=number_of_day(epoch,time_end);
priode=2*pi*((r^3)/mu)^0.5;
numbere=24*60*60/priode;

numbere1=NOD*numbere;
Orb_no=fix(numbere1);
%    ---------------------------------------------- 
    main(breaker);
    
    figure(1)
    if Angle_St==1
    deggi=deggi(1:ii);
    xx=deggi'*180/pi;
    cc='Angle ,Deg'
    else
    tt=tt(1:ii);
    xx=tt'/t_orb;
    cc='number of Orbit',
    end
    calfaxpi=calfaxpi(1:ii);
    calfaxni=calfaxni(1:ii);
    calfaypi=calfaypi(1:ii);
    calfayni=calfayni(1:ii);
    calfazpi=calfazpi(1:ii);
    calfazni=calfazni(1:ii);
     
    figure (1)
    subplot(3,2,1),plot(xx,calfaxpi','Color','r','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' x+')
    legend(' x+')
    title('Illumination coefficient in positive x')
    xlim([0 max(xx)])

    subplot(3,2,2),plot(xx,calfaxni','Color','r','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' x-')
    legend(' x-')
    title('Illumination coefficient in negative x')
    xlim([0 max(xx)])
    
    subplot(3,2,3),plot(xx,calfaypi','Color','b','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' y+')
    legend(' y+')
    title('Illumination coefficient in positive y')
    xlim([0 max(xx)])
    
    subplot(3,2,4),plot(xx,calfayni','Color','b','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' y-')
    legend(' y-')
    title('Illumination coefficient in negative y')
    xlim([0 max(xx)])
    
    subplot(3,2,5),plot(xx,calfazpi','Color','k','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' z+')
    legend(' z+')
    title('Illumination coefficient in positive z')
    xlim([0 max(xx)])
    
    subplot(3,2,6),plot(xx,calfazni','Color','k','LineWidth',1.5),grid on
    xlabel(cc)
    ylabel(' z-')
    legend(' z-')
    title('Illumination coefficient in negative z')
    xlim([0 max(xx)])
     figure (2)
     plot (xx,calfaxpi,'r')
      xlim([0 max(xx)])
     hold on
     plot (xx,calfaypi,'b')
      xlim([0 max(xx)])
     hold on
      plot (xx,calfazpi,'k')
      xlim([0 max(xx)])
     hold on
    plot (xx, calfaxni,'r')
      xlim([0 max(xx)])
     hold on
   plot (xx, calfayni,'b')
      xlim([0 max(xx)])
     hold on
     plot (xx,calfazni,'k')
      xlim([0 max(xx)])
     hold off
% function Stop_Callback(hObject, eventdata, handles)

% global breaker
% breaker==1;