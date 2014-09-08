udpServer3('Open');

pause(0.5);

buf=udpServer3('Read');

udpServer3('Close');

%%
D=[];
[rawD,~]=readUdpPackets(buf);


tmp=rawD.amplifierData(1,1,:);
recordData=tmp(:);
L=length(recordData);

for i=1:L-1
    D(i)=recordData(i+1)-recordData(i);
end

figure
subplot(2,1,1), plot(recordData)
subplot(2,1,2), plot(D)
