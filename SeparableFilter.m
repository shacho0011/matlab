clear
clc
a=imread('cameraman.tif');

a=imresize(a,1.0);
figure(1),imshow(uint8(a));
[x y]=size(a);

b=zeros(x+2,y+2);
c=zeros(x+2,y+2);
b(2:x+1,2:y+1)=a(1:x,1:y)

k1=ones(3,1)./3;
k2=ones(1,3)./3;
[x y]=size(b);
avgSum1=0;
avgSum2=0;
for i=1:x-2
    for j=1:y-2
        n=1;
        for q=i:(i+2)
            avgSum1 = avgSum1 + b(q,j)*k1(n,1);
            n=n+1;
        end
        b(i+1,j) = avgSum1;
        avgSum1=0;
        n=1;
        for q=j:(j+2)
            avgSum2 = avgSum2 + b(i,q)*k2(1,n);
            n=n+1;
        end
        b(i,j+1) = avgSum2;
        avgSum2=0;
    end
end

%{
for i=1:x-2
    for j=1:y-2
        n=1;
        for q=j:(j+2)
            avgSum2 = avgSum2 + b(i,q)*k2(1,n);
            n=n+1;
        end
        b(i,j+1) = avgSum2;
        avgSum2=0;
    end
end
%}
a(1:x-2,1:y-2)=b(2:x-1,2:y-1);
%imshow(uint8(a));
figure(2),imshow(uint8(a));