x = [2, 3, 3, -1, 4, -2];
%x = [-6:1:6];
y = [2, 1, 3, -3, 2, -2];
%plot(x,y,'*'); hold on
x = [0, -2, -1, -4, -4, 2];
%x = [-6:1:6];
y = [0, 2, -1, 2, 3, 6];
%plot(x,y,'ro');; hold on
AllD=[x;y];
AllDL=[];
for k=1:length(AllD)
    if k<=length(x)
        AllDL=[AllDL;'X'];
    else AllDL=[AllDL;'Y'];
    end
end
Test=[];
for i=1:length(AllD)
    if rand > 1
        Test = [Test,i];
    end
end
Test = setxor(1:length(AllD),Test);
        