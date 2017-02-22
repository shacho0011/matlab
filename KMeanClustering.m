clear
clc
x=zeros(150,4);
myfile=fopen('irisdataset.txt','r');
x=textscan(myfile,'%f\t%f\t%f\t%f');
x=[x{1} x{2} x{3} x{4}];
%figure,hold on;
%plot(x(:,1), x(:,2),x(:,3),x(:,4), 'bs');
%grid on;
%hold off;



randomRow = randi([1,50]);
x1=randomRow
c1 = [x(x1,1) x(x1,2) x(x1,2) x(x1,4)];

randomRow = randi([51,100]);
x2=randomRow
c2 = [x(x2,1) x(x2,2) x(x2,2) x(x2,4)];

randomRow = randi([101,150]);
x3=randomRow
c3 = [x(x3,1) x(x3,2) x(x3,2) x(x3,4)];

figure;
plot(c1(1,1),c1(1,2),c1(1,3),c1(1,4),'r*');hold on;
plot(c2(1,1),c2(1,2),c2(1,3),c2(1,4),'g*');hold on;
plot(c3(1,1),c3(1,2),c3(1,3),c3(1,4),'b*');hold on;hold off;

d1 = zeros(1,150);
d2 = d1;
d3 = d1;
for i = 1:150
    d1(1,i) = sqrt((c1(:,1) - x(i,1)) * (c1(:,1) - x(i,1)) + (c1(:,2) - x(i,2)) * (c1(:,2) - x(i,2)) + (c1(:,1) - x(i,3)) * (c1(:,1) - x(i,3)) + (c1(:,2) - x(i,4)) * (c1(:,2) - x(i,4)));
    d2(1,i) = sqrt((c2(:,1) - x(i,1)) * (c2(:,1) - x(i,1)) + (c2(:,2) - x(i,2)) * (c2(:,2) - x(i,2)) + (c2(:,1) - x(i,3)) * (c2(:,1) - x(i,3)) + (c2(:,2) - x(i,4)) * (c2(:,2) - x(i,4)));
    d3(1,i) = sqrt((c3(:,1) - x(i,1)) * (c3(:,1) - x(i,1)) + (c3(:,2) - x(i,2)) * (c3(:,2) - x(i,2)) + (c3(:,1) - x(i,3)) * (c3(:,1) - x(i,3)) + (c3(:,2) - x(i,4)) * (c3(:,2) - x(i,4)));
end;
d = [d1; d2; d3];
g = d;
for j = 1:150
    min = 50000;
    index = 0;
    for i = 1:3
        if(d(i,j) < min)
            min = d(i,j);
            index = i;
        end;
    end;
    for i = 1:3
        g(i,j) = 0;
    end;
    g(index,j) = 1;
end;


%CLUSTERING LOOP
for w=1:150
    tempG = g;
    %c1 = [0 0 0 0];
    %c2 = [0 0 0 0];
    %c3 = [0 0 0 0];
    for j = 1:150
        for i = 1:3
            if(g(i,j)==1 && i==1)
                newX1 = (x(j,1) + c1(1,1))/2;
                newX2 = (x(j,2) + c1(1,2))/2;
                newX3 = (x(j,3) + c1(1,3))/2;
                newX4 = (x(j,4) + c1(1,4))/2;
                c1 = [newX1 newX2 newX3 newX4];
            elseif(g(i,j)==1 && i==2)
                newX1 = (x(j,1) + c2(1,1))/2;
                newX2 = (x(j,2) + c2(1,2))/2;
                newX3 = (x(j,3) + c2(1,3))/2;
                newX4 = (x(j,4) + c2(1,4))/2;
                c2 = [newX1 newX2 newX3 newX4];
            elseif(g(i,j)==1 && i==3)
                newX1 = (x(j,1) + c3(1,1))/2;
                newX2 = (x(j,2) + c3(1,2))/2;
                newX3 = (x(j,3) + c3(1,3))/2;
                newX4 = (x(j,4) + c3(1,4))/2;
                c3 = [newX1 newX2 newX3 newX4];
            end;
        end;
    end;
    d1 = zeros(1,150);
    d2 = d1;
    d3 = d1;
    for i = 1:150
        d1(1,i) = sqrt((c1(:,1) - x(i,1)) * (c1(:,1) - x(i,1)) + (c1(:,2) - x(i,2)) * (c1(:,2) - x(i,2)) + (c1(:,1) - x(i,3)) * (c1(:,1) - x(i,3)) + (c1(:,2) - x(i,4)) * (c1(:,2) - x(i,4))) ;
        d2(1,i) = sqrt((c2(:,1) - x(i,1)) * (c2(:,1) - x(i,1)) + (c2(:,2) - x(i,2)) * (c2(:,2) - x(i,2)) + (c2(:,1) - x(i,3)) * (c2(:,1) - x(i,3)) + (c2(:,2) - x(i,4)) * (c2(:,2) - x(i,4))) ;
        d3(1,i) = sqrt((c3(:,1) - x(i,1)) * (c3(:,1) - x(i,1)) + (c3(:,2) - x(i,2)) * (c3(:,2) - x(i,2)) + (c3(:,1) - x(i,3)) * (c3(:,1) - x(i,3)) + (c3(:,2) - x(i,4)) * (c3(:,2) - x(i,4))) ;
    end;
    d = [d1; d2; d3];
    g = d;
    for j = 1:150
        min = 50000;
        index = 0;
        for i = 1:3
            if(d(i,j) < min)
                min = d(i,j);
                index = i;
            end;
        end;
        
        %display(index);
        for i = 1:3
            g(i,j) = 0;
        end;
        g(index,j) = 1;
    end;
    if(tempG==g)
        break;
    else
        tempG=g;
    end;
end;
display(w);
figure;
hold on;
plot(c1(:,1), c1(:,2),c1(:,3),c1(:,4), 'r*');
hold off;
hold on;
plot(c2(:,1), c2(:,2),c2(:,3),c2(:,4), 'g*');
hold off;
hold on;
plot(c3(:,1), c3(:,2),c3(:,3),c3(:,4), 'b*');
hold off;

counterG1=0;
counterG2=0;
counterG3=0;
for j = 1:150
    for i = 1:3
        if(g(i,j)==1 && i==1)
            counterG1=counterG1+1;
            hold on; plot(x(j,1), x(j,2),x(j,3),x(j,4), 'rs'); hold off;
        elseif(g(i,j)==1 && i==2)
            counterG2=counterG2+1;
            hold on; plot(x(j,1), x(j,2),x(j,3),x(j,4), 'gs'); hold off;
        elseif(g(i,j)==1 && i==3)
            counterG3=counterG3+1;
            hold on; plot(x(j,1), x(j,2),x(j,3),x(j,4), 'bs'); hold off;
        end;
    end;
end;
display(counterG1);
display(counterG2);
display(counterG3);