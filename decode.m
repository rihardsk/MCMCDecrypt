function text = decode(coded, mapping)

coded = upper(coded);

n = size(coded, 1);
text = zeros(n,1);

text = arrayfun( @(a)( mapChar(a, mapping)), coded);

end

function chr = mapChar(c, mapping)
	c = upper(c);
	ind = c - 'A' + 1;
	if c < 'A' || c > 'Z'
		ind = 27;
	end
	
	chr = char(mapping(ind) + 'A' - 1);
	if chr > 'Z'
		chr = ' ';
	end
end