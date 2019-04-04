all: build/prezentacja.pdf

build/prezentacja.pdf: prezentacja.tex $(shell find img -type f) plasma_uses.eps methods.eps pic-cycle.eps
	# make pictures
	pdflatex -halt-on-error -shell-escape -output-directory=build prezentacja.tex 

methods.eps: methods.gv
	dot -Tps $< -o $@

plasma_uses.eps: plasma_uses.gv
	neato -Tps $< -o $@

pic-cycle.eps: pic-cycle.gv
	circo -Tps $< -o $@

.PHONY: all clean


clean:
	rm -rf build/*
optimize:
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=prezentacja-compressed.pdf prezentacja.pdf
