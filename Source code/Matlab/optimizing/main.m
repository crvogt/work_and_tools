close all;
clear all;
clc;
tic;
%==========================parameter declaration=============
np=[1 0 0]';
d=.2;%camera parameter (distance between postion of the camera and sensor)
%d3=1;%distance between the two planes
wr=256;%Total pixels
hr=256;
h=0.4;%dimension of the image plane
w=0.4;
o=[0,0,0]';
%c=rand(3,1);%postion of the camera
c=[.5,.8,.2]';
p1=[3 -2 1]';%arbitrary point in St
% temp=p1(1)+d3*np(1)/(norm(np));
p2=[4 -2 1]';%uv planes

p3=[3 4 0]';% other point in St
%temp1=p1(1)+d3*np(1)/(norm(np));
p4=[4 4 0]';%other point in uv planes

% gtemp=[1/sqrt(3),1/sqrt(3),0]';
% up=[-1/sqrt(3),1/sqrt(3),0]';
% gtemp=[1 0 0]';
% up=[0 1 0]';

oc=c/(norm(c));
% gtemp=rand(3,1);
gtemp=[1,1,1]';
gtemp=gtemp/(norm(gtemp))
up=cross(oc,gtemp);
up=up./(norm(up));

o1=[3,1,0]';
p1p2=p1-p2;
d3=norm((dot(p1p2,np)/(norm(np)^2))*np);%distance between two planes
o2=o1+d3*(np/(norm(np)));
mat=[];
% px=250;%specific pixel index
% py=250;
m=wr;
n=hr;
f=1:1:n;
indx=cell(m,1);
subs=[];
a=zeros(m,n);
for i=1:n
    b(1:m)=i;
    indx{i}=sub2ind(size(a),b,f);
end
for i=1:size(indx)
    [indx2 ,indx3]=ind2sub(size(a),indx{i});
    subs=[subs;indx2',indx3'];
end
px=subs(:,1);
py=subs(:,2);
[q1,q2,ci,ss1,ss2,p]=intersection(px,py,gtemp,up,d,wr,hr,h,w,c,p1,p2,np);
[a1,a2,a3,a4,s1,t1,u1,v1]=ij2stuv(q1,q2,np,p3,p4,o1,o2);
pixelval2=struct('s',s1,'t',t1,'u',u1,'v',v1);
save('stuvvalue2','pixelval2')
timeelapsed2=toc









