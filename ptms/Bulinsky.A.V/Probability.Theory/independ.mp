verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex

beginfig(1);

picture p;

p := thelabel(btex $\vDash$ etex, (0,0));

draw p rotated 90;

endfig;

verbatimtex \end{document} etex

bye;
