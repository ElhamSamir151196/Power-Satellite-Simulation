function varargout = BatteryInputParameters(varargin)
% BATTERYINPUTPARAMETERS MATLAB code for BatteryInputParameters.fig
%      BATTERYINPUTPARAMETERS, by itself, creates a new BATTERYINPUTPARAMETERS or raises the existing
%      singleton*.
%
%      H = BATTERYINPUTPARAMETERS returns the handle to a new BATTERYINPUTPARAMETERS or the handle to
%      the existing singleton*.
%
%      BATTERYINPUTPARAMETERS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BATTERYINPUTPARAMETERS.M with the given input arguments.
%
%      BATTERYINPUTPARAMETERS('Property','Value',...) creates a new BATTERYINPUTPARAMETERS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BatteryInputParameters_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BatteryInputParameters_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BatteryInputParameters

% Last Modified by GUIDE v2.5 12-Jun-2019 01:57:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BatteryInputParameters_OpeningFcn, ...
                   'gui_OutputFcn',  @BatteryInputParameters_OutputFcn, ...
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

% --- Executes just before BatteryInputParameters is made visible.
function BatteryInputParameters_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BatteryInputParameters (see VARARGIN)

% Choose default command line output for BatteryInputParameters
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BatteryInputParameters wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BatteryInputParameters_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function EnergyCapacity_Callback(hObject, eventdata, handles)
% hObject    handle to EnergyCapacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EnergyCapacity as text
%        str2double(get(hObject,'String')) returns contents of EnergyCapacity as a double


% --- Executes during object creation, after setting all properties.
function EnergyCapacity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EnergyCapacity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MAX_Charge_Callback(hObject, eventdata, handles)
% hObject    handle to MAX_Charge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MAX_Charge as text
%        str2double(get(hObject,'String')) returns contents of MAX_Charge as a double


% --- Executes during object creation, after setting all properties.
function MAX_Charge_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MAX_Charge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function IntialEnergy_Callback(hObject, eventdata, handles)
% hObject    handle to IntialEnergy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IntialEnergy as text
%        str2double(get(hObject,'String')) returns contents of IntialEnergy as a double


% --- Executes during object creation, after setting all properties.
function IntialEnergy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IntialEnergy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function DOD_Callback(hObject, eventdata, handles)
% hObject    handle to DOD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of DOD as text
%        str2double(get(hObject,'String')) returns contents of DOD as a double


% --- Executes during object creation, after setting all properties.
function DOD_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DOD (see GCBO)
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


% --- Executes on button press in Save.
function Save_Callback(hObject, eventdata, handles)

Battery_charge = double(0);
Battery_charge=str2num(char(get(handles.EnergyCapacity,'String')));

Battery_MAX = double(0);
Battery_MAX=(str2num(char(get(handles.MAX_Charge,'String'))))/100;

Battery_charge_Intial = double(0);
Battery_charge_Intial=(str2num(char(get(handles.IntialEnergy,'String'))))/100;

Battery_DOD = double(0);
Battery_DOD=(str2num(char(get(handles.DOD,'String'))))/100;


InitalBattery=Battery_charge_Intial*Battery_charge;         
MaxBattery=Battery_MAX*Battery_charge;
DOD=Battery_DOD*Battery_charge;

set_param('test_pow_sim_1_loop/Subsystem/For Iterator Subsystem1/Battery','Value',num2str(InitalBattery));
set_param('test_pow_sim_1_loop/Subsystem/For Iterator Subsystem1/MaxBattery','Value',num2str(MaxBattery));
set_param('test_pow_sim_1_loop/Subsystem/For Iterator Subsystem1/DOD','Value',num2str(DOD));
% set_param('test_loop_charge_unit/For Iterator Subsystem1/Battery','Value',num2str(InitalBattery));
% set_param('test_loop_charge_unit/For Iterator Subsystem1/MaxBattery','Value',num2str(MaxBattery));
% set_param('test_loop_charge_unit/For Iterator Subsystem1/DOD','Value',num2str(DOD));


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
