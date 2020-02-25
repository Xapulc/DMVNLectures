input dmvnmpl;

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex

beginfig(1);
numeric u; u = .75cm;

z1 = (0,0);
z2 = (5u,0);
z3 = (0,3u);
z4 = .15[z1,z2];
z5 = .4[z1,z2];
z6 = (0,1u);
z7 = (0,2u);
z8 = (x4,y6);
z9 = (x5,y7);
z10= (x5,y6);
z11= .85[z1,z2];
z12= (x11,y7);


drawarrow z1--z2 sthin;
drawarrow z1--z3 sthin;

drawarrow z1--z4 snorm;
drawarrow z8--z10 snorm;
drawarrow z9--z12 snorm;

draw z6--z8 dthin;
draw z7--z9 dthin;
draw z4--z8 dthin;
draw z5--z9 dthin;
draw z11--z12 dthin;

label.bot(btex $S_0$ etex, z1);
label.bot(btex $S_1$ etex, z4);
label.bot(btex $S_2$ etex, z5);
label.bot(btex $S_3$ etex, z11);
label.lft(btex $1$ etex, z6);
label.lft(btex $2$ etex, z7);

bmp(1,1);
bmp(5,9);
bmp(11,11);


endfig;

bye;
