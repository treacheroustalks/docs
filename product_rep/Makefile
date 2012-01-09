all:	product_rep.pdf

product_rep.pdf: product_rep.tex
	pdflatex product_rep
	bibtex product_rep
	pdflatex product_rep
	pdflatex product_rep

clean: clean_latex clean_logs

clean_latex: clean_logs
	rm -f *.pdf *nav *out *snm *toc *.aux *.bbl *.blg

clean_logs:
	rm -f *.log *~

.PHONY: all clean clean_latex clean_logs
