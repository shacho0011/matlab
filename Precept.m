clc
clear
%TASK_1
w1 = [2 1; 1 -1; 4 5; 4.5 1];
w2 = [2 2.5; 0 2 ; 2 3; 2 2.1];

plot(w1(:,1),w1(:,2),'s','MarkerFaceColor','g');
hold on;
grid on;
plot(w2(:,1),w2(:,2),'d','MarkerFaceColor','r');

%TASK_2

y11 = [ w1(1,1)*w1(1,1) w1(1,2)*w1(1,2) w1(1,1)*w1(1,2) w1(1,1) w1(1,2) 1];
y12 = [ w1(2,1)*w1(2,1) w1(2,2)*w1(2,2) w1(2,1)*w1(2,2) w1(2,1) w1(2,2) 1];
y13 = [ w1(3,1)*w1(3,1) w1(3,2)*w1(3,2) w1(3,1)*w1(3,2) w1(3,1) w1(3,2) 1];

y21 = [ -w2(1,1)*w2(1,1) -w2(1,2)*w2(1,2) -w2(1,1)*w2(1,2) -w2(1,1) -w2(1,2) -1];
y22 = [ -w2(2,1)*w2(2,1) -w2(2,2)*w2(2,2) -w2(2,1)*w2(2,2) -w2(2,1) -w2(2,2) -1];
y23 = [ -w2(3,1)*w2(3,1) -w2(3,2)*w2(3,2) -w2(3,1)*w2(3,2) -w2(3,1) -w2(3,2) -1];

y = [y11; y12; y13; y21; y22; y23;]




%TASK_3(ONE AT A TIME)

a = 1;
count = 0;
f = 0;
w = ones(1,6);
for j = 1:100000
    f=0;
    count = count+1;
    for j = 1:6
    g = y(j,:)*w' ;
        if g < 0
            w = w + a * y(j,:);
        else
            f = f + 1;
        end;
    end;
    
    if (f == 6)
        break ;
    end;
end
fprintf('W: %f %f %f %f %f %f\n',w);
fprintf('Counter is at %d\n', count);


%TASK_3(MANY AT A TIME)


a= 1;
f = 0;
count = 0;
temp = 0;
w = ones(1,6);


for i = 1:100000
    count = count + 1;
    f = 0;
    for j = 1:6
        g = y(j,:)*w' ;
        if g < 0
            temp = temp + y(j, :);
        else
            f = f + 1;
        end;
    end;
    if (f == 6)
        break ;
    end;
	w = w + a * temp;
end;
fprintf('W: %f %f %f %f %f %f\n',w);
fprintf('counter is at %d\n', count);


%TASK_4

syms x1 x2;
s=sym(w(1)*x1*x1+w(2)*x2*x2+w(3)*x1*x2+w(4)*x1+w(5)*x2+w(6));
s2=solve(s,x2);
xvals1=(-10:0.01:10);
xvals2(1,:)=subs(s2(2),x1,xvals1);
plot(xvals1,xvals2(1,:),'k');
grid on,hold,