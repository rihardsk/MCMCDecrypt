function p = logProb(decoded, transitions)
	decoded = upper(decoded);

	n = size(decoded, 1);
	lastLetter = decoded(1);
	
	if lastLetter >= 'A' && lastLetter <= 'Z'
		lastInd = lastLetter - 'A' + 1;
	else
		lastInd = 27;
	end
	
	p = 0;
	
	for i = 2:n
	
		curLetter = decoded(i);
		if curLetter >= 'A' && curLetter <= 'Z'
			curInd = curLetter - 'A' + 1;
		else
			curInd = 27;
		end
		
		p = p + log(transitions(lastInd, curInd));
		
		
		lastLetter = curLetter;
		lastInd = curInd;
	end
	
	%TODO pieskaitīt pēdējā burta varb
	
end