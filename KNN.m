clear
clc
x=zeros(150,4);
myfile=fopen('irisdataset.txt','r');
x=textscan(myfile,'%f\t%f\t%f\t%f');
x=[x{1} x{2} x{3} x{4}];
for i=1:150
    if i<=50
        plot(x(i,1),x(i,2),x(i,3),x(i,4),'+r');hold on;
    elseif i>50 && i<=100
        plot(x(i,1),x(i,2),x(i,3),x(i,4),'+b');hold on;
    elseif i>100 && i<=150
        plot(x(i,1),x(i,2),x(i,3),x(i,4),'+c');hold on;
    end
end
[m,n]=size(x);
xTemp = zeros(m,n+2);
xTemp(1:150,1:4) = x(1:150,1:4);
xTemp(1:50,6) =1;
xTemp(51:100,6) =2;
xTemp(101:150,6) =3;
c1 = 0;
c2= 0;
c3 = 0;
s=m;
k=ceil(sqrt(s));

conf = zeros(4,4);
for w=1:3
    r=randi([1 150],1,10)
    for z =1:10
        q=[x(r(1,z),1) x(r(1,z),2) x(r(1,z),3) x(r(1,z),4)];
        dist=zeros(1,150);
        for i=1:150
            for j=1:4
                dist(1,i) = dist(1,i)+(q(1,j) - x(i,j))*(q(1,j) - x(i,j));
            end
            xTemp(i,5) = sqrt(dist(1,i));
        end
        min = xTemp(1,5);
        
        for p=1:149
            for i=1:149
                if xTemp(i,5)>xTemp(i+1,5)
                    t = zeros(1,6);
                    t = xTemp(i,:);
                    xTemp(i,:) = xTemp(i+1,:);
                    xTemp(i+1,:) = t;
                end
            end
        end
        c1=0;
        c2=0;
        c3=0;
        for i=1:k
            if xTemp(i,6)==1
                c1 = c1+1;
            elseif xTemp(i,6)==2
                c2 = c2+1;
            elseif xTemp(i,6)==3
                c3 = c3+1;
            end
        end
        if c1>c2
            if c1>c3
                plot(q(1,1),q(1,2),q(1,3),q(1,4),'or');hold on;
                conf(w,1) = conf(w,1)+1;
            else
                plot(q(1,1),q(1,2),q(1,3),q(1,4),'oc');hold on;
                conf(w,3) = conf(w,3)+1;
            end
        else
            if c2>c3
                plot(q(1,1),q(1,2),q(1,3),q(1,4),'ob');hold on;
                conf(w,2) = conf(w,2)+1;
            else
                plot(q(1,1),q(1,2),q(1,3),q(1,4),'oc');hold on;
                conf(w,3) = conf(w,3)+1;
            end
        end
        
    end
    
end

for i=1:3
    for j=1:3
        conf(i,4) = conf(i,4) + conf(i,j);
        conf(4,i) = conf(4,i) + conf(j,i);
    end
end

conf

pre_c1 = conf(1,1)/conf(1,4)
pre_c2 = conf(2,2)/conf(2,4)
pre_c3 = conf(3,3)/conf(3,4)
re_c1 = conf(1,1)/conf(4,1)
re_c2 = conf(2,2)/conf(4,2)
re_c3 = conf(3,3)/conf(4,3)
f1_c1 = 2*pre_c1*re_c1/(pre_c1+re_c1)
f1_c2 = 2*pre_c2*re_c2/(pre_c2+re_c2)
f1_c3 = 2*pre_c3*re_c3/(pre_c3+re_c3)

pre = (pre_c1+pre_c2+pre_c3)/3
re = (re_c1+re_c2+re_c3)/3
f1 = 2*pre*re/(pre+re)
