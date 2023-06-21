all: main.pdf

BIBER := $(shell if $$(command -v Biber); then echo "Biber"; else echo "biber"; fi)

%.pdf: %.tex pubs.bib
	xelatex $< 
	$(BIBER) $*.bcf
	xelatex $<
	xelatex $<

clean:
	rm -f *.log *.dvi *.aux *.out *.xml
	rm -f *.blg *.bbl *.bcf
	rm -f main.pdf
