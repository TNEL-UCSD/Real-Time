udpServer3('Open');

pause(5);

buf=udpServer3('Read');

rawD=readUdpPackets(buf);

udpServer3('Close');

%%

recordData=[];
D=[];

i=1;

while buf(1,i)
    rawD(i)=readUdpPackets(buf(:,i))
    tmp=rawD(i).timeStamp;
    recordData=[recordData ; tmp];
    i=i+1;
end


L=length(recordData);

for i=1:L-1
    D(i)=recordData(i+1)-recordData(i);
end

figure
subplot(2,1,1), plot(recordData)
subplot(2,1,2), plot(D)
