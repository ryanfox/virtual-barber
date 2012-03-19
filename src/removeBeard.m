function face = removeBeard(image, processing, style)
%
%
% image: string file path to bearded face image
% processing: 'naive' or 'iterative'
% style: 'clean', 'moustache', 'goatee' 'vandyck', 'soulPatch', 'fuManchu'

load facialHair;

valid = false;
switch(style)
    case {'clean', 'none'}
        shave_style = clean;
        valid = true;
    case 'moustache'
        shave_style = moustache;
        valid = true;
    case 'goatee'
        shave_style = goatee;
        valid = true;
    case 'vandyck'
        shave_style = vandyck;
        valid = true;
    case 'soulPatch'
        shave_style = soulPatch;
        valid = true;
    case 'fuManchu'
        shave_style = fuManchu;
        valid = true;
   
end

if strcmp(processing, 'naive') && valid
    face = naive(image, shave_style);
elseif strcmp(processing,'iterative') && valid
    face = iterative(image, shave_style);
else
    error('Invalid command. Try again or call "help removeBeard" for more info');
end

end