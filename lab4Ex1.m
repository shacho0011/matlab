clear
clc
a=[0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 ;
    0 0 0 1 1 0 0 0 ;
    0 0 0 1 1 0 0 0 ;
    0 0 0 1 1 0 0 0 ;
    0 0 0 1 1 0 0 0 ;
    0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 ];
iptsetpref('ImshowBorder','loose')
%figure(1), imshow(a)
%figure(2), mesh(a)

N=64;

b=fft2(a,N,N);
e=fftshift(b);
f=log(abs(e));
figure(5), imshow(f)
figure(6), mesh(f)
x=length(a);

while x<N
img=zeros(2*x,2*x);
for i=1:x
    for j=1:x
        img((2*i-1),(2*j-1))=a(i,j);
        img((2*i-1),2*j)=a(i,j);
        img(2*i,(2*j-1))=a(i,j);
        img(2*i,2*j)=a(i,j);
    end
end 
a=img;
x=length(img);
end

figure(3), imshow(a)
%figure(4), mesh(a)

W=(-2*3.1416*1i);
sum=0;
pic=zeros(x,x);

%{
for j=0:(N*N-1)
    for k=0:(x*x-1)
        sum=sum+a(k+1)*W*j*k;
    end
    pic(j+1)=sum;
    sum=0;
end

%}
for p=0:(x-1)
    for q=0:(x-1)
        for j=0:(x-1)
           for k=0:(x-1)
                sum=sum+(a(j+1,k+1)*exp(W*((p*j/x)+(q*k/x))));
           end
        end
      pic(p+1,q+1)=sum;
      sum=0;
    end
end
              
%for j=1:N*N
%    for k=1:x*x
%        sum=sum+a(k)*exp(W*(k-1)*(j-1));
%    end
%    img(j)=sum;
%    sum=0;
%end;

c=fftshift(pic);
d=log(abs(c));
figure(7), imshow(d)
figure(8), mesh(d)
