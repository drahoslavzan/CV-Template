LATEX=lualatex
doc=cv
VIEW=evince

.PHONY: en show clean

en: $(doc).tex
	$(LATEX) $<

show:
	$(VIEW) $(doc).pdf

clean:
	rm -f *.{aux,log,out}
