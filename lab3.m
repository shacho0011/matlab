i = imread('cameraman.tif');
class(i);
j = im2uint8(i);
%imshow(j);
class(j);

clc;
close all;
clear all;
I = imread('cameraman.tif');
K= imfinfo('cameraman.tif');
if(K.BitDepth ==24)
I=rgb2gray(I);
end
[r,c] = size(I)
I2(1:r/2, 1:c/2) = I(1:2:r, 1:2:c);
%imshow(I);
%figure
%imshow(I2);

b=imread('cameraman.tif');
whos b
b1=uint8(double(b)/5);
%imshow(b1);
p=imhist(b)/numel(b);
imhist(p)
