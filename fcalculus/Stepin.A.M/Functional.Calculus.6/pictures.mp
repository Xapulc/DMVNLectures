input dmvnmpl;

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \footnotesize
  \pagestyle{empty}
etex

% To short 'addto' statement
def obj(expr c) =
  doublepath c withpen currentpen
enddef;

% Macro for R[0,1]
% ----------------
def rnd = uniformdeviate(1) enddef;

% Filling with lines engine
% -------------------------
picture lines;
newinternal linescount; linescount := 200;
% Macro for making lines
vardef makelines(expr lined, linel) =
  save l;
  path l;
  lines := nullpicture;
  l := (-linel,0)--(linel,0);
  for i = -linescount upto linescount: addto lines obj(l shifted (rnd, 1.5pt*i)); endfor
  lines := lines rotated lined;
enddef;

def PI = (3.1415926) enddef;

beginfig(1);
numeric u; u = .35cm;
numeric m; m = 3;
numeric a; a = PI;
numeric s; s = .01;
numeric v; v = .6*PI;
path p[];

def f(expr x) = (1+cosd((180*x)/PI))**m enddef;

z1 = (0,0);
z2 = (a*u,0);
z3 = (-a*u,0);
z4 = (.5v*u, f(.5v)*u);
z5 = (.5v*u,0);
z6 = z4 xscaled -1;
z7 = z5 xscaled -1;

p1 := z5--z4--z6--z7--cycle;


drawarrow (-4u,0)--(4u,0) snorm;
drawarrow (0,0)--(0,9u) snorm;
draw (-a*u,f(-a)*u) for i = -a+s step s until a: --(i*u, f(i)*u) endfor sbold;
draw p1 snorm;

makelines(20,3u);
clip lines to p1;
draw lines sthin;

label.bot(btex $0$ etex, (0,0));
label.bot(btex $\pi$ etex, z2);
label.bot(btex $-\pi$ etex, z3);
label.bot(btex $\frac{x_0}{2}$ etex, z5);
label.bot(btex \hbox to 0pt{\hss$-$}$\frac{x_0}{2}$ etex, z7);

bmp(1,7);

endfig;



beginfig(2);
numeric u; u = 2.5cm;

z1 = (0,0);

drawarrow (-1.1u,0)--(1.1u,0) snorm;
drawarrow (0,-.1u)--(0,.5u) snorm;

label.llft(btex $0$ etex, (0,0));

numeric a; a = .5;
numeric s; s = .003;

z2 = (a*u,0);
z3 = (-a*u,0);

def f(expr x) = 2.81828**(a*a/(x*x - a*a)) enddef;

draw (-1.5a*u,0)--(-a*u,0) for i = -a+s step s until a-s: --(i*u, f(i)*u) endfor --(a*u,0)--(1.5a*u,0) sbold;

label.bot(btex $a$ etex, z2);
label.bot(btex $-a$ etex, z3);

bmp(1,3);

endfig;

bye;
