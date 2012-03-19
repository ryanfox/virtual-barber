function m = maskFromCP(cp, img_name)

img = imread(img_name);

coords = [1 2 3 5 6 22 23 28 24 27 25 26];
x = zeros(1, size(coords)); 
y = zeros(1, size(coords));

for i = 1:size(coords)
    c = coords(i);
    x = cp(c, 1); 
    y = cp(c, 2);
end

m = poly2mask(x,y,size(img,1), size(img,2));

end