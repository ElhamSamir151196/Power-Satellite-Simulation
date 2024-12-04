function varargout = Power_Input_Parameters(varargin)
% POWER_INPUT_PARAMETERS MATLAB code for Power_Input_Parameters.fig
%      POWER_INPUT_PARAMETERS, by itself, creates a new POWER_INPUT_PARAMETERS or raises the existing
%      singleton*.
%
%      H = POWER_INPUT_PARAMETERS returns the handle to a new POWER_INPUT_PARAMETERS or the handle to
%      the existing singleton*.
%
%      POWER_INPUT_PARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POWER_INPUT_PARAMETERS.M with the given input arguments.
%
%      POWER_INPUT_PARAMETERS('Property','Value',...) creates a new POWER_INPUT_PARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Power_Input_Parameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Power_Input_Parameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Power_Input_Parameters

% Last Modified by GUIDE v2.5 12-Jun-2019 02:43:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Power_Input_Parameters_OpeningFcn, ...
                   'gui_OutputFcn',  @Power_Input_Parameters_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT




% --- Executes just before Power_Input_Parameters is made visible.
function Power_Input_Parameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Power_Input_Parameters (see VARARGIN)

% Choose default command line output for Power_Input_Parameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Power_Input_Parameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Power_Input_Parameters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)
% initialize 4 paramters for power 
 MinFlux = char(get(handles.MinFlux,'String'));
 ActiveArea = char(get(handles.ActiveArea,'String'));
 InitalEfficience = char(get(handles.InitalEfficience,'String'));
 SC_Efficience = char(get(handles.SC_Efficience,'String'));

 if(isempty(MinFlux))
     MinFlux='0';
 end
 if(isempty(ActiveArea ))
     ActiveArea='0';
 end
 if(isempty(InitalEfficience ))
     InitalEfficience='0';
 end
 if(isempty(SC_Efficience ))
     SC_Efficience='0';
 end
 InitalEfficience=num2str(str2num(InitalEfficience)/100.0);
 SC_Efficience=num2str(str2num(SC_Efficience)/100.0);
 
set_param('test_pow_sim_1_loop/Solar Array/MinFlux','Value',MinFlux);
set_param('test_pow_sim_1_loop/Solar Array/ActiveArea','Value',ActiveArea);
set_param('test_pow_sim_1_loop/Solar Array/InitalEfficience','Value',InitalEfficience);
set_param('test_pow_sim_1_loop/Solar Array/SC_Efficience','Value',SC_Efficience);

% in case any of powers files not exist

%     
%     %power mergin
%      len_vec_PowerMergin=1; 
%      vec_PowerMergin_cell1='[0]';
%    if( isfield(handles,vec_PowerMergin_cell1))
%        vec_PowerMergin_cell1=handles.vec_PowerMergin_cell1;
%        len_vec_PowerMergin=handles.len_vec_PowerMergin;
%         if(isempty(vec_PowerMergin_cell1) || vec_PowerMergin_cell1 =='[]')
%             len_vec_PowerMergin=1; 
%             vec_PowerMergin_cell1='[0]';
%         end
%     end
%     set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerMergin','X',vec_PowerMergin_cell1);
% 	set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerMergin','Ts',num2str(len_vec_PowerMergin));
% 	set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerMergin','nsamps',num2str(len_vec_PowerMergin));
%     
%    
%     %power requirements
%     len_PowerRequirement=1; 
%     vec_PowerRequirement_cell1='[0]';
%     if( isfield(handles,vec_PowerRequirement_cell1))
%          vec_PowerRequirement_cell1=handles.vec_PowerRequirement_cell1;
%          len_PowerRequirement=handles.len_PowerRequirement;
%         if(isempty(vec_PowerRequirement_cell1) || handles.vec_PowerRequirement_cell1=='[]')
%             len_PowerRequirement=1; 
%             vec_PowerRequirement_cell1='[0]';
%         end
%     end
%     set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerRequirement','X',vec_PowerRequirement_cell1);
%     set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerRequirement','Ts',num2str(len_PowerRequirement));
%     set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerRequirement','nsamps',num2str(len_PowerRequirement));
% 
%     
%     
%     %power Distribution
%     len_Distribution=1; 
%     vec_Distribution_cell1='[0]';
%     if( isfield(handles,vec_Distribution_cell1))
%         vec_Distribution_cell1=handles.vec_Distribution_cell1;
%         len_Distribution=handles.len_Distribution;
%         if(isempty(vec_Distribution_cell1) || vec_Distribution_cell1 == '[]')
%             len_Distribution=1; 
%             vec_Distribution_cell1='[0]';
%         end
%     end
%     vec_Distribution_cell1
%     set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerDistribution','X',vec_Distribution_cell1);
%     set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerDistribution','Ts',num2str(len_Distribution));
%     set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerDistribution','nsamps',num2str(len_Distribution));
%     
%     %Battery not change
%     if( isfield(handles,Flag_Battery))
%         Flag_Battery=handles.Flag_Battery;
%          if(Flag_Battery~=1)
%              Battery_charge=20;
%              InitalBattery=.55*Battery_charge;
%              MaxBattery=.85*Battery_charge;
%              DOD=0.1*Battery_charge;
%              set_param('test_loop_charge_unit/For Iterator Subsystem1/Battery','Value',num2str(InitalBattery));
%              set_param('test_loop_charge_unit/For Iterator Subsystem1/MaxBattery','Value',num2str(MaxBattery));
%              set_param('test_loop_charge_unit/For Iterator Subsystem1/DOD','Value',num2str(DOD));
% 
%          end
%     end
%      
%     % orbit no change
%     if( isfield(handles,Flag_Orbit))
%          Flag_Orbit=handles.Flag_Orbit;
%         if(Flag_Orbit~=1)
%             len_OrbitPower=1; 
%             OrbitPower='[0]';
%             set_param('test_pow_sim_1_loop/Orbit/OrbitPower','X',OrbitPower);
%             set_param('test_pow_sim_1_loop/Orbit/OrbitPower','Ts',num2str(len_OrbitPower));
%             set_param('test_pow_sim_1_loop/Orbit/OrbitPower','nsamps',num2str(len_OrbitPower));
%         end
%     end

% --- Executes on button press in Battery.
function Battery_Callback(hObject, eventdata, handles)
% Flag_Battery=1;
BatteryInputParameters
% handles.Flag_Battery=Flag_Battery;
% guidata(hObject,handles)
% hObject    handle to Battery (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double


% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Distribution.
function Distribution_Callback(hObject, eventdata, handles)

[filename1,filepath1]=uigetfile({'*.*','All Files'},...
  'Select Data File 1');
  cd(filepath1);
Data_File_Power_Distribution=xlsread(filename1,'Sheet1');
vec_Distribution=Data_File_Power_Distribution(1:end,2)';% to be one row instead of one column
%vec_Distribution=[10 15 20 20 5];
vec_Distribution_cell = cellstr(num2str(vec_Distribution))
vec_Distribution_cell = strcat('[',vec_Distribution_cell,']')
vec_Distribution_cell1=char(vec_Distribution_cell)
len_Distribution=length(vec_Distribution);

 if(isempty(vec_Distribution_cell1) || strcmp(vec_Distribution_cell1 ,'[]'))
            len_Distribution=1; 
            vec_Distribution_cell1='[0]';
end
   
set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerD','X',vec_Distribution_cell1);
%set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerD','X',vec_Distribution_cell1);
set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerD','Ts',num2str(len_Distribution));
set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerD','nsamps',num2str(len_Distribution));



% --- Executes on button press in PowerRequirement.
function PowerRequirement_Callback(hObject, eventdata, handles)
[filename1,filepath1]=uigetfile({'*.*','All Files'},...
  'Select Data File 1');
  cd(filepath1);
Data_File_PowerRequirement=xlsread(filename1,'Sheet1');
vec_PowerRequirement=Data_File_PowerRequirement(1:end,2)';% to be one row instead of one column
%vec_PowerRequirement=[10 20  5 15 10]
vec_PowerRequirement_cell = cellstr(num2str(vec_PowerRequirement))
vec_PowerRequirement_cell = strcat('[',vec_PowerRequirement_cell,']')
vec_PowerRequirement_cell1=char(vec_PowerRequirement_cell)
len_PowerRequirement=length(vec_PowerRequirement);


        if(isempty(vec_PowerRequirement_cell1) || strcmp(vec_PowerRequirement_cell1,'[]'))
            len_PowerRequirement=1; 
            vec_PowerRequirement_cell1='[0]';
        end
    
set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerRequirements_Distribution','X',vec_PowerRequirement_cell1);
set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerRequirements_Distribution','Ts',num2str(len_PowerRequirement));
set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerRequirements_Distribution','nsamps',num2str(len_PowerRequirement));

    
% handles.vec_PowerRequirement_cell1=vec_PowerRequirement_cell1;
% handles.len_PowerRequirement=len_PowerRequirement;
% guidata(hObject,handles)

function MinFlux_Callback(hObject, eventdata, handles)
% hObject    handle to MinFlux (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MinFlux as text
%        str2double(get(hObject,'String')) returns contents of MinFlux as a double


% --- Executes during object creation, after setting all properties.
function MinFlux_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MinFlux (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SC_Efficience_Callback(hObject, eventdata, handles)
% hObject    handle to SC_Efficience (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SC_Efficience as text
%        str2double(get(hObject,'String')) returns contents of SC_Efficience as a double


% --- Executes during object creation, after setting all properties.
function SC_Efficience_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SC_Efficience (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ActiveArea_Callback(hObject, eventdata, handles)
% hObject    handle to ActiveArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ActiveArea as text
%        str2double(get(hObject,'String')) returns contents of ActiveArea as a double


% --- Executes during object creation, after setting all properties.
function ActiveArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ActiveArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function InitalEfficience_Callback(hObject, eventdata, handles)
% hObject    handle to InitalEfficience (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of InitalEfficience as text
%        str2double(get(hObject,'String')) returns contents of InitalEfficience as a double


% --- Executes during object creation, after setting all properties.
function InitalEfficience_CreateFcn(hObject, eventdata, handles)
% hObject    handle to InitalEfficience (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PowerMergin.
function PowerMergin_Callback(hObject, eventdata, handles)
[filename1,filepath1]=uigetfile({'*.*','All Files'},...
  'Select Data File 1');
  cd(filepath1);
Data_File_PowerMergin=xlsread(filename1,'Sheet1');
vec_PowerMergin=Data_File_PowerMergin(1:end,2)';% to be one row instead of one column
%vec_PowerMergin=[5 10 15 20 10]
vec_PowerMergin_cell = cellstr(num2str(vec_PowerMergin))
vec_PowerMergin_cell = strcat('[',vec_PowerMergin_cell,']')
vec_PowerMergin_cell1=char(vec_PowerMergin_cell)
len_vec_PowerMergin=length(vec_PowerMergin);

if(isempty(vec_PowerMergin_cell1) || strcmp(vec_PowerMergin_cell1 ,'[]'))
            len_vec_PowerMergin=1; 
            vec_PowerMergin_cell1='[0]';
end

set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerMergin','X',vec_PowerMergin_cell1);
set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerMergin','Ts',num2str(len_vec_PowerMergin));
set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerMergin','nsamps',num2str(len_vec_PowerMergin));
    
% handles.vec_PowerMergin_cell1=vec_PowerMergin_cell1;
% handles.len_vec_PowerMergin=len_vec_PowerMergin;
% guidata(hObject,handles)

% --- Executes on button press in Orbit.
function Orbit_Callback(hObject, eventdata, handles)
Power_generation
% Flag_Orbit=1;
% handles.Flag_Orbit=Flag_Orbit;
% guidata(hObject,handles)
