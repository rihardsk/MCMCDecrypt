function void = display(matrix)
	%m = matrix';
	figure;
	imagesc(matrix);
	colorbar;
	colormap gray;
	cmap = gray;
	cmap = flipud(cmap);
	colormap(cmap);
	colorbar;
end