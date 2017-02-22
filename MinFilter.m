clear
clc
img=imread('eight.tif');
j=imnoise(img,'salt & pepper',0.02);
figure,imshow(j),title('Salt and Pepper Noise Image');
[x,y]=size(img);
b=zeros(x+2,y+2);
c=zeros(x+2,y+2);
b(2:x+1,2:y+1)=img(1:x,1:y);
a=zeros(1,9);
for i=1:x
    for j=1:y
        m=1;
        for p=i:i+2
            for q=j:j+2
                a(:,m)=b(p,q);
                m=m+1;
            end
        end
        c(i+1,j+1)=min(a);
        a=zeros(1,9);
    end
end
img(1:x,1:y)=c(2:x+1,2:y+1);
figure,imshow(img),title('Min Image');