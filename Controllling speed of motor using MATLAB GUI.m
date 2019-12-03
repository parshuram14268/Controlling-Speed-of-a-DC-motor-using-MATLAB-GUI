function varargout = learning_gui(varargin)
% LEARNING_GUI MATLAB code for learning_gui.fig
%      LEARNING_GUI, by itself, creates a new LEARNING_GUI or raises the existing
%      singleton*.
%
%      H = LEARNING_GUI returns the handle to a new LEARNING_GUI or the handle to
%      the existing singleton*.
%
%      LEARNING_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LEARNING_GUI.M with the given input arguments.
%
%      LEARNING_GUI('Property','Value',...) creates a new LEARNING_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before learning_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to learning_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help learning_gui

% Last Modified by GUIDE v2.5 04-Nov-2019 22:37:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @learning_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @learning_gui_OutputFcn, ...
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


% --- Executes just before learning_gui is made visible.
function learning_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to learning_gui (see VARARGIN)

% Choose default command line output for learning_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes learning_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1)


% --- Outputs from this function are returned to the command line.
function varargout = learning_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
clear all;
global a;
a = arduino;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
global a;
writeDigitalPin(a,'D6',0);
writeDigitalPin(a,'D7',1);

% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pause_button.
function pause_button_Callback(hObject, eventdata, handles)
global a;
writeDigitalPin(a,'D6',1);
writeDigitalPin(a,'D7',0);
% hObject    handle to pause_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global a;
slider = get(hObject,'Value')
slider1 = slider *20;
set(handles.edit1,'String',num2str(slider1))
writePWMVoltage(a,'D3',slider);
guidata(hObject,handles);
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider



% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%
