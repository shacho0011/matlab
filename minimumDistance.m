clear
clc
c1 = 20 + (-20+80)*rand(500,2);
c2 = -10 + (10+30)*rand(500,2);
fid1=fopen('w1.txt','w');
fprintf(fid1, '%f %f\n', c1);
fid2=fopen('w2.txt','w');
fprintf(fid2, '%f %f\n', c2);
fclose(fid1);
fclose(fid2);
fileID1 = fopen('w1.txt','r');
formatSpec = '%f %f';
[X Y] = size(c1);
sizeW = [100 Y];
w1 = fscanf(fileID1,formatSpec,sizeW);
fileID2 = fopen('w2.txt','r');
formatSpec = '%f %f';
[X Y] = size(c2);
sizeW = [100 Y];
w2 = fscanf(fileID2,formatSpec,sizeW);

%w1 = [2,2;3,1;3,3;-1,-3;4,2;-2,-2];
%w1 = -10 + (5+50)*rand(50,2);
%w2=[0,0;-2,2;-1,-1;-4,2;-4,3;2,6];
%w2 = 0 + (5+70)*rand(50,2);

plot(w1(:,1),w1(:,2),'*b');hold on;
plot(w2(:,1),w2(:,2),'*r');hold on;
y1=[mean(w1(:,1)),mean(w1(:,2))];
plot(y1(:,1),y1(:,2),'+b','MarkerSize',10);hold on;
y2=[mean(w2(:,1)),mean(w2(:,2))];
plot(y2(:,1),y2(:,2),'+r','MarkerSize',10);hold on;
x=[-1,-1;3,2;-2,1;8,2];
for n=1:length(x)
    g1=x(n,:)*transpose(y1)-0.5*y1*transpose(y1);
    g2=x(n,:)*transpose(y2)-0.5*y2*transpose(y2);
    if g1>g2
        plot(x(n,1),x(n,2),'ob');hold on;
    else
        plot(x(n,1),x(n,2),'or');hold on;
    end
end
c = -0.5*(y1*transpose(y1) - y2*transpose(y2));
minw=min(min(w1(:)),min(w2(:)));
minAll = min(minw,min(x(:)));
maxw=max(max(w1(:)),max(w2(:)));
maxAll=max(maxw,max(x(:)));
x1 = minAll:0.1:maxAll
cof=y1-y2;
for i=1:length(x1)
    x2(i,:)=(-(cof(1,1)*x1(:,i)+c)/cof(1,2));
end
b = [x1' x2];
%b = [x1' ((c/1.5)-x1')];
plot(b(:,1),b(:,2),'-g');hold on;