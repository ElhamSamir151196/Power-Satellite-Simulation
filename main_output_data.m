        
%===================================================================================================================================%
%                                                          main_output_data                                                         %            
%===================================================================================================================================%

% The object of this function " main_output_data " is to store data of simulation in an arrays for purpose of plotting 
global  ii calfaxp calfaxn calfayp calfayn calfazp calfazn ...
    calfaxpi calfaxni calfaypi calfayni calfazpi calfazni tt deggi
        tt(ii)    = t ;
        yy(ii,:)  = yo; 

        deggi(ii)=rem(degg,2*pi);
        calfaxpi(ii)=calfaxp;
        calfaxni(ii)=calfaxn;
        calfaypi(ii)=calfayp;
        calfayni(ii)=calfayn;
        calfazpi(ii)=calfazp;
        calfazni(ii)=calfazn;