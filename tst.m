%%%%%%%%%%%%%%%%%%%%%%%%%%%%codesmesh.com%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
image=[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 1 1 1 1 0 0 0 0 0 0 0 0 0;% structure A
       0 0 1 1 1 1 0 0 0 0 0 1 0 0 0;
       0 0 1 1 1 1 0 0 0 0 1 1 1 0 0;% structure C
       0 0 1 1 1 1 0 0 0 1 1 1 1 1 0;
       0 0 1 1 1 1 0 0 1 1 1 1 1 1 1;
       0 0 1 1 1 1 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0; %D-structure to find in an 15*15 image
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0;
       0 0 0 0 0 0 0 0 0 0 0 1 1 1 0;
       0 0 0 1 1 1 0 0 0 0 0 0 0 0 0; %another D-structure in image
       0 0 0 1 1 1 0 0 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
    ];
image=imread('E:\\Education\\4.2\\Digital Image Processing\\CharSet\\N1.jpg');

[r c]=size(image);
D=[ 0 0 0 1 0 0 0;
    0 0 1 1 1 0 0; 
    0 1 1 1 1 1 0;
    1 1 1 1 1 1 1];
D=imread('E:\\Education\\4.2\\Digital Image Processing\\CharSet\\ww.jpg');
D=im2bw(D,0.9);
[rd cd]=size(D);
WminusD=zeros(rd+2,cd+2);
for i=2:rd+1
    for j=2:cd+1
        WminusD(i,j)=D(i-1,j-1);
    end
end

     x=0;y=0;
% as we know hit miss tranformation is given by A*B=(A erosion D(structure
% we wana find))intersection (Ac erosion(W-D))
        AeroD = imerode(image,D);
        image = uint8(image);
        imagecomp=bitcmp(image,'uint8');
        ero2=imerode(imagecomp,WminusD);
        imshow(ero2);
        finalImg=AeroD+ero2;
        
        subplot(1,3,1)
        imshow(image);
        title('image')
        subplot(1,3,2)
        imshow(WminusD);
        title('structure to find')
        subplot(1,3,3)
        imshow(finalImg);
        title('location of structure in image');