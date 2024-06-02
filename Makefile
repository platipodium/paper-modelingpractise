# SPDX-FileCopyrightText: 2024 Helmholtz-Zentrum hereon GmbH
# SPDX-License-Identifier: CC0-1.0
# SPDX-FieContributor: Carsten Lemmen <carsten.lemmen@hereon.de>
PANDOC=pandoc

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

# Markdown source format with extensions

MDFORMAT=--from=markdown+pipe_tables+simple_tables+multiline_tables+fenced_code_blocks+table_captions+yaml_metadata_block+definition_lists+superscript+subscript+tex_math_dollars+inline_notes+smart

BIBCMD=--citeproc #--biblatex --bibliography $(BIB)
#BIBCMD=

TOCCMD=--toc
TOCCMD=

LTX=
CMD=$(PANDOC) $(MDFORMAT) $(BIBCMD) $(TOCCMD)
TEMPLATE=elsarticle-pandoc-template.tex

## All markdown files in the working directory
#SRC = $(wildcard *.$(MEXT))
SRC = Lemmen2024_Sommer_ecologicalmodelling.$(MEXT)

## Location of Pandoc support files.
PREFIX = $(HOME)/.pandoc

PDF=$(SRC:.md=.pdf)
PPTX=$(SRC:.md=.pptx)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)
DOCX=$(SRC:.md=.docx)
ODT=$(SRC:.md=.odt)
EPUB=$(SRC:.md=.epub)
TXT=$(SRC:.md=.txt)
BIB=$(SRC:.md=.bib)

.PHONY: all pdf html docx odt epub tex txt allbib localbib \
  assets elsevier-logo ecomod-cover

all:  tex pdf
pdf:	$(PDF) $(SRC) Makefile
html:	$(HTML) $(SRC) Makefile
docx: $(DOCX) $(SRC) Makefile
odt:  $(ODT) $(SRC) Makefile
epub: $(EPUB) $(SRC) Makefile
tex:  $(TEX) $(SRC) Makefile
txt:  $(TXT) $(SRC) Makefile

# Pull some files from Elsevier so we don't have to store them on the
# repository
assets: ecomod-cover elsevier-logo
elsevier-logo: ./assets/elsevier-non-solus-new-with-wordmark.pdf
./assets/elsevier-non-solus-new-with-wordmark.svg:
	wget -O $@ https://cdn.elsevier.io/matrix/includes/svg/logo-elsevier-wordmark.svg
./assets/elsevier-non-solus-new-with-wordmark.pdf: ./assets/elsevier-non-solus-new-with-wordmark.svg
	rsvg-convert -f pdf -o $@ $<
ecomod-cover: ./assets/X03043800.jpg
./assets/X03043800.jpg:
	wget -O $@ https://ars.els-cdn.com/content/image/X03043800.jpg

%.txt:	%.md %.bib Makefile
	$(CMD) --to=plain -o $@ $<

%.html:	%.md Makefile assets
	$(CMD) --to=html -o $@ $<

%.epub:	%.md  %.bib Makefile assets
	$(CMD) --to=epub -s -o $@ $<  # --epub-cover-image=cover-image.gif

#%.tex:	%.docx Makefile
#	$(CMD) -s  --from docx --to latex  -o $@ $<
#%.pdf:	%.docx Makefile
#	$(CMD) -s  --from docx --to pdf  -o $@ $<
%.tex:	%.md  %.bib Makefile  style $(TEMPLATE) assets
	$(CMD) -s  --filter divenv.py  --template=./$(TEMPLATE)  -o $@ $<

%.pdf:	%.md  %.bib Makefile  style $(TEMPLATE) assets
	$(CMD) -s  --filter divenv.py  --template=./$(TEMPLATE)  -o $@ $<

%.docx:	%.md  %.bib Makefile pandoc-scholar.docx assets
	$(CMD)--to=docx --reference-doc=pandoc-scholar.docx -s -o $@ $<
#	$(CMD)--to=docx --reference-doc=custom-reference.docx -s -o $@ $<

%.odt:	%.docx Makefile assets
	$(CMD) -s  --from docx --to odt  -o $@ $<

# --reference-doc= --filter pandoc-citeproc --bibliography

clean:
	@rm -f $(PDF) $(SRC:.md=.html) $(SRC:.md=.odt) $(SRC:.md=.docx)
	@rm -f $(PDF:.pdf=.nav) $(PDF:.pdf=.out) $(PDF:.pdf=.tex) $(PDF:.pdf=.snm) $(PDF:.pdf=.toc)
	@rm -f $(PDF:.pdf=.log) $(PDF:.pdf=.synctex.gz) $(PDF:.pdf=.blg)  $(PDF:.pdf=.bbl)
	@rm -f missfont.log $(SRC:.md=.run.xml)
	@rm -f $(EPUB) $(TXT)
	@rm -f allbib.html allbib.pdf

bib:
	pandoc allbib.tex -o allbib.html --citeproc --bibliography Lemmen2024_modelingpractise.md.bib
	pandoc allbib.tex -o allbib.pdf --citeproc --bibliography Lemmen2024_modelingpractise.md.bib

style: ecomod.csl

# This following targets are developer-only ones specific to the developmet
# platform used here and may not work universally
localbib:
	cp $(HOME)/temp/mendeley/MuSSeL-Modelingpractise.bib paper.bib

docker:
	docker run -v $(shell pwd):/home -it ubuntu-pandoc /bin/bash

docker-make:
	docker run -v $(shell pwd):/home -it ubuntu-pandoc make -C /home

declaration: declaration_of_interest.md
	pandoc -o declaration_of_interest.docx $<

Figure_1.pdf: Figure_1.svg
	svg2pdf $< $@

arxiv: tex
	zip Lemmen2024_Sommer_arxiv.zip $(TEX) Figure_1.pdf elsevier.cls
