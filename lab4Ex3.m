i=imread('eight.tif');
j=imnoise(i,'salt & pepper',0.02);
figure(1); imshow(j);
h=fspecial('gaussian',[3 3],0.2);
l=imfilter(j,h);
figure(2); imshow(l);
k=[1 1 1;
    1 1 1;
    1 1 1]./6;
figure(3),freqx2(k);
m=imfilter(l,k);
figure(4); imshow(m);