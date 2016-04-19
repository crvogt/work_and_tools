function [a1,a2,a3,a4,s,t,u,v,s1,t1,u1,v1]=ij2stuv(q1,q2,np,p3,p4,o1,o2)
a1=(p3-o1)/(norm(p3-o1));%a1 and a2 are arbitrary vectors that pass through point o1(on the first plane) where a1 is perpendicular to a2
a2=cross(a1,np);
a3=(p4-o2)/(norm(p4-o2));%a3 and a4 are arbitrary vectors that pass through point o2(on the second plane) where a3 is perpendicular to a4
a4=cross(a3,np);

o1q1=q1-o1;
o2q2=q2-o2;
%=======;

s=abs(dot(o1q1,a1)/(norm(a1)^2)).*a1;%projection of o1q1 to a1 vector
s1=abs(dot(o1q1,a1));

t=abs(dot(o1q1,a2)/(norm(a1)^2)).*a2;
t1=abs(dot(o1q1,a2));

u=abs(dot(o2q2,a3)/(norm(a3)^2))*a3;%projection of o1q1 to a3 vector
u1=abs(dot(o2q2,a3));

v=abs(dot(o2q2,a4)/(norm(a4)^2))*a4;
v1=abs(dot(o2q2,a4));

%Drawing
% figure(2),
% ends = a1;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3),'color','r');hold on;
%
% axis equal
%
% ends = a2;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3),'color','g');hold on;
% %
% % ends = q1;
% % quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3),'color','k');hold on;
%
% ends=s;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3),'color','b');hold on;
% ends=t;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3),'color','m');hold on;
%
% text(p1(1),p1(2),p1(3), 'p1','FontSize', 10);hold on;
% plot3(p1(1),p1(2),p1(3), '*-') ; hold on;
% plot3(q1(1),q1(2),q1(3), '*-') ; hold on;
% % text(p3(1),p3(2),p3(3), 'p3','FontSize', 10);hold on;
% text(q1(1),q1(2),q1(3), 'q1','FontSize', 10);hold on;
% text(o1(1),o1(2),o1(3), 'O1','FontSize', 10);hold on;
%
% xlabel('xaxis')
% ylabel('yaxis')
% zlabel('zaxis')


% figure(3),
% ends = a3;
% quiver3(o2(1), o2(2),o2(3), ends(1), ends(2),ends(3),'color','r');hold on;
%
% axis equal
%
% ends = a4;
% quiver3(o2(1), o2(2),o2(3), ends(1), ends(2),ends(3),'color','g');hold on;
%
%
% % ends = q2;
% % quiver3(o2(1), o2(2),o2(3), ends(1), ends(2),ends(3),'color','k');hold on;
%
% ends=u;
% quiver3(o2(1), o2(2),o2(3), ends(1), ends(2),ends(3),'color','b');hold on;
% ends=v;
% quiver3(o2(1), o2(2),o2(3), ends(1), ends(2),ends(3),'color','m');hold on;
%
% plot3(p2(1),p2(2),p2(3), '*-') ; hold on;
% plot3(q2(1),q2(2),q2(3), '*-') ; hold on;
% text(p2(1),p2(2),p2(3), 'p2','FontSize', 10);hold on;
% text(q2(1),q2(2),q2(3), 'q2','FontSize', 10);hold on;
% text(o2(1),o2(2),o2(3), 'O2','FontSize', 10);hold on;
%
% xlabel('xaxis')
% ylabel('yaxis')
% zlabel('zaxis')
end