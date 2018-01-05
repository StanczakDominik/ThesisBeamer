prezentacja.pdf: prezentacja.tex $(shell find img -type f) 
	# make pictures
	pdflatex -halt-on-error -output-directory=build prezentacja.tex

clean:
	rm -rf build/*
optimize:
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=prezentacja-compressed.pdf prezentacja.pdf
