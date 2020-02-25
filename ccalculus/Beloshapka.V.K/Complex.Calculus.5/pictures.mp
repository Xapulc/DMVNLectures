input dmvnmpl;

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage{dmvn}
  \begin{document}
  \footnotesize
etex


% =========================================================
% curve partition
% =========================================================
beginfig(10);

numeric u; u := 1cm;

z1 = (1u,0u);
z2 = (2.1u,1u);
z3 = (2u,0u);
z4 = (1.75u,0.75u);
z5 = (5u,0.5u);

path p;
p =  z1{dir 40}..z2..z3..z4{dir 50}..z5;
draw p;

numeric t;
for t = 0 step 0.2 until length(p):
pair w;
w = (unitvector(direction t of p) rotated 90)*0.07u;
draw ((point t of p)+w)--((point t of p)-w);
endfor

mp(1,1);
mp(5,5);

label.lft(btex $z_0$ etex, z1);
label.lrt(btex $z_n$ etex, z5);

endfig;

% =========================================================
% homotopy
% =========================================================
beginfig(20);

numeric u; u := 2cm;

z1 = (0u,0u);
z2 = (2u,0.1u);

numeric t;
numeric a;
a := 40;
for t = 0 upto 7:
draw z1{dir (a - 4*t)}..{dir (15*t)}z2;
endfor

pickup pencircle scaled 1pt;

path p[];
p1 = z1{dir (a - 4*0)}..{dir (15*0)}z2;
p2 = z1{dir (a - 4*7)}..{dir (15*7)}z2;

draw p1; draw p2;

mp(1,2);

label.bot(btex $A$ etex, z1);
label.top(btex $B$ etex, z2);

label.top(btex $\al(t)$ etex, point (directiontime (1u,0) of p1) of p1);
label.bot(btex $\be(t)$ etex, point (directiontime (1u,-0.3u) of p2) of p2);
endfig;


% =========================================================
% homotopy 2: non simple-connected domain
% =========================================================
beginfig(30);

numeric u; u := 1cm;

z1 = (-.2u,0u);
z2 = (2.75u,0.2u);

z3 = (-0.3u,0u);
z4 = (1u,1u);
z5 = (2.75u,1u);
z6 = (2.3u,-1u);

numeric t;
numeric a;

a := 60;

path p[];

p1 = z3..z4..z5{dir (115+180)}..z6{dir 200}..cycle;

fill p1 withcolor 0.8white;

draw p1;

p2 = z1{dir (a - 10*4)}..{dir (11*4)}z2;

z7 = point 0.5 of p2;

p3 = (fullcircle scaled 0.4u) shifted z7;

unfill p3;

draw p3;

for t = 1 upto 2:
draw z1{dir (a - 10*t)}..{dir (11*t)}z2;
endfor

for t = 7 upto 9:
draw z1{dir (a - 10*t)}..{dir (11*t)}z2;
endfor

pickup pencircle scaled 1pt;

draw z1{dir (a)}..{dir 0}z2;
draw z1{dir (a - 10*9)}..{dir (11*9)}z2;


label.bot(btex $D$ etex, z4);

mp(1,2);

endfig;


% =========================================================
% E.Goursat lemma
% =========================================================
beginfig(40);

numeric u; u := 1.5cm;

numeric k[];
k1 =0.55;
k2 =0.07;

def arwp(expr a, b) =
begingroup
save w;
save l;

pair w[];
numeric l;
w1 = (b-a) * k1;
w2 = unitvector((b-a) rotated 90)*k2*u;
w3 = (.5[a,b])+w2-0.5*w1;

drawarrow w3--(w3+w1);

endgroup
enddef;

def arwn(expr a, b) =
begingroup
save w;
save l;

pair w[];
numeric l;
w1 = (b-a) * k1;
w2 = unitvector((b-a) rotated 90)*k2*u;
w3 = (.5[a,b])-w2-0.5*w1;

drawarrow w3--(w3+w1);

endgroup
enddef;

z1 = (0u,0u);
z2 = (2u,0u) rotated 20;
z3 = z2 rotated 80;

path p[];

p1 = z1--z2--z3--cycle;

z4 = 0.5[z1,z2];
z5 = 0.5[z2,z3];
z6 = 0.5[z3,z1];

p2  = z4--z5--z6--cycle;

z7 = 0.5[z5,z3];
z8 = 0.5[z6,z3];
z9 = 0.5[z6,z5];

p3 = z7--z8--z9--cycle;

z10 = 0.5[z8,z9];
z11 = 0.5[z6,z9];
z12 = 0.5[z6,z8];

p4 = z10--z11--z12--cycle;

draw p1;
draw p2;
draw p3;
draw p4;

ahangle := 20;

arrowon;

arwn(z1,z2);
arwn(z2,z3);
arwn(z3,z1);

arwp(z4,z2);
arwp(z2,z5);
arwp(z5,z4);

arwp(z1,z4);
arwp(z4,z6);
arwp(z6,z1);

arrowoff;

endfig;

%Cauchy's theorem =============================
beginfig(45)

u := .8 cm;

z1 = (-1u,-1u);
z2 = (-1u,1u);
z3 = (0u,.5u);
z4 = (.8u,1u);
z5 = (.9u,-1u);
z6 = (0u,-.9u);

for i = 1 upto 6: z[i+6] = z[i] scaled (.2+.3/i); endfor

path p[];

numeric l[];

p1 = for i = 1 upto 6: z[i].. endfor cycle;
p2 = for i = 1 upto 6: z[i+6].. endfor cycle;

l1 := length(p1);
l2 := length(p2);

p3 = subpath (.0025*l1, 0.999*l1) of p1;
p4 = (subpath (.004*l2, 0.995*l2) of p2)shifted (-.4u,.15u);

draw p3;
draw p4;

pair w[];
w1 = point 0 of p3;
w2 = point 0 of p4;

w3 = point length(p3) of p3;
w4 = point length(p4) of p4;

draw w1..w2;
draw w3..w4;

arrowon;
drawarrow ((.1[w1,w2])--(.9[w1,w2])) shifted (-2bp,0.2bp) withpen pencircle scaled .2pt;
drawarrow ((.1[w4,w3])--(.9[w4,w3])) shifted (2bp,-0.2bp) withpen pencircle scaled .2pt;
arrowoff;

draw w1..w3 dashed evenly scaled .1pt withpen pencircle scaled .1pt;
draw w2..w4 dashed evenly scaled .1pt withpen pencircle scaled .1pt;


endfig;

%Vectors =============================
beginfig(50)

u := 1cm;

z0 = (0,0);
z1 = (1u,0);
z2 = (0,1u);

drawarrow z0--z1;
drawarrow z0--z2;

z3 = z1+z2;
drawarrow z0--z3;

cang(z0,z3,z1,1);

label.rt(btex $e_1$ etex, z1);
label.lft(btex $e_2$ etex, z2);
label.top(btex $e_1+e_2$ etex, z3);

z4 = (3.5u,0);

numeric al, lambda;
al := 20;
lambda := 1.5;

z5 = (z0 rotated al) + z4;
z6 = (z1 rotated al) + z4;
z7 = ((z2 scaled lambda) rotated al) + z4;
z8 = ((z1+z2 scaled lambda) rotated al) + z4;
z9 = ((z1+z2) rotated al) + z4;

drawarrow z5--z6;
drawarrow z5--z7;

drawarrow z5--z8;

pickup pencircle scaled 0.3pt;

drawarrow z5--z9 dashed evenly scaled 0.5pt;

draw z8--z6 dashed evenly scaled 0.4pt;
draw z8--z7 dashed evenly scaled 0.4pt;
draw z9--((z2 rotated al) +z4) dashed evenly scaled 0.4pt;

draw z3--z1 dashed evenly scaled 0.4pt;
draw z3--z2 dashed evenly scaled 0.4pt;
cang(z5,z9,z6,1);
cangsize := .3;
cang(z5,z8,z6,2);

label.rt(btex $e'_1$ etex, z6);
label.lft(btex $e'_2$ etex, z7);
label.top(btex $e'_1+e'_2$ etex, z8);

mp(0,0);

mp(4,4);

endfig;


% maximum principle =============================
beginfig(60)

u := 1.5cm;

z0 = (0,0);
z1 = (1.5u,0) rotated 35; % A
z2 = (1u,0) rotated 35;
z3 = z1+z2;
drawarrow z0--z1;
drawarrow z1--z3;

z4 = ltanend(z1,z3, .2u);
z5 = rtanend(z1,z3, .2u);

draw fullcircle scaled .4u shifted z3;
draw fullcircle scaled .4u shifted z3;

draw z4--z1--z5 dashed evenly scaled .5pt;

draw z4--z3--z5;

path p;
pair w[];

p := fullcircle scaled 3u;

numeric l;
l := .25length(p);

p := (subpath (0, l) of p) rotated -15;

for i := .01l step 0.1 until .99l:
w1 := point i of p;
w2 := unitvector(direction i of p)*.075u rotated 45;
draw w1--(w1+w2) withpen pencircle scaled .25pt;
endfor

draw p;

z6 = (1.5u,0);

drawarrow z0--z6;


mp(0,0);

label.lft(btex $0$ etex, z0);
label.rt(btex $f(a)$ etex, z1 + (3bp,-3bp));
label.top(btex $|f(a)|$ etex, .5[z0,z6]);

endfig;


% maximum principle =============================
beginfig(70)

u := 1.3cm;

path p[];

p1 := fullcircle scaled 2u;
p2 := fullcircle scaled .7u;
p3 := fullcircle scaled 1.85u;
p4 := fullcircle scaled .85u;

fill p3 withcolor .8white;
unfill p4;

draw p1;
draw p2;

draw p3 dashed evenly scaled .5pt withpen pencircle scaled .3pt;
draw p4 dashed evenly scaled .5pt withpen pencircle scaled .3pt;

numeric l;

arrowon;

p5 := fullcircle scaled 2.15u;
l := .1*length(p5);
p5 := subpath (0, l) of p5;
drawarrow p5 rotated -15 withpen pencircle scaled .35pt;

p6 := fullcircle scaled .55u;
l := .2*length(p6);
p6 := subpath (0, l) of p6;
drawarrow reverse p6 rotated -30 withpen pencircle scaled .35pt;

arrowoff;

z0 = (0,0);
z1 = (.6u,.25u);

mp(0,1);

label.lft(btex $a$ etex, z0);
label.top(btex $z$ etex, z1);
endfig;


% residues =============================
beginfig(80)

u := 1.1 cm;

def star(expr w) =
begingroup
save p;
path p;
p := (-.065u,0u)--(.065u,0u);
draw (p) shifted w;
draw (p rotated 60) shifted w;
draw (p rotated 120) shifted w;
endgroup;
enddef;

z1 = (-1u,-1u);
z2 = (-1u,1.2u);
z3 = (0u,1u);
z4 = (1.5u,1.3u);
z5 = (1.4u,-1.3u);
z6 = (0u,-1.1u);

for i = 1 upto 6: z[i+6] = z[i] scaled (.1+.3/i); endfor
for i = 1 upto 6: z[i+12] = (z[i] scaled (.2-.1/i)) shifted (1.2u,.1u); endfor

path p[];
path s[];
path r[];

pair w[];
numeric l;
numeric k;
numeric l;

p1 = for i = 1 upto 6: z[i].. endfor cycle;
p2 = for i = 1 upto 6: z[i+6].. endfor cycle;
p3 = for i = 1 upto 6: z[i+12].. endfor cycle;

l := length(p1);

fill p1 withcolor .85white;
unfill p2;
unfill p3;

draw p1;
draw p2;
draw p3;

p4 = p1 scaled .7;
p5 = p1 scaled 1.05;

m := length(p5);

p6 = subpath(.65*m, .61*m) of p5;

arrowon; drawarrow p6; arrowoff;


ahangle := 10;

for i = 0 upto 8:
    w[i] = point (i/9*l) of p4;
    s[i] := fullcircle scaled .32u;
    k := length(s[i]);
    r[i] := (subpath (0,k/5) of s[i])  rotated (-10+i*5) scaled 1.35;
    unfill s[i] shifted w[i];
    draw s[i] shifted w[i];
    star(w[i]);
    arrowon;
    drawarrow reverse r[i] shifted w[i];
    arrowoff;
endfor


endfig;


% example of integrations =============================
beginfig(90)

u := 1 cm;

def star(expr w) =
begingroup
save p;
path p;
p := (-.065u,0u)--(.065u,0u);
draw (p) shifted w;
draw (p rotated 60) shifted w;
draw (p rotated 120) shifted w;
endgroup;
enddef;

z0 = (0u,0u);
z1 = (-1u,0u);
z2 = (1u,0u);

path p[];

p1 := hcir(1u)--cycle;

draw p1;

p2 := p1 scaled 1.1;

numeric l;
l = length(p2);

p3 := subpath(.12l, .25l) of p2;
p4 := subpath(.85l, .95l) of p2;

arrowon;

pickup pencircle scaled .3pt;

drawarrow p3;
drawarrow p4 shifted (0,-0.1u);

drawarrow (-1.3u,0)--(1.3u,0);
drawarrow (0, -0.3u)--(0, 1.3u);
arrowoff;

star(z2 scaled .75 rotated 40);
star(z2 scaled .55 rotated 120);
star(z2 scaled .85 rotated 80);
star(z2 scaled .35 rotated 60);

label.bot(btex $-R$ etex, z1);
label.bot(btex $R$ etex, z2);

label.ulft(btex $C_R$ etex, z2 rotated 130);
mp(1,2);

endfig;

% Argument principle ======================================
beginfig(100)

u := 1cm;

def star(expr w) =
begingroup
save p;
path p;
p := (-.065u,0u)--(.065u,0u);
draw (p) shifted w;
draw (p rotated 60) shifted w;
draw (p rotated 120) shifted w;
endgroup;
enddef;


z0 = (1u,0u);
z1 = (.3u,0u);

path p[];
numeric q;
q := 30;

p1 :=
for i = 0 upto q:
   (z0 scaled (1.0 + (i/q) + .5*cosd(360/q*5*i))) rotated (i*360/q)..
endfor
cycle;



p2 :=
for i = 0 upto q:
   (z1 scaled (.8 + .1*cosd(360/q*6*i))) rotated (i*360/q)..
endfor
cycle;


p3 :=
for i = 0 upto q:
   (z1 scaled (.1 + i/30 + .1*cosd(360/q*4*i))) rotated (i*360/q)..
endfor
cycle;

fill p1 withcolor .85 white;
unfill p2;
unfill (p3 shifted (.5u,-1u));

numeric l;
l = length(p1);

for i = 0 upto 10: star(.72*(point (i*l/10) of p1)); endfor

numeric t;
for t = 0 step 0.3 until l:
pair w;
w = (unitvector(direction t of p1) rotated 90)*0.05u;
draw ((point t of p1)+w)--((point t of p1)-w);
endfor

draw p1;

draw p2;

draw p3 shifted (.5u,-1u);

label.top(btex $\gamma$ etex, point 0 of p1);

z2 = point .61l of p1;
z3 = point .639l of p1;

mp(2,3);

p4 = subpath(.61l,.639l) of p1;

draw p4 withpen pencircle scaled 1pt;

label.top(btex $\gamma$ etex, point 0 of p1);

label.bot(btex $a_2$ etex, z2);
label.lrt(btex $a_1$ etex, z3);

endfig;

% ================================= arg principle part II
beginfig(110)

u := .5cm;


path p[];

numeric q;

q := 15;

z0 = (1u,0);

p1 :=
for i = 0 upto q:
   (z0 scaled (1.0 + (i/q) + .5*cosd(360/q*1*i))) rotated (i/q*360)..
endfor
cycle;

p2 :=
for i = 0 upto q:
   (z0 scaled (1.0 + (i/q) + .3*cosd(360/q*1.3*i))) rotated (2*i/q*360)..
endfor
cycle;

p3= p2 shifted (7u,0);

draw p1;
draw p3;

z1 = point .1 of p1;
z2 = point .25length(p2) of p3;

z3 = (7u,0);

p4 = z1{dir 30}..z2;
numeric l;
l = length(p4);

p5 = subpath (.1l, .7l) of p4;

label.top(btex $w=f(z)$ etex, point .4l of p4);

z4 = point .75*length(p1) of p1;
z5 = point .4*length(p3) of p3;

label.top(btex $w=f(z)$ etex, point .4l of p4);
label.bot(btex $z$ etex, z4);
label.top(btex $0$ etex, z3);
label.lrt(btex $w$ etex, z5);

arrowon;
drawarrow p5;
drawarrow z3--z5;
arrowoff;

mp(3,5);


endfig;


% ================================= non-homeomorphism
beginfig(120)

u := .75cm;

z0 = (0,0);
z1 = (1u,0);
z2 = (-1u,0);
z3 = (0,1u);
z4 = (0,-1u);

path p[];

p1 := z1..z3..z2--cycle;
p2 := z1..z3..z2..z4..cycle;

p5 := z1..z0;

pair w;
w = (3.5u,0);
draw p1 withpen pencircle scaled .75pt;
draw p5 shifted w withpen pencircle scaled .75pt;
draw p2 shifted w withpen pencircle scaled .75pt;

z5 = (-.7u,0) rotated -7.5;
z6 = (.6u,0) rotated -15 shifted w;

z7 = (.7u,0) rotated 7.5;
z8 = (.6u,0) rotated 15 shifted w;

arrowon;
p3 := (-1.4u,0)--(1.4u,0);
p4 := (0, -0.4u)--(0, 1.4u);

drawarrow p3; drawarrow p4;
drawarrow p3 shifted w; drawarrow p4 shifted w;
p6 := (1u,1u){dir 30}..{dir -30}((-1u,1u) shifted w);
p7 := z5{dir -20}.. {dir 20}z6;
p8 := z7{dir 20}.. {dir -20}z8;
numeric l[];
l1 = length(p7);
l2 = length(p8);
drawarrow subpath (.025*l1, .975*l1) of p7 withpen pencircle scaled .3pt;
drawarrow subpath (.025*l2, .975*l2) of p8 withpen pencircle scaled .3pt;
drawarrow p6;
arrowoff;


label.top(btex $z^2$ etex, point length(p6)/2 of p6);

mp(5,8);

endfig;


% ================================= non-homeomorphism - II
beginfig(130)

u := .75cm;

z0 = (0,1u);
z1 = (0,-2u);
z2 = (3.3u,-2u);
z3 = (3.3u,1u);

path p[];

numeric i;

p2 :=
for i = 0.001 step .00001 until .01: (250*i*u, .5u+.5*sind(2/i)*u)-- endfor z3;

draw p2;

draw z0--z1--z2--z3;

endfig;


% ======================== Symmetry principle: part 0 (lemma 2)
beginfig(140)

u := 1.5cm;

z1 = (0,0u);
z2 = (2u,1u);

z3 = (.8u,1.2u);
z4 = (.8u,.3u);
z5 = (1.6u,.7u);

path p[];

p1 := z1{dir 55}..z2;

p3 := (point 0 of p1){dir 100}..(0,1.5u)..{dir -60}(point length(p1) of p1);
p4 := (point 0 of p1){dir -80}..(1u,-.3u)..{dir 90}(point length(p1) of p1);

p2 := z3--z4--z5--cycle;

z6 = (z3--z5) intersectionpoint p1;
z7 = (z3--z4) intersectionpoint p1;
z8 = .92[z3,z7];
z9 = .92[z3,z6];

z10 = .88[z4,z7];
z11 = .88[z5,z6];

p5 := z8{dir 30}..z9;
p6 := z10{dir 30}..z11;

numeric l[];

l1 := length(p5);
l2 := length(p6);

p7 := (subpath (.2*l1, .8*l1) of p5) shifted (.05u*unitvector(direction (.5*l1) of p5) rotated 90);
p8 := (subpath (.2*l2, .8*l2) of p6) shifted (.05u*unitvector(direction (.5*l2) of p6) rotated -90);

draw p1;
draw p2;
draw p3;
draw p4;
draw p5 dashed evenly scaled .35pt;
draw p6 dashed evenly scaled .35pt;

drawarrow p7 withpen pencircle scaled .3pt;
drawarrow reverse p8 withpen pencircle scaled .3pt;

label.lrt(btex $D_1$ etex, point .5*length(p3) of p3);
label.top(btex $D_2$ etex, point .5*length(p4) of p4);
label.top(btex $\gamma$ etex, point .8*length(p1) of p1);
label.urt(btex $C_1$ etex, z3);
label.bot(btex $C_2$ etex, z5);


endfig;

verbatimtex \end{document} etex

bye;
