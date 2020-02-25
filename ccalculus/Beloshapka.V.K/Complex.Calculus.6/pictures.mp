input dmvnmpl

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex


% =========================================================
% hydrodynamics
% =========================================================
beginfig(10);

numeric u; u := 1cm;

draw (0,0);

endfig;

% =========================================================
% eliminated set
% =========================================================
beginfig(20);

numeric u; u := 1cm;

z1 = (2u,.25u);
z2 = (2u,-.25u);
z3 = -z1;
z4 = -z2;

path p[];

p1 := z1--z2--z3--z4--cycle;
p2 := p1 rotated 90;



p3 := (.25u,.25u)--z1{dir 180}..{dir 90}(z2 rotated 90)--cycle;

fill p3 wc .8white;

drawarrow (-2.5u,0)--(2.5u,0) sthin;
drawarrow (0,-2.5u)--(0,2.5u) sthin;
draw p1 snorm;
draw p2 snorm;
draw p3 snorm;

z5 = .5(1u,1u);

label.bot(btex $|z_1|$ etex, (2.5u,0));
label.lft(btex $|z_2|$ etex, (2.5u,0)rotated 90);
elabel.top(btex $a$ etex, z5);

bmp(5,5);

endfig;


% =========================================================
% Hartogs figure
% =========================================================
beginfig(30);

numeric u; u := 1cm;

numeric s; s := 1.75u;
numeric w; w := .5u;

z1 = (s,s);
z2 = (s,s-w);
z3 = (.5*w,s-w);
z4 = z3 yscaled (-1);
z5 = z2 yscaled (-1);
z6 = z1 yscaled (-1);
z7 = z6 xscaled (-1);
z8 = z5 xscaled (-1);
z9 = z4 xscaled (-1);
z10 = z3 xscaled (-1);
z11 = z2 xscaled (-1);
z12 = z1 xscaled (-1);

numeric c; c = .92;
z13 = c*z1;
z14 = c*z12;

z16 = -c*z1;
z15 = -c*z12;

path p[];

p1 := z1--z2--z3--z4--z5--z6--z7--z8--z9--z10--z11--z12--cycle;

p2 := (s,.075u)--(s,-.075u);

p3 := (z3--z4--z9--z10--cycle) xscaled .7 yscaled 1.2;

fill p3 wc .8white;

draw p3 dnorm;

drawarrow (-2.5u,0)--(2.5u,0) sthin;
drawarrow (0,-2.5u)--(0,2.5u) sthin;

draw z13--z14 sbold;
draw z15--z16 sbold;

bmp(13,16);

draw p1 snorm;
draw p2 sthin;
draw p2 xscaled -1 sthin;

label.bot(btex $|z_1|$ etex, (2.5u,0));
label.lft(btex $|z_2|$ etex, (2.5u,0)rotated 90);
label.top(btex $1$ etex, (s,.075u));
label.top(btex $-1$ etex, (-s,.075u));

endfig;

verbatimtex \end{document} etex

bye;
