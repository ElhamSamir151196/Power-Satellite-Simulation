
%===================================================================================================================================%
%                                                    Sub function  button_callback                                                  %                                         
%===================================================================================================================================%
% The object of this function " button_callback  " is to display a question dialog
% when you press cancel button in the waitbar during simulation

function button_callback

global breaker

%whitebg('b')
selection = questdlg('Cancel Simulation ?',...
                     'Cancel Simulation',...
                     'Yes','No','Yes');
switch selection,
    case 'Yes',
       delete(gcf) 
       breaker =1;
   case 'No'
       return    
end

