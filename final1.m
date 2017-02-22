[im1, map1] = imread('change1.gif');
[im2, map2] = imread('change2.gif');
im_diff = imsubtract(im1, im2);
 % im_diff = im1 – im2; % direct subtraction
imshow(im_diff)
colormap(jet)
set(gca, 'clim', [0 60]); % adjust colorbar