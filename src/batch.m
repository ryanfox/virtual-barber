a='b/04066.jpg';
i=2;
clean = removeBeard(a, 'naive', 'clean');
imwrite(clean, strcat(int2str(i),'-clean.jpg'), 'JPG');
clean = removeBeard(a, 'naive', 'moustache');
imwrite(clean, strcat(int2str(i),'-moustache.jpg'), 'JPG');
clean = removeBeard(a, 'naive', 'goatee');
imwrite(clean, strcat(int2str(i),'-goatee.jpg'), 'JPG');
clean = removeBeard(a, 'naive', 'fuManchu');
imwrite(clean, strcat(int2str(i),'-fuManchu.jpg'), 'JPG');
clean = removeBeard(a, 'naive', 'soulPatch');
imwrite(clean, strcat(int2str(i),'-soulPatch.jpg'), 'JPG');
clean = removeBeard(a, 'naive', 'vandyck');
imwrite(clean, strcat(int2str(i),'-vandyck.jpg'), 'JPG');