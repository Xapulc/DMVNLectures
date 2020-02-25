verbatimtex
\documentclass{article}
\begin{document}
\footnotesize
etex

input dmvnmpl;

% =========================
% T.o.P Pictures - Holevo
% =========================

beginfig(1);
numeric u;
u:=.4cm;

ahangle := 20;

drawarrow (-1u,0)--(10u,0);
drawarrow (0,-1u)--(0,4u);

for i = 1 upto 9:
   draw (i*u,-.125u)--(i*u,.125u) sthin;
endfor

for i = 1 upto 3:
   draw (-.125u, i*u)--(.125u,i*u) sthin;
endfor

draw (0,0)--(2u,2u)--(3u,1u)--(5u,3u)--(6u,2u)--(7u,3u)--(9u,1u) snorm;

mpt ((0,0));
mpt ((1u,1u));
mpt ((2u,2u));
mpt ((3u,1u));
mpt ((4u,2u));
mpt ((5u,3u));
mpt ((6u,2u));
mpt ((7u,3u));
mpt ((8u,2u));
mpt ((9u,1u));

endfig;

% ===================================================
% continous probability
% ===================================================

beginfig(2);
numeric u;
u:=.6cm;

ahangle := 20;

drawarrow (0,0)--(4.5u,0);
drawarrow (0,0)--(0,4.5u);

draw (0,4u)--(4u,4u)--(4u,0);

draw (0,0)--(4u,4u);

path p[];

p[1] := (2u,0)--(2u,2u)--(4u,2u)--(2u,0)--cycle;
p[2] := (0,2u)--(2u,2u)--(2u,4u)--(0,2u)--cycle;

draw p[1];
draw p[2];

fill p[1] withcolor .5white;
fill p[2] withcolor .5white;

elabel.top(btex $A$ etex, .7[(0u,2.1u),(2u,2.1u)]);
elabel.bot(btex $A$ etex, .3[(2u,1.9u),(4u,1.9u)]);

label.bot(btex $1$ etex, (4u,0));
label.lft(btex $1$ etex, (0,4u));

label.bot(btex $0.5$ etex, (2u,0));
label.lft(btex $0.5$ etex, (0,2u));

mpt ((0,0));
mpt ((2u,0));
mpt ((0,2u));
mpt ((4u,4u));
mpt ((4u,2u));
mpt ((2u,4u));
mpt ((0,4u));
mpt ((4u,0));
mpt ((2u,2u));

endfig;

bye;
