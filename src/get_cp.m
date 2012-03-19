num_imgs = size(nb_names, 2);

[input_points, base_points] = cpselect(nb_names{2}, nb_names{1}, 'Wait', true);

all_cp = zeros(size(base_points,1), 2, size(nb_names, 2));

all_cp(:,:,1) = base_points;
all_cp(:,:,2) = input_points;

for i=3:size(all_cp,3)
    [input_points, base_points] = cpselect(nb_names{i}, nb_names{1}, ...
        all_cp(:,:,1), all_cp(:,:,1), 'Wait', true);
    
    all_cp(:,:,i) = input_points;
end