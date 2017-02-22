clear;
clc;
dist = [0.00 0.71 5.66 3.61 4.24 3.20;
    0.71 0.00 4.95 2.92 3.54 2.50;
    5.66 4.95 0.00 2.24 1.41 2.50;
    3.61 2.92 2.24 0.00 1.00 0.50;
    4.24 3.54 1.41 1.00 0.00 1.12;
    3.20 2.50 2.50 0.50 1.12 0.00
    ];
X = dist;
display(dist);
Len = 6;
for k = 1:4
    minVal = min(dist(dist>0));
    [row, col] = find(dist == minVal);
    r = row(1);
    c = col(1);
    temp =zeros(Len-1,Len-1);
    
    for m = 1:Len
        for n = 1:Len
            if(m==n) temp(m,n) = 0.00;
            elseif(n == c) temp(m,n) = min(dist(r,m), dist(c,m));
            elseif(n == r) temp(m,n) = -1;
            elseif(m == r) temp(m,n) = -1;
            elseif(m == c) temp(m,n) = min(dist(r,n), dist(c,n));
            else temp(m,n) = dist(m,n);
            end
        end
    end
    
    temp(r,:) = [];
    temp(:,r) = [];
    dist = temp;
    %display(dist);
    Len = Len-1;
    dist
end

%--------------------------------------------------------dendogram
Y = pdist(X);
%display(Y);
P = squareform(Y);
%display(P);
Z = linkage(Y);
%display(Z);
dendrogram(Z);
