verbatimtex
\documentclass{article}
\begin{document}
\footnotesize
etex


input dmvnmpl;

vardef acosd(expr x) =
angle((x,1+-+x))
enddef;

numeric n;

for n = 1 upto 9:

beginfig(n);

numeric u;
u = .6cm;

def cheb(expr x) =
(x*u, cosd(n*acosd(x))*u)
enddef;

draw cheb(-1) for i = -1 step 0.003 until 1: ..cheb(i) endfor snorm;

numeric c;
c = 1.35;

draw (1u,1u)--(1u,-1u)--(-1u,-1u)--(-1u,1u)--cycle dthin;

drawarrow (-c*u,0)--(c*u,0) sthin;
drawarrow (0,-c*u)--(0,c*u) sthin;

path p;
p = (0.2u,0)--(-0.2u,0);

draw p shifted (-1u,0) sthin;
draw p shifted (1u,0) sthin;

endfig;

endfor;

beginfig(10);

numeric u; u :=1cm;
numeric c; c:= 1;
numeric s; s:= 1.6;

for i = 1 upto 7: z[i] = (0,-i*c*u); endfor

for j = 0 upto 5:

for i = 1 upto (6-j):
z[i+10*(j+1)] = (.5[z[i+10*j],z[i+1+10*j]] + ((1+j/6)*s*u,0));
draw z[i+10*j]--z[i+10*(j+1)]--z[i+1+10*j] snorm;
endfor

endfor

elabel(btex $f(x_1)$ etex, z1);
elabel(btex $f(x_2)$ etex, z2);
elabel(btex $f(x_3)$ etex, z3);
elabel(btex $f(x_4)$ etex, z4);
elabel(btex $f(x_5)$ etex, z5);
elabel(btex $f(x_6)$ etex, z6);
elabel(btex $f(x_7)$ etex, z7);

elabel(btex $f(x_1;x_2)$ etex, z[1+10]);
elabel(btex $f(x_2;x_3)$ etex, z[2+10]);
elabel(btex $f(x_3;x_4)$ etex, z[3+10]);
elabel(btex $f(x_4;x_5)$ etex, z[4+10]);
elabel(btex $f(x_5;x_6)$ etex, z[5+10]);
elabel(btex $f(x_6;x_7)$ etex, z[6+10]);

elabel(btex $f(x_1;x_2;x_3)$ etex, z[1+20]);
elabel(btex $f(x_2;x_3;x_4)$ etex, z[2+20]);
elabel(btex $f(x_3;x_4;x_5)$ etex, z[3+20]);
elabel(btex $f(x_4;x_5;x_6)$ etex, z[4+20]);
elabel(btex $f(x_5;x_6;x_7)$ etex, z[5+20]);

elabel(btex $f(x_1;x_2;x_3;x_4)$ etex, z[1+30]);
elabel(btex $f(x_2;x_3;x_4;x_5)$ etex, z[2+30]);
elabel(btex $f(x_3;x_4;x_5;x_6)$ etex, z[3+30]);
elabel(btex $f(x_4;x_5;x_6;x_7)$ etex, z[4+30]);

elabel(btex $f(x_1;x_2;x_3;x_4;x_5)$ etex, z[1+40]);
elabel(btex $f(x_2;x_3;x_4;x_5;x_6)$ etex, z[2+40]);
elabel(btex $f(x_3;x_4;x_5;x_6;x_7)$ etex, z[3+40]);

elabel(btex $f(x_1;x_2;x_3;x_4;x_5;x_6)$ etex, z[1+50]);
elabel(btex $f(x_2;x_3;x_4;x_5;x_6;x_7)$ etex, z[2+50]);

elabel(btex $f(x_1;x_2;x_3;x_4;x_5;x_6;x_7)$ etex, z[1+60]);

endfig;
%==============================================

beginfig(11);
numeric u;
u := 1cm;
numeric c;
c := 2.5;

drawarrow (-c/4*u,0)--(1.5*c*u,0) sthin;
drawarrow (0,-c/4*u)--(0,c*u) sthin;

numeric a; a := .5;
numeric b; b := 3;

vardef func(expr x) = (2-.65*(x-1)**2) enddef;
vardef tan(expr x) = (t*(x-a)+func(a)) enddef;

draw (a*u,func(a)*u)
for i = a step 0.01 until b: --(i*u,func(i)*u) endfor snorm;

z1= (a*u,0);
z2 = (b*u,0);
z3 = (a*u,func(a)*u);
z4 = (b*u,func(b)*u);

numeric t; t := (func(b)-func(a))/(b-a);

numeric q; q := 1.65;

%-.65*2*(q-1) = t;

z7 = (q*u,0);

path p[];

p1 := (z3--z4) shifted (0,(func(q)- tan(q))*u);
draw p1 sthin;
z5 = point 0 of p1;
z6 = point 1 of p1;

z8 = .5[z3,z5];
z9 = .5[z4,z6];

draw z8--z9 sthin;
draw z3--z4 sthin;

draw z5--z1 dthin;
draw z6--z2 dthin;

z10 = (q*u,func(q)*u);

draw z7--z10 dthin;

bmp(1,10);

endfig;

% ================================================================== (C) ]DichlofoS[

beginfig(12);
numeric u; u = 1cm;
z0 = (0,0);

numeric l;
l = 15u;
z100 = (l,0);

numeric n;
n = 6;
stnmo = l/(n+0);
stn   = l/(n+1);
stnpo = l/(n+2);

def npopoint(expr d) =
  fill fullcircle scaled .25u shifted d;
  unfill fullcircle scaled .20u shifted d;
  label(btex $*$ etex, d);
enddef;

def npoint(expr d) =
  fill fullcircle scaled .20u shifted d;
  unfill fullcircle scaled .15u shifted d;
  %label.bot(btex $n$ etex, d);
enddef;

def nmopoint(expr d) =
  fill fullcircle scaled .15u shifted d;
  %unfill fullcircle scaled .11u shifted d;
  %label(btex $n-1$ etex, d);
enddef;

vardef nrpath(expr w) =
  linejoin := rounded;
  save m; numeric m; m = 5;
  %draw w wc (1, 0,0) wppc scaled ((m+.5)*pt);
  for i = 0 step .5 until m:
    k := m - i;
    draw w wc (1, sind(90k/m)**2, sind(90k/m)**2) wppc scaled (k*pt);
  endfor
enddef;

vardef nbpath(expr w) =
  linejoin := rounded;
  save m; numeric m; m = 5;
  %draw w wc (0,0,1) wppc scaled ((m+.5)*pt);
  for i = 0 step .5 until m:
    k := m - i;
    draw w wc (sind(90k/m)**2, sind(90k/m)**2,1) wppc scaled (k*pt);
  endfor
enddef;

draw z0--z100 snorm;
draw (z0+2up)--(z0-2up) snorm;
draw (z100+2up)--(z100-2up) snorm;

label.bot(btex $a$ etex, z0);
label.bot(btex $b$ etex, z100);

pair zn[];
pair znpo[];
pair znmo[];

pair dnpo[];
pair dnmo[];

% End points to short some defs

znmo[0]   = z0;
znmo[n]   = z100;

zn[0]     = z0;
zn[n+1]   = z100;

znpo[0]   = z0;
znpo[n+2] = z100;

for i = 1 upto n-1: znmo[i] = (i*stnmo,0); endfor;
for i = 1 upto n+0: zn[i]   = (i*stn,  0); endfor;
for i = 1 upto n+1: znpo[i] = (i*stnpo,0); endfor;

for i = 0 upto n+1:
  dnpo[i] = (xpart zn[i], 2u*(((n-i) mod 2)-.5));
  dnmo[i] = (xpart zn[i], -2u*(((n-i) mod 2)-.5));
endfor;

dnmo[0] := (x0,4u*((n mod 2) - .5));
dnmo[n+1] := (x100,2u);

path p[];

p3 := dnpo[0] for i = 1 upto n+1: ..znpo[i]..dnpo[i] endfor;
p2 := dnmo[0] for i = 1 upto n-1: ..dnmo[i]..znmo[i] endfor .. dnmo[n]..dnmo[n+1];

nrpath(p3);
nbpath(p2);

for i = 1 upto n-1: nmopoint(znmo[i]); endfor;
for i = 1 upto n+0: npoint(zn[i]);   endfor;
for i = 1 upto n+1: npopoint(znpo[i]); endfor;

for i = 0 upto n+1:
  label (btex $*$ etex, dnpo[i]);
  label (btex $\circ$ etex, dnmo[i]);
endfor;

endfig;


%===============================================

vardef graph(expr a, b, s) = 
((a*u, f(a)*u)
for i = a+s step s until b: --(i*u,f(i)*u)
endfor)
enddef;


beginfig(13); % ================================== arg min arg max tau

numeric u; u:=1.75cm;

drawarrow (0,-.25*u)--(0,1.5u) sthin;
drawarrow (-.25*u,0)--(2.5u,0) sthin;


numeric mu,M;
mu := .6;
M := 1.2;

vardef f(expr x) = abs(1-mu*x) enddef;

draw graph(-.25,2,.025) snorm;

vardef f(expr x) = abs(1-M*x) enddef;

draw graph(-.25,2,.025) snorm;


z0 = (0,0);
z1 = (1/mu*u,0);
z2 = (1/M*u,0);
numeric tauopt;

tauopt:= 2/(M+mu); 


z2 = (1/M*u,0);
z3 = (tauopt*u,0);

z4 = (tauopt*u,f(tauopt)*u);

draw z3--z4 dthin;

label.bot(btex $\frac1\mu$ etex, z1);
label.bot(btex $\frac1M$ etex, z2);
label.bot(btex $\tau$ etex, (2.5u,0));
label.bot(btex $\tau_{{\rm opt}}$ etex, z3);

bmp(0,4);


endfig;

bye;
