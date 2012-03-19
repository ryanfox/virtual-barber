[mask,base]=cpselect(canvas, canvas, canvas_cp, canvas_cp, 'Wait', true);


a = input('How many points define the mask?');
roi = poly2mask(mask(1:a,1), mask(1:a,2), 95, 93);

