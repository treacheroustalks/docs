all:	course_rep.pdf

course_rep.pdf: course_rep.tex
	pdflatex course_rep
	bibtex course_rep
	pdflatex course_rep
	pdflatex course_rep

clean: clean_latex clean_logs

clean_latex: clean_logs
	rm -f *.pdf *nav *out *snm *toc *.aux *.bbl *.blg

clean_logs:
	rm -f *.log *~

.PHONY: all clean clean_latex clean_logs
