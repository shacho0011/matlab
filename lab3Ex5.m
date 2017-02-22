clear
clc
[em,map]=imread('trees.tif');
imfinfo('trees.tif');
e=ind2gray(em,map);
figure,imshow(e);
e2=im2uint8(e);
figure,imshow(e2);
c=imread('cameraman.tif');
e2=im2uint8(c);
figure,imshow(e2);
%lab3ex6,7,8 done