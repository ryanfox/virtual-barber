function masked = maskSrcImgs(all_cp, nb_names)


length = size(nb_names,2);
masked = cell(1,length);

for i=1:length
    mask = maskFromCP(all_cp(:,:,i), nb_names{i});
    mask = repmat(mask, [1 1 3]);
    
    masked{i} = double(imread(nb_names{i})) .* double(mask);
end

end