function [theta1,phi1,theta2,phi2]=intersectsphere(px,py,gtemp,up,d,wr,hr,h,w,c)
ci=c + d*(gtemp/(norm(gtemp)));%center of the sensor
v=cross(gtemp,up);
temp =((px-wr/2)/wr) * (w)*(v/norm(v))+ ((py-hr/2)/hr) * (h)*(up/norm(up));
p=ci + temp;%this is specific pixel coordinate
cp=(p-c)/(norm(p-c));%I am supposing the direction of the unit vector is uniformly in the direction of pq

scen=rand(3,1);%center of a sphere
r=rand();%radius of the sphere
aa=cp(1)^2+cp(2)^2+cp(3)^2;
bb=2*((c(1)-scen(1))*cp(1)+(c(2)-scen(2))*cp(2)+(c(3)-scen(3))*cp(3));
cc=(c(1)-scen(1))^2+(c(2)-scen(2))^2+(c(2)-scen(2))^2-r^2;
coef=[aa,bb,cc];
sol=abs(roots(coef));
l=mean(sol);

q1=c + l*cp;%intersection point 
q2=-q1;%the anti podal point of the sphere

theta1=acos(q1(3)/r);%The spherical coordinaes of point q1
phi1=atan(q1(2)/q1(1));

theta2=acos(q2(3)/r);%spherical coordinates of point q2
phi2=atan(q2(2)/q2(1));


%check=norm(q1-scen)
check=sqrt((q1(1)-scen(1))^2+(q1(2)-scen(2))^2 + (q1(3)-scen(3))^2);
isequal(check,r);

end