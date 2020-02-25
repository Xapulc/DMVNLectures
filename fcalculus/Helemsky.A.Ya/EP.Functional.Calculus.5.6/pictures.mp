input dmvnmpl

verbatimtex
\documentclass{article}
\begin{document}
etex 

beginfig(1);

numeric u;
u := 1cm;
drawarrow (-.5u,0)--(3u,0) sthin;
drawarrow (0,-.5u)--(0,1.25u) sthin;

z0 = (.25u,0);
z1 = (.75u,1u);
z2 = (1.75u,1u);
z3 = (2.25u,0);

z4 = (x1,0);
z5 = (x2,0);

draw (-.25u,0)--z0--z1--z2--z3--(2.5u,0) sbold;

draw z1--z4 sthin;
draw z2--z5 sthin;

mp(0,5);

label.bot(btex $a$ etex, z0);
label.bot(btex $c$ etex, (x1,0));
label.bot(btex $d$ etex, (x2,0));
label.bot(btex $b$ etex, z3);

endfig;

verbatimtex
\end{document}
etex

bye;
