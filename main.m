% Main Script

clear

hudpr=dsp.UDPReceiver;
hudpr.LocalIPPort=9930;

while (1)
D=readUdpPackets(hudpr);
realTime();
end

release(hudpr);