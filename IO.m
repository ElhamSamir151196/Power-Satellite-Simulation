%===================================================================================================================================%
%                                                    Sub function  IO                                                               %                                         
%===================================================================================================================================%

function [Tio] = IO(ri,vi)

% The object of this function " IO " is to transform from orbital coordinate to inertial coordinate system during simulation

% inputs  : 
         % ri  : position vector of the spacecraft in Inertial coordinate system 
         % vi  : velocity vector of the spacecraft in Inertial coordinate system  
         % ai  : acceleration vector of the spacecraft in Inertial coordinate system 
         
% outputs  :
         % Tio : transformation matrix from orbital coordinate to inertial coordinate system during simulation
         % wio : the angular velocity of orbital coordinate w.r.t inertial coordinate system (wio)
         
% referances
        % valado
        % M.sidi
        
Z    = -ri/norm(ri);
Y    = cross(vi,ri)/norm(cross(vi,ri));
X    = cross(Y,Z);
Tio  = [ X Y Z];
