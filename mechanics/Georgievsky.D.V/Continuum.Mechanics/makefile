DocName = "Continuum Mechanics - D.V. Georgievsky"
RarName = "continuummechanics-georgievsky"

t:
 latex --src $(DocName).tex
 dvips $(DocName).dvi
a: t
 wt $(RarName).rar *.ps
c:
 rm *.dvi *.mpx *.log *.aux *.toc
p: t
 gs -sDEVICE=pdfwrite -sOutputFile=$(DocName).pdf -r1200 -dNOPAUSE -dBATCH -g9912x14028 $(DocName).ps
b: p
 wr $(RarName)-pdf.rar *.pdf 
all: a b
