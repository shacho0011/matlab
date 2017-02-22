clear
clc
img=imread('cameraman.tif');
figure,imshow(img),title('Original Image');
img=double(img);
c=1;
g=1.5;
[x,y]=size(img);
n=zeros(x,y);
for i=1:x
    for j=1:y
        n(i,j)=c*img(i,j)^g;
    end
end
figure,imshow(uint8(n)),title('Gamma Image');
figure,plot(n,img),title('Gamma Image');