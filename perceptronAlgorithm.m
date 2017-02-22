clear
clc
%Task 01
w1 = [-8,5; 1,-7; 4,5];
w2 = [10,-9;-4,2;2,-8];
plot(w1(:,1),w1(:,2),'*b');hold on;
plot(w2(:,1),w2(:,2),'*r');hold on;

%Task 02
y=zeros(6,6);
y=[w1(1,1)*w1(1,1) w1(1,2)*w1(1,2) w1(1,1)*w1(1,2) w1(1,1) w1(1,2) 1;
   w1(2,1)*w1(2,1) w1(2,2)*w1(2,2) w1(2,1)*w1(2,2) w1(2,1) w1(2,2) 1;
   w1(3,1)*w1(3,1) w1(3,2)*w1(3,2) w1(3,1)*w1(3,2) w1(3,1) w1(3,2) 1;
   w2(1,1)*w2(1,1) w2(1,2)*w2(1,2) w2(1,1)*w2(1,2) w2(1,1) w2(1,2) 1;
   w2(2,1)*w2(2,1) w2(2,2)*w2(2,2) w2(2,1)*w2(2,2) w2(2,1) w2(2,2) 1;
   w2(3,1)*w2(3,1) w2(3,2)*w2(3,2) w2(3,1)*w2(3,2) w2(3,1) w2(3,2) 1]

%Task 03
w=ones(1,6);
alpha=1/6;
flag=0;
count=0;
while count<200
    count = count+1;
    flag=0;
    for i=1:6
        g=y(i,:)*w';
        if g<=0
            w=w+alpha*y(i,:);
        else 
            flag = flag+1;
        end;
    end;
    if flag==6
        break;
    end;
end;
fprintf('W: %f %f %f %f %f %f\n',w);
fprintf('Iteration: %d\n',count);

%Task 04
w=ones(1,6);
alpha=1/6;
flag=0;
count=0;
temp=0;
while count<200
    count = count+1;
    flag=0;
    for i=1:6
        g=y(i,:)*w';
        if g<=0
            temp=temp+y(i,:);
        else 
            flag = flag+1;
        end;
    end;
    if flag==6
        break;
    end;
    w=w+alpha*temp;
end;
fprintf('W: %f %f %f %f %f %f\n',w);
fprintf('Iteration: %d\n',count);

syms x1 x2;
s=sym(w(1,1)*x1*x1+w(1,2)*x2*x2+w(1,3)*x1*x2+w(1,4)*x1+w(1,5)*x2+w(1,6));
s2=solve(s,x2);
xval1=[-10:0.01:10];
xval2(1,:)=subs(s2(1),x1,xval1);
plot(xval1,xval2(1,:),'k');grid;hold on;