
function [q1all,q2all,ci,ss1,ss2,p]=intersection(px,py,gtemp,up,d,wr,hr,h,w,c,p1,p2,np)

ci=c + d*(gtemp/(norm(gtemp)));%center of the sensor
v=cross(gtemp,up);
temp1= ((bsxfun(@minus,px,wr/2))/wr);
temp2=((bsxfun(@minus,py,hr/2))/hr);
q1all=[];
q2all=[];

for i=1:size(temp1,1)
    temp =temp1(i) * (w)*(v/norm(v))+ temp2(i) * (h)*(up/norm(up));
    p=ci + temp;%this is specific pixel coordinate
    cp=(p-c)/(norm(p-c));%I am supposing the direction of the unit vector is uniformly in the direction of pq
    l=((p1(1)-c(1))*np(1)+ (p1(2)-c(2))*np(2)+ (p1(3)-c(3))*np(3))/(cp(1)*np(1)+cp(2)*np(2) + cp(3)*np(3));
    l2=((p2(1)-c(1))*np(1)+ (p2(2)-c(2))*np(2)+ (p2(3)-c(3))*np(3))/(cp(1)*np(1)+cp(2)*np(2) + cp(3)*np(3));
    q1=c + l*cp;
    q1all=[q1all q1];
    q2=c + l2*cp;
    q2all=[q2all q2];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%
dx=gtemp(1)-ci(1);
dy=gtemp(2)-ci(2);
dz=gtemp(3)-ci(3);
m=[dx,dy,dz]';
ss=cross(ci,m);
ss1=ci-(w/2)*(ss/norm(ss));
ss2=ci+(w/2)*(ss/norm(ss));
end
