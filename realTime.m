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
guidata(hObject, handles);



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
guidata(hObject, handles);

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
guidata(hObject, handles);


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
guidata(hObject, handles);

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
guidata(hObject, handles);

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
guidata(hObject, handles);

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
guidata(hObject, handles);

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

function rawUsbBuffer=simulateData()

numBuffs=4;

rawUsbBuffer=uint8(ceil(256*rand(179000,numBuffs)));
rawUsbBuffer(1,:)=2;
rawUsbBuffer(2,:)=16;


function sChan=convertChanCtn(flatChan)

flatChan=flatChan(:); %make a column vector
numChannels=32;
sChan=zeros(length(flatChan),2);

sChan(:,1)=ceil(flatChan./numChannels);
sChan(:,2)=rem(flatChan,numChannels);


function D=convertUnits(rawD)
%Converts rawD units (eg ADC value) to physical unit (eg microVolts)
%Copied from signalprocessor.cpp, line 575

% Load and scale RHD2000 amplifier waveforms
%(sampled at amplifier sampling rate)
D.amplifierPreFilter= 0.195 .* (rawD.amplifierData - 32768); %microVolts

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


% --- Executes on button press in plotButton.
function plotButton_Callback(hObject, eventdata, handles)
% hObject    handle to plotButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Init Vars
set(hObject,'UserData',1);
simData=1;
TW=1;
SPTparams.tapers=[TW TW*2-1];
PSDparams.tapers=[3 5];


if ~simData
    udpServer3('Open');
    pause(1);
end

while get(hObject,'UserData');
    
    %Get Raw Data
    if simData
        rawUsbBuffer=simulateData();
        [rawD,~]=readUdpPackets(rawUsbBuffer);
    else
        repeat=1;
        timeOut=1;
        while repeat || timeOut > 1000
            rawUsbBuffer=udpServer3('Read');
            [rawD,repeat]=readUdpPackets(rawUsbBuffer);
            timeOut=timeOut+1;
            pause(0.2)
            
        end
    end    
    
    %Perform Conversion
    D=convertUnits(rawD);    
    
    %Parse Channels
    tmp=get(handles.channelsp1,'String');
    tmp=strsplit(tmp,',');
    flatChan=cellfun(@str2num,tmp);
    sChanp1=convertChanCtn(flatChan);
    numP1Plots=size(sChanp1,1);
    
    tmp=get(handles.channelsp2,'String');
    tmp=strsplit(tmp,',');
    flatChan=cellfun(@str2num,tmp);
    sChanp2=convertChanCtn(flatChan); 
    numP2Plots=size(sChanp2,1);
    
    %Parse Plot Type
    contents = cellstr(get(handles.plotTypep1,'String'));
    plotTypep1Str = contents{get(handles.plotTypep1,'Value')};
    
    contents = cellstr(get(handles.plotTypep2,'String'));
    plotTypep2Str = contents{get(handles.plotTypep2,'Value')};
    
    %Parse Filter Input
    tmp=get(handles.lowp1,'String');
    bfp1(1)=str2double(tmp); %low freq cutoff
    tmp=get(handles.highp1,'String');
    bfp1(2)=str2double(tmp); %high freq cuttoff
    
    tmp=get(handles.lowp2,'String');
    bfp2(1)=str2double(tmp); %low freq cutoff
    tmp=get(handles.highp2,'String');
    bfp2(2)=str2double(tmp); %high freq cuttoff    
    
    %Get Signal of Interest
    t=D.timeStamp;
    
    if simData
        t=0:1/rawD.sampleRate:(length(D.timeStamp)-1)*1/rawD.sampleRate;
    end
    
    SOIp1=zeros(length(t),numP1Plots);
    SOIp2=zeros(length(t),numP2Plots);
    
    for i=1:numP1Plots
        SOIp1(:,i)=squeeze(D.amplifierPreFilter(sChanp1(i,1),sChanp1(i,2),:));
    end
    
    for i=1:numP2Plots
        SOIp2(:,i)=squeeze(D.amplifierPreFilter(sChanp2(i,1),sChanp2(i,2),:));
    end
        
    %Process and Plot Signals
    %Portrait 1
    
    if strcmp(plotTypep1Str,'Raw Data')
        
        for i=1:numP1Plots
            plotCmd=sprintf('plot(handles.p1%d,t,SOIp1(:,%d));',i,i);
            eval(plotCmd);
        end
        
    elseif strcmp(plotTypep1Str,'Spectrogram')
        
        SPTparams.Fs=rawD.sampleRate;
        W=30/SPTparams.Fs;
        movingwin=[W W/10];        
        
        %Filter
        fltFlag=~((bfp1(1)<0.1)&& (bfp1(2)==Inf));
        
        if fltFlag            
            SPTparams.fpass=[bfp1(1),bfp1(2)];           
        end
        
        [S,tx,f]=mtspecgramc(SOIp1,movingwin,SPTparams);
       
        %Plot        
        for i=1:numP1Plots
            plotCmd1=sprintf('surf(handles.p1%d,f,tx,10*log10(abs(S(:,:,%d))),''EdgeColor'',''none'');',i,i);
            plotCmd2=sprintf('axis(handles.p1%d,''tight'');',i);
            plotCmd3=sprintf('view(handles.p1%d,2)',i);
            eval(plotCmd1), eval(plotCmd2), eval(plotCmd3);
        end       
        
    elseif strcmp(plotTypep1Str,'Power Spectrum Density')
        
        PSDparams.Fs=rawD.sampleRate;
        
        %Filter
        fltFlag=~((bfp1(1)<0.1)&& (bfp1(2)==Inf));
        
        if fltFlag
            PSDparams.fpass=[bfp1(1),bfp1(2)];
        end
              
        [S,f]=mtspectrumc(SOIp1,PSDparams);
        
        %Plot
        for i=1:numP1Plots
            plotCmd=sprintf('semilogy(handles.p1%d,f,S(:,%d));',i,i);
            eval(plotCmd);
        end     
        
    else
        error('Error when picking plot type');
    end
    
    %Portrait 2
    if strcmp(plotTypep2Str,'Raw Data')
        
        for i=1:numP2Plots
            plotCmd=sprintf('plot(handles.p2%d,t,SOIp2(:,%d));',i,i);
            eval(plotCmd);
        end
        
    elseif strcmp(plotTypep2Str,'Spectrogram')
        
        SPTparams.Fs=rawD.sampleRate;
        W=30/SPTparams.Fs;
        movingwin=[W W/10];        
        
        %Filter
        fltFlag=~((bfp2(1)<0.1)&& (bfp2(2)==Inf));
        
        if fltFlag            
            SPTparams.fpass=[bfp2(1),bfp2(2)];           
        end
        
        [S,tx,f]=mtspecgramc(SOIp2,movingwin,SPTparams);
        
        %Plot
        for i=1:numP2Plots
            plotCmd1=sprintf('surf(handles.p2%d,f,tx,10*log10(abs(S(:,:,%d))),''EdgeColor'',''none'');',i,i);
            plotCmd2=sprintf('axis(handles.p2%d,''tight'');',i);
            plotCmd3=sprintf('view(handles.p2%d,2)',i);
            eval(plotCmd1), eval(plotCmd2), eval(plotCmd3);
        end
        
        
    elseif strcmp(plotTypep2Str,'Power Spectrum Density')
        
        PSDparams.Fs=rawD.sampleRate;
        
        %Filter
        fltFlag=~((bfp2(1)<0.1)&& (bfp2(2)==Inf));
        
        if fltFlag
            PSDparams.fpass=[bfp2(1),bfp2(2)];
        end
        
        [S,f]=mtspectrumc(SOIp2,PSDparams);
        
        %Plot
        for i=1:numP2Plots
            plotCmd=sprintf('semilogy(handles.p2%d,f,S(:,%d));',i,i);
            eval(plotCmd);
        end
        
    else
        error('Error when picking plot type');
    end
    
    drawnow
    
end

if ~simData
    udpServer3('Close');
    clear mex;
end

