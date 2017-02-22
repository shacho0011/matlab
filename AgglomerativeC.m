clear
clc
x=zeros(150,4);
myfile=fopen('irisdataset.txt','r');
x=textscan(myfile,'%f\t%f\t%f\t%f');
x=[x{1} x{2} x{3} x{4}];
[m,n]=size(x);
dist = zeros(m,m);
xTemp = 0;
for k=1:150
    for i=k:150
        for j=1:4
            xTemp = xTemp+(x(k,j)-x(i,j))*(x(k,j)-x(i,j));
        end
        dist(k,i) = sqrt(xTemp);
        dist(i,k) = sqrt(xTemp);
        xTemp = 0;
    end
end
[m,n]=size(dist);
for k=1:m-2
    [m,n]=size(dist);
    minV = 100;
    r=0;
    c=0;
    for i=1:m
        for j=1:n
            if dist(i,j)<minV && (dist(i,j) > 0)
                minV = dist(i,j);
                r=i;
                c=j;
            end
        end
    end
    sIndx = 0;
    bIndx= 0;
    if(r<c)
        sIndx = r;
        bIndx = c;
    else
        sIndx = c;
        bIndx = r;
    end
    temp = zeros(m,n);
    for i=1:m
        for j=1:n
            if i==j
                temp(i,j) = 0;
            elseif i==sIndx
                temp(i,j) = min(dist(r,j),dist(c,j));
            elseif j==sIndx
                temp(i,j) = min(dist(r,i),dist(c,i));
            elseif i==bIndx
                temp(i,j) = -1;
            elseif j==bIndx
                temp(i,j) = -1;
            else
                temp(i,j) = dist(i,j);
            end
        end
    end
    temp(bIndx,:)=[];
    temp(:,bIndx)=[];
    dist = zeros(m-1,n-1);
    dist=temp;
end
dist
Y = pdist(x);
P = squareform(Y);
Z = linkage(Y);
figure;
dendrogram(Z);
T = clusterdata(x,'maxclust',3);
figure;
V=find(T==1);
[m,n]=size(V);
for i=1:m
    plot(x(V(i,1),1),x(V(i,1),2),x(V(i,1),3),x(V(i,1),4),'bs');hold on;
end
V=find(T==2);
[m,n]=size(V);
for i=1:m
    plot(x(V(i,1),1),x(V(i,1),2),x(V(i,1),3),x(V(i,1),4),'rs');hold on;
end
V=find(T==3);
[m,n]=size(V);
for i=1:m
    plot(x(V(i,1),1),x(V(i,1),2),x(V(i,1),3),x(V(i,1),4),'gs');hold on;
end
