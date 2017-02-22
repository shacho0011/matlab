clear
clc
a=imread('cameraman.tif');
a=imresize(a,1.0);
a=imnoise(a,'salt & pepper',0.02);
figure(1),imshow(uint8(a));
[x y]=size(a);
b=zeros(x+2,y+2);
c=zeros(x+2,y+2);
b(2:x+1,2:y+1)=a(1:x,1:y)
k=ones(3,3)./9;
[x y]=size(b);
for i=1:x-2
    for j=1:y-2
        m=1;
        val=zeros(1,9);
        for p=i:(i+2)
            for q=j:(j+2)
                val(1,m) = b(p,q);
                m=m+1;
            end
        end
        c(i+1,j+1) = median(val);  
    end
end
a(1:x-2,1:y-2)=c(2:x-1,2:y-1);
figure(2),imshow(uint8(a));