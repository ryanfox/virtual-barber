function images = warpToCanvas(imgs, imgs_cp, canvas, canvas_cp)

if ~iscell(imgs)
    imgs = {imgs};
end
length = size(imgs, 2);

images = cell(1,length);

for i = 1:length
    tform = cp2tform(imgs_cp(:,:,i), canvas_cp, 'polynomial');
    img = imtransform(imgs{i}, tform);
    
    if i == 8 || i == 34 || i == 39 || i == 41 || i == 52 || i == 60
        img = imcrop(uint8(img));
    end
    
    xMin = Inf; yMin = Inf;
    for j=1:size(img,1)
        for k=1:size(img,2)
            if img(j,k,1)+img(j,k,2)+img(j,k,3) > 0
                if j < yMin
                    yMin = j;
                end
                if k < xMin
                    xMin = k;
                end
            end
        end
    end
    
    img = imcrop(img, [xMin-10 yMin-10 92 94]);
    images{i} = img;
end