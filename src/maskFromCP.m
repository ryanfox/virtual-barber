function m = maskFromCP(cp, img_name)

if ischar(img_name) 
    img = imread(img_name);
else img = img_name;
end

coords = [1 2 3 5 6 22 23 28 24 27 25 26];
x = zeros(1, size(coords,2)); 
y = zeros(1, size(coords,2));

for i = 1:size(coords,2)
    c = coords(i);
    x(i) = cp(c, 1); 
    y(i) = cp(c, 2);
end

m = poly2mask(x,y,size(img,1), size(img,2));

end