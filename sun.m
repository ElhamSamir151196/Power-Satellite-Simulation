%===================================================================================================================================%
%                                                    Sub function  sun                                                              %                                         
%===================================================================================================================================%

function [ra,decl,rs] = sun(epoch,t)

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
TUT1   = (JDUT1-2451545.0)/36525;
TTDB   = TUT1;

lams   = 280.4606184+36000.77005361*TUT1;
Msun   = (357.5277233+35999.05034*TTDB);
lame   = lams+1.914666471*sin(Msun*rad)+.019994643*sin(2*Msun*rad);                      % lamda ecliptic
st     = 1.000140612-.016708617*cos(Msun*rad)-.000139589*cos(2*Msun*rad);
epsi   = 23.439291-.0130042*TTDB-1.64e-7*TTDB^2+5.04e-7*TTDB^3;
rs     = [cos(lame*rad);cos(epsi*rad)*sin(lame*rad);sin(epsi*rad)*sin(lame*rad)]*st*AU;
ra     = atan2(cos(epsi*rad)*sin(lame*rad),cos(lame*rad));                               % right ascention of the sun,rad 
decl   = asin(sin(epsi*rad)*sin(lame*rad));                                              % declination of the sun,rad 


pdate = [Y, M, D, H, Min, S];


