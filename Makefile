LATEX2PDF     = pdflatex
SVG2PDF       = inkscape
SVG2PDF_FLAGS = --export-area-drawing --export-text-to-path

slides: slides.pdf

handout: slides.handout.pdf

print: slides.print.pdf

%.pdf: %.svg
	$(SVG2PDF) $(SVG2PDF_FLAGS) $< -o $@

PDFs := $(foreach dir, ., $(patsubst %.svg,%.pdf,$(wildcard ./$(dir)/*.svg)))

images: $(PDFs)

slides.pdf: slides.tex images ../license.pdf
	f=$<; b=$${f%.tex}; if [ ! -f $$b.toc ]; then $(LATEX2PDF) $<; fi
	$(LATEX2PDF) $<

%.handout.pdf: %.handout.tex
	# make images
	f=$<; b=$${f%.tex}; if [ ! -f $$b.toc ]; then $(LATEX2PDF) $<; fi
	$(LATEX2PDF) $<

%.handout.tex: %.tex
	sed "s/\\documentclass\[dvipsnames\]{beamer}/\documentclass[dvipsnames,handout]{beamer}/" $< \
		| sed "s/usetheme{.*}/usetheme{default}\n  \\\setbeamertemplate{footline}\[page number\]/" \
		| grep -v usecolortheme > $@

%.print.pdf: %.handout.pdf
	pdfjam --nup 2x2 --landscape --paper a4paper \
		--frame true --scale 0.91 \
		--offset "0.1cm 0.1cm" --delta "0.3cm 0.3cm" --outfile $@ $<

zip: slides.pdf slides.print.pdf
	rm -f slides.zip
	zip -q slides.zip slides.tex *.pdf *.svg *.png *.jpg *.gif

clean:
	rm -f *~ *.bak *.backup *.log *.toc *.aux *.nav *.out *.snm *.vrb
	rm -f *.bbl *.blg
	rm -f *.synctex.gz
	rm -f *.handout.*
	rm -f *~ *.dvi *.ps *.pdf
	rm -f ../license.pdf
