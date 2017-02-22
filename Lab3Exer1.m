clear
clc
img1=imread('AT3_1m4_01.tif');
img2=imread('AT3_1m4_09.tif');
[x1,y1]=size(img1);
[x2,y2]=size(img2);
if x1==x2 && y1==y2
    subImg=zeros(x1,y1);
    for i=1:x1
        for j=1:y1
            subImg(i,j)=img1(i,j)-img2(i,j);
        end
    end
    figure,imshow(uint8(subImg)),title('Subtract Image');
else
    error('Please, enter same sized image');
end