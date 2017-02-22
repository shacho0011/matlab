clear
clc
img=imread('cameraman.tif');
imhist(img);
[x y]=size(img);
n=zeros(x,y);
for i=1:1:x
    for j=1:1:y
        n(i,j) = 255*(img(i,j)-120)/(180-120);
    end
end
imshow(n);