im0=imread('cameraman.tif');
fc=0.6;
[ir,ic,iz] = size(im0); 
hr = (ir-1)/2; 
hc = (ic-1)/2; 
[x, y] = meshgrid(-hc:hc, -hr:hr);

mg = sqrt((x/hc).^2 + (y/hr).^2); 
lp = double(mg <= fc);

IM = fftshift(fft2(double(im0))); 
IP = zeros(size(IM)); 
for z = 1:iz 
    IP(:,:,z) = IM(:,:,z) .* lp; 
end 
im = abs(ifft2(ifftshift(IP)));
imshow(uint8(im));