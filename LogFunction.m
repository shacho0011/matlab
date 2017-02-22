clear
clc
img=imread('cameraman.tif');
figure,imshow(img),title('Original Image');
img=double(img);
c=30;
[x,y]=size(img);
n=zeros(x,y);
for i=1:x
    for j=1:y
        n(i,j)=c*log(1+img(i,j));
    end
end
figure,imshow(uint8(n)),title('Log Image');