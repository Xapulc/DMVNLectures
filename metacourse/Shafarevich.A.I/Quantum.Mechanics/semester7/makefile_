DocName = "Quantum Mechanics [7] - A.I. Shafarevich"
RarName = "quantummechanics-7s-shafarevich"

t:
 mp --tex=latex pic.mp
 latex --src $(DocName).tex
 dvips $(DocName).dvi
a: t
 wt $(RarName).rar $(DocName).ps
c:
 del *.dvi *.mpx *.log *.aux *.toc
p: t
 gs -sDEVICE=pdfwrite -sOutputFile=$(DocName).pdf -r1200 -dNOPAUSE -dBATCH -g9912x14028 $(DocName).ps
b: p
 wr $(RarName)-pdf.rar $(DocName).pdf 
all: a b
