input dmvnmac.mp

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex


% =========================================================
% Peano curve 1
% =========================================================
beginfig(10);

numeric u; u := .75cm;

z1 = (0u,0u);
z2 = (4u,0u);
z3 = (4u,4u);
z4 = (0u,4u);

z5 = .5[z1,z2];
z6 = .5[z2,z3];
z7 = .5[z3,z4];
z8 = .5[z4,z1];

draw z1--z2--z3--z4--cycle;
draw z5--z7;
draw z6--z8;

path p;
p = .5[z5,z8]--.5[z7,z8]--.5[z7,z6]--.5[z6,z5];

draw p withpen pencircle scaled 1.2pt;

label.bot(btex $0$ etex, z1);
label.bot(btex $1$ etex, z2);

endfig;

% =========================================================
% Peano curve 2
% =========================================================
beginfig(20);

numeric u; u := 0.75cm;

for i = 0 upto 4: draw (i*u, 0)--(i*u, 4u); endfor
for j = 0 upto 4: draw (0,j*u)--(4u, j*u); endfor

z1 = (0u,0u);
z2 = (4u,0u);
z3 = (4u,4u);
z4 = (0u,4u);

z5 = .5[z1,z2];
z6 = .5[z2,z3];
z7 = .5[z3,z4];
z8 = .5[z4,z1];

path p[];
p0 = (.5[z5,z8]--.5[z7,z8]--.5[z7,z6]--.5[z6,z5]) shifted (-2u,-2u) scaled .5;
p1 = (p0 rotated -90) shifted (1u,1u);
p2 = p0 shifted (1u,3u);
p3 = p0 shifted (3u,3u);
p4 = (p0 rotated 90) shifted (3u,1u);

draw (reverse p1)--p2--p3--(reverse p4) withpen pencircle scaled 1.2pt;

%path p; draw p withpen pencircle scaled 1.2pt;

label.bot(btex $0$ etex, (0,0));
label.bot(btex $1$ etex, (4u,0));
endfig;

% =========================================================
% Peano curve 3
% =========================================================
beginfig(30);

numeric u; u := .75cm;

for i = 0 upto 8: draw (.5i*u, 0)--(.5i*u, 4u); endfor
for j = 0 upto 8: draw (0,.5j*u)--(4u, .5j*u); endfor

z1 = (0u,0u);
z2 = (4u,0u);
z3 = (4u,4u);
z4 = (0u,4u);

z5 = .5[z1,z2];
z6 = .5[z2,z3];
z7 = .5[z3,z4];
z8 = .5[z4,z1];

draw z1--z2--z3--z4--cycle;
draw z5--z7;
draw z6--z8;

path p[];
p0 = (.5[z5,z8]--.5[z7,z8]--.5[z7,z6]--.5[z6,z5]) shifted (-2u,-2u) scaled .5;
p1 = (p0 rotated -90) shifted (1u,1u);
p2 = p0 shifted (1u,3u);
p3 = p0 shifted (3u,3u);
p4 = (p0 rotated 90) shifted (3u,1u);

p5 = ((reverse p1)--p2--p3--(reverse p4)) shifted (-2u,-2u) scaled .5;

p6 = (p5 rotated -90) shifted (1u,1u);
p7 = p5 shifted (1u,3u);
p8 = p5 shifted (3u,3u);
p9 = (p5 rotated 90) shifted (3u,1u);

p10 = (reverse p6)--p7--p8--(reverse p9);

draw p10 withpen pencircle scaled 1.2pt;


label.bot(btex $0$ etex, (0,0));
label.bot(btex $1$ etex, (4u,0));
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


verbatimtex \end{document} etex

bye;
