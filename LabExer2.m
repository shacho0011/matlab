clear
clc
img1=imread('rice.png');
img2=imread('cameraman.tif');

[x,y]=size(img1);
img3=zeros(x,y);
for i=1:x
    for j=1:y
        img3(i,j)=img1(i,y-j+1);
    end
end
figure,imshow(uint8(img3)),title('X Reflected Rice Image');

[x,y]=size(img2);
img4=zeros(x,y);
for i=1:x
    for j=1:y
        img4(i,j)=img2(x-i+1,j);
    end
end
figure,imshow(uint8(img4)),title('Y Reflected Cameraman Image');

img=imadd(img3,img4);
figure,imshow(uint8(img)),title('Added Image');


[x,y]=size(img2);
img3=zeros(x,y);
for i=1:x
    for j=1:y
        img3(i,j)=img2(i,y-j+1);
    end
end
figure,imshow(uint8(img3)),title('X Reflected Cameraman Image');