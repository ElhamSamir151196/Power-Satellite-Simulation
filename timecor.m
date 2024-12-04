%===================================================================================================================================%
%                                                    Sub function  timecor                                                          %                                         
%===================================================================================================================================%

function [Y, M, D, H, Min, S] = timecor(epoch,t)

% The object of this function " timecor " is to calculate the current date during simulation
% inputs  : 
         % epoch    : starting time of the simulation [year month day hour minute sec]
         % t        : current time of simulation in secends
% outputs  :

         % Y    : year   
         % M    : Month number  
         % D    : day number
         % H    : hours
         % Min  : minutes
         % S    : seconds         
      
T   = epoch;
Y   = T(1);
M   = T(2);
D   = T(3);
H   = T(4);
Min = T(5);
S   = T(6)+t;

Lmonth = [31 28 31 30 31 30 31 31 30 31 30 31]';

if mod(Y,4)==0
    Lmonth(2)=29;
end

temp = S/60;
S    = mod(S,60);
Min  = fix(temp)+Min;
temp = Min/60;
Min  = mod(Min,60);
H    = fix(temp)+H;
temp = H/24;
H    = mod(H,24);
D    = fix(temp)+D;
temp = Lmonth(M);
while D>temp
M    = M+1;
if M>length(Lmonth)
    M    = mod(M,length(Lmonth));
    Y    = Y+1; 
end
temp3 = M-1;
if temp3==0;
    temp3 = 12;
end
temp1 = Lmonth(temp3);
D     = D-temp1;
temp  = Lmonth(M);  
end
