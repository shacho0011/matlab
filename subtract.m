im1=imread('D:\MatlabPictures\u1.jpg');
im2=imread('D:\MatlabPictures\u2.jpg');
i1=rgb2gray(im1);
i2=rgb2gray(im2);
im_diff=imsubtract(im1, im2);
subplot(2,2,1),imshow(im1)
subplot(2,2,2),imshow(im2)
subplot(2,2,3),imshow(im_diff)
% im_diff = im1 – im2; % direct subtraction
%imshow(im_diff)
%colormap(jet)
%set(gca, 'clim', [0 50]); % adjust colorbar