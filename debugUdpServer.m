udpServer2('Open')
choice='Yes';
numbufs=2;
delay=0;

for i=1:numbufs
    
    %buf=udpServer3('Read');
    tic
    buf(i,:)=udpServer2('Receive');
    pause(delay);
    toc
    %choice=questdlg('Read UDP Buffer','Yes','No');
    
end

udpServer2('Close')

%%
recordData=[];
D=[];

for i=1:numbufs
    rawD(i)=readUdpPackets(buf(i,:))
    tmp=rawD(i).timeStamp;
    recordData=[recordData ; tmp];
end


L=length(recordData);

for i=1:L-1
    D(i)=recordData(i+1)-recordData(i);
end

figure
subplot(2,1,1), plot(recordData)
subplot(2,1,2), plot(D)

%%





