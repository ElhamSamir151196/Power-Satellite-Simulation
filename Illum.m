
 
%===================================================================================================================================%
%                                                    Sub function  Illum                                                     %                                         
%===================================================================================================================================%

function [calfaxp,calfaxn,calfayp,calfayn,calfazp,calfazn] = Illum(ri,vi,t)

% The object of this function " Illum " is to simulate the Illumination Coefficient during simulation 
% inputs  :
          % ri   :   position vector of the spacecraft in Inertial coordinate system
          % vi   :   velocity vector of the spacecraft in Inertial coordinate system 
          % t    :   current time of simulation, sec
                                 
% outputs :
         
%           calfaxp : Illumination coefficient in positive x direction .
%           calfaxn : Illumination coefficient in negative x direction .
%           calfayp : Illumination coefficient in positive y direction .
%           calfayn : Illumination coefficient in negative y direction .
%           calfazp : Illumination coefficient in positive z direction .
%           calfazn : Illumination coefficient in negative z direction .

global epoch Rs Re
  
       
      [ra,decl,rs] = sun(epoch,t);
   
      [Tio] = IO(ri,vi);
  

  r     = norm(ri);
  rsn   = norm(rs);
  

  Tbo=eye(3,3);
  Tbi=Tbo*inv(Tio);
  sb=Tbi*(rs/rsn);    
            

  rbxp     = [1 0 0]';               % unit vector of the sun in body coordinate system
  rbxn     = [-1 0 0]';               % unit vector of the sun in body coordinate system
  rbyp     = [0 1 0]';               % unit vector of the sun in body coordinate system
  rbyn     = [0 -1 0]';               % unit vector of the sun in body coordinate system
  rbzp     = [0 0 1]';               % unit vector of the sun in body coordinate system
  rbzn     = [0 0 -1]';               % unit vector of the sun in body coordinate system

    
     
  % Solar moment
  
    BB=Re*rsn/(Rs-Re);
    rhosu=asin(Re/BB);
    thetaps=acos(dot((rs+ri),-ri)/(norm(rs+ri)*r));
    rhos=asin(Rs/rsn);
    rhoe=asin(Re/r);
    cosal  = thetaps;
    cossr  = abs(rhoe-rhos);
    
      if cosal > cossr
          
          calfaxp=dot(rbxp,sb);
          calfaxn=dot(rbxn,sb);
          calfayp=dot(rbyp,sb);
          calfayn=dot(rbyn,sb);
          calfazp=dot(rbzp,sb);
          calfazn=dot(rbzn,sb);

      if calfaxp<=0
          calfaxp=0;
      end
      if calfaxn<=0
          calfaxn=0;
      end
      if calfayp<=0
          calfayp=0;
      end
      if calfayn<=0
          calfayn=0;
      end
      if calfazp<=0
          calfazp=0;
      end
      if calfazn<=0
          calfazn=0;
      end
      
      else
          calfaxp=0;
          calfaxn=0;
          calfayp=0;
          calfayn=0;
          calfazp=0;
          calfazn=0;
      end 
      
 
