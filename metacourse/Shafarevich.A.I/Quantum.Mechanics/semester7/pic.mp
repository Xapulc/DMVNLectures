input dmvnmpl;

verbatimtex
\documentclass{article}
\usepackage{dmvn}
\begin{document}
\footnotesize
etex

% ---------------------------------------------------
% Vin's law
% ---------------------------------------------------
beginfig(1);

numeric u;
u := 1cm;

def ff(expr x) = (3.5**(2-x-1/x)) enddef;

draw (0,0) for i = 0.01 step 0.1 until 6: ..(i*u,ff(i)*u) endfor snorm;

z1 = (1*u,1*u);
z2 = (1*u,0);

drawarrow (-.25*u,0)--(6.25*u,0) sthin;
drawarrow (0,-.25*u)--(0,1.25*u) sthin;

z0=(0,0);

bmp(0,2);

draw z1--z2 dthin;
label.bot(btex $\om_0$ etex, z2);
label.bot(btex $\om$ etex, (6u,0));
label.lft(btex $u$ etex, (0,1u));

endfig;

% ---------------------------------------------------
% Potential
% ---------------------------------------------------
beginfig(2);

numeric u;
u := .5cm;

z0 = (-3u,0);
z1 = (-2u,0);
z2 = (0u,1u);
z3 = (1u,2.5u);
z4 = (2u,2u);
z5 = (3u,2.5u);
z6 = (3.75u,1u);
z7 = (5u,-1u);
z8 = (6.5u,1u);
z9 = (7.5u,3u);
z10 = (8.5u,2u);
z11 = (9.5u,0);
z12 = (10.5u,0);
z13 = (11.5u,0);
z14 = (12.5u,0);

z15 = (0,0);
drawarrow (-3.25*u,0)--(13*u,0) sthin;
drawarrow (0,-.25*u)--(0,3.25*u) sthin;

path p[];

p0 := z0{dir0}
for i = 1 upto 14: ..z[i] endfor {dir0};

draw p0 snorm;

z16 = (-3u,1.75u); % flying nightmare
z17 = z16 shifted (1u,0);
z18 = z16 shifted (10u,0);

p1 := z17--z18;
z19 = (p1 intersectionpoint p0);
p2 := p1 cutafter ((z19 shifted (0,1u))--(z19 shifted (0,-1u)));
draw p2 dthin;
p3 = (p1 cutbefore p0) cutafter p0;
draw p3 dthin;

draw fullcircle scaled 3pt shifted z16 sbold;
drawarrow z16--z17 snorm;

bmp(1,1);
bmp(13,13);

label.top(btex $v$ etex, z17);
label.bot(btex $a$ etex, z1);
label.bot(btex $b$ etex, z13);
label.lft(btex $V(x)$ etex, (0,3u));
label.bot(btex $x$ etex, (13u,0));

endfig;

% ---------------------------------------------------
% Nuclear core potential
% ---------------------------------------------------

beginfig(3);
numeric u; u = 1cm;

z0 = (0,0);
z1 = (4u,0);
z2 = (0,2.5u);
z3 = (0,-1.5u);

path p[];

z4 = (0,-1u);
z5 = (1.0u,1.5u);
z6 = (1.5u,2u);
z7 = (2.0u,1.5u);
z8 = (4u,.3u);

z9 = (0,y5);
z10 = (x5,0);

p1 := z4{dir 10}..z5..{dir 10}z6..z7..{dir 0}z8;

draw p1 sbold;
draw z5--z9 snorm;
draw z5--z10 dthin;
draw z5--(x1,y5) dthin;

drawarrow z0--z1 sthin;
drawarrow z3--z2 sthin;

bmp(0,0);
bmp(5,5);
bmp(7,7);
bmp(9,10);

label.bot(btex $r$ etex, z1);
label.lft(btex $V(r)$ etex, z2);
label.bot(btex $r_0$ etex, z10);
label.lft(btex $E$ etex, z9);
label.urt(btex \tiny улетела etex, z7);
label.urt(btex \vbox{\hsize=8mm\tiny\noindent не улетела} etex, z9);

endfig;

% ---------------------------------------------------
% Resonnance tunneling
% ---------------------------------------------------

beginfig(4);
numeric u; u = 1cm;

def wav = ((-1u,0){dir0}..{dir0}(.5u,1u)..(1.2u,-1.u)..{dir 0}(1.5u,-1.5u)..{dir0}(3u,.5u)..{dir0}(3.5u,0)) enddef;

z0 = (-2u,0);

draw (-2u,0)--wav--(wav shifted (7u,0))--(11.5u,0) sbold;
drawarrow (-2u,0)--(11.5u,0) sthin;
drawarrow (-2u,-1.5u)--(-2u,1.5u) sthin;

label.bot(btex $x$ etex, (11.5u,0));
label.lft(btex $V(x)$ etex, (-2u,1.5u));

bmp(0,0);

endfig;



bye;
