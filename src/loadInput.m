function [cropped, tform, in] = loadInput(Input, base, cp)
% input MUST be a string
% base can be string or matrix

load images;

% verify image integrity
if ischar(base)
    base = imread(base);
end

if ischar(Input)
    input = imread(Input);
else
    error('Error using loadInput. input must be file name (not a matrix)');
end


%check to see if you've definied this image's points
if isKey(processedImages, Input)
    in = processedImages(Input);
else 
    [in,bs] = cpselect(input,base,cp,cp,'Wait',true);
    processedImages(Input) = in;
    save images processedImages;
end


canvas = zeros(94,92);
canvas_cp = [13.8750000000000,16.8750000000000;23.1250000000000,...
    12.3750000000000;38.6250000000000,15.1250000000000;58.3750000000000,...
    15.1250000000000;70.3750000000000,12.1250000000000;78.6250000000000,...
    18.3750000000000;23.1250000000000,25.3750000000000;29.3750000000000,...
    24.6250000000000;34.8750000000000,25.6250000000000;60.1250000000000,...
    25.6250000000000;66.3750000000000,25.1250000000000;72.8750000000000,...
    25.3750000000000;47.6250000000000,45.6250000000000;41.3750000000000,...
    51.3750000000000;53.1250000000000,51.3750000000000;46.3750000000000,...
    24.8750000000000;36.3750000000000,66.1250000000000;41.3750000000000,...
    62.3750000000000;51.1250000000000,62.6250000000000;57.8750000000000,...
    66.1250000000000;47.6250000000000,71.3750000000000;80.8750000000000,...
    60.6250000000000;74.8750000000000,72.1250000000000;47.1250000000000,...
    89.6250000000000;17.3750000000000,72.3750000000000;11.1250000000000,...
    59.8750000000000;28.3750000000000,82.3750000000000;65.1250000000000,...
    83.1250000000000;];

mask = maskFromCP(in,input);
mask = repmat(mask, [1 1 3]);

masked = double(mask) .* double(input);

cropped = warpToCanvas(masked,in,canvas,canvas_cp);
cropped = cropped{1};

tform = cp2tform(in, canvas_cp, 'polynomial');
 
end