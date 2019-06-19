example.pdf:example.tex
	rm example.dvi
	latexmk -latex='platex -synctex=1 -src-specials -interaction=nonstopmode' example.tex && dvipdfm example.dvi

all: example.pdf

