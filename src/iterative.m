function shavedFace = iterative(infile, filter)

load nonbeardsubspace;
load init;

% number of iterations in loop
num = 10;

face = loadInput(infile, img, cp);
inFile = face;

x = reshape(face, 26505, 1, 1);
x = double(x);

V = double(nonbeardsubspace);
W = ones(26505, 1, 'single');

for k=1:num

    c = (V'*diag(W.^2)*V)\V'*diag(W.^2)*x;
    xstar = V*c;

    sigma = 1.4826 * median(abs(x-xstar));
    e = x - V*c;
    for i=1:26505
        W(i) = sigma^2/(e(i)^2 + sigma^2)^2;
    end
    disp(strcat('Iteration ', int2str(k), ' of ', int2str(num), ' complete.'));
end

xstar = reshape(xstar, 95, 93, 3);

face = uint8(devectorized);

    
shavedFace = applyBeardFilter(inFile, xStar, filter);