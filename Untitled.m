for n=1:3
D = A
D(:,n)=B;
C=D;
w(n)=det(C)/det(A);
end
w=w'
