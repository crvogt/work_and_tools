close all;
clear all;
clc;
tic;
%==========================parameter declaration=============
np=[1 0 0]';
d=0.2;%camera parameter (distance between postion of the camera and sensor)
%d3=1;%distance between the two planes
wr=256;%Total pixels
hr=256;
h=0.4;%dimension of the image plane
w=0.4;
o=[0,0,0]';
%  c=rand(3,1);%position of the camera
 c=[.5,.8,.2]';
p1=[3 -2 1]';%arbitrary point in St
% temp=p1(1)+d3*np(1)/(norm(np));
p2=[4 -2 1]';%uv planes

p3=[3 4 0]';% other point in St
%temp1=p1(1)+d3*np(1)/(norm(np));
p4=[4 4 0]';%other point in uv planes

 gtemp=[1,2,3]';
% up=[-1/sqrt(3),1/sqrt(3),0]';
% gtemp=[1 0 0]';
% up=[0 1 0]';

 oc=c/(norm(c));
% gtemp=rand(3,1);
 gtemp=gtemp/(norm(gtemp))
up=cross(oc,gtemp);
up=up./(norm(up));

o1=[3,1,0]';
p1p2=p1-p2;
d3=norm((dot(p1p2,np)/(norm(np)^2))*np);%distance between two planes
o2=o1+d3*(np/(norm(np)));
mat=[];


 
%===========================for normalization===============
% for k=1:m
%     for l=1:n
%         [q1,q2,ci,ss1,ss2,p]=intersection(k,l,gtemp,up,d,wr,hr,h,w,c,p1,p2,np);
%         [a1,a2,a3,a4,s,t,u,v,s1,t1,u1,v1]=ij2stuv(q1,q2,np,p3,p4,o1,o2);
%         mat=[mat;[s1,t1,u1,v1]];
%     end
% end
% maxs=max(mat(:,1))
% maxt=max(mat(:,2));
% maxu=max(mat(:,3));
% maxv=max(mat(:,4));
%========================================================
%  pixelval=cell(wr,hr);
% %  Q=[];
%  for px=1:wr
%      for py=1:hr
%         [q1,q2,ci,ss1,ss2,p]=intersection(px,py,gtemp,up,d,wr,hr,h,w,c,p1,p2,np);
%         
%         [a1,a2,a3,a4,s,t,u,v,s1,t1,u1,v1]=ij2stuv(q1,q2,np,p3,p4,o1,o2);        
% %          Q=[Q;[s1,t1,u1,v1]];
%           pixelval{px,py}=struct('s',s1,'t',t1,'u',u1,'v',v1);
%      end
%  end
% %  inter=Q;
% stuvalue = struct('val', pixelval);
% save('stuvvalue.mat','stuvalue');
% %  save('qvalue.mat','inter');
[theta1,phi1,theta2,phi2]=intersectsphere(1,4,gtemp,up,d,wr,hr,h,w,c);
timeelapsed=toc

%======================Figures
% px=250;%specific pixel index
% py=250;
% [q1,q2,ci,ss1,ss2,p]=intersection(px,py,gtemp,up,d,wr,hr,h,w,c,p1,p2,np);
% [a1,a2,a3,a4,s,t,u,v]=ij2stuv(q1,q2,np,p3,p4,o1,o2);
%
%
% figure(1),
%
% ends = gtemp;
% quiver3(c(1), c(2),c(3), ends(1), ends(2),ends(3),'color','r');hold on;
% ends = up;
% quiver3(c(1), c(2),c(3), ends(1), ends(2),ends(3),'color','g');hold on;
% % line([c(1) v(1)],[c(2) v(2)],[c(3) v(3)],'color','b')
% line([c(1) q1(1)],[c(2) q1(2)],[c(3) q1(3)],'color','y');
% line([ss1(1) ss2(1)],[ss1(2) ss2(2)],[ss1(3) ss2(3)],'color','m');%sensor drawing
% line([p1(1) q1(1)],[p1(2) q1(2)],[p1(3) q1(3)],'color','c');
% line([q2(1) q1(1)],[q2(2) q1(2)],[q2(3) q1(3)],'color','k');
% line([q2(1) p2(1)],[q2(2) p2(2)],[q2(3) p2(3)],'color','b');
% hold on;
%
% % xlabel('xaxis')
% % ylabel('yaxis')
% % zlabel('zaxis')
%
% % figure(2),
% ends = a1;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3),'color','r');hold on;
%
% axis equal
%
% ends = a2;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3),'color','g');hold on;
%
% ends=s;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3),'color','b');hold on;
% ends=t;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3),'color','m');hold on;
%
% % xlabel('xaxis')
% % ylabel('yaxis')
% % zlabel('zaxis')
%
%
% % figure(3),
% ends = a3;
% quiver3(o2(1), o2(2),o2(3), ends(1), ends(2),ends(3),'color','r');hold on;
%
% axis equal
%
% ends = a4;
% quiver3(o2(1), o2(2),o2(3), ends(1), ends(2),ends(3),'color','g');hold on;
%
% ends=u;
% quiver3(o2(1), o2(2),o2(3), ends(1), ends(2),ends(3),'color','b');hold on;
% ends=v;
% quiver3(o2(1), o2(2),o2(3), ends(1), ends(2),ends(3),'color','m');hold on;
%
% text(p1(1),p1(2),p1(3), 'p1','FontSize', 10);hold on;
% text(o1(1),o1(2),o1(3), 'O1','FontSize', 10);hold on;
% text(p2(1),p2(2),p2(3), 'p2','FontSize', 10);hold on;
% text(o2(1),o2(2),o2(3), 'O2','FontSize', 10);hold on;
% text(p(1),p(2),p(3), 'P','FontSize', 9);
% text(q1(1),q1(2),q1(3), 'Q1','FontSize', 9);
% text(c(1),c(2), c(3),'C','FontSize', 9);
% text(p1(1),p1(2),p1(3), 'p1','FontSize', 9);
% text(q2(1),q2(2),q2(3), 'Q2','FontSize', 9);
% text(p2(1),p2(2),p2(3), 'P2','FontSize', 9);
%
% plot3(ci(1),ci(2),ci(3),'rx','color','r');hold on;
% xlabel('xaxis')
% ylabel('yaxis')
% zlabel('zaxis')
%






