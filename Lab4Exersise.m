clear
clc
a=imread('cameraman.tif');
a=imresize(a,0.1);
[x y]=size(a);
figure(1);imshow(a);
b=zeros(x+1,y+1);
c=zeros(x+1,y+1);
b(2:x-1,2:y-1)=a(1:x-2,1:y-2);

k=ones(3,3)./9;
[x y]=size(b);
avgSum=0;
for i=1:x-2
    for j=1:y-2
        m=1;
        for p=i:(i+2)
            n=1;
            for q=j:(j+2)
                avgSum = avgSum + b(p,q)*k(m,n);
                n=n+1;
            end
            m=m+1;
        end
        c(i+1,j+1) = avgSum;  
        avgSum=0;
    end
end
a(1:x-2,1:y-2)=c(2:x-1,2:y-1);
%imshow(uint8(a));
figure(2);imshow(uint8(a));