clear all
clc
a=imread('E:\\Education\\4.2\\Digital Image Processing\\CharSet\\N1.jpg');
k=imread('E:\\Education\\4.2\\Digital Image Processing\\CharSet\\ww.jpg');
se = strel('line',11,90);
erodedBW = imerode(a, se);

figure(1),imshow(uint8(erodedBW));
[x,y]=size(a);
[s,r] = size(k);

b=zeros(x+2,y+2);
c=zeros(x+2,y+2);
b(2:x+1,2:y+1)=a(1:x,1:y)

[x,y]=size(b);

avgSum=zeros(1,s*r);
for i=1:x-2
    for j=1:y-2
        m=1;u=1;
        for p=i:(i+2)
            n=1;
            for q=j:(j+2)
                avgSum(1,u) = b(p,q)*k(m,n);
                n=n+1;
                u=u+1;
            end
            m=m+1;
        end
        c(i+1,j+1) = min(avgSum);  
        avgSum=zeros(1,s*r);
    end
end
a(1:x-2,1:y-2)=c(2:x-1,2:y-1);
%imshow(uint8(a));
figure(2),imshow(uint8(a)),title('Dialation');