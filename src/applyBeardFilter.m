function final = applyBeardFilter(b, nb, filter)
filter = repmat(filter, [1 1 3]);
final = (double(b) .* double(filter)) + (double(nb) .* double(~filter));
final = uint8(final);
end