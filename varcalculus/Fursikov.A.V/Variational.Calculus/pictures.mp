input dmvnmpl;

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage{dmvn}
  \begin{document}
  \footnotesize
etex


% ===============================================
% nullpicture
% ===============================================
beginfig(0);
numeric u; u = 1cm;

label(btex \framebox{[NO PICTURE AVAILABLE YET]} etex, origin);

endfig;


% ===============================================
% le dubois-reymond' function
% ===============================================
beginfig(1);
numeric u; u = 1cm;
numeric ep; ep = .15u;

z0 = (0,0);
z1 = (4u,0);
z2 = (0,-1.25u);
z3 = (0,1.25u);

z4 = (1u-ep,0);
z5 = (1u,1u);
z6 = (1u+ep,0);

z7 = (3u-ep,0);
z8 = (3u,-1u);
z9 = (3u+ep,0);

z10 = (1u,0);
z11 = (3u,0);

drawarrow z0--z1 snorm;
drawarrow z2--z3 snorm;
draw z0--z4--z5--z6--z7--z8--z9--(3.5u,0) sbold;

draw z5--(0,y5) dthin;
draw z8--(0,y8) dthin;

draw z5--z10 dthin;
draw z8--z11 dthin;


label.bot(btex $\tau_1$ etex, z10);
label.top(btex $\tau_2$ etex, z11);
label.bot(btex $t$ etex, z1);
label.lft(btex $1$ etex, (0,y5));
label.lft(btex $-1$ etex, (0,y8));

endfig;


% ===============================================
% counter-example sequence
% ===============================================
beginfig(2);
numeric u; u = 1cm;
numeric ep; ep = .25u;

z0 = (0,0);
z1 = (2u,0);
z2 = (0,1.25u);

z3 = (ep,0);
z4 = (ep,1u);
z5 = (2u,1u);
z6 = (0,1u);

drawarrow z0--z1 snorm;
drawarrow z0--z2 snorm;
draw z0--z4--z5 sbold;

draw z4--z3 dthin;
draw z5--z6 dthin;

label.bot(btex $\frac1n$ etex, z3);
label.lft(btex $1$ etex, z6);
label.bot(btex $t$ etex, z1);

endfig;


beginfig(3);
numeric u; u = 1cm;

z1 = (-1.5u,0);
z2 = (1.5u,0);
z3 = (0,-1.5u);

path p[];

numeric k; k = .2;
numeric m; m = 1-k;

p1 := k[z1,z2]--m[z1,z2];
p2 := k[z1,z3]--m[z1,z3];
p3 := k[z3,z2]--m[z3,z2];

p4 := p2 shifted (.1u,.1u);
p5 := (reverse p2) shifted (-.1u,-.1u);

drawarrow p1 snorm;
drawarrow p4 snorm;
drawarrow p5 dnorm;
drawdblarrow p3 snorm;

label(btex $X$ etex, z1);
label(btex $Y$ etex, z2);
label(btex $X/\Ker A$ etex, z3);

elabel(btex $A$ etex, relpoint(p1,.5));
elabel(btex $\wt A$ etex, relpoint(p3,.5));
elabel(btex $\pi$ etex, relpoint(p4,.5));
elabel(btex $\ph$ etex, relpoint(p5,.5));

endfig;

% ===============================================
% counter-example sequence
% ===============================================
beginfig(4);
numeric u; u = 1cm;
numeric ep; ep = 3*.333u;

z0 = (0,0);
z1 = (3.25u,0);
z2 = (0,1.25u);

z3 = (0,1u);
z4 = (ep,0);
z5 = (ep,1u);
z6 = (3u-ep,0);
z7 = (3u,0);

drawarrow z0--z1 snorm;
drawarrow z0--z2 snorm;
draw z3--z5{dir 0}..{dir 0}z6--z7 sbold;

draw z5--z4 dthin;

bmp(5,6);

label.bot(btex $0$ etex, z0);
label.bot(btex $\frac13$ etex, z4);
label.bot(btex $\frac23$ etex, z6);
label.lft(btex $1$ etex, z3);
label.bot(btex $1$ etex, z7);
label.lrt(btex $t$ etex, z1);

endfig;


bye;
