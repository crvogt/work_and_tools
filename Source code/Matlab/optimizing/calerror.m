close all;
clear all;
clc;
% load('stuvvalue.mat')
load('stuvvalue2.mat')
% errors=abs(Q(:,1)-pixelval2.s);
% errort=abs(Q(:,2)-pixelval2.t);
% erroru=abs(Q(:,3)-pixelval2.u);
% errorv=abs(Q(:,4)-pixelval2.v);
% error=sqrt( (errors).^2 +(errort).^2 +(erroru) .^2 + (errorv) .^2);
% errorN=error./(max(error));

%error between matlab and c++
fileID = fopen('example.txt','r');
formatSpec = '%f';
A = fscanf(fileID,formatSpec);
s=1;
t=2;
u=3;
v=4;
errorcs=[];
errorct=[];
errorcu=[];
errorcv=[];
for i=1:size(pixelval2.s)
    temp=abs(pixelval2.s(i)-A(s));
    errorcs=[errorcs;temp];
    temp2=abs(pixelval2.t(i)-A(t));
    errorct=[errorct;temp];
    temp3=abs(pixelval2.u(i)-A(u));
    errorcu=[errorcu;temp];
    temp4=abs(pixelval2.v(i)-A(v));
    errorcv=[errorcv;temp];
    s=s+4;
    t=t+4;
    u=u+4;
    v=v+4;
end
error=sqrt( (errorcs).^2 +(errorct).^2 +(errorcu) .^2 + (errorcv) .^2);
errorN=error./(max(error));

figure;
plot(1:size(errorN), error(1:size(errorN)), 'b.');
axis([0  65536  0 max(errorN)]);

xlabel('number of pixels', 'FontSize', 12);
ylabel('Error', 'FontSize', 12);
%title('Error between Ground Truth and Detections', 'FontSize', 12);
legend(['Error Mean: ' num2str(mean(error(1:end)))], 'Location', 'northeast');




% end