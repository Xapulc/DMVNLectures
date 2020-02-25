verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex

beginfig(1);
u=0.75cm;

ahangle := 20;

linejoin:=mitered;
drawarrow (-2u,0)--(5u,0);
drawarrow (0,-.5u)--(0,1.5u);

linejoin:=rounded;

draw (0, 1u)--(3u,1u)--(3u,0) dashed evenly scaled .5;

pickup pencircle scaled 1.25pt;
draw (-1.5u,0)--(1u,0)--(3u,1u)--(4.5u,1u);
label.llft(btex $0$ etex, (0,0));
label.lft(btex $1$ etex, (0,1u));
label(btex $a$ etex, (1u,-.3u));
label(btex $b$ etex, (3u,-.3u));

pickup pencircle scaled 2pt;

draw (0,0);

endfig;

verbatimtex \end{document} etex

bye;
