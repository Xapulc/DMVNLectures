verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex

input dmvnmac.mp

beginfig(10);
numeric u;
u :=0.75cm;
z1 = (0,0);
z2 = (-.25u,0);
z3 = (0,-.25u);
z4 = (3u,0);
z5 = (0,1.5u);
numeric lambda;
lambda := .3;
z6 = (lambda * u,1u);
z7 = (2*lambda * u,0);
z8 = (2u,0);
z9 = (0,ypart z6);
arrowon;

drawarrow z2--z4;
drawarrow z3--z5;

arrowoff;

draw z6--z9 dashed evenly scaled .5;

draw z1--z6--z7--z8 withpen pencircle scaled 1pt;

mp(1,1);
mp(7,9);


label.lft(btex $1$ etex, z9);
label.lrt(btex $0$ etex, z1);
label.bot(btex $\frac{1}{n}$ etex, z7);
label.bot(btex $x$ etex, z4);
label.bot(btex $1$ etex, z8);

endfig;


verbatimtex
  \end{document}
etex

bye
