clear
clc
img=imread('cameraman.tif');
figure,imshow(img);
title('Original Image');
[x,y]=size(img);
%zoom in
n=zeros(x*2,y*2);
for i=1:y
    for j=1:x
        n(2*j-1,2*i-1) = img(j,i);
        n(2*j,2*i-1) = img(j,i);
    end
end

for i=1:(x*2)
    for j=1:y
        n(i,2*j)=n(i,2*j-1);
    end
end
figure,imshow(uint8(n));
title('Zoom In');
%zoom out
n=zeros(x/2,y/2);
for i=1:(x/2)
    for j=1:(y/2)
        n(i,j) = img(2*i-1,2*j-1);
    end
end
figure,imshow(uint8(n));
title('Zoom Out');

%rgb2gray
rgbImg = imread('peppers.png');
figure,imshow(rgbImg);
title('Original Image');
%0.2989 * R + 0.5870 * G + 0.1140 * B 
x=size(rgbImg,1);
y=size(rgbImg,2);
grayImg=zeros(x,y);
for i=1:x
      for j=1:y
          grayImg(i,j)=0.2989*rgbImg(i,j,1)+0.5870*rgbImg(i,j,2)+0.1140*rgbImg(i,j,3);
      end
end
%Without using for loop:
%GIm=0.2989*rgbImg(:,:,1)+0.5870*rgbImg(:,:,2)+0.1140*rgbImg(:,:,3);
figure,imshow(uint8(grayImg));
title('Grayscale Image');
figure,imhist(uint8(grayImg));

%gray2bw
avg =120;
[x,y]=size(grayImg);
n=zeros(x,y);
for i=1:1:x
    for j=1:1:y
        q=grayImg(i,j);
        if q<avg
            n(i,j)=0;
        else
            n(i,j)=1;
        end
    end
end
figure,imshow(n);
title('Black&White Image');
%{
I = imread('liftingbody.png');
x = [19 427 416 77];
y = [96 462 37 33];
improfile(I,x,y),grid on;
%}

%separate color image into R G B plane
x=size(rgbImg,1);
y=size(rgbImg,2);
r=rgbImg(:,:,1);
n=zeros(x,y);
red = cat(3,r,n,n);
figure,imshow(red),title('Red');

g=rgbImg(:,:,2);
n=zeros(x,y);
green = cat(3,n,g,n);
figure,imshow(green),title('Green');

b=rgbImg(:,:,3);
n=zeros(x,y);
blue = cat(3,n,n,b);
figure,imshow(blue),title('Blue');

%original color image from R G B plane
original=cat(3,r,g,b);
figure,imshow(original),title('Original Reback');

