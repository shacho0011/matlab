I=rgb2gray(imread('D:\MatlabPictures\4.jpg'));
subplot(2,2,1); imshow(I);title('Original Image');
subplot(2,2,2);imhist(I);title('Original Histogram');
keyValue = [0:1:255];
pixelNumber=zeros(size(keyValue));
mapPixNum = containers.Map(keyValue,pixelNumber);
[X,Y]=size(I);
for n=1:X
    for m=1:Y
        T = I(n,m);
        mapPixNum(T) = mapPixNum(T)+1;
    end
end
sumOfN=zeros(size(keyValue));
mapSumOfN = containers.Map(keyValue,sumOfN);
for n=0:255
    T = mapPixNum(n);
    if n==0
        mapSumOfN(n) = T;
    else
        mapSumOfN(n) = T + mapSumOfN(n-1);
    end
end
newValue=zeros(size(keyValue));
mapNewValue = containers.Map(keyValue,newValue);
L=256;
for n=0:255
    s = mapSumOfN(n)/(X*Y);
    mapNewValue(n)=round((L-1)*s);
end
J = I;
for n=1:X
    for m=1:Y
        T = I(n,m);
        J(n,m) = mapNewValue(T);
    end
end
subplot(2,2,3); imshow(J);title('Equilized Image');
subplot(2,2,4);imhist(J);title('Equilized Histogram');