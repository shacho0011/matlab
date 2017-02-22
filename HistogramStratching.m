I=imread('D:\MatlabPictures\7.jpg');
subplot(2,2,1); imshow(I);title('Original Image');
subplot(2,2,2);imhist(I);title('Original Histogram');
[X, Y] = size(I);
T =[];
J = I-0;
J = round(J./(100-0));
J = 255.*J;
%for n=1:X
    %for m=1:Y
       % T =round((255*(I(n,m)-0))/(150-0))
       % T=[T,];
    %end
    %J=[J;T];
%end
J = imadjust(I,[0.05;0.55],[0.0;1.0]);
subplot(2,2,3); imshow(J);title('Stretched Image');
subplot(2,2,4);imhist(J);title('Stretched Histogram');