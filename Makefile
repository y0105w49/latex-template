clean:
	rm -f *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.loc *.log *.out *.run.xml *.soc *.synctex.gz *.toc out.bib
gen-bib:
	biber main --output-format=bibtex --output-file=out.bib
