all: slides.pdf
handout: slides.handout.pdf
print: slides.print.pdf

images:
	for f in *.svg; do b=$${f%.svg}; make $$b.eps; done || true

%.eps: %.svg
	inkscape --export-eps=$@ --export-text-to-path $< 2> /dev/null && epstopdf $@

%.pdf: %.tex
	make images
	pdflatex $<
	python3tex $<
	pdflatex $<

%.handout.pdf: %.handout.tex
	make images
	pdflatex $<
	python3tex $<
	pdflatex $<

%.handout.tex: %.tex
	sed "s/\\documentclass\[dvipsnames\]{beamer}/\documentclass[dvipsnames,handout]{beamer}/" $< \
		| sed "s/usetheme{.*}/usetheme{default}\n  \\\setbeamertemplate{footline}\[page number\]/" \
		| grep -v usecolortheme > $@

%.print.pdf: %.handout.pdf
	pdfnup --nup 2x2 --frame true --paper a4paper --scale 0.91 \
		--offset "0.1cm 0.1cm" --delta "0.3cm 0.3cm" --outfile $@ $<

zip: slides.pdf slides.print.pdf
	rm -f slides.zip
	zip -q slides.zip slides.tex *.pdf *.svg *.png *.jpg *.gif

clean:
	rm -f *~ *.bak *.backup *.log *.toc *.aux *.nav *.out *.snm *.vrb
	rm -f *.handout.*
	rm -f *~ *.dvi *.ps *.pdf *.eps
	rm -rf pythontex-files-slides* *.pytxcode
