function D=readUdpPackets(hudpr)

%Init Vars
numChannels=32;
numSamplesKept=50; %samples
timeStamp=nan(numSamplesKept,1);
boardAdcData=nan(8,numSamplesKept);
ttlIn=nan(numSamplesKept);
ttlOut=nan(numSamplesKept);
numDataStreams=-1;
t=1;
D=[];

while numDataStreams==-1
    usbBuffer=step(hudpr);
    if ~isempty(usbBuffer)
        numDataStreams=usbBuffer(1);
    end
end

auxiliaryData=nan(numDataStreams,3,numSamplesKept);
amplifierData=nan(numDataStreams,numChannels,numSamplesKept);


for t=1:numSamplesKept
    pause(0.005);
    usbBuffer=step(hudpr);
    
    if ~isempty(usbBuffer)
        if ~(usbBuffer==numDataStreams)
            error('Number of Data Streams Changed Abortly!');
        end
        index=2;
        
        % Time Stamp
        index=index+8;
        timeStamp(t)=convertUsbTimeStamp(usbBuffer,index);
        index=index+4;
        
        % Read auxiliary results
        for channel=1:3
            for stream=1:numDataStreams
                auxiliaryData(stream,channel,t)=convertUsbWord(usbBuffer,index);
                index=index+2;
            end
        end
        
        % Read amplifier channels
        for channel=1:numChannels
            for stream=1:numDataStreams
                amplifierData(stream,channel,t)=convertUsbWord(usbBuffer,index);
                index=index+2;
            end
        end
        
        % skip 36th filler word in each data stream
        index=index+2*numDataStreams;
        
        % Read from AD5662 ADCS
        for i=1:8
            boardAdcData(i,t)= convertUsbWord(usbBuffer,index);
            index=index+2;
        end
        
        % Read TTL input and output values
        ttlIn(t)=convertUsbWord(usbBuffer,index);
        index=index+2;
        
        ttlOut(t)=convertUsbWord(usbBuffer,index);
        
        % Some error checking
        if ~(index==176)
            error('Error Reading UDP Packet!');
        end
        
        % Send data to GUI
        D.timeStamp=timeStamp;
        D.auxiliaryData=auxiliaryData;
        D.amplifierData=amplifierData;
        D.boardAdcData=boardAdcData;
        D.ttlIn=ttlIn;
        D.ttlOut=ttlOut;
    end
end


    function result=convertUsbTimeStamp(usbBuffer,index)
        x1=usbBuffer(index);
        x2=usbBuffer(index+1);
        x3=usbBuffer(index+2);
        x4=usbBuffer(index+3);
        
        result=bitshift(uint32(x4),24)+bitshift(uint32(x3),16)+ ...
            bitshift(uint32(x2),8)+uint32(x1);
        
    end

    function result=convertUsbWord(usbBuffer,index)
        x1=usbBuffer(index);
        x2=usbBuffer(index+1);
        result=bitshift(uint16(x2),8)+uint16(x1);
    end

end