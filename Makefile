TEXFILE = main

# Default target - only rebuilds when files change
all: $(TEXFILE).pdf

# Force rebuild target
rebuild:
	pdflatex $(TEXFILE).tex
	makeglossaries $(TEXFILE)
	bibtex $(TEXFILE)
	pdflatex $(TEXFILE).tex
	pdflatex $(TEXFILE).tex

# Step-by-step PDF build
$(TEXFILE).pdf: $(TEXFILE).tex
	pdflatex $(TEXFILE).tex
	makeglossaries $(TEXFILE)
	bibtex $(TEXFILE)
	pdflatex $(TEXFILE).tex
	pdflatex $(TEXFILE).tex

clean:
	rm -f $(TEXFILE).aux $(TEXFILE).log $(TEXFILE).out $(TEXFILE).toc \
		$(TEXFILE).bbl $(TEXFILE).blg $(TEXFILE).lof $(TEXFILE).lot \
		$(TEXFILE).glg $(TEXFILE).glo $(TEXFILE).gls \
		$(TEXFILE).acn $(TEXFILE).acr $(TEXFILE).alg \
		$(TEXFILE).ist $(TEXFILE).ilg $(TEXFILE).idx $(TEXFILE).ind \
		$(TEXFILE).pdf

cleanaux:
	rm -f $(TEXFILE).aux $(TEXFILE).log $(TEXFILE).out $(TEXFILE).toc \
		$(TEXFILE).bbl $(TEXFILE).blg $(TEXFILE).lof $(TEXFILE).lot \
		$(TEXFILE).glg $(TEXFILE).glo $(TEXFILE).gls \
		$(TEXFILE).acn $(TEXFILE).acr $(TEXFILE).alg \
		$(TEXFILE).ist $(TEXFILE).ilg $(TEXFILE).idx $(TEXFILE).ind

.PHONY: all clean cleanaux rebuild
