########################################################################
# Makefile for MPItutorial
#
########################################################################

CC         =  g++
CCFLAGS    =  -O3 -Wall
LIBS       =  

MAKE       = $$(which make)

TEXS	   = presentation.tex
PDFS 	   = $(TEXS:.tex=.pdf)
AUXS	   = $(TEXS:.tex=.aux)
BBLS	   = $(TEXS:.tex=.bbl) # for bibtex

SOURCES	   = 
HEADERS    = 
TARGETS    = $(SOURCES:.cc=)
OBJECTS    = $(SOURCES:.cc=.o)

all:	$(TARGETS) subdirs $(PDFS)

subdirs:
	@echo making subdirs
	@for s in $$(find -maxdepth 2 -name Makefile | grep -v '\./Makefile' | sed 's/Makefile$$//'); do \
	  echo $$s; \
	  $(MAKE) -C $$s; \
	done

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

$(OBJECTS): %.o: %.cc $(HEADERS)
	$(CC) $(CCFLAGS) $< $(LIBS) -c

$(TARGETS): %: %.o $(HEADERS)
	$(CC) $(CCFLAGS) -o $@ $< $(LIBS)

clean: clean_o clean_exe clean_latex clean_logs

clean_o:
	rm -f *.o

clean_exe:
	rm -f $(TARGETS)

clean_latex: clean_logs
	rm -f $(PDFS)
	rm -f *nav *out *snm *toc *.aux *.bbl *.blg

clean_logs:
	rm -f *.log *~

.PHONY: all clean clean_o clean_exe subdirs clean_latex clean_logs subdirs
