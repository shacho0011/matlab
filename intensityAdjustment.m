I = imread('D:\MatlabPictures\6.jpg');
J = imadjust(I,[0.1 0.9],[0.5 0]);
subplot(2,1,1),imshow(I)
subplot(2,1,2),imshow(J)