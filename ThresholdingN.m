clear
clc
img=imread('cameraman.tif');
avg =120;
[x y]=size(img);
n=zeros(x,y);
for i=1:1:x
    for j=1:1:y
        q=img(i,j);
        if q<avg
            n(i,j)=0;
        else
            n(i,j)=1;
        end
    end
end
imshow(n);