input dmvnmpl;

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage{dmvn}
  \begin{document}
  \footnotesize
etex

% =================================
% ShtrichPath
% =================================
vardef spath(expr p, st) =
  for i = 0 step st until 1: draw relpoint(p,i)--(relpoint(p,i) + (unitvector(reldir(p,i)) scaled .075u rotated 45)); endfor
enddef;

% ===============================================
% nullpicture
% ===============================================
beginfig(0);
numeric u; u = 1cm;

label(btex \framebox{[NO PICTURE AVAILABLE YET]} etex, origin);

endfig;


% ===============================================
% arbitrary graph example
% ===============================================
beginfig(1);
numeric u; u = 1cm;

endfig;

% ===============================================
% K-5 graph
% ===============================================
beginfig(2);
numeric u; u = 1cm;

for i = 0 upto 4: z[i] = (1u,0) rotated (360i/5); endfor

for i = 0 upto 4:
  for j = i+1 upto 4:
    subdrawn(z[i]--z[j],.2,.8);
  endfor
endfor

bmp(0,4);

endfig;

% ===============================================
% K-3-3 graph
% ===============================================
beginfig(3);
numeric u; u = 1cm;

z1 = (0,0);
z2 = (1u,0);
z3 = (2u,0);
z4 = (0,1u);
z5 = (1u,1u);
z6 = (2u,1u);

numeric ep; ep = .2;

subdrawn(z1--z4,ep,1-ep);
subdrawn(z1--z5,ep,1-ep);
subdrawn(z1--z6,ep,1-ep);
subdrawn(z2--z4,ep,1-ep);
subdrawn(z2--z5,ep,1-ep);
subdrawn(z2--z6,ep,1-ep);
subdrawn(z3--z4,ep,1-ep);
subdrawn(z3--z5,ep,1-ep);
subdrawn(z3--z6,ep,1-ep);

bmp(1,6);

endfig;


% ===============================================
% Tree count - skeleton
% ===============================================

beginfig(4);
numeric u; u = 1cm;

numeric h; h = .4u;

z1 = (0,0);
z2 = (-.5u,.5h);
z3 = (-.5u,1.5h);
z4 = (-.5u,-.5h);
z5 = (-.5u,-1.5h);

z6 = (5u,0);
z7 = (3u,0);
z8 = (4u,0);

draw z1--z2 snorm;
draw z1--z3 snorm;
draw z1--z4 snorm;
draw z1--z5 snorm;

draw z1--z7 snorm;
draw z8--z6 snorm;

z9 = (.5u,0);
z10 = (1u,0);
z11 = (1.5u,0);
z12 = (2.5u,0);
z13 = (4.5u,0);

bmp(1,6);
bmp(9,13);

draw (3.25u,0) wppc scaled 1.5bp;
draw (3.5u,0) wppc scaled 1.5bp;
draw (3.75u,0) wppc scaled 1.5bp;


label.bot(btex $0$ etex, z1);
label.bot(btex $1$ etex, z9);
label.bot(btex $2$ etex, z10);
label.bot(btex $t$ etex, z6);

endfig;

% ===============================================
% Tree count - subtrees
% ===============================================

beginfig(5);
numeric u; u = 1cm;

z1 = (0,0);
z2 = (0,.5u);
z3 = (0,1u);

z4 = (2u,0);
z5 = (2.25u,.5u);
z6 = (1.75u,.5u);

draw z1--z2--z3 snorm;
draw z5--z4--z6 snorm;

bmp(1,6);

endfig;

% ===============================================
% ===============================================
% ===============================================

vardef longarcu(expr w) =
  save p; path p[];
  p0 := fullcircle scaled 2h;
  p1 := (reverse subp(p0, .25,.5)) shifted (-.5w+h,0);
  p2 := (reverse subp(p0,0,.25)) shifted (.5w-h,0);
  p3 := p1--p2;
  (p3)
enddef;

vardef longarcl(expr w) =
  save p; path p[];
  p0 := fullcircle scaled 2h;
  p1 := (reverse subp(p0, .25,.5)) shifted (-.5w+h,0) reflectedabout ((0,0),(1,0));
  p2 := (reverse subp(p0,0,.25)) shifted (.5w-h,0) reflectedabout ((0,0),(1,0));
  p3 := p1--p2;
  (p3)
enddef;

def darcu(expr w, t) =
  draw longarcu(w) shifted (upos + .5w,0) sthin;
  label.top(t, (upos+.5w,h));
  upos := upos + w;
enddef;

def darcl(expr w, t) =
  draw longarcl(w) shifted (lpos + .5w,0) sthin;
  label.bot(t, (lpos+.5w,-h));
  lpos := lpos + w;
enddef;

% ===============================================
% Words example
% ===============================================

beginfig(6);
numeric u; u = 1cm;

numeric h; h = .2u;
numeric upos; upos = 0;
numeric lpos; lpos = 0;

darcu(2u, btex $a_{i_1}$ etex);
darcu(1.5u, btex $a_{i_2}$ etex);
darcu(.75u, btex $a_{i_3}$ etex);
darcu(1.5u, btex $a_{i_4}$ etex);
darcu(2u, btex $a_{i_5}$ etex);
darcu(1.5u, btex $a_{i_6}$ etex);
darcu(.75u, btex $a_{i_7}$ etex);

darcl(1.5u, btex $a_{j_1}$ etex);
darcl(1.75u, btex $a_{j_2}$ etex);
darcl(1u, btex $a_{j_3}$ etex);
darcl(.75u, btex $a_{j_4}$ etex);
darcl(1.25u, btex $a_{j_5}$ etex);
darcl(1u, btex $a_{j_6}$ etex);
darcl(1u, btex $a_{j_7}$ etex);
darcl(.5u, btex $a_{j_8}$ etex);
darcl(1.25u, btex $a_{j_9}$ etex);

draw (0,0)--(upos,0) snorm;

endfig;

% ===============================================
% Words: four cases of intersection
% ===============================================

beginfig(7);
numeric u; u = 1cm;

numeric h; h = .2u;

path p[];

numeric w; w = 1.2u;

p1 := longarcu(w) shifted (.25w,0);
p2 := longarcl(w) shifted (-.25w,0);
p3 := (-2u,0)--(2u,0);

pair SH; SH = (1u,0);

z0 = (2.5u,.5u);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
draw p1 shifted -SH shifted (-x0,y0) sthin;
draw p2 shifted -SH shifted (-x0,y0) sthin;

draw p1 shifted SH shifted (-x0,y0) sthin;
draw p2 shifted SH shifted (-x0,y0) sthin;

draw p3 shifted (-x0,y0) snorm;

label(btex \emph{à)} etex, (-x0-2.3u,y0));

p10 := bop(p1 shifted -SH shifted (-x0,y0))--eop(p2 shifted -SH shifted (-x0,y0));
p11 := bop(p1 shifted SH shifted (-x0,y0))--eop(p2 shifted SH shifted (-x0,y0));

spath(p10,.1);
spath(p11,.1);


z1 = bop(p10);
z2 = bop(p11);

draw ((x1,.4u)--(x2,.4u)--(x2,-.4u)--(x1,-.4u)--cycle) shifted (0,.5u) dthin;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
draw p1 shifted -SH shifted (-x0,-y0) sthin;
draw p2 shifted -SH shifted (-x0,-y0) sthin;

draw p1 yscaled -1 shifted SH shifted (-x0,-y0) sthin;
draw p2 yscaled -1 shifted SH shifted (-x0,-y0) sthin;

draw p3 shifted (-x0,-y0) snorm;
label(btex \emph{á)} etex, (-x0-2.3u,-y0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
draw p1 yscaled -1 shifted -SH shifted (x0,y0) sthin;
draw p2 yscaled -1 shifted -SH shifted (x0,y0) sthin;

draw p1 yscaled -1 shifted SH shifted (x0,y0) sthin;
draw p2 yscaled -1 shifted SH shifted (x0,y0) sthin;

draw p3 shifted (x0,y0) snorm;
label(btex \emph{â)} etex, (x0-2.3u,y0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
draw p1 yscaled -1 shifted -SH shifted (x0,-y0) sthin;
draw p2 yscaled -1 shifted -SH shifted (x0,-y0) sthin;

draw p1 shifted SH shifted (x0,-y0) sthin;
draw p2 shifted SH shifted (x0,-y0) sthin;

draw p3 shifted (x0,-y0) snorm;
label(btex \emph{ã)} etex, (x0-2.3u,-y0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



endfig;

% ===============================================
% Words in one word
% ===============================================

beginfig(8);
numeric u; u = 1cm;

numeric h; h = .2u;
numeric upos; upos = 0;
numeric lpos; lpos = 0;

darcu(5u, "");

lpos := .25u;

darcl(.5u, "");
darcl(.75u, "");
darcl(1u, "");
darcl(.5u, "");
darcl(1u, "");
darcl(.75u, "");

draw (0,0)--(upos,0) snorm;

endfig;

% ===============================================
% Functional scheme
% ===============================================

beginfig(9);
numeric u; u=.5cm;

z6 = (0,0);
z5 = (-2u, 1u);
z7 = (2u, 1u);
z4 = (2u, 2u);
z3 = (-2u,2u);
z1 = (-2u,3u);
z2 = (2u,3u);

z0 = (0,.2u);

draw z6--z7--z4--z2--z3--z5--z6 snorm;
draw z3--z1--z4 snorm;

label.top(btex $\&$ etex, z6);
label.bot(btex $6\,*$ etex, z6);

label.lft(btex $5$ etex, z5);
label.rt(btex $\neg$ etex, z5);
label.lft(btex $3$ etex, z3);
label.rt(btex $\&$ etex, z3-z0);
label.lft(btex $1$ etex, z1);
label.top(btex $x_1$ etex, z1+z0);
label.rt(btex $2$ etex, z2);
label.top(btex $x_2$ etex, z2+z0);
label.rt(btex $4$ etex, z4);
label.lft(btex $\vee$ etex, z4-z0);

draw z3 wppc scaled 2pt;
draw z4 wppc scaled 2pt;
draw z5 wppc scaled 2pt;

draw z1 wppc scaled 3pt;
draw z2 wppc scaled 3pt;
draw z6 wppc scaled 3pt;

endfig;


% ===============================================
% Trees
% ===============================================

beginfig(10);
numeric u; u=1cm;

vardef circ(expr a, b) =
  save c; path c;
  c := fullcircle scaled .3u shifted b;
  fill c withcolor white;
  draw c snorm;
  label(a,b);
enddef;

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

draw z1--z2 snorm;
draw z1--z3 snorm;

draw z2--z4 snorm;
draw z2--z5 snorm;

draw z3--z6 snorm;
draw z3--z7 snorm;

draw z4--z8 snorm;
draw z4--z9 snorm;

draw z5--z10 snorm;
draw z5--z11 snorm;

draw z6--z12 snorm;
draw z6--z13 snorm;
draw z7--z14 snorm;
draw z7--z15 snorm;

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

% ===============================================
% Even-function tree
% ===============================================

beginfig(11);
numeric u; u=1cm;

vardef circ(expr a, b) =
  save c; path c;
  c := fullcircle scaled .4u shifted b;
  fill c withcolor white;
  draw c snorm;
  label(a, b);
enddef;

z1 = (0u,0u);
z2 = (-1u,1u);
z3 = (1u,1u);

draw z2--z1--z3 snorm;

pair s; s = (3u, 0);

pair su; su = (0,.1u);

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

% ===============================================
% Even-function Moore diagram
% ===============================================

beginfig(12);
numeric u; u=1cm;

def circ(expr a, b) =
  save c; path c;
  c := fullcircle scaled .5u shifted b;
  fill c withcolor white;
  draw c snorm;
  label(a, b);
enddef;

z1 = (-.75u,0);
z2 = (+.75u,0);

pair h; h = (0,.2u);

path cl, cr;
cl := fullcircle scaled .5u shifted z1;
cr := fullcircle scaled .5u shifted z2;

pair lp;

lp = (z1 + h -- z1+h-(1u,0)) intersectionpoint cl;

pair s;
s = (1u,0);

drawarrow z1+h-s--lp snorm;
draw z1+h-s--z2+h+s--z2-h+s--z1-h-s--z1+h-s snorm;
drawarrow z2-h+s--(-lp) snorm;

circ(btex $0$ etex, z1);
circ(btex $1$ etex, z2);

label.top(btex $(1,1)$ etex, .5[z1+h,z2+h]);
label.bot(btex $(1,0)$ etex, .5[z1-h,z2-h]);
label.lft(btex $(0,0)$ etex, z1-s);
label.rt(btex $(0,1)$ etex, z2+s);

endfig;

% ===============================================
% Wait function
% ===============================================
beginfig(13);
numeric u; u=1cm;

vardef circ(expr a, b) =
  save c; path c;
  c := fullcircle scaled .5u shifted b;
  fill c withcolor white;
  draw c snorm;
  label(a, b);
enddef;


z1 = (-.75u,0);
z2 = (+.75u,0);

pair h; h = (0,.2u);

path cl, cr;
cl := fullcircle scaled .5u shifted z1;
cr := fullcircle scaled .5u shifted z2;

pair lp;
lp = (z1 + h -- z1+h-(1u,0)) intersectionpoint cl;

pair s; s = (1u,0);

drawarrow z1+h-s--lp snorm;
draw z1+h-s--z2+h+s--z2-h+s--z1-h-s--z1+h-s snorm;
drawarrow z2-h+s--(-lp) snorm;

circ(btex $0$ etex, z1);
circ(btex $1$ etex, z2);

label.top(btex $(1,0)$ etex, .5[z1+h,z2+h]);
label.bot(btex $(0,1)$ etex, .5[z1-h,z2-h]);
label.lft(btex $(0,0)$ etex, z1-s);
label.rt(btex $(1,1)$ etex, z2+s);

endfig;

% ===============================================
% Device
% ===============================================

beginfig(14);
numeric u; u=1cm;

vardef circ(expr a, b) =
  save c; path c;
  c := fullcircle scaled .5u shifted b;
  fill c withcolor white;
  draw c snorm;
  label(a, b);
enddef;

vardef wait(expr a) =
  save c; path c;
  c := a+(.1u,.25u)--a+(-.1u,.25u)--a+(-.1u,-.25u)--a+(.1u,-.25u)--cycle;
  fill c withcolor .75white;
  draw c snorm;
enddef;

draw (0,.5u)--(3u,.5u)--(3u,-.5u)--(0,-.5u)--cycle snorm;
drawarrow (2u,-.5u)--(2u,-1u)--(4u,-1u)--(4u,1u)--(2u,1u)--(2u,.5u) snorm;
drawarrow (2.75u,-.5u)--(2.75u,-.75u)--(3.25u,-.75u)--(3.25u,.75u)--(2.75u,.75u)--(2.75u,.5u) snorm;

wait((3.25u,0));
wait((4u,0));

draw (.25u,.5u)--(.25u,.6u) snorm;
draw (1u,.5u)--(1u,.6u) snorm;
draw (.25u,-.5u)--(.25u,-.6u) snorm;
draw (1u,-.5u)--(1u,-.6u) snorm;

vardef threed(expr a) =
  draw a wppc scaled 1pt;
  draw a-(.1u,0) wppc scaled 1pt;
  draw a+(.1u,0) wppc scaled 1pt;
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

% ===============================================
% General source: one letter
% ===============================================

beginfig(15);
numeric u; u = 1cm;

z1 = (0,0);
z2 = (2u,0);

path p[];

p1 := z1--z2;

drawarrow p1 sthin;

label.lft(btex $S$ etex, z1);
label.rt(btex $E$ etex, z2);

draw z1 wppc scaled 2bp;
draw z2 wppc scaled 2bp;

label.top(btex $a_i$ etex, relpoint(p1,.5));

endfig;


vardef source(expr SH, s, e, n) =
  save p; path p[];

  p1 := (-1u,0){dir 30}..(1u,0);
  p2 := (-1u,0){dir -30}..(1u,0);

  fill (p1--reverse p2--cycle) shifted SH wc .7white;

  draw p1 shifted SH sthin;
  draw p2 shifted SH sthin;

  draw bop(p1) shifted SH wppc scaled 2bp;
  draw eop(p1) shifted SH wppc scaled 2bp;

  label.top(s, bop(p1) shifted SH);
  label.top(e, eop(p1) shifted SH);
  elabel(n, .5[bop(p1),eop(p1)]shifted SH);
enddef;

% ===============================================
% General source: \concat
% ===============================================

beginfig(16);
numeric u; u = 1cm;

z1 = (0,0);
z2 = (2u,0);
z3 = (4u,0);
z4 = (6u,0);

source((1u,0), btex $S_1$ etex, btex $E_1$ etex, btex $D_1$ etex);
source((5u,0), btex $S_2$ etex, btex $E_2$ etex, btex $D_2$ etex);

drawarrow z2--z3 sthin;

label.bot(btex $S$ etex, z1);
label.bot(btex $E$ etex, z4);

endfig;

% ===============================================
% General source: \cup
% ===============================================

beginfig(17);
numeric u; u = 1cm;

z1 = (-2u,0);
z2 = (-1u,.75u);
z3 = (-1u,-.75u);
z4 = (1u,.75u);
z5 = (1u,-.75u);
z6 = (2u,0);

source((0,.75u), btex $S_1$ etex, btex $E_1$ etex, btex $D_1$ etex);
source((0,-.75u), btex $S_2$ etex, btex $E_2$ etex, btex $D_2$ etex);

drawarrow z1--z2 sthin;
drawarrow z1--z3 sthin;
drawarrow z4--z6 sthin;
drawarrow z5--z6 sthin;

draw z1 wppc scaled 2bp;
draw z6 wppc scaled 2bp;

label.lft(btex $S$ etex, z1);
label.rt(btex $E$ etex, z6);

endfig;

% ===============================================
% General source: \iterator
% ===============================================

beginfig(18);
numeric u; u = 1cm;

z1 = (-2u,0);
z2 = (0,0);
z3 = (2u,0);

source((1u,0), btex $S_1$ etex, btex $E_1$ etex, btex $D_1$ etex);

path p[];

p1 := z3{dir -100}..{dir 100}z2;

drawarrow z1--z2 sthin;
drawarrow p1 sthin;

label.lft(btex $S$ etex, z1);
label.rt(btex $E$ etex, z3);

draw z1 wppc scaled 2bp;

endfig;

bye;
