function S = my_im2bw(Ig,level)
S = Ig;
S(Ig > level) = 255;
S(Ig <= level) = 0;
subplot(2,1,1),imshow(Ig)
subplot(2,1,2),imshow(S)
end