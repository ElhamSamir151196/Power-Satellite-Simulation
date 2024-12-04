%  ------------------------------------------------------------------------------

%  [rsun,rtasc,decl] = sunaynan ( jd );

function[ra,decl,rs] = sunaynan(epoch,t)

% The object of this function "sun" is to compute right ascention, declination and position of the sun in ICS 
% inputs  :
         % epoch    : starting time of the simulation [year month day hour minute sec]
         % t        : current time of simulation in secends
         
% outputs :
         % rs      : position vector of the sun in ICS,km
         % ra      : right ascention of the sun,rad 
         % decl    : declination of the sun,rad 
         
% referances
        % valado             
                            
global AU rad pdate

[Y, M, D, H, Min, S] = timecor(epoch,t);

JDUT1  = 367*Y-fix(7*(Y+fix((M+9)/12))/4)+fix(275*M/9)+D+1721013.5+H/24+Min/1440+S/86400 ;;
tut1   = (JDUT1-2451545.0)/36525;
TTDB   = tut1;
         au = 149597870.0;
        twopi      =     2.0*pi;
        deg2rad    =     pi/180.0;

%                 tut1= ( jd - 2451545.0  )/ 36525.0;
% fprintf(1,'tut1 %14.9f \n',tut1);

        meanlong= 280.460  + 36000.77*tut1;
        meanlong= rem( meanlong,360.0  );  %deg

        ttdb= tut1;
        meananomaly= 357.5277233  + 35999.05034 *ttdb;
        meananomaly= rem( meananomaly*deg2rad,twopi );  %rad
        if ( meananomaly < 0.0  )
            meananomaly= twopi + meananomaly;
          end

        eclplong= meanlong + 1.914666471 *sin(meananomaly) ...
                    + 0.019994643 *sin(2.0 *meananomaly); %deg
        eclplong= rem( eclplong,360.0  );  %deg

        obliquity= 23.439291  - 0.0130042 *ttdb;  %deg

        eclplong = eclplong *deg2rad;
        obliquity= obliquity *deg2rad;

        % --------- find magnitude of sun vector, )   components ------
        magr= 1.000140612  - 0.016708617 *cos( meananomaly ) ...
                              - 0.000139589 *cos( 2.0 *meananomaly );    % in au's

        rsun(1)= magr*cos( eclplong ) *au;
        rsun(2)= magr*cos(obliquity)*sin(eclplong) *au;
        rsun(3)= magr*sin(obliquity)*sin(eclplong) *au;
        rs=[  rsun(1) ; rsun(2) ; rsun(3)];

% fprintf(1,'meanlon %11.6f meanan %11.6f eclplon %11.6f obli %11.6f \n', ...
%            meanlong,meananomaly/deg2rad,eclplong/deg2rad,obliquity/deg2rad);
% fprintf(1,'rs %11.9f %11.9f %11.9f \n',rsun);
% fprintf(1,'magr %14.7f \n',magr);

        ra= atan( cos(obliquity)*tan(eclplong) );

        % --- check that rtasc is in the same quadrant as eclplong ----
        if ( eclplong < 0.0  )
            eclplong= eclplong + twopi;    % make sure it's in 0 to 2pi range
          end
        if ( abs( eclplong-rtasc ) > pi*0.5  )
            ra= rtasc + 0.5 *pi*round( (eclplong-rtasc)/(0.5 *pi));
          end
        decl = asin( sin(obliquity)*sin(eclplong) );

pdate = [Y, M, D, H, Min, S];
