close all;
clc;
% % b=[0,0,-1];
% % a=[0,1,0];
% % a = [0,-0.8944,0.4472];
% % b =[0,0.4472,0.8944];
% a = [0 , 0.3714,0.9285];
% b = [0, 0.9285,-0.3714];
%
% q1 = [3.0000,1.9231,-0.7615];
% o1 = [1 1 1];
% ends = a;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3))
% axis equal
% hold on
% ends = b;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3))
% hold on
% ends = q1;
% quiver3(o1(1), o1(2),o1(3), ends(1), ends(2),ends(3))
% norm(o1-a)
% text(o1(1),o1(2),o1(3) ,'O1','FontSize', 12);hold on;
% text(q1(1),q1(2),q1(3) ,'O1','FontSize', 12);hold on;
% xlabel('xaxis')
% ylabel('yaxis')
% zlabel('zaxis')

% d=cell(5,5);
% for i=1:size(d,1)
%     for j=1:size(d,2)
%     d{i,j}=struct('s',i,'t',i);
%     end
% end
% X = struct('c', d);
% X(1).c.t

% x=[1:1:10]';
% y=[1:1:10]';
% z=[2,2,2]';
% dev = bsxfun(@times ,x,z)

%
%     A = [97 89 84; 95 82 92; 64 80 99;76 77 67;...
%  88 59 74; 78 66 87; 55 93 85];
% mean(A)
% dev = bsxfun(@minus,A,mean(A))
% 
% values=5;
% A=zeros(4,4);
% [m,n]=size(A);
% final={1:m,1:n};
% %  final=cell(m,n);
% display('final is')
% final{:,1}
% display('converted indices')
% index=sub2ind(size(A),1:3,1:3)
% A(1:index)=values;
% [sub1,sub2]=ind2sub(size(A),index);
% v=[sub1,sub2]';

% q1=rand(5,3)
% o1=[1,2,3];
% a1=[1,2,3];
% o1q1 = bsxfun(@minus,q1,o1)
% ss=bsxfun(@times,o1q1,a1)
% m=ones(size(ss,2),1);
% s=ss*m
tic;
a=zeros(256,256);
[m,n]=size(a);
f=1:1:n;
indx=cell(m,1);
subs=[];
for i=1:size(a,2)
    b(1:m)=i;
    indx{i}=sub2ind(size(a),b,f);   
end
 for i=1:size(indx)
 [indx2 ,indx3]=ind2sub(size(a),indx{i});
    subs=[subs;indx2',indx3'];
 end
 t=toc