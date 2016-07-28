TEX=docker run --rm -it -v `pwd`:/data -w /data charemma/texlive-german rubber
TEXFLAGS='-d'
VIEWER=xdg-open

gbrief=g-brief

input=$(gbrief).tex
output=$(gbrief).pdf


all: $(output) 
	$(VIEWER) $<

$(output): $(input)
	$(TEX) $(TEXFLAGS) $<

show:
	$(VIEWER) $(output)

clean:
	@rm -f *.aux *.log

distclean:
	@$(MAKE) clean ; rm $(output)
