
%===================================================================================================================================%
%                                                            MAIN PROGRAM                                                           %                
%===================================================================================================================================%

% The function "main " is the main function (bulk) used for simulating the spacecraft during different mode of operation
function main(breaker)


global mu Re R rad  Rs tfin h Orb_no degg deg_step Angle_St t to ii AU oelo Hx t_orb
breaker=0;
to=0;
t=0;
ii=0;
mu     = 3.98600441500*10^5 ;                        % Earth Gravitational constant  km3.s-2
Re     = 6378.1363 ;                                 % Earth mean equatorial radius km
R      = 6.371e3;                                    % average radius of the Earth ,km 
rad    = pi/180 ;                                    % degree to radian
Rs     = 6.9599e5;                                   % Sun mean equatorial radius km
AU     = 149597870;                                  % Asrtonomical units,km


degg=0;
[ri,vi] = oe2rv(oelo);
t_orb=2*pi/(sqrt(mu/(norm(ri))^3));
tfin=Orb_no*t_orb;
if Angle_St==1
    h=deg_step*t_orb/(2*pi);
else
    deg_step=h*(2*pi)/t_orb;
end
tfin=tfin;
yo=[ri;vi]';

 toolbar = waitbar(to,'calculate is running ...','CreateCancelBtn','button_callback');

while (t <= tfin) && (t >= to)
        if breaker ==1, break, end    
    ii    = ii+1;
    
    [calfaxp,calfaxn,calfayp,calfayn,calfazp,calfazn] = Illum(ri,vi,t);   
    
    main_output_data;
    y    = RK4f(to,yo);
    ri=y(1:3)';
    vi=y(4:6)';
    
    to   = t;
    yo   = y;    
    t    = t+h;
    degg=degg+deg_step;
    
    tt(ii)=t;
    rii(ii,:)=ri;
    waitbar(t/tfin,toolbar);  
    
   
end
breaker=1;
if breaker==1
    delete(toolbar)
    vb='Illum_xxx_xxl.xlsx';
    xv='A2:H000';
    if ii<1000
        xv='A2:H000';
        xv(5:7)=num2str(ii+1);
    elseif ii<10000
        xv='A2:H0000';
        xv(5:8)=num2str(ii+1);
    elseif ii<100000
         xv='A2:H00000';
         xv(5:9)=num2str(ii+1);
    end
    vb(7:9)=num2str(Hx);
    vb(11:12)=num2str(oelo(3)*180/pi);
    delete(vb);
    deggi=deggi(1:ii);
    tt=tt(1:ii);
    calfaxpi=calfaxpi(1:ii);
    calfaxni=calfaxni(1:ii);
    calfaypi=calfaypi(1:ii);
    calfayni=calfayni(1:ii);
    calfazpi=calfazpi(1:ii);
    calfazni=calfazni(1:ii);
    xlswrite(vb,{'Time ,Sec','Angle ,Deg','Illumination coef x+','Illumination coef x-','Illumination coef y+','Illumination coef y-','Illumination coef z+','Illumination coef z-'},'Sheet1','A1:H1'); 
    xlswrite(vb,[tt',deggi'*180/pi,calfaxpi',calfaxni',calfaypi',calfayni',calfazpi',calfazni'],'Sheet1',xv);
end

    





                       















  

   





