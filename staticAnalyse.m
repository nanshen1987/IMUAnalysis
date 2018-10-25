% xsensData.t=xsens{:,1};
% xsensData.accX=xsens{:,2};
% xsensData.accY=xsens{:,3};
% xsensData.accZ=xsens{:,4};
close all
clear all
load xsensData.mat
t=xsensData.t;
%%按照5分钟处理
meanAccX=mean(xsensData.accX);
correctAccX=xsensData.accX-meanAccX;
correctAccX=correctAccX*1000;
[numX,~]=size(correctAccX);
preXv=0;
preXa=correctAccX(1);
preXp=0;
figure
subplot(2,3,1);
plot(correctAccX)
title('noise of accX');
XpSerials=zeros(numX,1);
XpSerials(1)=preXp;
for i=2:numX
    curXa=correctAccX(i);
    curXv=preXv+(preXa+curXa)/800.0;
    curXp=preXp+(curXv+preXv)/800.0;
    
    preXa=curXa;
    preXv=curXv;
    preXp=curXp;
    XpSerials(i)=preXp;
end
subplot(2,3,4);
plot(t,XpSerials');
title('displacement of X')

meanAccY=mean(xsensData.accY);
correctAccY=xsensData.accY-meanAccY;
correctAccY=correctAccY*1000;
[numY,~]=size(correctAccY);
preYv=0;
preYa=correctAccY(1);
preYp=0;
subplot(2,3,2);
plot(correctAccY)
title('noise of accY');
YpSerials=zeros(numY,1);
YpSerials(1)=preYp;
for i=2:numY
    curYa=correctAccY(i);
    curYv=preYv+(preYa+curYa)/800.0;
    curYp=preYp+(curYv+preYv)/800.0;
    
    preYa=curYa;
    preYv=curYv;
    preYp=curYp;
    YpSerials(i)=preYp;
end
subplot(2,3,5);
plot(t,YpSerials');
title('displacement of Y')
meanAccZ=mean(xsensData.accZ);
correctAccZ=xsensData.accZ-meanAccZ;
correctAccZ=correctAccZ*1000;
[numZ,~]=size(correctAccZ);
preZv=0;
preZa=correctAccZ(1);
preZp=0;
subplot(2,3,3);
plot(correctAccZ)
title('noise of accZ');
ZpSerials=zeros(numZ,1);
ZpSerials(1)=preZp;
for i=2:numZ
    curZa=correctAccZ(i);
    curZv=preZv+(preZa+curZa)/800.0;
    curZp=preZp+(curZv+preZv)/800.0;
    
    preZa=curZa;
    preZv=curZv;
    preZp=curZp;
    ZpSerials(i)=preZp;
end
subplot(2,3,6);
plot(t,ZpSerials');
title('displacement of Z')

%%设定重置间隔
intervalReset=400*2;
preXv=0;
preXa=correctAccX(1);
preXp=0;
XpSerials(1)=preXp;
for i=2:numX
    curXa=correctAccX(i);
    curXv=preXv+(preXa+curXa)/800.0;
    curXp=preXp+(curXv+preXv)/800.0;
    
    preXa=curXa;
    preXv=curXv;
    preXp=curXp;
    XpSerials(i)=preXp;
    if mod(i,intervalReset)==0
          preXv=0;
          preXp=0;
    end
end
figure
subplot(3,1,1)
plot(t,XpSerials');
title(['displacement of X in ',num2str(intervalReset/400.0),' s'])
preYv=0;
preYa=correctAccY(1);
preYp=0;
YpSerials(1)=preYp;
for i=2:numY
    curYa=correctAccY(i);
    curYv=preYv+(preYa+curYa)/800.0;
    curYp=preYp+(curYv+preYv)/800.0;
    
    preYa=curYa;
    preYv=curYv;
    preYp=curYp;
    YpSerials(i)=preYp;
    if mod(i,intervalReset)==0
          preYv=0;
          preYp=0;
    end
end
subplot(3,1,2)
plot(t,YpSerials');
title(['displacement of Y in ',num2str(intervalReset/400.0),' s'])
preZv=0;
preZa=correctAccZ(1);
preZp=0;
ZpSerials(1)=preZp;
for i=2:numZ
    curZa=correctAccZ(i);
    curZv=preZv+(preZa+curZa)/800.0;
    curZp=preZp+(curZv+preZv)/800.0;
    
    preZa=curZa;
    preZv=curZv;
    preZp=curZp;
    ZpSerials(i)=preZp;
    if mod(i,intervalReset)==0
          preZv=0;
          preZp=0;
    end
end
subplot(3,1,3)
plot(t,ZpSerials');
title(['displacement of Z in ',num2str(intervalReset/400.0),' s'])


