function varargout = Power_generation(varargin)
% POWER_GENERATION MATLAB code for Power_generation.fig
%      POWER_GENERATION, by itself, creates a new POWER_GENERATION or raises the existing
%      singleton*.
%
%      H = POWER_GENERATION returns the handle to a new POWER_GENERATION or the handle to
%      the existing singleton*.
%
%      POWER_GENERATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POWER_GENERATION.M with the given input arguments.
%
%      POWER_GENERATION('Property','Value',...) creates a new POWER_GENERATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Power_generation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Power_generation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Power_generation

% Last Modified by GUIDE v2.5 19-Jun-2019 18:08:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Power_generation_OpeningFcn, ...
                   'gui_OutputFcn',  @Power_generation_OutputFcn, ...
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


% --- Executes just before Power_generation is made visible.
function Power_generation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Power_generation (see VARARGIN)

% Choose default command line output for Power_generation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Power_generation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Power_generation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Attitude=str2num(get(handles.Attitude,'string'));
True_Anomaly=str2num(get(handles.True_Anomaly,'string'));
Eccentricity=str2num(get(handles.Eccentricity,'string'));
Orbit_Inclination=str2num(get(handles.Orbit_Inclination,'string'));
Argument_of_perigee=str2num(get(handles.Argument_of_perigee,'string'));
Ascending_Node=str2num(get(handles.Ascending_Node,'string'));

%%%%%%%%%%%%%
%Start Time
%%%%%%%%%%%
year_start=str2num(get(handles.year_start,'string'));
month_start=str2num(get(handles.month_start,'string'));
day_start=str2num(get(handles.day_start,'string'));
hour_start=str2num(get(handles.hour_start,'string'));
minutes_start=str2num(get(handles.minutes_start,'string'));
second_start=str2num(get(handles.second_start,'string'));
%%%%%%%%%%%
%End Time
%%%%%%%%%%%
year_end=str2num(get(handles.year_end,'string'));
month_end=str2num(get(handles.month_end,'string'));
day_end=str2num(get(handles.day_end,'string'));
hour_end=str2num(get(handles.hour_end,'string'));
minute_end=str2num(get(handles.minute_end,'string'));
second_end=str2num(get(handles.second_end,'string'));

nu=True_Anomaly;
e=Eccentricity;
i=Orbit_Inclination;
om=Argument_of_perigee;
Om=Ascending_Node;
% epoch=[Yr Mo D H Mi Se];
epoch=[year_start month_start day_start hour_start minutes_start second_start]%start time
time_end=[ day_end  month_end year_end  hour_end minute_end second_end]

total_calfay=Orbit_Generation_power1(nu,e,i,Om,om,epoch,time_end,Attitude);
vec_Power_cell = cellstr(num2str(total_calfay))';
vec_Power_cell = strcat('[',vec_Power_cell,']')
vec_Power_cell1=char(vec_Power_cell)
len_Power=length(total_calfay);


        if(isempty(vec_Power_cell1) || strcmp(vec_Power_cell1,'[]'))
            len_Power=1; 
            vec_Power_cell1='[0]';
        end
    
        set_param('test_pow_sim_1_loop/Orbit/OrbitPower','X',vec_Power_cell1);
        set_param('test_pow_sim_1_loop/Orbit/OrbitPower','Ts',num2str(len_Power));
        set_param('test_pow_sim_1_loop/Orbit/OrbitPower','nsamps',num2str(len_Power));
        set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerRequirements_Distribution','nsamps',num2str(len_Power));
        set_param('test_pow_sim_1_loop/DEMUX subsystem distribution/PowerRequirements_Distribution','Ts',num2str(len_Power));


function year_end_Callback(hObject, eventdata, handles)
% hObject    handle to year_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of year_end as text
%        str2double(get(hObject,'String')) returns contents of year_end as a double


% --- Executes during object creation, after setting all properties.
function year_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to year_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function month_end_Callback(hObject, eventdata, handles)
% hObject    handle to month_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of month_end as text
%        str2double(get(hObject,'String')) returns contents of month_end as a double


% --- Executes during object creation, after setting all properties.
function month_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to month_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function day_end_Callback(hObject, eventdata, handles)
% hObject    handle to day_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of day_end as text
%        str2double(get(hObject,'String')) returns contents of day_end as a double


% --- Executes during object creation, after setting all properties.
function day_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hour_end_Callback(hObject, eventdata, handles)
% hObject    handle to hour_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hour_end as text
%        str2double(get(hObject,'String')) returns contents of hour_end as a double


% --- Executes during object creation, after setting all properties.
function hour_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hour_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minute_end_Callback(hObject, eventdata, handles)
% hObject    handle to minute_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minute_end as text
%        str2double(get(hObject,'String')) returns contents of minute_end as a double


% --- Executes during object creation, after setting all properties.
function minute_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minute_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function second_end_Callback(hObject, eventdata, handles)
% hObject    handle to second_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of second_end as text
%        str2double(get(hObject,'String')) returns contents of second_end as a double


% --- Executes during object creation, after setting all properties.
function second_end_CreateFcn(hObject, eventdata, handles)
% hObject    handle to second_end (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function year_start_Callback(hObject, eventdata, handles)
% hObject    handle to year_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of year_start as text
%        str2double(get(hObject,'String')) returns contents of year_start as a double


% --- Executes during object creation, after setting all properties.
function year_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to year_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function month_start_Callback(hObject, eventdata, handles)
% hObject    handle to month_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of month_start as text
%        str2double(get(hObject,'String')) returns contents of month_start as a double


% --- Executes during object creation, after setting all properties.
function month_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to month_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function day_start_Callback(hObject, eventdata, handles)
% hObject    handle to day_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of day_start as text
%        str2double(get(hObject,'String')) returns contents of day_start as a double


% --- Executes during object creation, after setting all properties.
function day_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to day_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hour_start_Callback(hObject, eventdata, handles)
% hObject    handle to hour_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hour_start as text
%        str2double(get(hObject,'String')) returns contents of hour_start as a double


% --- Executes during object creation, after setting all properties.
function hour_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hour_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function minutes_start_Callback(hObject, eventdata, handles)
% hObject    handle to minutes_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minutes_start as text
%        str2double(get(hObject,'String')) returns contents of minutes_start as a double


% --- Executes during object creation, after setting all properties.
function minutes_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minutes_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function second_start_Callback(hObject, eventdata, handles)
% hObject    handle to second_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of second_start as text
%        str2double(get(hObject,'String')) returns contents of second_start as a double


% --- Executes during object creation, after setting all properties.
function second_start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to second_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Orbit_Inclination_Callback(hObject, eventdata, handles)
% hObject    handle to Orbit_Inclination (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Orbit_Inclination as text
%        str2double(get(hObject,'String')) returns contents of Orbit_Inclination as a double


% --- Executes during object creation, after setting all properties.
function Orbit_Inclination_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Orbit_Inclination (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Argument_of_perigee_Callback(hObject, eventdata, handles)
% hObject    handle to Argument_of_perigee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Argument_of_perigee as text
%        str2double(get(hObject,'String')) returns contents of Argument_of_perigee as a double


% --- Executes during object creation, after setting all properties.
function Argument_of_perigee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Argument_of_perigee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ascending_Node_Callback(hObject, eventdata, handles)
% hObject    handle to Ascending_Node (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ascending_Node as text
%        str2double(get(hObject,'String')) returns contents of Ascending_Node as a double


% --- Executes during object creation, after setting all properties.
function Ascending_Node_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ascending_Node (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function True_Anomaly_Callback(hObject, eventdata, handles)
% hObject    handle to True_Anomaly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of True_Anomaly as text
%        str2double(get(hObject,'String')) returns contents of True_Anomaly as a double


% --- Executes during object creation, after setting all properties.
function True_Anomaly_CreateFcn(hObject, eventdata, handles)
% hObject    handle to True_Anomaly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Eccentricity_Callback(hObject, eventdata, handles)
% hObject    handle to Eccentricity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Eccentricity as text
%        str2double(get(hObject,'String')) returns contents of Eccentricity as a double


% --- Executes during object creation, after setting all properties.
function Eccentricity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Eccentricity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function pushbutton6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function Attitude_Callback(hObject, eventdata, handles)
% hObject    handle to Attitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Attitude as text
%        str2double(get(hObject,'String')) returns contents of Attitude as a double


% --- Executes during object creation, after setting all properties.
function Attitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Attitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
