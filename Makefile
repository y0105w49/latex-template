clean:
	rm -f default.log main.aux main.bbl main.bcf main.blg main.fdb_latexmk main.fls main.log main.out main.run.xml main.synctex.gz pset.aux pset.fdb_latexmk pset.fls pset.log pset.out pset.synctex.gz out.bib
gen-bib:
	biber main --output-format=bibtex --output-file=out.bib
