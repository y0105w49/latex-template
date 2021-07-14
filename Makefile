clean:
	rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.loc *.log *.out *.run.xml *.soc *.synctex.gz *.toc out.bib
clean-all: clean
	rm -f *.pdf
gen-bib:
	biber main --output-format=bibtex --output-file=out.bib
main.pdf:
	latexmk -pdf main
