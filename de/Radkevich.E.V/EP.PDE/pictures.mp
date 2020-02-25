input dmvnmpl;

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \footnotesize
etex

beginfig(1);
numeric u; u = 1cm;

numeric r; r = 2u;

z0 = (0,0);
z1 = (1.25r,0);
z2 = (0, 1.25r);

z3 = (r,0);
z4 = (0,r);

z5 = .3(z3 + z4);
path p[];

p1 := subp(fullcircle scaled 2r shifted z0, 0, .25);

drawarrow z0--z1 sthin;
drawarrow z0--z2 sthin;
draw z0--p1--cycle sbold;

bmp(0,0);
bmp(3,4);

label.llft(btex $O$ etex, z0);
label.bot(btex $A$ etex, z3);
label.lft(btex $B$ etex, z4);

label(btex $\Omega$ etex, z5);

label.urt(btex $\pf{u}{\nu} = 0$ etex, relpoint(p1,.5));
label.bot(btex $u = r^2-2r$ etex, .5[z0,z3]);
label.lft(btex $u = 0$ etex, .5[z0,z4]);

endfig;

bye;
