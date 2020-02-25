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

draw (0, 1u)--(4u,1u) dashed evenly scaled .5;
for i = 1 upto 4:
draw (i, .1)*u--(i,-.1)*u;
label.bot(char(48+i), (i,0)*u);
endfor

label.llft(btex $0$ etex, (0,0));
label.lft(btex $1$ etex, (0,1u));


pickup pencircle scaled 1.25pt;

draw (-1.5u,0)-- (0,0)
for i = 0 step .5 until 4.5:
..(i, 1-2.818**(-i))*u
endfor;

pickup pencircle scaled 2pt;

draw (0,0);

endfig;

verbatimtex \end{document} etex

bye;
