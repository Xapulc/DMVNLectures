verbatimtex
  \documentclass[a4paper]{article}
  \usepackage{dmvn}
  \begin{document}
etex

beginfig(1);
picture p;
p := thelabel(btex $\Kf$ etex, (0,0));

draw p xscaled -1;
endfig;
verbatimtex
  \end{document}
etex

bye;
