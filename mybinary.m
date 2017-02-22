load trees % from MATLAB
gray=rgb2gray(map); % 'map' is loaded from 'trees'. Convert to grayscale.
threshold=128;
lbw=double(gray>threshold);
BW=im2bw(X,lbw); % 'X' is loaded from 'trees'.
imshow(X,map), figure, imshow(BW)