function [rawD,repeat]=readUdpPackets(rawUsbBuffer)

%Init Vars
repeat=0;
numChannels=32;
numDataStreams=double(rawUsbBuffer(1,1));
rawD=[];

if numDataStreams==2
    bytesPerPac=178;
elseif numDataStreams<=0
    errstr=sprintf('Invalid numDataStreams or no data received!: %d',numDataStreams);
    repeat=myError(errstr);
    return;
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
        
        %numWords=size(mBytes,1);
        numBytes=size(mBytes,2);
        %result=nan(256,1);
        
        if numBytes==2
            byteSizeStr='uint16';
        elseif numBytes==4
            byteSizeStr='uint32';
        else
            error('There is an error in convert word');
        end
        
%         for iter=1:numWords
%             result(iter)=typecast(mBytes(iter,:),byteSizeStr);
%         end
        result=typecastx(mBytes',byteSizeStr);
        
    end

end