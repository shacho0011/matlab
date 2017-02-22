clear
clc
clear
clc
c1 = 0 + (10-0)*rand(20,2);
c2 = 15 + (25-15)*rand(20,2);
fid1=fopen('w1.txt','w');
fprintf(fid1, '%0.1f %0.1f\n', c1);
fid2=fopen('w2.txt','w');
fprintf(fid2, '%0.1f %0.1f\n', c2);
fclose(fid1);
fclose(fid2);

w=zeros(20,2);
fileID1 = fopen('w1.txt','r');
w = textscan(fileID1,'%f %f');
w1=[w{1} w{2}];
w=zeros(20,2);
fileID2 = fopen('w2.txt','r');
w = textscan(fileID2,'%f %f');
w2=[w{1} w{2}];
%Task 01
%w1=[1,1;1,-1;4,5];
%w2=[2,2.5;0,2;2,3];
plot(w1(:,1),w1(:,2),'o','MarkerEdgeColor','b', 'MarkerFaceColor', 'b', 'MarkerSize',2);hold on;
plot(w2(:,1),w2(:,2),'s','MarkerEdgeColor','r', 'MarkerFaceColor', 'r', 'MarkerSize',2);hold on;

%Task 02
y=zeros(6,6);
y=[w1(1,1)*w1(1,1) w1(1,2)*w1(1,2) w1(1,1)*w1(1,2) w1(1,1) w1(1,2) 1;
   w1(2,1)*w1(2,1) w1(2,2)*w1(2,2) w1(2,1)*w1(2,2) w1(2,1) w1(2,2) 1;
   w1(3,1)*w1(3,1) w1(3,2)*w1(3,2) w1(3,1)*w1(3,2) w1(3,1) w1(3,2) 1;
   -w2(1,1)*w2(1,1) -w2(1,2)*w2(1,2) -w2(1,1)*w2(1,2) -w2(1,1) -w2(1,2) -1;
   -w2(2,1)*w2(2,1) -w2(2,2)*w2(2,2) -w2(2,1)*w2(2,2) -w2(2,1) -w2(2,2) -1;
   -w2(3,1)*w2(3,1) -w2(3,2)*w2(3,2) -w2(3,1)*w2(3,2) -w2(3,1) -w2(3,2) -1];

%Task 03
alpha = 1;
w=ones(1,6);
flag = 0;
count = 0;
while count<1000
    count=count+1;
    flag = 0;
    for i=1:6
        g=y(i,:)*w';
        if g<0
            w=w+alpha*y(i,:);
        else
            %w=w;
            flag=flag+1;
        end
    end
    if flag==6
        break;
    end
end
fprintf('W: %0.2f %0.2f %0.2f %0.2f %0.2f %0.2f\n',w);
fprintf('Iteration: %d\n',count);

alpha = 1;
w=ones(1,6);
flag = 0;
count = 0;
temp = 0;
while count<1000
    count = count + 1;
    flag = 0;
    for i = 1:6
        g=y(i,:)*w';
        if g < 0
            temp = temp + y(i, :);
        else
            flag = flag + 1;
        end;
    end;
    if (flag == 6)
        break ;
    end;
	w = w + alpha * temp;
end;
fprintf('W: %0.2f %0.2f %0.2f %0.2f %0.2f %0.2f\n',w);
fprintf('Iteration: %d\n',count);

syms x1 x2;
s=sym(w(1)*x1*x1+w(2)*x2*x2+w(3)*x1*x2+w(4)*x1+w(5)*x2+w(6));
s2=solve(s,x2);
xvals1=[-5:0.5:30];
xvals2(1,:)=subs(s2(2),x1,xvals1);
plot(xvals1,xvals2(1,:),'k');
grid, hold,