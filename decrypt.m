%text = fileRead('war.txt');
%text = upper(text);

%p = train(text);

function text = decrypt(coded, transitions)
	
	mapping = randperm(27)';
	
	bestMapping = mapping;
	decoded = decode(coded, mapping);
	prob = logProb(decoded, transitions);
	bestProb = prob;
	iters = 2000;
	i = 1
	
	while i <= iters
		toSwitch = floor(rand(2,1) * 27) + 1;
		proposal = mapping;
		temp = proposal(toSwitch(1));
		proposal(toSwitch(1)) = proposal(toSwitch(2));
		proposal(toSwitch(2)) = temp;
		
		proposalText = decode(coded, proposal);
		
		proposedProb = logProb(proposalText, transitions);
		
		ratio = exp(proposedProb - prob);
		r = rand(1,1);
		if r <= ratio
			mapping = proposal;
			prob = proposedProb;
			
			if prob > bestProb
				bestProb = prob;
				bestMapping = mapping;
			end
			
			i = i+1;
			fprintf('picked: %i\n', i);
		else
			fprintf('rejected\n');		
		end
	end
	
	text = decode(coded, bestMapping);

end