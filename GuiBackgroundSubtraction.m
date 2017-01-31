
% Project: BackGroundSubtraction
% File Name : GuiBackgroundSubtraction.m
% Name : Ilay Serr
% Email : ilay92@gmail.com
%
% GUI

function varargout = GuiBackgroundSubtraction(varargin)
% GUIBACKGROUNDSUBTRACTION MATLAB code for GuiBackgroundSubtraction.fig
%      GUIBACKGROUNDSUBTRACTION, by itself, creates a new GUIBACKGROUNDSUBTRACTION or raises the existing
%      singleton*.
%
%      H = GUIBACKGROUNDSUBTRACTION returns the handle to a new GUIBACKGROUNDSUBTRACTION or the handle to
%      the existing singleton*.
%
%      GUIBACKGROUNDSUBTRACTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIBACKGROUNDSUBTRACTION.M with the given input arguments.
%
%      GUIBACKGROUNDSUBTRACTION('Property','Value',...) creates a new GUIBACKGROUNDSUBTRACTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GuiBackgroundSubtraction_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GuiBackgroundSubtraction_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GuiBackgroundSubtraction

% Last Modified by GUIDE v2.5 29-Nov-2016 17:34:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GuiBackgroundSubtraction_OpeningFcn, ...
                   'gui_OutputFcn',  @GuiBackgroundSubtraction_OutputFcn, ...
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


% --- Executes just before GuiBackgroundSubtraction is made visible.
function GuiBackgroundSubtraction_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GuiBackgroundSubtraction (see VARARGIN)

% Choose default command line output for GuiBackgroundSubtraction
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GuiBackgroundSubtraction wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GuiBackgroundSubtraction_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function th_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.thText.String = floor(get(handles.th, 'Value'));

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function frames_Callback(hObject, eventdata, handles)
% hObject    handle to frames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frames as text
%        str2double(get(hObject,'String')) returns contents of frames as a double


% --- Executes during object creation, after setting all properties.
function frames_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frames (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in random.
function random_Callback(hObject, eventdata, handles)
% hObject    handle to random (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of random


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    % taking care of the first group of radio buttons and chossing the
    % correct answer, (median , mean or single).
    if (get(handles.median, 'value') == 1)
        chosenRB1 = 'median';
    elseif (get(handles.mean, 'value') == 1)
        chosenRB1 = 'mean';
    elseif (get(handles.single, 'value') == 1)
        chosenRB1 = 'single';
    end

    % taking care of the second group of radio buttons and chossing the
    % correct answer, (rgb or grayscale).
    if (get(handles.rgb, 'value') == 1)
        chosenRB2 = 'rgb';
    elseif (get(handles.gray, 'value') == 1)
        chosenRB2 = 'gray';
    end

    % getting the correct threshold from the slider.
    th = floor(get(handles.th, 'Value'));

    % getting the number of frames from the textBox using the str2num func.
    k = get(handles.frames, 'String');
    k = str2num(k);
    
    % getting the user descion if he wants random frames.
    if (get(handles.random, 'value') == 1)
       rand = 'random';
    else 
       rand = 'no';
    end
    
    % getting the video file path
    filename = get(handles.filename, 'String');
    filepath = get(handles.filepath, 'String');
    video_path = strcat(filepath,filename);
    
    % running the program with the given data.
    backgroundSubtraction(video_path, k , th , chosenRB1 , chosenRB2, rand);
    
% --- Executes on button press in loadVideo.
function loadVideo_Callback(hObject, eventdata, handles)
% hObject    handle to loadVideo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, filepath, i] = uigetfile('*.*');
set(handles.filename, 'String', filename);
set(handles.filepath, 'String', filepath);
