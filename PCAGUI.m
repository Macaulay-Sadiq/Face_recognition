function varargout = PCAGUI(varargin)
% PCAGUI MATLAB code for PCAGUI.fig
%      PCAGUI, by itself, creates a new PCAGUI or raises the existing
%      singleton*.
%
%      H = PCAGUI returns the handle to a new PCAGUI or the handle to
%      the existing singleton*.
%
%      PCAGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PCAGUI.M with the given input arguments.
%
%      PCAGUI('Property','Value',...) creates a new PCAGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PCAGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PCAGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PCAGUI

% Last Modified by GUIDE v2.5 01-Jan-2019 18:26:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @PCAGUI_OpeningFcn, ...
    'gui_OutputFcn',  @PCAGUI_OutputFcn, ...
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


% --- Executes just before PCAGUI is made visible.
function PCAGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PCAGUI (see VARARGIN)

% Choose default command line output for PCAGUI
handles.output = hObject;
axes(handles.InputAxes);
set(gca,'XtickLabel',[],'YtickLabel',[]);
axes(handles.Face1Axes);
set(gca,'XtickLabel',[],'YtickLabel',[]);
axes(handles.Face2Axes);
set(gca,'XtickLabel',[],'YtickLabel',[]);
axes(handles.Face3Axes);
set(gca,'XtickLabel',[],'YtickLabel',[]);

% To set the visibility off
set(handles.LoadTrainDataText,'visible','off');
set(handles.SelectTestFolderText,'visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PCAGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PCAGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function AccuEdit2_Callback(hObject, eventdata, handles)
% hObject    handle to AccuEdit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AccuEdit2 as text
%        str2double(get(hObject,'String')) returns contents of AccuEdit2 as a double


% --- Executes during object creation, after setting all properties.
function AccuEdit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AccuEdit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AccuEdit1_Callback(hObject, eventdata, handles)
% hObject    handle to AccuEdit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AccuEdit1 as text
%        str2double(get(hObject,'String')) returns contents of AccuEdit1 as a double


% --- Executes during object creation, after setting all properties.
function AccuEdit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AccuEdit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AccuEdit3_Callback(hObject, eventdata, handles)
% hObject    handle to AccuEdit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AccuEdit3 as text
%        str2double(get(hObject,'String')) returns contents of AccuEdit3 as a double


% --- Executes during object creation, after setting all properties.
function AccuEdit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AccuEdit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in LoadTrainImageButton.
function LoadTrainImageButton_Callback(hObject, eventdata, handles)
% hObject    handle to LoadTrainImageButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 TrainPath = './Norm_Images/Train_Images/';

% Create Training Set
[D,L] = TrainingSet( TrainPath );

handles.D = D;
handles.L = L;
guidata(hObject, handles)

set(handles.LoadTrainDataText,'visible','on');

% --- Executes on button press in SelectTestImageButton.
function SelectTestImageButton_Callback(hObject, eventdata, handles)
% hObject    handle to SelectTestImageButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get Path for Test Images
TestPath = uigetdir('./Norm_Images/');

handles.TestPath = TestPath;
guidata(hObject, handles)

set(handles.SelectTestFolderText,'visible','on');

% --- Executes on button press in SelectImageButton.
function SelectImageButton_Callback(hObject, eventdata, handles)
% hObject    handle to SelectImageButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Function to get Test Image
TestPath = handles.TestPath;
[filename, pathname] = uigetfile({'*.jpg;*.jpeg;*.JPG'}, 'Select Image',TestPath);
fileName = fullfile(pathname,filename);

% Read Test Image
Test_Image = imread(fileName);

% Display Test Image
axes(handles.InputAxes);
imshow(Test_Image);

handles.Test_Image = Test_Image;
handles.Image_Name = filename;
guidata(hObject, handles)


% --- Executes on button press in RecognitionProcessButton.
function RecognitionProcessButton_Callback(hObject, eventdata, handles)
% hObject    handle to RecognitionProcessButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get No. of Principal Components from the User
PCA_Number = str2double(get(handles.PCAEdit,'String'));

% Calculate PCA Transformation matrix (or) Projection Matrix
[PCA_Transf_Matrix] = Feature_Vector(handles.D, PCA_Number);

% Function to perform Face Recognition
[Match1, Match2, Match3, Accuracy1, Accuracy2, Accuracy3] = RecognizeFace(handles.Test_Image, handles.Image_Name, PCA_Transf_Matrix, handles.D, handles.L, handles.TestPath);

% Display the Matches
axes(handles.Face1Axes);
imshow(Match1);

axes(handles.Face2Axes);
imshow(Match2);

axes(handles.Face3Axes);
imshow(Match3);

set(handles.AccuEdit1,'String',Accuracy1);
set(handles.AccuEdit2,'String',Accuracy2);
set(handles.AccuEdit3,'String',Accuracy3);

handles.Match1 = Match1;
handles.Match2 = Match2;
handles.Match3 = Match3;

handles.Accuracy1 = Accuracy1;
handles.Accuracy2 = Accuracy2;
handles.Accuracy3 = Accuracy3;
guidata(hObject, handles)



function PCAEdit_Callback(hObject, eventdata, handles)
% hObject    handle to PCAEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PCAEdit as text
%        str2double(get(hObject,'String')) returns contents of PCAEdit as a double


% --- Executes during object creation, after setting all properties.
function PCAEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PCAEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Resetbutton.
function Resetbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Resetbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.InputAxes,'reset');
cla(handles.Face1Axes,'reset');
cla(handles.Face2Axes,'reset');
cla(handles.Face3Axes,'reset');
axes(handles.InputAxes);
set(gca,'XtickLabel',[],'YtickLabel',[]);
axes(handles.Face1Axes);
set(gca,'XtickLabel',[],'YtickLabel',[]);
axes(handles.Face2Axes);
set(gca,'XtickLabel',[],'YtickLabel',[]);
axes(handles.Face3Axes);
set(gca,'XtickLabel',[],'YtickLabel',[]);

% To set the visibility off
set(handles.LoadTrainDataText,'visible','off');
set(handles.SelectTestFolderText,'visible','off');
set(handles.AccuEdit1,'String' ,' ');
set(handles.AccuEdit2,'String' ,' ');
set(handles.AccuEdit3,'String' ,' ');
