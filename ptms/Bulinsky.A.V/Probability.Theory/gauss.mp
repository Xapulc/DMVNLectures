verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex

beginfig(1);
u=1cm;

ahangle := 20;

linejoin:=mitered;
drawarrow (-3.5,0)*u--(3.5,0)*u;
drawarrow (0,-.5)*u--(0,2)*u;

linejoin:=rounded;

% draw (0, 1u)--(4u,1u) dashed evenly scaled .5;
label.llft(btex $0$ etex, (0,0));

pickup pencircle scaled 1.25pt;
numeric d;
d := .5;
draw (-3.1,0)*u
for i = -3 step .2 until 3:
..(i, 1/(d * sqrt(6.28))*(2.818**(-i*i/(2*d**2))))*u
endfor;

d := .25;
draw (-3.1,0)*u
for i = -3 step .1 until 3:
..(i, 1/(d * sqrt(6.28))*(2.818**(-i*i/(2*d**2))))*u
endfor;
pickup pencircle scaled 2pt;

draw (0,0);

endfig;

verbatimtex \end{document} etex

bye;
