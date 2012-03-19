function [min_height, min_width] = getFaceDims(all_cp)

min_width = inf;
min_height = inf;

for i = 1:size(all_cp, 3)
    xMax = max(all_cp(:,1,i));
    xMin = min(all_cp(:,1,i));
    yMax = max(all_cp(:,2,i));
    yMin = min(all_cp(:,2,i));
    
    width = xMax - xMin;
    height = yMax - yMin;
    
    if width < min_width
        min_width = width;
    end
    
    if height < min_height
        min_height = height;
    end
end