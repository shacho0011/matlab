clear
clc

%Binary Image
c=imread('cameraman.tif');
avg =120;
[x,y]=size(c);
n=zeros(x,y);
for i=1:1:x
    for j=1:1:y
        q=c(i,j);
        if q<avg
            n(i,j)=0;
        else
            n(i,j)=1;
        end
    end
end
imwrite(uint8(n),'binarycameraman.tif');
figure,imshow(n),title('Binary Image');
cd=double(uint8(n));
c0=mod(cd,2);
figure,
subplot(3,3,1),imshow(c0),hold on;
c1=mod(floor(cd/2),2);
subplot(3,3,2),imshow(c1),hold on;
c2=mod(floor(cd/4),2);
subplot(3,3,3),imshow(c2),hold on;
c3=mod(floor(cd/8),2);
subplot(3,3,4),imshow(c3),hold on;
c4=mod(floor(cd/16),2);
subplot(3,3,5),imshow(c4),hold on;
c5=mod(floor(cd/32),2);
subplot(3,3,6),imshow(c5),hold on;
c6=mod(floor(cd/64),2);
subplot(3,3,7),imshow(c6),hold on;
c7=mod(floor(cd/128),2);
subplot(3,3,8),imshow(c7),hold on;
cc=2*(2*(2*(2*(2*(2*(2*c7+c6)+c5)+c4)+c3)+c2)+c1)+c0;
subplot(3,3,9),imshow(uint8(cc)),hold on;

%True Color Image
c=imread('autumn.tif');
figure,imshow(c),title('True Color Image');
cd=double(c);
c0=mod(cd,2);
figure,
subplot(3,3,1),imshow(c0),hold on;
c1=mod(floor(cd/2),2);
subplot(3,3,2),imshow(c1),hold on;
c2=mod(floor(cd/4),2);
subplot(3,3,3),imshow(c2),hold on;
c3=mod(floor(cd/8),2);
subplot(3,3,4),imshow(c3),hold on;
c4=mod(floor(cd/16),2);
subplot(3,3,5),imshow(c4),hold on;
c5=mod(floor(cd/32),2);
subplot(3,3,6),imshow(c5),hold on;
c6=mod(floor(cd/64),2);
subplot(3,3,7),imshow(c6),hold on;
c7=mod(floor(cd/128),2);
subplot(3,3,8),imshow(c7),hold on;
cc=2*(2*(2*(2*(2*(2*(2*c7+c6)+c5)+c4)+c3)+c2)+c1)+c0;
subplot(3,3,9),imshow(uint8(cc)),hold on;

%Indexed Color Image
[c, map]=imread('E:\emu.jpeg');
figure,imshow(c),colormap(map),title('Indexed Color Image');
cd=double(c);
c0=mod(cd,2);
figure,
subplot(3,3,1),imshow(c0),colormap(map),hold on;
c1=mod(floor(cd/2),2);
subplot(3,3,2),imshow(c1),colormap(map),hold on;
c2=mod(floor(cd/4),2);
subplot(3,3,3),imshow(c2),colormap(map),hold on;
c3=mod(floor(cd/8),2);
subplot(3,3,4),imshow(c3),colormap(map),hold on;
c4=mod(floor(cd/16),2);
subplot(3,3,5),imshow(c4),colormap(map),hold on;
c5=mod(floor(cd/32),2);
subplot(3,3,6),imshow(c5),colormap(map),hold on;
c6=mod(floor(cd/64),2);
subplot(3,3,7),imshow(c6),colormap(map),hold on;
c7=mod(floor(cd/128),2);
subplot(3,3,8),imshow(c7),colormap(map),hold on;
cc=2*(2*(2*(2*(2*(2*(2*c7+c6)+c5)+c4)+c3)+c2)+c1)+c0;
subplot(3,3,9),imshow(uint8(cc)),colormap(map),hold on;

