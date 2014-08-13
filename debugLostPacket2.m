%Read UDP Client

hudpr=dsp.UDPReceiver;
dataMax=1e5;


for i=1:dataMax
   data=step(hudpr); 
end

save('data.mat','data');

release(hudpr)