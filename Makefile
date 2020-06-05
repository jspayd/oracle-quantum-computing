TEX := pdflatex
TEXFLAGS := -shell-escape
SRCDIR := src
OUTDIR := out

SRC := $(wildcard $(SRCDIR)/*.tex)
OUT := $(SRC:$(SRCDIR)/%.tex=$(OUTDIR)/%.pdf)

.PHONY: all
all: $(OUT)

$(OUTDIR)/%.pdf: $(SRCDIR)/%.tex
	mkdir -p $(OUTDIR)
	cd $(SRCDIR) && $(TEX) $(TEXFLAGS) --output-directory=../$(OUTDIR) $(<:$(SRCDIR)/%=%)
	cd $(SRCDIR) && $(TEX) $(TEXFLAGS) --output-directory=../$(OUTDIR) $(<:$(SRCDIR)/%=%)

.PHONY: clean
clean:
	rm -rf $(OUTDIR)
