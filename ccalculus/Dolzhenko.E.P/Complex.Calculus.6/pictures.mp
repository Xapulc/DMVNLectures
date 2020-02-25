input dmvnmpl

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex


beginfig(10);

numeric u; u := .75cm;

z1 = (0,0);
z2 = (1u,0);
z3 = (1u,1u);
z4 = (0u,1u);

path p[];

p1 := z1--z2--z3--z4--cycle;
p2 := (p1 scaled 1.25) shifted (-.55u,-.75u);

p3 := ((z1--z4) cutbefore p2)--z3--z2--((z1--z2) cutbefore p2);
p4 := (p2 cutbefore (z1--z2)) cutafter (z1--z4);
p5 := p3--p4--cycle;

z5 = (1pt,1pt);

draw p1 shifted z5 dthin scaled .5pt;
draw p5 shifted z5 snorm;

draw p2 snorm;




endfig;

verbatimtex \end{document} etex

bye;
