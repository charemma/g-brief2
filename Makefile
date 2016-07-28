TEX=docker run --rm -it -v `pwd`:/data -w /data charemma/texlive-german rubber
TEXFLAGS='-d'

PLATFORM = $(shell echo `python -c "import sys; print(sys.platform)"`)
VIEWER=xdg-open

ifeq ($(PLATFORM), darwin) 
	VIEWER=open	
endif

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
