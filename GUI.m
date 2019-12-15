function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 26-Jan-2019 20:14:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadBtn.
function loadBtn_Callback(hObject, eventdata, handles)
% hObject    handle to loadBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uigetfile({'*.wav'},'File Selector');
fullpathname = strcat(pathname, filename);
set(handles.path, 'String',fullpathname);

[handles.inputData, handles.inputFs] = audioread(fullpathname);

handles.outputData = handles.inputData;
handles.outputFs = handles.inputFs;
set(handles.sampleRate,'String',num2str(handles.inputFs));
handles.vol = get(handles.volume,'Value') + 1;

handles.playableData = handles.inputData;
handles.playableFs = handles.inputFs;
equalizerPlayer(hObject,handles);

'Track loaded successfully'

guidata(hObject,handles);




function equalizerPlayer(hObject,handles)

global player;
player = audioplayer(handles.vol * handles.playableData,handles.playableFs);
guidata(hObject,handles);





% --- Executes during object deletion, before destroying properties.
function uipanel2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function g1_Callback(hObject, eventdata, handles)
% hObject    handle to g1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g1 as text
%        str2double(get(hObject,'String')) returns contents of g1 as a double


% --- Executes during object creation, after setting all properties.
function g1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g1 (see GCBO)
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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
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


% --- Executes on button press in saveBtn.
function saveBtn_Callback(hObject, eventdata, handles)
% hObject    handle to saveBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename, pathname] = uiputfile({'*.wav'},'File Selector');
fullpathname = strcat(pathname, filename);
outputFs = str2num(get(handles.sampleRate,'String'));
audiowrite (fullpathname, handles.outputData, outputFs);


function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to g1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g1 as text
%        str2double(get(hObject,'String')) returns contents of g1 as a double


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g2_Callback(hObject, eventdata, handles)
% hObject    handle to g2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g2 as text
%        str2double(get(hObject,'String')) returns contents of g2 as a double


% --- Executes during object creation, after setting all properties.
function g2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g4_Callback(hObject, eventdata, handles)
% hObject    handle to g4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g4 as text
%        str2double(get(hObject,'String')) returns contents of g4 as a double


% --- Executes during object creation, after setting all properties.
function g4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g5_Callback(hObject, eventdata, handles)
% hObject    handle to g5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g5 as text
%        str2double(get(hObject,'String')) returns contents of g5 as a double


% --- Executes during object creation, after setting all properties.
function g5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g6_Callback(hObject, eventdata, handles)
% hObject    handle to g6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g6 as text
%        str2double(get(hObject,'String')) returns contents of g6 as a double


% --- Executes during object creation, after setting all properties.
function g6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g7_Callback(hObject, eventdata, handles)
% hObject    handle to g7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g7 as text
%        str2double(get(hObject,'String')) returns contents of g7 as a double


% --- Executes during object creation, after setting all properties.
function g7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g8_Callback(hObject, eventdata, handles)
% hObject    handle to g8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g8 as text
%        str2double(get(hObject,'String')) returns contents of g8 as a double


% --- Executes during object creation, after setting all properties.
function g8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g9_Callback(hObject, eventdata, handles)
% hObject    handle to g9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g9 as text
%        str2double(get(hObject,'String')) returns contents of g9 as a double


% --- Executes during object creation, after setting all properties.
function g9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g3_Callback(hObject, eventdata, handles)
% hObject    handle to g3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g3 as text
%        str2double(get(hObject,'String')) returns contents of g3 as a double


% --- Executes during object creation, after setting all properties.
function g3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sambleRateField_Callback(hObject, eventdata, handles)
% hObject    handle to sampleRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampleRate as text
%        str2double(get(hObject,'String')) returns contents of sampleRate as a double


% --- Executes during object creation, after setting all properties.
function sampleRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampleRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in halfBtn.
function halfBtn_Callback(hObject, eventdata, handles)
% hObject    handle to halfBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rate = str2num(get(handles.sampleRate,'String'));
set(handles.sampleRate,'String',num2str(rate/2));



% --- Executes on button press in doubleBtn.
function doubleBtn_Callback(hObject, eventdata, handles)
% hObject    handle to doubleBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rate = str2num(get(handles.sampleRate,'String'));
set(handles.sampleRate,'String',num2str(rate*2));


% --- Executes on button press in equalizeBtn.
function equalizeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to equalizeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

KFIR = {'KFIR170(Fs)','KFIR310(Fs)','KFIR600(Fs)','KFIR1000(Fs)','KFIR3K(Fs)','KFIR6K(Fs)','KFIR12K(Fs)','KFIR14K(Fs)','KFIR16K(Fs)'};
KFIR = cell2sym(KFIR);
BIIR = {'BIIR170(Fs)','BIIR310(Fs)','BIIR600(Fs)','BIIR1000(Fs)','BIIR3K(Fs)','BIIR6K(Fs)','BIIR12K(Fs)','BIIR14K(Fs)','BIIR16K(Fs)'};
BIIR = cell2sym(BIIR);
EIIR = {'EIIR170(Fs)','EIIR310(Fs)','EIIR600(Fs)','EIIR1000(Fs)','EIIR3K(Fs)','EIIR6K(Fs)','EIIR12K(Fs)','EIIR14K(Fs)','EIIR16K(Fs)'};
EIIR = cell2sym(EIIR);

% upper edge frequency for each band
maxF = [ 170, 310, 600, 1000, 3000, 6000, 12000, 14000, 16000 ];
 
Fs = handles.inputFs;

gains = [];

gains = [gains,str2num(get(handles.g1,'String'))];
gains = [gains,str2num(get(handles.g2,'String'))];
gains = [gains,str2num(get(handles.g3,'String'))];
gains = [gains,str2num(get(handles.g4,'String'))];
gains = [gains,str2num(get(handles.g5,'String'))];
gains = [gains,str2num(get(handles.g6,'String'))];
gains = [gains,str2num(get(handles.g7,'String'))];
gains = [gains,str2num(get(handles.g8,'String'))];
gains = [gains,str2num(get(handles.g9,'String'))];

gains = 10 .^ (gains / 20);

sampleRate = str2num(get(handles.sampleRate,'String'));
handles.outputFs = sampleRate;

handles.vol = get(handles.volume,'value') + 1;

filterSelected = get(get(handles.filterType,'SelectedObject'),'String');

%temp = 0 * (1:length(handles.inputData))';

temp = zeros(size(handles.inputData));

% here we need to update handles.outputData with filtered data
if (strcmp(filterSelected, 'Kaiser-Windowed'))
    for i = 1 : 9
        if (maxF(i) > handles.inputFs / 2)
            break;
        end
        f = eval(KFIR(i));
        if (gains(i) > 0)
            temp = temp + gains(i)* filter(f,handles.inputData);
        end
    end
    
end 

if (strcmp(filterSelected, 'Butterworth'))
    for i = 1 : 9
        if (maxF(i) > handles.inputFs / 2)
            break;
        end
        f = eval(BIIR(i));
        if (gains(i) > 0)
            temp = temp + gains(i)* filter(f,handles.inputData);
        end
    end
    
end

if (strcmp(filterSelected, 'Elliptic'))
    for i = 1 : 9
        if (maxF(i) > handles.inputFs / 2)
            break;
        end
        f = eval(EIIR(i));
        
        if (gains(i) > 0)
            temp = temp + (gains(i) * filter(f,handles.inputData));
        end    
    end
    
end

% resample output to desired sample rate
newFs = str2num(get(handles.sampleRate,'String')) ; % whatever
[P, Q] = rat (newFs / Fs);
temp = resample (temp, P, Q);

handles.outputData = temp;
handles.playableData = temp;
handles.playableFs = newFs;
equalizerPlayer(hObject,handles);


plot_data(handles.inputData,handles.inputFs,handles.outputData,handles.outputFs);

handles.playableData = temp;
handles.playableFs = handles.inputFs;
equalizerPlayer(hObject,handles);

'Equalizing done'

guidata(hObject,handles);  


% --- Executes on button press in firRadioBtn.
function firRadioBtn_Callback(hObject, eventdata, handles)
% hObject    handle to firRadioBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of firRadioBtn


% --- Executes on button press in kaiserbtn.
function IirBtn_Callback(hObject, eventdata, handles)
% hObject    handle to kaiserbtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of kaiserbtn


% --- Executes on button press in halfBtn.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to halfBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in doubleBtn.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to doubleBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when uipanel6 is resized.
function uipanel6_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in bandsMenu.
function bandsMenu_Callback(hObject, eventdata, handles)
% hObject    handle to bandsMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns bandsMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from bandsMenu


% --- Executes during object creation, after setting all properties.
function bandsMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bandsMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in applyBtn.
function applyBtn_Callback(hObject, eventdata, handles)
% hObject    handle to applyBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

KFIR = {'KFIR170(Fs)','KFIR310(Fs)','KFIR600(Fs)','KFIR1000(Fs)','KFIR3K(Fs)','KFIR6K(Fs)','KFIR12K(Fs)','KFIR14K(Fs)','KFIR16K(Fs)'};
KFIR = cell2sym(KFIR);
BIIR = {'BIIR170(Fs)','BIIR310(Fs)','BIIR600(Fs)','BIIR1000(Fs)','BIIR3K(Fs)','BIIR6K(Fs)','BIIR12K(Fs)','BIIR14K(Fs)','BIIR16K(Fs)'};
BIIR = cell2sym(BIIR);
EIIR = {'EIIR170(Fs)','EIIR310(Fs)','EIIR600(Fs)','EIIR1000(Fs)','EIIR3K(Fs)','EIIR6K(Fs)','EIIR12K(Fs)','EIIR14K(Fs)','EIIR16K(Fs)'};
EIIR = cell2sym(EIIR);

Fs = handles.inputFs;

filterSelected = get(get(handles.filterType,'SelectedObject'),'String');
bandSelected = get(handles.bandsMenu,'Value');

data =  zeros(size(handles.inputData));

if (strcmp(filterSelected, 'Kaiser-Windowed'))
    data = filter(eval(KFIR(bandSelected)), handles.inputData); 
end 

if (strcmp(filterSelected, 'Butterworth'))
    data = filter(eval(BIIR(bandSelected)),handles.inputData);
end

if (strcmp(filterSelected, 'Elliptic'))
    data = filter(eval(EIIR(bandSelected)),handles.inputData);
end

plot_data(handles.inputData,handles.inputFs,data,handles.outputFs);

'filter applied sucessfully'

handles.playableData = data;
handles.playableFs = handles.inputFs;
equalizerPlayer(hObject,handles);


% --- Executes during object deletion, before destroying properties.
function bandsMenu_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to bandsMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function ipTimeDomain_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to ipTimeDomain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in playBtn.
function playBtn_Callback(hObject, eventdata, handles)
% hObject    handle to playBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global  player;
handles.vol = get(handles.volume,'Value') + 1;
equalizerPlayer(hObject,handles);
play(player);
guidata(hObject,handles)

% --- Executes on button press in stopBtn.
function stopBtn_Callback(hObject, eventdata, handles)
% hObject    handle to stopBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
handles.vol = get(handles.volume,'Value') + 1;
equalizerPlayer(hObject,handles)
stop(player);
guidata(hObject,handles);


% --- Executes on slider movement.
function volume_Callback(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function volume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function sampleRate_Callback(hObject, eventdata, handles)
% hObject    handle to sampleRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampleRate as text
%        str2double(get(hObject,'String')) returns contents of sampleRate as a double


% --- Executes on button press in analyzeBtn.
function analyzeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to analyzeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

KFIR = {'KFIR170(Fs)','KFIR310(Fs)','KFIR600(Fs)','KFIR1000(Fs)','KFIR3K(Fs)','KFIR6K(Fs)','KFIR12K(Fs)','KFIR14K(Fs)','KFIR16K(Fs)'};
KFIR = cell2sym(KFIR);
BIIR = {'BIIR170(Fs)','BIIR310(Fs)','BIIR600(Fs)','BIIR1000(Fs)','BIIR3K(Fs)','BIIR6K(Fs)','BIIR12K(Fs)','BIIR14K(Fs)','BIIR16K(Fs)'};
BIIR = cell2sym(BIIR);
EIIR = {'EIIR170(Fs)','EIIR310(Fs)','EIIR600(Fs)','EIIR1000(Fs)','EIIR3K(Fs)','EIIR6K(Fs)','EIIR12K(Fs)','EIIR14K(Fs)','EIIR16K(Fs)'};
EIIR = cell2sym(EIIR);

Fs = handles.inputFs;

filterSelected = get(get(handles.filterType,'SelectedObject'),'String');
bandSelected = get(handles.bandsMenu,'Value');

if (strcmp(filterSelected, 'Kaiser-Windowed'))
    filter = KFIR(bandSelected); 
end 

if (strcmp(filterSelected, 'Butterworth'))
    filter = BIIR(bandSelected);
end

if (strcmp(filterSelected, 'Elliptic'))
    filter = EIIR(bandSelected);
end


analyze_filter(eval(filter));




% --- Executes on button press in resumeBtn.
function resumeBtn_Callback(hObject, eventdata, handles)
% hObject    handle to resumeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
handles.vol = get(handles.volume,'Value') + 1;
equalizerPlayer(hObject,handles);
resume(player);
guidata(hObject,handles);

% --- Executes on button press in pauseBtn.
function pauseBtn_Callback(hObject, eventdata, handles)
% hObject    handle to resumeBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global player;
handles.vol = get(handles.volume,'Value') + 1;
equalizerPlayer(hObject,handles);
pause(player);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pauseBtn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pauseBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --------------------------------------------------------------------
function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipanel2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipanel8_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipanel15_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uipanel8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uipanel15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function uipanel1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function uipanel8_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uipanel8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function uipanel15_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uipanel15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function loadBtn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to loadBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function saveBtn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to saveBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path as text
%        str2double(get(hObject,'String')) returns contents of path as a double


% --- Executes during object deletion, before destroying properties.
function path_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function loadBtn_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to loadBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function saveBtn_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to saveBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ButterworthBtn.
function ButterworthBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ButterworthBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ButterworthBtn


% --- Executes on button press in kaiserBtn.
function kaiserBtn_Callback(hObject, eventdata, handles)
% hObject    handle to kaiserBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of kaiserBtn


% --- Executes on button press in ellipticBtn.
function ellipticBtn_Callback(hObject, eventdata, handles)
% hObject    handle to ellipticBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ellipticBtn


% --- Executes during object creation, after setting all properties.
function axes11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes11


% --- Executes during object creation, after setting all properties.
function axes12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes12


% --- Executes on mouse press over axes background.
function ipFreqDomain_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to ipFreqDomain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

dest = uigetdir;
if (dest == 0)
    return;
end

resultfig = plot_data(handles.inputData,handles.inputFs,handles.outputData,handles.outputFs);
saveas(resultfig, strcat(dest, '\result.fig'));
saveas(resultfig, strcat(dest, '\result.png'));
set(resultfig, 'Visible', 'off');

KFIR = {'KFIR170(Fs)','KFIR310(Fs)','KFIR600(Fs)','KFIR1000(Fs)','KFIR3K(Fs)','KFIR6K(Fs)','KFIR12K(Fs)','KFIR14K(Fs)','KFIR16K(Fs)'};
BIIR = {'BIIR170(Fs)','BIIR310(Fs)','BIIR600(Fs)','BIIR1000(Fs)','BIIR3K(Fs)','BIIR6K(Fs)','BIIR12K(Fs)','BIIR14K(Fs)','BIIR16K(Fs)'};
EIIR = {'EIIR170(Fs)','EIIR310(Fs)','EIIR600(Fs)','EIIR1000(Fs)','EIIR3K(Fs)','EIIR6K(Fs)','EIIR12K(Fs)','EIIR14K(Fs)','EIIR16K(Fs)'};

filterSelected = get(get(handles.filterType,'SelectedObject'),'String');
if (strcmp(filterSelected, 'Kaiser-Windowed'))
    filters = KFIR;
elseif (strcmp(filterSelected, 'Butterworth'))
    filters = BIIR;
elseif (strcmp(filterSelected, 'Elliptic'))
    filters = EIIR;
end

Fs = handles.inputFs;

for filter = filters
    filtersym = cell2sym(filter);
    filterfig = analyze_filter(eval(filtersym));

    filter = filter{1};
    saveas(filterfig, strcat(dest, '\', filter(1:length(filter)-4), '.fig'));
    saveas(filterfig, strcat(dest, '\', filter(1:length(filter)-4), '.png'));
    set(filterfig, 'Visible', 'off');

end
disp('Done exporting');
