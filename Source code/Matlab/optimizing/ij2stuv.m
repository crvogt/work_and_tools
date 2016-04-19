function [a1,a2,a3,a4,s1,t1,u1,v1]=ij2stuv(q1,q2,np,p3,p4,o1,o2)
a1=(p3-o1)/(norm(p3-o1));%a1 and a2 are arbitrary vectors pass through point o1(in the first plane) where a1 perpendicular to a2
a2=cross(a1,np);
a3=(p4-o2)/(norm(p4-o2));%a3 and a4 are arbitrary vectors pass through point o2(on second plane) where a1 perpendicular to a2
a4=cross(a3,np);

% o1q1=q1-o1;
% o2q2=q2-o2;
%=======;
o1q1 = bsxfun(@minus,q1,o1);
o2q2 = bsxfun(@minus,q2,o2);

%first plane
ss=bsxfun(@times,o1q1,a1);
m=ones(size(ss',2),1);
s1=abs(ss'*m);

tt=bsxfun(@times,o1q1,a2);
t1=abs(tt'*m);

%second plane
uu=bsxfun(@times,o2q2,a3);
m2=ones(size(uu',2),1);
u1=abs(uu'*m2);

vv=bsxfun(@times,o2q2,a4);
v1=abs(vv'*m2);

end