# This script is written by DichlofoS Systems, Inc
# ------------------------------------------------
for i in *.tex; do latex --src $i; done;
for i in *.dvi; do dvips $i; done;
for i in *.ps; do
  gswin32c -sDEVICE=pdfwrite -sOutputFile=$i"f" -r1200 -dNOPAUSE -dBATCH -g9912x14028 $i;
done;
