function final = removeUsingMask(before, after)

% calculate difference between bearded/beardless images
diff = double(before) - double(after);

% extract bottom half of the difference
bottom = diff(50:95,:,:);

% convert it to grayscale, then binary
bw = rgb2gray(bottom);
bw = round(bw);
bw = repmat(bw,[1 1 3]);

% create canvas with bottom half bw, top half ones
canvas = ones(95,93,3);
canvas(50:95,:,:) = bw;

% merge masked part with rest of image
final = (uint8(before) .* uint8(canvas)) + (uint8(after) .* uint8(~canvas));

