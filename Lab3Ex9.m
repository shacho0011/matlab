clear
clc
b=imread('cameraman.tif');
whos b
b1=uint8(double(b)+128);
figure,imshow(b1);
b1=imadd(b,128);
figure,imshow(b1);
b2=imsubtract(b,128);
figure,imshow(b2);
b2=immultiply(b,2);
figure,imshow(b2);
b2=imdivide(b,2);
figure,imshow(b2);
bc=imcomplement(b);
figure,imshow(bc);
figure,imhist(b,256);
p=imhist(b,256)/numel(b);
figure,imhist(p);