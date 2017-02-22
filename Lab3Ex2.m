clear
clc
c=imread('cameraman.tif');
cd=double(c);
c0=mod(cd,2);
subplot(3,3,1),imshow(c0),hold on;
c1=mod(floor(cd/2),2);
subplot(3,3,2),imshow(c1),hold on;
c2=mod(floor(cd/4),2);
subplot(3,3,3),imshow(c2),hold on;
c3=mod(floor(cd/8),2);
subplot(3,3,4),imshow(c3),hold on;
c4=mod(floor(cd/16),2);
subplot(3,3,5),imshow(c4),hold on;
c5=mod(floor(cd/32),2);
subplot(3,3,6),imshow(c5),hold on;
c6=mod(floor(cd/64),2);
subplot(3,3,7),imshow(c6),hold on;
c7=mod(floor(cd/128),2);
subplot(3,3,8),imshow(c7),hold on;
cc=2*(2*(2*(2*(2*(2*(2*c7+c6)+c5)+c4)+c3)+c2)+c1)+c0;
subplot(3,3,9),imshow(uint8(cc)),hold on;
imwrite(uint8(cc),'newcameraman.jpg');
imwrite(uint8(cc),'newcameraman.png');
imwrite(uint8(cc),'newcameraman.bmp');
figure,imshow('newcameraman.bmp');