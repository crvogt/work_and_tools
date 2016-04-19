%given d,wr,hr,w,h,p1,p2,np(camera and plane parameters)
%input=i,j index of a pixel
%the function gives output q1 and q2 which are the intersection of ray coming from pixel(i,j)
%to uv,st planes
function [q1,q2,ci,ss1,ss2,p]=intersection(px,py,gtemp,up,d,wr,hr,h,w,c,p1,p2,np)
%%Assuming d-the distance from center of the image plane to postion of the
%%camera
%(wr,hr) number of pixels in x and y direction and w and h are the
%phisical measurements
%P1 and p2 are two points in the st and uv planes respecively
%np direction vector in st and uv planes perpendicular to qp vector
%Assuming the gaze(g) and up(u) vectors are given
%v is given by the cross product of g and u
ci=c + d*(gtemp/(norm(gtemp)));%center of the sensor
v=cross(gtemp,up);
temp =((px-wr/2)/wr) * (w)*(v/norm(v))+ ((py-hr/2)/hr) * (h)*(up/norm(up));
p=ci + temp;%this is specific pixel coordinate
cp=(p-c)/(norm(p-c));%I am supposing the direction of the unit vector is uniformly in the direction of pq

l=((p1(1)-c(1))*np(1)+ (p1(2)-c(2))*np(2)+ (p1(3)-c(3))*np(3))/(cp(1)*np(1)+cp(2)*np(2) + cp(3)*np(3));


l2=((p2(1)-c(1))*np(1)+ (p2(2)-c(2))*np(2)+ (p2(3)-c(3))*np(3))/(cp(1)*np(1)+cp(2)*np(2) + cp(3)*np(3));

q1=c + l*cp;
q2=c + l2*cp;
%%%%%%%%%%%%%%%%%%%%%%%%%%%
dx=gtemp(1)-ci(1);
dy=gtemp(2)-ci(2);
dz=gtemp(3)-ci(3);
m=[dx,dy,dz]';
ss=cross(ci,m);
% s=[-dy,dx,dz]';
% s=[dy ,-dx,dz]'
ss1=ci-(w/2)*(ss/norm(ss));
ss2=ci+(w/2)*(ss/norm(ss));
%%%%%%%%%%%%%%%%
% figure(1),
% % line([c(1) gtemp(1)],[c(2) gtemp(2)],[c(3) gtemp(3)],'color','r')
% % line([c(1) u(1)],[c(2) u(2)],[c(3) u(3)],'color','g')
% ends = gtemp;
% quiver3(c(1), c(2),c(3), ends(1), ends(2),ends(3),'color','r');hold on;
% ends = u;
% quiver3(c(1), c(2),c(3), ends(1), ends(2),ends(3),'color','g');hold on;
% % line([c(1) v(1)],[c(2) v(2)],[c(3) v(3)],'color','b')
% line([c(1) q1(1)],[c(2) q1(2)],[c(3) q1(3)],'color','y');
% line([s1(1) s2(1)],[s1(2) s2(2)],[s1(3) s2(3)],'color','m');%sensor drawing
% line([p1(1) q1(1)],[p1(2) q1(2)],[p1(3) q1(3)],'color','c')
% line([q2(1) q1(1)],[q2(2) q1(2)],[q2(3) q1(3)],'color','k')
% line([q2(1) p2(1)],[q2(2) p2(2)],[q2(3) p2(3)],'color','b')
% hold on;
%
% text(p(1),p(2),p(3), 'P','FontSize', 9);
% text(q1(1),q1(2),q1(3), 'Q1','FontSize', 9);
% text(c(1),c(2), c(3),'C','FontSize', 9);
% text(p1(1),p1(2),p1(3), 'p1','FontSize', 9);
% text(q2(1),q2(2),q2(3), 'Q2','FontSize', 9);
% text(p2(1),p2(2),p2(3), 'P2','FontSize', 9);
% % text(gtemp(1),gtemp(2),gtemp(3), 'g','FontSize', 9);
% % text(u(1),u(2),u(3), 'u','FontSize', 9);
% % text(v(1),v(2),v(3), 'v','FontSize', 12);
% plot3(ci(1),ci(2),ci(3),'rx','color','r');hold on;
% xlabel('xaxis')
% ylabel('yaxis')
% zlabel('zaxis')

% title('line drawing');
end
