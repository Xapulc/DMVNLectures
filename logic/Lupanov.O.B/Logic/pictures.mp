verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
  \footnotesize
etex

% Functional element scheme ===========================================================================

beginfig(10);

numeric u; u=.5cm;

z6 = (0,0);
z5 = (-2u, 1u);
z7 = (2u, 1u);
z4 = (2u, 2u);
z3 = (-2u,2u);
z1 = (-2u,3u);
z2 = (2u,3u);

z = (0,.2u);

draw z6--z7--z4--z2--z3--z5--z6;
draw z3--z1--z4;

label.top(btex $\&$ etex, z6);
label.bot(btex $6\,*$ etex, z6);

label.lft(btex $5$ etex, z5);
label.rt(btex $\neg$ etex, z5);
label.lft(btex $3$ etex, z3);
label.rt(btex $\&$ etex, z3-z);
label.lft(btex $1$ etex, z1);
label.top(btex $x_1$ etex, z1+z);
label.rt(btex $2$ etex, z2);
label.top(btex $x_2$ etex, z2+z);
label.rt(btex $4$ etex, z4);
label.lft(btex $\vee$ etex, z4-z);

pickup pencircle scaled 2pt;
draw z3;
draw z4;
draw z5;

pickup pencircle scaled 3pt;
draw z1;
draw z2;
draw z6;

endfig;


% Contact scheme ===========================================================================

beginfig(20);

def circ(expr a, b) =
  save c;
  path c;
  c := fullcircle scaled .5u shifted (b);
  fill c withcolor white;
  pickup pencircle scaled .25pt;
  draw c;
  label(a, b);
enddef;

numeric u; u=1cm;

z1 = (0u,0u);
z2 = (1u,1u);
z3 = (3u,1u);
z4 = (4u,0u);
z5 = (3u,-1u);
z6 = (1u,-1u);

z7 = .5[z1,z4];

draw z1--z2--z3--z4--z5--z6--z1;
draw z2--z5;
draw z3--z6;

label.lft(btex $a$ etex, z1);
label.rt(btex $b$ etex, z4);

circ(btex $\overline{x}_1$ etex, .5[z1,z6]);
circ(btex $\overline{x}_2$ etex, .5[z7,z6]);
circ(btex $\overline{x}_2$ etex, .5[z7,z5]);
circ(btex $\overline{x}_3$ etex, .5[z4,z5]);
circ(btex $x_1$ etex, .5[z1,z2]);
circ(btex $x_2$ etex, .5[z2,z3]);
circ(btex $x_3$ etex, .5[z3,z4]);
circ(btex $x_2$ etex, .5[z5,z6]);

pickup pencircle scaled 2pt;
draw z2;
draw z3;
draw z5;
draw z6;

pickup pencircle scaled 3pt;
draw z1;
draw z4;

endfig;

% Upper bound of scheme complexity for CS =========================================================

beginfig(30);

def circ(expr a, b) =
  begingroup
  save c;

  path c;
  c := fullcircle scaled .6u shifted (b);
  fill c withcolor white;
  pickup pencircle scaled .25pt;
  draw c;

  label(a, b);
  endgroup
enddef;

numeric u; u=1cm;

z1 = (0u,0u);

z2 = (1u,1.5u);
z3 = (3u,1.5u);
z4 = (5u,1.5u);
z5 = (6u,1.5u);

z6 = (7u,0u);

z7 = (1.5u,0);
z8 = (3.5u,0);
z9 = (5u,0);
z10 = (6u,0);

z11 = (1u,-1.5u);
z12 = (3u,-1.5u);
z13 = (5u,-1.5u);
z14 = (6u,-1.5u);

draw z1--z2--z3--z4;
draw z5--z6;
draw z1--z7--z8--z9;
draw z10--z6;
draw z1--z11--z12--z13;
draw z14--z6;

draw z4--z5 dashed evenly;
draw z9--z10 dashed evenly;
draw z13--z14 dashed evenly;

label.lft(btex $a$ etex, z1);
label.rt(btex $b$ etex, z6);

circ(btex $a_1^{12}$ etex, .5[z1,z2]);
circ(btex $a_2^{13}$ etex, .5[z2,z3]);
circ(btex $a_3^{14}$ etex, .5[z3,z4]);
circ(btex $a_n^{1n}$ etex, .5[z5,z6]);

circ(btex $a_1^{21}$ etex, .5[z1,z7]);
circ(btex $a_2^{22}$ etex, .5[z7,z8]);
circ(btex $a_3^{23}$ etex, .5[z8,z9]);
circ(btex $a_n^{2n}$ etex, .5[z10,z6]);

circ(btex $a_1^{s1}$ etex, .5[z1,z11]);
circ(btex $a_2^{s2}$ etex, .5[z11,z12]);
circ(btex $a_3^{s3}$ etex, .5[z12,z13]);
circ(btex $a_n^{sn}$ etex, .5[z14,z6]);

pickup pencircle scaled 1pt;

z20 = (2u,-.75u);
z40 = (5u,-.75u);
z30 = .5[z20,z40];
draw z20;
draw z30;
draw z40;

pickup pencircle scaled 2pt;
draw z2;
draw z3;
draw z4;
draw z5;
draw z7;
draw z8;
draw z9;
draw z10;
draw z11;
draw z12;
draw z13;
draw z14;

pickup pencircle scaled 3pt;
draw z1;
draw z6;

endfig;

% Function building ==========================================================================================

beginfig(40);

def circ(expr a, b) =
  begingroup
  save c;

  path c;
  c := fullcircle scaled .5u shifted (b);
  fill c withcolor white;
  pickup pencircle scaled .25pt;
  draw c;

  label(a, b);
  endgroup
enddef;


numeric u; u=1cm;

z0 = (0,0);
z1 = (1u,1u);
z2 = (2u,0);
z3 = (2.5u,.5u);

draw z0--z1--z2;

circ(btex $x_n$ etex, .5[z0,z1]);
circ(btex $\overline{x}_n$ etex, .5[z1,z2]);

label.top(btex $1$ etex, z1);
label.top(btex $0$ etex, z3);

label.rt(btex {\footnotesize Изолированная} etex, z3);
label.rt(btex {\footnotesize вершина} etex, z3 + (.45u, -.3u));
label.rt(btex {\footnotesize Вход} etex, z1);


pickup pencircle scaled 2pt;
draw z0;
draw z2;

pickup pencircle scaled 3pt;
draw z1;
draw z3;

endfig;

% Function construction: FES =========================================================================

beginfig(50);

def lin(expr a, b) =
begingroup
  draw (a) -- (b) withpen pencircle scaled .5pt;
  draw a withpen pencircle scaled 2pt;
  draw b withpen pencircle scaled 2pt;
endgroup
enddef;

def triangle(expr a, b) =
begingroup
  save verl, verr;
  pair verr, verl;
  verr = ( .3u, .5u);
  verl = (-.3u, .5u);

  draw (b)--(b + verr)--(b + verl)--cycle withpen pencircle scaled .5pt;
  draw b withpen pencircle scaled 2pt;

  label(a, b + (0,.35u));
endgroup
enddef;

numeric u; u=1cm;

z0 = (0u,0u);
z1 = (.5u,.75u);
z2 = (-.5u,.75u);
z3 = (-1u,1.5u);

z4 = (-.2u,.5u);
z5 = (.2u,.5u);

z6 = z1 + (-.2u,.5u);
z7 = z1 + (.2u,.5u);

z8 = z2 + (-.2u,.5u);
z9 = z2 + (.2u,.5u);

pair axe;
pair gzero;
pair gone;
pair tp;

axe = (-.5u, 2.5u);
gzero = (.5u, 2.5u);
gone = (1u, 2u);
tp = z3 + (0,.5u);


triangle(btex $\vee$ etex, z0);
triangle(btex $\&$ etex, z1);
triangle(btex $\&$ etex, z2);
triangle(btex $\neg$ etex, z3);

pickup pencircle scaled 2pt;
lin(z4, z2);
lin(z5, z1);

lin(z6, axe);
lin(z7, gone);

lin(z8, z3);
lin(z9, gzero);

lin(axe, tp);

label.top(btex $x_{i+1}$ etex, axe);
label.top(btex $g_{ij}(0,x_{i+2},\dots,x_n)$ etex, gzero + (1u,0));
label.top(btex $g_{ij}(1,x_{i+2},\dots,x_n)$ etex, gone + (1u,0));
label.rt(btex $g_{ij}(x_{i+1},\dots,x_n)$ etex, z0);

endfig;

% "Konfeta" =================================================================================================
beginfig(60);

def lin(expr a, b) =
begingroup
  draw (a) -- (b) withpen pencircle scaled .5pt;
  draw a withpen pencircle scaled 2pt;
  draw b withpen pencircle scaled 2pt;
endgroup
enddef;

def triangle(expr a, b) =
begingroup
  save verl, verr;
  pair verr, verl;
  verr = ( .3u, .5u);
  verl = (-.3u, .5u);

  draw (b)--(b + verr)--(b + verl)--cycle withpen pencircle scaled .5pt;
  draw b withpen pencircle scaled 2pt;

  label(a, b + (0,.35u));
endgroup
enddef;

def circ(expr a, b) =
  begingroup
  save c;

  path c;
  c := fullcircle scaled .5u shifted (b);
  fill c withcolor white;
  pickup pencircle scaled .25pt;
  draw c;

  label(a, b);
  endgroup
enddef;

def oval(expr a, b) =
  begingroup
  save c;

  path c;
  c := (fullcircle scaled .5u) xscaled 2 shifted (b);
  fill c withcolor white;
  pickup pencircle scaled .25pt;
  draw c;

  label(a, b);
  endgroup
enddef;

numeric u; u=1cm;

z1 = (0u,0u);

z2 = (1u,1u);
z3 = (3u,1u);
z4 = (5u,1u);
z5 = (6u,1u);
z6 = (8u,1u);

z7 = (9u,0u);

z8 = (1u,-1u);
z9 = (3u,-1u);
z10 = (5u,-1u);
z11 = (6u,-1u);
z12 = (8u,-1u);

draw z8--z1--z2--z3--z4--z9--z10--z3--z8--z9--z2;

draw z6--z7--z12--z5--z6--z11--z12;

draw z4--z5 dashed evenly;
draw z10--z11 dashed evenly;

pickup pencircle scaled 2pt;

draw z2;
draw z3;
draw z4;
draw z5;
draw z6;

draw z8;
draw z9;
draw z10;
draw z11;
draw z12;

pickup pencircle scaled 3pt;

draw z1;
draw z7;

label.lft(btex $a$ etex, z1);
label.rt(btex $b$ etex, z7);


circ(btex $x_{n}$ etex, .5[z1,z2]);

oval(btex $\overline{x}_{n-1}$ etex, .5[z2,z3]);
oval(btex $\overline{x}_{n-2}$ etex, .5[z3,z4]);
circ(btex $\overline{x}_{2}$ etex, .5[z5,z6]);
circ(btex $\overline{x}_{1}$ etex, .5[z6,z7]);

oval(btex $x_{n-1}$ etex, .25[z2,z9]);
oval(btex $x_{n-1}$ etex, .25[z8,z3]);
oval(btex $x_{n-2}$ etex, .25[z3,z10]);
oval(btex $x_{n-2}$ etex, .25[z9,z4]);

circ(btex $\overline{x}_{n}$ etex, .5[z1,z8]);
oval(btex $\overline{x}_{n-1}$ etex, .5[z8,z9]);
oval(btex $\overline{x}_{n-2}$ etex, .5[z9,z10]);
circ(btex $\overline{x}_{2}$ etex, .5[z11,z12]);
circ(btex $x_1$ etex, .5[z12,z7]);

endfig;

% Treeeeeeeeeeeeeees =============================================================================================

beginfig(70);

def circ(expr a, b) =
  begingroup
  save c;

  path c;
  c := fullcircle scaled .3u shifted (b);
  fill c withcolor white;
  pickup pencircle scaled .25pt;
  draw c;

  label(a, b);
  endgroup
enddef;

numeric u; u=1cm;

z1 = (0u,0u);

z2 = (-1u,1u);
z3 = (1u,1u);

z4 = (-1.6u, 1.75u);
z5 = (-.4u, 1.75u);
z6 = (.4u, 1.75u);
z7 = (1.6u, 1.75u);

z8 = (-1.95u, 2.25u);
z9 = (-1.25u, 2.25u);
z10 = (-.75u, 2.25u);
z11 = (-.05u, 2.25u);

z12 = (.05u, 2.25u);
z13 = (.75u, 2.25u);
z14 = (1.25u, 2.25u);
z15 = (1.95u, 2.25u);

draw z1--z2;
draw z1--z3;

draw z2--z4;
draw z2--z5;

draw z3--z6;
draw z3--z7;

draw z4--z8;
draw z4--z9;

draw z5--z10;
draw z5--z11;

draw z6--z12;
draw z6--z13;
draw z7--z14;
draw z7--z15;

pair s;
s = (5u, 0);
draw currentpicture shifted s;

circ(btex $0$ etex, s+.5[z1,z2]);
circ(btex $1$ etex, s+.5[z1,z3]);
circ(btex $0$ etex, s+.5[z2,z4]);
circ(btex $1$ etex, s+.5[z2,z5]);
circ(btex $1$ etex, s+.5[z3,z6]);
circ(btex $0$ etex, s+.5[z3,z7]);
circ(btex $0$ etex, s+.5[z4,z8]);
circ(btex $1$ etex, s+.5[z4,z9]);
circ(btex $1$ etex, s+.5[z5,z10]);
circ(btex $0$ etex, s+.5[z5,z11]);
circ(btex $1$ etex, s+.5[z6,z12]);
circ(btex $0$ etex, s+.5[z6,z13]);
circ(btex $0$ etex, s+.5[z7,z14]);
circ(btex $1$ etex, s+.5[z7,z15]);

circ(btex $0$ etex, .5[z1,z2]);
circ(btex $1$ etex, .5[z1,z3]);
circ(btex $0$ etex, .5[z2,z4]);
circ(btex $1$ etex, .5[z2,z5]);
circ(btex $1$ etex, .5[z3,z6]);
circ(btex $1$ etex, .5[z3,z7]);
circ(btex $0$ etex, .5[z4,z8]);
circ(btex $1$ etex, .5[z4,z9]);
circ(btex $1$ etex, .5[z5,z10]);
circ(btex $1$ etex, .5[z5,z11]);
circ(btex $1$ etex, .5[z6,z12]);
circ(btex $1$ etex, .5[z6,z13]);
circ(btex $1$ etex, .5[z7,z14]);
circ(btex $1$ etex, .5[z7,z15]);

endfig;

% Even-function trees =============================================================================================
beginfig(80);

def circ(expr a, b) =
  begingroup
  save c;

  path c;
  c := fullcircle scaled .4u shifted (b);
  fill c withcolor white;
  pickup pencircle scaled .25pt;
  draw c;

  label(a, b);
  endgroup
enddef;

numeric u; u=1cm;

z1 = (0u,0u);
z2 = (-1u,1u);
z3 = (1u,1u);

draw z2--z1--z3;

pair s;
s = (3u, 0);

pair su;
su = (0,.1u);

draw currentpicture shifted s;

circ (btex $1$ etex, z1);
circ (btex $1$ etex, z2);
circ (btex $0$ etex, z3);

label.llft(btex $0$ etex, .5[z1,z2]+su);
label.lrt(btex $1$ etex, .5[z1,z3]+su);

circ (btex $0$ etex, z1+s);
circ (btex $0$ etex, z2+s);
circ (btex $1$ etex, z3+s);

label.llft(btex $0$ etex, .5[z1,z2]+su+s);
label.lrt(btex $1$ etex, .5[z1,z3]+su+s);

endfig;

% Even-function Moore diagram ===================================================================================

beginfig(90);

def circ(expr a, b) =
  begingroup
  save c;

  path c;
  c := fullcircle scaled .5u shifted (b);
  fill c withcolor white;
  pickup pencircle scaled .25pt;
  draw c;

  label(a, b);
  endgroup
enddef;

numeric u; u=1cm;

linejoin := mitered;
ahangle := 20;

z1 = (-.75u,0);
z2 = (+.75u,0);

pair h;
h = (0,.2u);

path cl, cr;
cl := fullcircle scaled .5u shifted z1;
cr := fullcircle scaled .5u shifted z2;

pair lp;

lp = (z1 + h -- z1+h-(1u,0)) intersectionpoint cl;

pair s;
s = (1u,0);

drawarrow z1+h-s--lp;
draw z1+h-s--z2+h+s--z2-h+s--z1-h-s--z1+h-s;

drawarrow z2-h+s--(-lp);

circ(btex $0$ etex, z1);
circ(btex $1$ etex, z2);

label.top(btex $(1,1)$ etex, .5[z1+h,z2+h]);
label.bot(btex $(1,0)$ etex, .5[z1-h,z2-h]);
label.lft(btex $(0,0)$ etex, z1-s);
label.rt(btex $(0,1)$ etex, z2+s);

endfig;

% Wait function ==========================================================================================
beginfig(100);

def circ(expr a, b) =
  begingroup
  save c;

  path c;
  c := fullcircle scaled .5u shifted (b);
  fill c withcolor white;
  pickup pencircle scaled .25pt;
  draw c;

  label(a, b);
  endgroup
enddef;

numeric u; u=1cm;

linejoin := mitered;
ahangle := 20;

z1 = (-.75u,0);
z2 = (+.75u,0);

pair h;
h = (0,.2u);

path cl, cr;
cl := fullcircle scaled .5u shifted z1;
cr := fullcircle scaled .5u shifted z2;

pair lp;

lp = (z1 + h -- z1+h-(1u,0)) intersectionpoint cl;

pair s;
s = (1u,0);

drawarrow z1+h-s--lp;
draw z1+h-s--z2+h+s--z2-h+s--z1-h-s--z1+h-s;

drawarrow z2-h+s--(-lp);

circ(btex $0$ etex, z1);
circ(btex $1$ etex, z2);

label.top(btex $(1,0)$ etex, .5[z1+h,z2+h]);
label.bot(btex $(0,1)$ etex, .5[z1-h,z2-h]);
label.lft(btex $(0,0)$ etex, z1-s);
label.rt(btex $(1,1)$ etex, z2+s);

endfig;

% Device ========================================================================================================
beginfig(110);

def circ(expr a, b) =
  begingroup
  save c;

  path c;
  c := fullcircle scaled .5u shifted (b);
  fill c withcolor white;
  pickup pencircle scaled .25pt;
  draw c;

  label(a, b);
  endgroup
enddef;

numeric u; u=1cm;

linejoin := mitered;
ahangle := 20;

def wait(expr a) =
begingroup
  save c;
  path c;
  c := a+(.1u,.25u)--a+(-.1u,.25u)--a+(-.1u,-.25u)--a+(.1u,-.25u)--cycle;
  fill c withcolor .75white;
  draw c;
endgroup
enddef;

draw (0,.5u)--(3u,.5u)--(3u,-.5u)--(0,-.5u)--cycle;
drawarrow (2u,-.5u)--(2u,-1u)--(4u,-1u)--(4u,1u)--(2u,1u)--(2u,.5u);
drawarrow (2.75u,-.5u)--(2.75u,-.75u)--(3.25u,-.75u)--(3.25u,.75u)--(2.75u,.75u)--(2.75u,.5u);

wait((3.25u,0));
wait((4u,0));

draw (.25u,.5u)--(.25u,.6u);
draw (1u,.5u)--(1u,.6u);
draw (.25u,-.5u)--(.25u,-.6u);
draw (1u,-.5u)--(1u,-.6u);

def threed(expr a) =
begingroup;
draw a withpen pencircle scaled 1pt;
draw a-(.1u,0) withpen pencircle scaled 1pt;
draw a+(.1u,0) withpen pencircle scaled 1pt;
endgroup
enddef;

label.top(btex $\alpha_1$ etex, (.25u,.5u));
label.top(btex $\alpha_n$ etex, (1u,.5u));

label.bot(btex $\omega_1$ etex, (2u,.5u));
label.bot(btex $\omega_l$ etex, (2.75u,.5u));

label.top(btex $g_1$ etex, (2u,-.5u));
label.top(btex $g_l$ etex, (2.75u,-.5u));

label.bot(btex $f_1$ etex, (.25u,-.55u));
label.bot(btex $f_m$ etex, (1u,-.55u));

threed(.5[(.25u,.7u),(1u,.7u)]);
threed(.5[(.25u,-.8u),(1u,-.8u)]);

threed(.5[(2u,.3u),(2.75u,.3u)]);
threed(.5[(2u,-.3u),(2.75u,-.3u)]);

threed(.5[(3.25u,0),(4u,0)]);

endfig;

verbatimtex
  \end{document}
etex

bye;
