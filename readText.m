function text = readText(name)

%%Read a text file as string:
  %FID = fopen(FileName, 'rb');
  %Str = fread(FID, [1, inf], 'char');
  %fclose(FID);
%%Read a text file as cell string line by line:
  %CStr = textread(FileName, '%s', 'delimiter', '\n');
%%Or a little bit faster:
  %CStr = dataread('file', FileName, '%s', 'delimiter', '\n');
	
	text = fileread(name);
	text = upper(text);
	text = text(text >= 'A');
	text = text(text <= 'Z');
end