%===================================================================================================================================%
%                                                    Sub function   RK4                                                             %                                         
%===================================================================================================================================%

function y = RK4(t,y)

% The object of this function " RK4 " is to integrate a system of differntial equations using  Runge Kutta 4 fixed step method 

% inputs  :
         % t  : current time of simulation from epoch, sec
         
% outputs :
         % y : vector of states ( i.e position, velocity, angular velocity vectors ...etc) 
         
global h 

    k1   = h*fun(t,y);
    k2   = h*fun(t+.5*h,y +.5*k1);
    k3   = h*fun(t+.5*h,y +.5*k2);
    k4   = h*fun(t+h,y + k3);
    y    = y +(k1+2*k2+2*k3+k4)/6;

%===================================================================================================================================%
%                                                    Sub function fun                                                               %                                         
%===================================================================================================================================%

function f = fun(t,y)

% The object of this function " fun " is to calculate the rate vector of states which will be integrated

% inputs  :
         % t  : current time of simulation, sec
         % y  : vector of states ( i.e position, velocity angular velocity vectors)
% outputs :
         % f : rate vector of states ( i.e  velocity, acceleration ...etc)

global h mu Re

ri=y(1:3);
vi=y(4:6);

J2=1.08265e-3;
r=norm(ri);

a2body=(-mu*ri./r^3);

J2_constant=h*(-3*J2*mu*Re^2/2/r^5);
ai=a2body+(1-5*ri(3)^2/r^2)*ri.*J2_constant;

f =[vi,ai];