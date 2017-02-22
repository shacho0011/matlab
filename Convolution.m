clear
clc
img=[0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0;
    0,0,0,1,1,1,0,0,0;
    0,0,0,1,1,1,0,0,0;
    0,0,0,1,1,1,0,0,0;
    0,0,0,1,1,1,0,0,0;
    0,0,0,1,1,1,0,0,0;
    0,0,0,0,0,0,0,0,0;
    0,0,0,0,0,0,0,0,0];
figure,
subplot(2,2,1),imshow(img),title('Original Image');
subplot(2,2,2),mesh(img),title('Original Mesh');
[x,y]=size(img);
b=zeros(x+4,y+4);
c=zeros(x+4,y+4);
b(3:x+2,3:y+2)=img(1:x,1:y);
k=ones(3,3)./9;
%{
k=[1,3,5;
    2,7,6;
    8,4,9];
%}
kFlip=zeros(3,3);
for i=1:3
    for j=1:3
        kFlip(i,j)=k(3-i+1,j);
    end
end
k=kFlip;
for i=1:3
    for j=1:3
        kFlip(i,j)=k(i,3-j+1);
    end
end
k=kFlip;
sum=0;
for i=1:(x+2)
    for j=1:(y+2)
        m=1;
        for p=i:i+2
            n=1;
            for q=j:j+2
                sum=sum+double(b(p,q))*k(m,n);
                n=n+1;
            end
            m=m+1;
        end
        c(i+1,j+1)= sum;
        sum=0;
    end
end
img(1:x,1:y)=c(3:x+2,3:y+2);
subplot(2,2,3),imshow(img),title('Convolution Image');
subplot(2,2,4),mesh(img),title('Convolution Mesh');

