bw = im2bw(imread('E:\\Education\\4.2\\Digital Image Processing\\CharSet\\N1.jpg'));
interval = im2bw(imread('E:\\Education\\4.2\\Digital Image Processing\\CharSet\\ww.jpg'));
interval= imresize(interval, 0.1);
bw2 = bwhitmiss(bw,interval);
imshow(bw2)