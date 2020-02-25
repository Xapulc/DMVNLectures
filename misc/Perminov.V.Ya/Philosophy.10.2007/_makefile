DocName = "Philosophy [10] - V.Ya. Perminov"
RarName = "philosophy-10s-perminov"

z = .000000000
s = .333333333
d = .666666666

t:
 mp -tex=latex pictures.mp
 latex --src $(DocName).tex
 makeindex $(DocName).idx
 dvips $(DocName).dvi
a: t
 wt $(RarName).rar $(DocName).ps
c:
 del *.dvi *.mpx *.log *.aux *.toc
p: t
 gswin32c -sDEVICE=pdfwrite -sOutputFile=$(DocName).pdf -r1200 -dNOPAUSE -dBATCH -g9912x14028 $(DocName).ps
b: p
 wr $(RarName)-pdf.rar $(DocName).pdf
all: a b
pda:
 cp $(DocName).tex $(DocName)-PDA.tex 
pdall:
 latex --src $(DocName)-PDA.tex
 makeindex $(DocName)-PDA.idx
 dvips $(DocName)-PDA.dvi
 gswin32c -sDEVICE=pdfwrite -sOutputFile=$(DocName)-PDA.pdf -r1200 -dNOPAUSE -dBATCH -g9912x14028 $(DocName)-PDA.ps
 wt $(RarName)-pda.rar $(DocName)-PDA.ps
 wr $(RarName)-pdf-pda.rar $(DocName)-PDA.pdf
nine:
 pstops 9:0@$(s)($(z)w,$(z)h)+1@$(s)($(s)w,$(z)h)+2@$(s)($(d)w,$(z)h)+3@$(s)($(z)w,$(s)h)+4@$(s)($(s)w,$(s)h)+5@$(s)($(d)w,$(s)h)+6@$(s)($(z)w,$(d)h)+7@$(s)($(s)w,$(d)h)+8@$(s)($(d)w,$(d)h) $(DocName).ps $(DocName)-9.ps
