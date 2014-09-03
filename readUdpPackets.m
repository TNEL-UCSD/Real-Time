function rawD=readUdpPackets(rawUsbBuffer)

%Init Vars
numChannels=32;
numDataStreams=double(rawUsbBuffer(1,1));
rawD=[];

if numDataStreams==2
    bytesPerPac=178;
elseif numDataStreams<=0
    disp('Invalid Number of Data Streams!');
    return;
end

[bytesPerBuf,numBufs]=size(rawUsbBuffer);

tmp=find(rawUsbBuffer(1,:)==0);
if ~isempty(tmp)
    numBufs=tmp;
end

numPacsPerBuf=bytesPerBuf/bytesPerPac; %eqv to VLEN
usbBuffer=uint8(zeros(numBufs*numPacsPerBuf,bytesPerPac));

for buf=1:numBufs
    
    tmp=rawUsbBuffer(:,buf);
    tmp=reshape(tmp,[],bytesPerPac);
    st=(buf-1)*numPacsPerBuf+1;
    usbBuffer(st:st+numPacsPerBuf-1,:)= tmp;
    
end

index=13;
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

rawD.timeStamp=convertWord(usbBuffer(:,10:13));
rawD.ttlIn=convertWord(usbBuffer(:,end-4:end-3));
rawD.ttlOout=convertWord(usbBuffer(:,end-2:end-1));


    function result=convertWord(mBytes)
        %mBytes(i,j): where i indexes words and j bytes in increasing order
        
        numWords=size(mBytes,1);
        numBytes=size(mBytes,2);
        result=nan(256,1);
        
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