function shavedFace = naive(infile, filter)

load nonbeardsubspace;
load init;

face = loadInput(infile, img, cp);
inFile = face;

vectorized = reshape(face, 26505, 1, 1);
vectorized = double(vectorized);
nonbeardsubspace=double(nonbeardsubspace);
solution = nonbeardsubspace*((nonbeardsubspace'*nonbeardsubspace)\nonbeardsubspace'*vectorized);

devectorized = reshape(solution, 95, 93, 3);

face = uint8(devectorized);


shavedFace = applyBeardFilter(inFile, face, filter);
