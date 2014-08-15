load('recordData.mat')

L=length(recordData);

for i=1:L-1
   D(i)=recordData(i+1)-recordData(i); 
end


%%
c=1e3;

x=ceil(rand()*L)-1e3-1
plot(D(x:x+c))

