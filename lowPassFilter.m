a=imread('cameraman.tif');
[M N]=size(a);
h=zeros(M,N);
d0=5;
for u=1:M
    for v=1:N
        d=sqrt((u-M/2)+(v-N/2));
        if d<=d0
            