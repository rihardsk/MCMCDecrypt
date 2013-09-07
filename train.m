function p = train(text)

p = zeros(27, 27);
n = size(text,1);

lastLetter = text(1);


for i = 2:n
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
	
	p(lastInd, curInd) = p(lastInd, curInd) + 1;
	
	lastLetter = cur;
end

p = p + ones(27, 27);

sums = sum(p, 2);
p = p ./ sums;

end