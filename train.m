function p = train(text)
text = upper(text);

p = zeros(27, 27);
n = size(text,1);

lastLetter = ' ';


for i = 1:n
	if lastLetter >= 'A' && lastLetter <= 'Z'
		lastInd = lastLetter - 'A' + 1;
	else
		lastInd = 27;
	end
	
	cur = text(i);
	if cur >='A' && cur <= 'Z'
		curInd = cur - 'A' + 1;
	else
		curInd = 27;
	end
	
	if ((lastInd != 27) || (curInd != 27))
		p(lastInd, curInd) = p(lastInd, curInd) + 1;
	end
	
	lastLetter = cur;
end

%p
p = p + ones(27, 27);
display(p);

sums = sum(p, 2);
p = p ./ sums;

end