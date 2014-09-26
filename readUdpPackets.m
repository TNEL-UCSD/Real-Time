function [rawD,repeat]=readUdpPackets(rawUsbBuffer)

%Init Vars
repeat=0;
numChannels=32;
numDataStreams=double(rawUsbBuffer(1,1));
sampleRate=double(rawUsbBuffer(2,1));
rawD=[];

if numDataStreams==2
    bytesPerPac=179;
elseif numDataStreams<=0
    errstr=sprintf('Invalid numDataStreams or no data received!: %d',numDataStreams);
    repeat=myError(errstr);
    return;
end

rawD.numActiveChannels=numDataStreams*numChannels;

switch sampleRate
    case 0
        rawD.sampleRate=1e3;
    case 1
        rawD.sampleRate=1.25e3;
    case 2
        rawD.sampleRate=1.5e3;
    case 3
        rawD.sampleRate=2e3;
    case 4
        rawD.sampleRate=2.5e3;
    case 5
        rawD.sampleRate=3e3;
    case 6
        rawD.sampleRate=3.33e3;
    case 7
        rawD.sampleRate=4e3;
    case 8
        rawD.sampleRate=5e3;
    case 9
        rawD.sampleRate=6.25e3;
    case 10
        rawD.sampleRate=8e3;
    case 11
        rawD.sampleRate=10e3;
    case 12
        rawD.sampleRate=12.5e3;
    case 13
        rawD.sampleRate=15e3;
    case 14
        rawD.sampleRate=20e3;
    case 15
        rawD.sampleRate=25e3;
    case 16
        rawD.sampleRate=30e3;
    otherwise
        rawD.sampleRate=20e3;
end

[bytesPerBuf,~]=size(rawUsbBuffer);

numBufs=find(rawUsbBuffer(1,:)==0,1)-1;

if isempty(numBufs)
    numBufs=size(rawUsbBuffer,2);
end

numPacsPerBuf=bytesPerBuf/bytesPerPac; %eqv to VLEN
usbBuffer=uint8(zeros(numBufs*numPacsPerBuf,bytesPerPac));

for buf=1:numBufs
    
    tmp=rawUsbBuffer(:,buf);
    tmp=reshape(tmp,bytesPerPac,[]);    
    st=(buf-1)*numPacsPerBuf+1;
    usbBuffer(st:st+numPacsPerBuf-1,:)= tmp';
    
end

index=14;
for channel=1:3
    for stream=1:numDataStreams
        rawD.auxiliaryData(stream,channel,:)=convertWord(usbBuffer(:,index:index+1));
        index=index+2;
    end
end

for channel=1:numChannels
    for stream=1:numDataStreams
        rawD.amplifierData(stream,channel,:)=convertWord(usbBuffer(:,index:index+1));
        index=index+2;
    end
end

index=index+2*numDataStreams;

for i=1:8
    rawD.boardAdcData(i,:)=convertWord(usbBuffer(:,index:index+1));
    index=index+2;
end

rawD.timeStamp=convertWord(usbBuffer(:,11:14));
rawD.ttlIn=convertWord(usbBuffer(:,end-4:end-3));
rawD.ttlOut=convertWord(usbBuffer(:,end-2:end-1));


    function result=convertWord(mBytes)
        %mBytes(i,j): where i indexes words and j bytes in increasing order
        
        numBytes=size(mBytes,2);
        
        if numBytes==2
            byteSizeStr='uint16';
        elseif numBytes==4
            byteSizeStr='uint32';
        else
            error('There is an error in convert word');
        end
        
        result=typecastx(mBytes',byteSizeStr);
        
    end

end