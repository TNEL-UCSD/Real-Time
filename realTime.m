function varargout = realTime(varargin)
% REALTIME MATLAB code for realTime.fig
%      REALTIME, by itself, creates a new REALTIME or raises the existing
%      singleton*.
%
%      H = REALTIME returns the handle to a new REALTIME or the handle to
%      the existing singleton*.
%
%      REALTIME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REALTIME.M with the given input arguments.
%
%      REALTIME('Property','Value',...) creates a new REALTIME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before realTime_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to realTime_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help realTime

% Last Modified by GUIDE v2.5 08-Aug-2014 10:56:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @realTime_OpeningFcn, ...
                   'gui_OutputFcn',  @realTime_OutputFcn, ...
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


% --- Executes just before realTime is made visible.
function realTime_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to realTime (see VARARGIN)

% Choose default command line output for realTime
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes realTime wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = realTime_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function channelsp1_Callback(hObject, eventdata, handles)
% hObject    handle to channelsp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channelsp1 as text
%        str2double(get(hObject,'String')) returns contents of channelsp1 as a double


% --- Executes during object creation, after setting all properties.
function channelsp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelsp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in plotTypep1.
function plotTypep1_Callback(hObject, eventdata, handles)
% hObject    handle to plotTypep1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns plotTypep1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plotTypep1


% --- Executes during object creation, after setting all properties.
function plotTypep1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotTypep1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function channelsp2_Callback(hObject, eventdata, handles)
% hObject    handle to channelsp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channelsp2 as text
%        str2double(get(hObject,'String')) returns contents of channelsp2 as a double


% --- Executes during object creation, after setting all properties.
function channelsp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelsp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in plotTypep2.
function plotTypep2_Callback(hObject, eventdata, handles)
% hObject    handle to plotTypep2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns plotTypep2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from plotTypep2


% --- Executes during object creation, after setting all properties.
function plotTypep2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to plotTypep2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sampleRateText_Callback(hObject, eventdata, handles)
% hObject    handle to sampleRateText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampleRateText as text
%        str2double(get(hObject,'String')) returns contents of sampleRateText as a double


% --- Executes during object creation, after setting all properties.
function sampleRateText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampleRateText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function channelNumText_Callback(hObject, eventdata, handles)
% hObject    handle to channelNumText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of channelNumText as text
%        str2double(get(hObject,'String')) returns contents of channelNumText as a double


% --- Executes during object creation, after setting all properties.
function channelNumText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelNumText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lowp2_Callback(hObject, eventdata, handles)
% hObject    handle to lowp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowp2 as text
%        str2double(get(hObject,'String')) returns contents of lowp2 as a double


% --- Executes during object creation, after setting all properties.
function lowp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function highp2_Callback(hObject, eventdata, handles)
% hObject    handle to highp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of highp2 as text
%        str2double(get(hObject,'String')) returns contents of highp2 as a double


% --- Executes during object creation, after setting all properties.
function highp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to highp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lowp1_Callback(hObject, eventdata, handles)
% hObject    handle to lowp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lowp1 as text
%        str2double(get(hObject,'String')) returns contents of lowp1 as a double


% --- Executes during object creation, after setting all properties.
function lowp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lowp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function highp1_Callback(hObject, eventdata, handles)
% hObject    handle to highp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of highp1 as text
%        str2double(get(hObject,'String')) returns contents of highp1 as a double


% --- Executes during object creation, after setting all properties.
function highp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to highp1 (see GCBO)
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


% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)
% hObject    handle to stopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.plotButton,'UserData',0); % stop running
guidata(hObject, handles);

function D=convertUnits(rawD)
%Converts rawD units (eg ADC value) to physical unit (eg microVolts)
%Copied from signalprocessor.cpp, line 575

% Load and scale RHD2000 amplifier waveforms
%(sampled at amplifier sampling rate)
D.amplifierPreFilter= 0.195 * (rawD.amplifierData - 32768); %microVolts

%Load and scale RHD2000 auxiliary input waveforms
%(sampled at 1/4 amplifier sampling rate)
t=1; 
i=1;
while t<size(rawD.auxiliaryData,3)-1
    D.auxChannel(:,1,i)= 0.0000374 * rawD.auxiliaryData(:,2,t+1);
    D.auxChannel(:,2,i)= 0.0000374 * rawD.auxiliaryData(:,2,t+2);
    D.auxChannel(:,3,i)= 0.0000374 * rawD.auxiliaryData(:,2,t+3);
    t=t+4;
    i=i+1;
end

%Load and scale RHD2000 supply voltage and temperature sensor waveforms
%(sampled at 1/60 amplifier sampling rate)
%Supply voltage wavefrom units = volts
%Temperature sensor waveform units = degrees C

D.supplyVoltage=rawD.auxiliaryData(:,2,1);
D.tempRaw=rawD.auxiliaryData(:,1,1)- ...
    rawD.auxiliaryData(:,2,1)./98.9 - 273.15;


%Load and scale USB interface board ADC waveforms
%(sampled at amplifier sampling rate)
D.boardAdc=  0.000050354 * rawD.boardAdcData;

D.ttlIn=rawD.ttlIn;
D.ttlOut=rawD.ttlOut;
D.timeStamp=rawD.timeStamp;


function rawD=simulateData()

rawD.auxiliaryData=1;
rawD.amplifierData=1;
rawD.timeStamp=1;
rawD.boardAdcData=1;
rawD.ttlIn=1;
rawD.ttlOut=1;


% --- Executes on button press in plotButton.
function plotButton_Callback(hObject, eventdata, handles)
% hObject    handle to plotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Init Vars
set(hObject,'UserData',1);
% hudpr=dsp.UDPReceiver;
% hudpr.LocalIPPort=9930;
% hudpr.ReceiveBufferSize=8192*2^3;
% hudpr.MaximumMessageLength=2^11-1;
s=udpServer('Open');

simData=0;
initFlag=0;
blocks=10;

dataMax=1e4;
recordData=[];


while get(hObject,'UserData');    
    
    if simData
        rawD=simulateData();
    else
        rawD=readUdpPackets(s,simData);
    end
    
    tic
%     if initFlag==0
%         
%         [numDataStreams,numChannels,numSamplesKept]= ...
%         size(rawD.amplifierData);
%     
%         D.amplifierData=nan(numDataStreams,numChannels, ...
%             numSamplesKept*blocks);
%         D.auxiliaryData=nan(numDataStreams,3,numSamplesKept*blocks);
%         D.boardAdcData=nan(8,numSamplesKept*blocks);
%         D.ttlIn=nan(numSamplesKept*blocks,1);
%         D.ttlOut=nan(numSamplesKept*blocks,1);
%         D.timeStamp=nan(numSamplesKept*blocks,1);
%         
%         for b=1:blocks                        
%             %Concat Blocks            
%             D.amplifierData(:,:,(b-1)*numSamplesKept+1:(b)*numSamplesKept) ...
%                 = rawD.amplifierData;
%             D.auxiliaryData(:,:,(b-1)*numSamplesKept+1:(b)*numSamplesKept) ...
%                 = rawD.auxiliaryData;
%             D.boardAdcData(:,(b-1)*numSamplesKept+1:(b)*numSamplesKept) ...
%                 = rawD.boardAdcData;
%             D.ttlIn((b-1)*numSamplesKept+1:(b)*numSamplesKept) ...
%                 = rawD.ttlIn;
%             D.ttlOut((b-1)*numSamplesKept+1:(b)*numSamplesKept) ...
%                 = rawD.ttlOut;
%             D.timeStamp((b-1)*numSamplesKept+1:(b)*numSamplesKept) ...
%                 = rawD.timeStamp;
%             
%             %Generate One Block
%             if b<blocks
%                 if simData
%                     rawD=simulateData();
%                 else
%                     rawD=readUdpPackets(hudpr,simData);
%                 end
%             end
%             
%         end       
%         
%        toffset=D.timeStamp(1);
%        initFlag=initFlag+1;
%        
%     else
%         
%         %Generate One Block       
%         D.amplifierData(:,:,1:(blocks-1)*numSamplesKept)= ... 
%             D.amplifierData(:,:,numSamplesKept+1:blocks*numSamplesKept);
%         D.amplifierData(:,:,(blocks-1)*numSamplesKept+1:end)= ... 
%             rawD.amplifierData;
%         D.timeStamp(1:(blocks-1)*numSamplesKept)= ... 
%             D.timeStamp(numSamplesKept+1:blocks*numSamplesKept);
%         D.timeStamp((blocks-1)*numSamplesKept+1:end)= ... 
%             rawD.timeStamp;
%         
%     end
    
    %Converts units
    %nD=convertUnits(D); 
    %nD=convertUnits(rawD);
    
    tmp=rawD.amplifierData(1,1,:);%PreFilter(1,1,:);
    x=tmp(:);
    t=rawD.timeStamp;%-toffset;    
    %plot(handles.p11,1:numSamplesKept*blocks,t) 
    plot(handles.p11,1:500,t)
    %plot(handles.p11,t,x);    
    
    %recordData=[recordData ; t((blocks-1)*numSamplesKept+1:end)];
    recordData=[recordData; t];
    disp(length(recordData))
    
    if length(recordData)>dataMax
        save('recordData.mat','recordData');
        udpServer('Close',s);
        error('Ending Execution');
    end
        
    
    drawnow
    toc

end

udpServer('Close',s);

