verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex

% ==========================================================
% Rectangle in the theorem of diffeomorphism square deffect
% ==========================================================
beginfig(10);
numeric u;
u=0.5cm;

ahangle := 20;

drawarrow (-.25u,0)--(6u,0);
drawarrow (0,-.25u)--(0,4u);

path p[];

p[1] := (2u,1u)--(4u,1u)--(4u,3u)--(2u,3u)--cycle;
draw p[1];

fill p[1] withcolor .7white;

label.lft(btex $A_{00}$ etex, (2u,1u));
label.lft(btex $A_{01}$ etex, (2u,3u));
label.rt(btex $A_{10}$ etex, (4u,1u));
label.rt(btex $A_{11}$ etex, (4u,3u));

label(btex $\sigma$ etex, .5[(2u,1u),(4u,3u)] );

label.bot(btex $t_1$ etex, (6u,0));
label.lft(btex $t_2$ etex, (0,4u));

pickup pencircle scaled 2pt;

draw (0,0);
draw (2u,1u);
draw (4u,1u);
draw (4u,3u);
draw (2u,3u);

endfig;


% =======================================================
% The Green formula
% =======================================================
beginfig(20);

numeric u;
u=0.5cm;

ahangle := 20;

drawarrow (-.25u,0)--(6u,0);
drawarrow (0,-.25u)--(0,4u);

path p[];

p[1] := (1u,1u)--(4u,1u)--(4u,3u)..(2u,2.3u)..(1u,1u)--cycle;
draw p[1];

fill p[1] withcolor .7white;

label.lft(btex $A$ etex, (1u,1.5u));
label.rt(btex $B$ etex, (4u,1u));
label.rt(btex $C$ etex, (4u,3u));

label.top(btex $a$ etex, (1u,-.8u));
label.top(btex $b$ etex, (4u,-.8u));

label.lft(btex $d$ etex, (0,3u));
label.lft(btex $c$ etex, (0,1u));

label(btex $G$ etex, (2.75u,1.75u));

label.bot(btex $x$ etex, (6u,0));
label.lft(btex $y$ etex, (0,4u));

pickup pencircle scaled 2pt;

draw (0,0);
draw (1u,1u);
draw (4u,1u);
draw (4u,3u);

pickup pencircle scaled .5pt;

drawoptions(dashed evenly);

draw (1u,1u)--(1u,0);
draw (4u,1u)--(4u,0);
draw (0,1u)--(1u,1u);
draw (0,3u)--(4u,3u);

endfig;


% =======================================================
% The contour
% =======================================================

beginfig(30);
numeric u;
u=0.5cm;

ahangle := 20;
linejoin := mitered;

path p[];
p[1] := (5u,0){dir 90}..(3u,1u)..(0,3u){dir 180}..(-2u,1.5u)..(-4u,0){dir -90}..(0,-3u){dir 0}..cycle;

p[2] := (1.5u,0)..(0,1.5u)..(-1.5u,0)..(0,-1.5u)..cycle;

draw p[1];
draw p[2];

yshi := 0.05u;

draw (-4u,yshi)--(-1.5u,yshi);
draw (1.5u,yshi)--(5u,yshi);

draw (-4u,-yshi)--(-1.5u,-yshi);
draw (1.5u,-yshi)--(5u,-yshi);

label.lft(btex $S$ etex, (2u,1u));
label.lft(btex $\Gamma$ etex, (3u,1.75u));

label(btex $D$ etex, (.5u,.5u));
label(btex $G_1$ etex, (.5u,2.1u));
label(btex $G_2$ etex, (2.8u,-2u));

pickup pencircle scaled 2pt;

draw (0,0);
pickup pencircle scaled .25pt;

drawarrow (-4.5u,0)--(5.75u,0);
drawarrow (0,-3.5u)--(0,3.75u);

label.bot(btex $x$ etex, (5.75u,0));
label.lft(btex $y$ etex, (0,3.75u));

ahangle := 10;

drawarrow (5.15u, -.4u){dir 80}..(5.15u, .4u);
drawarrow (-4.15u, .4u){dir -100}..(-4.15u, -.4u);

drawarrow (.4u, 3.15u){dir 170}..(-.4u, 3.15u);
drawarrow (-.4u, -3.15u){dir -10}..(.4u, -3.15u);

drawarrow (-.4u, 1.65u){dir 10}..(.4u, 1.65u);
drawarrow (.4u, -1.65u){dir -170}..(-.4u, -1.65u);

drawarrow (3.2u + -.4u, yshi+.15u)--(3.2u + .4u, yshi+.15u);
drawarrow (3.2u - -.4u, -yshi-.15u)--(3.2u - .4u, -yshi-.15u);

drawarrow (-2.7u + -.4u, yshi+.15u)--(-2.7u + .4u, yshi+.15u);
drawarrow (-2.7u - -.4u, -yshi-.15u)--(-2.7u - .4u, -yshi-.15u);

endfig;


% =======================================================
% The normal to area
% =======================================================
beginfig(40);
numeric u;
u=0.5cm;

ahangle := 20;
linejoin := mitered;


draw (4u,2u){dir 90}..(2u,4u)..(1u,2.5u)..(2u,0)..cycle;

drawarrow (4u,2u)--(4u,4u);

drawarrow (4u,2u)--(6u,2u);

pickup pencircle scaled 1pt;
                    
drawarrow (4u,2u)--(5u,2u);

pickup pencircle scaled 2pt;

draw (4u,2u);

label.top(btex $n$ etex, (5u, 2u));
label.top(btex $\widetilde{v}$ etex, (6u, 2u));
label.rt(btex $v$ etex, (4u, 4u));

label(btex $G$ etex, (2.5u, 2u));

endfig;


% =======================================================
% Double series convergence
% =======================================================

beginfig(50);
numeric u;
u=0.5cm;

ahangle := 20;
linejoin := mitered;

drawarrow (-1u, 0)--(6u, 0);
drawarrow (0, -1u)--(0,6u);


xmf := u*cosd(60);
ymf := u*sind(60);

xms := u*cosd(40);
yms := u*sind(40);

path p[];
p[1] := (0,0)--(6*xmf,6*ymf);
p[2] := (0,0)--(6.5*xms,6.5*yms);

p[3] := (4*xmf,0)--(4*xmf,6u);
p[4] := (0,4*ymf)--(6u,4*ymf);

draw p[3];
draw p[4];

pickup pencircle scaled 1pt;

draw p[1];
draw p[2];

pickup pencircle scaled 3pt;

draw (0,0);
z0 = (4*xmf, 4*ymf);
draw z0;

label.bot(btex $x$ etex, (5.5u,0));
label.lft(btex $y$ etex, (0,5.5u));

label(btex $M_\alpha$ etex, (4*xmf+.85u,4*ymf+.35u));

z1 = p[2] intersectionpoint p[3];
z2 = p[2] intersectionpoint p[4];

draw z1;
draw z2;

z3 = (4*xms, 4*yms);

draw z3;

pickup pencircle scaled 1pt;

draw (1u,4u)..z0..z3..(4.5u,1u);

label.rt(btex $X_\beta$ etex, z1 - (.1u,.3u));
label.bot(btex $Y_\beta$ etex, z2 + (.6u,0));
label.bot(btex $M_\beta$ etex, z2 + (-.25u,-.5u));

label.rt(btex $\gamma$ etex, (4.5u,1u));

endfig;


verbatimtex
  \end{document}
etex

bye
