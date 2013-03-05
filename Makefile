# This file generates files required to use the ltl package.
#
# Copyright (C) 2013 by Malte Schmitz <malte@schmitz-sh.de>
# --------------------------------------------------------------------------
# This work may be distributed and/or modified under the
# conditions of the LaTeX Project Public License, either version 1.3
# of this license or (at your option) any later version.
# The latest version of this license is in
#   http://www.latex-project.org/lppl.txt
# and version 1.3 or later is part of all distributions of LaTeX
# version 2005/12/01 or later.

all: ltl.pdf

ltl.sty: ltl.ins
	pdflatex ltl.ins

ltl.pdf: ltl.dtx ltl.sty
	pdflatex ltl.dtx
	# make indices with special styles (-s) and specified output files (-o)
	makeindex -s gind.ist -o ltl.ind ltl.idx # make index
	makeindex -s gglo.ist -o ltl.gls ltl.glo # make glossary / changelog
	pdflatex ltl.dtx
	pdflatex ltl.dtx

clear: clean
	rm -f \
		ltl.pdf \
		ltl.sty

clean:
	rm -f \
		ltl.aux \
		ltl.glo \
		ltl.gls \
		ltl.idx \
		ltl.ilg \
		ltl.ind \
		ltl.log \
		ltl.out
