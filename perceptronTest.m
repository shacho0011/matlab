clear
clc
class1 = [1 1; 1 -1; 4 5];
class2 = [2 2.5; 0 2 ; 2 3];
plot(class1(:,1), class1(:,2),'o','MarkerEdgeColor','b', 'MarkerFaceColor', 'b', 'MarkerSize',7);
hold on;
plot(class2(:,1), class2(:,2),'s','MarkerEdgeColor','r', 'MarkerFaceColor', 'r', 'MarkerSize',5);
hold on;

y = zeros(6,6);
y = [class1(1,1)*class1(1,1) class1(1,2)*class1(1,2) class1(1,1)*class1(1,2) class1(1,1) class1(1,2) 1;
    class1(2,1)*class1(2,1) class1(2,2)*class1(2,2) class1(2,1)*class1(2,2) class1(2,1) class1(2,2) 1;
    class1(3,1)*class1(3,1) class1(3,2)*class1(3,2) class1(3,1)*class1(3,2) class1(3,1) class1(3,2) 1;
    -class2(1,1)*class2(1,1) -class2(1,2)*class2(1,2) -class2(1,1)*class2(1,2) -class2(1,1) -class2(1,2) -1;
    -class2(2,1)*class2(2,1) -class2(2,2)*class2(2,2) -class2(2,1)*class2(2,2) -class2(2,1) -class2(2,2) -1;
    -class2(3,1)*class2(3,1) -class2(3,2)*class2(3,2) -class2(3,1)*class2(3,2) -class2(3,1) -class2(3,2) -1];
w=ones(1,6);
alpha= 1/6;
flag = 0;
counter = 0;
while counter < 200
    counter = counter + 1;
    flag = 0;
    for i = 1:6
        g = y(i,:)*w' ;
        if g <= 0
            w = w + alpha * y(i,:);
        else
            flag = flag + 1;
        end;
    end;
    if flag==6
        break ;
    end;
end;
display(w);
display(counter);

syms x1 x2;
%s=sym(10*x1*x1-6*x2*x2+24*x1*x2-24*x1-68*x2+65);
s=sym(w(1,1)*x1*x1-w(1,2)*x2*x2+w(1,3)*x1*x2-w(1,4)*x1-w(1,5)*x2+w(1,6));
s2=solve(s,x2);
xvals1=[-10:0.1:10];
xvals2(1,:)=subs(s2(1),x1,xvals1);
plot(xvals1,xvals2(1,:),'k');
grid, hold on;