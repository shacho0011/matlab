function [] = sub(a,b)
if isequal(size(a),size(b))
    i = imsubtract(b,a);
else
    msgbox('Please enter two same sized image!');
    return;
end
imshow(i);
end