########################################################################

MAKE       = $$(which make)

TEXS	   = sprint2_rep.tex
PDFS 	   = $(TEXS:.tex=.pdf)
AUXS	   = $(TEXS:.tex=.aux)
BBLS	   = $(TEXS:.tex=.bbl) # for bibtex
all:	$(PDFS)

$(AUXS): %.aux: %.tex
	@echo AUX
	pdflatex $<

$(BBLS): %.bbl: %.aux
	@echo BBL
	bibtex $*

$(PDFS): %.pdf: %.tex
	@echo PDF
	pdflatex $<
	pdflatex $< > /dev/null

clean: clean_latex clean_logs

clean_latex: clean_logs
	rm -f $(PDFS)
	rm -f *nav *out *snm *toc *.aux *.bbl *.blg

clean_logs:
	rm -f *.log *~

.PHONY: all clean clean_latex clean_logs
