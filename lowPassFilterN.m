clear
clc
i=imread('eight.tif');
j=imnoise(i,'salt & pepper',0.02);
figure, imshow(j);
h=fspecial('gaussian',[3 3],0.2);
sigma=0.2;
g=[0,0,0;
    0,1,0;
    0,0,0];
l=imfilter(j,h);

[x,y]=size(i);
b=zeros(x+2,y+2);
b(2:x+1,2:y+1)=i(1:x,1:y);
figure, imshow(l);
k=[1 1 1;
    1 1 1;
    1 1 1]./6;
%figure(3),freqx2(k);
m=imfilter(l,k);
figure, imshow(m);