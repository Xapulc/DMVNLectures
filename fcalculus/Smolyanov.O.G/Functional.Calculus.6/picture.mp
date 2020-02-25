input dmvnmpl;

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex


numeric u;
u=1cm;

vardef f(expr t) =
 ((t/57.295779513082320876798154814105)*u,cosd(2*t)*u)
enddef;

ahangle:=25;

beginfig(1);

pickup pencircle scaled 1pt;
drawarrow (0,0)--(4.5u,0);

label(btex $[$ etex, (.25u,0));
label(btex $]$ etex, (3.5u,0));
label(btex $)$ etex, (3.75u,0));
label.bot(btex $a$ etex, (.25u,-.2u));
label.bot(btex $c\;\, b$ etex, (3.6u,-.1u));

endfig;

beginfig(2);

pickup pencircle scaled 1pt;
drawarrow (0,0)--(4.5u,0);

label(btex $($ etex, (.25u,0));
label(btex $[$ etex, (.5u,0));
label(btex $)$ etex, (4u,0));
label.bot(btex $d_i\, a_i$ etex, (.4u,-.1u));
label.bot(btex $b_i$ etex, (4u,-.1u));

endfig;

beginfig(3)

path n,omega;
numeric i;
pair A,B,C,D,E,F,G,H;

A=(0,-.75u);
B=(1u,1.25u);
C=(1.5u,1.75u);
D=(2.75u,2.75u);
E=(4u,1.75u);
F=(4.5u,1.25u);
G=(5.5u,2.75u);
H=(6.5u,3.75u);

draw (0,1.25u)--B--(1u,-.25u);
draw (0,1.75u)--C--(1.5u,-.25u);
draw (0,1.75u)--E--(4u,-.25u);
draw (0,1.25u)--F--(4.5u,-.25u);
draw (0,2.75u)--G--(5.5u,-.25u);

n=(0,-.75u)--(0,3.75u);
omega=(0,-.25u)--(7u,-.25u);

pickup pencircle scaled 1pt;
draw (-.05u,0)--(.05u,0);
draw (-.05u,.5u)--(.05u,.5u);
draw (-.05u,1.25u)--(.05u,1.25u);
draw (-.05u,1.75u)--(.05u,1.75u);
draw (-.05u,2.25u)--(.05u,2.25u);
draw (-.05u,2.75u)--(.05u,2.75u);
draw (-.05u,3.25u)--(.05u,3.25u);

label.lft(btex $2 \cdot 2^{-n}$ etex, (0,.5u));
label.lft(btex $2^{-n}$ etex, (0,0));

label.lft(btex $(k+1) \cdot 2^{-n}$ etex, (0,1.75u));
label.lft(btex $k \cdot 2^{-n}$ etex, (0,1.25u));

label.lft(btex $n$ etex, (0,3.25u));
label.bot(btex $\Omega$ etex, (7u,-.25u));


drawarrow n;
drawarrow omega;

pickup pencircle scaled 1.25pt;
draw A..B..C..D..E..F..G..H;

endfig;

beginfig(4);

pickup pencircle scaled 1pt;
drawarrow (0,0)--(4.5u,0);

draw (.5u,-.1u)--(.5u,.1u);
draw (1.5u,-.1u)--(1.5u,.1u);
draw (1.75u,-.1u)--(1.75u,.1u);
draw (2.75u,-.1u)--(2.75u,.1u);
label.bot(btex $\Omega$ etex, (4.5u,0));
label.bot(btex $\Omega_1$ etex, (u,-.2u));
label.bot(btex $\Omega_2$ etex, (2u,-.2u));

endfig;


beginfig(5)

pickup pencircle scaled 1pt;

draw (-.05u,.75u)--(.05u,.75u);
draw (-.05u,1.5u)--(.05u,1.5u);
%draw (-.05u,2.25u)--(.05u,2.25u);
draw (-.05u,3u)--(.05u,3u);
label.lft(btex $1$ etex, (-.05u,.75u));
label.lft(btex $2$ etex, (-.05u,1.5u));
label.lft(btex $4$ etex, (-.05u,3u));

draw (u,-.05u)--(u,.05u);
draw (2u,-.05u)--(2u,.05u);
draw (4u,-.05u)--(4u,.05u);
label.bot(btex $\frac14$ etex, (u,0));
label.bot(btex $\frac12$ etex, (2u,0));
label.bot(btex $1$ etex, (4u,0));

label.rt(btex $f_3$ etex, (.5u,3u));
label.urt(btex $f_2$ etex, (u,1.5u));
label.top(btex $f_1$ etex, (2u,.75u));

drawarrow (0,0)--(0,3.75u);
drawarrow (0,0)--(4.75u,0);

pickup pencircle scaled 1.25pt;
draw (0,0)--(.5u,3u)--(u,0);
draw (0,0)--(u,1.5u)--(2u,0);
draw (0,0)--(2u,.75u)--(4u,0);

endfig;

beginfig(6)

pickup pencircle scaled 1pt;

draw (-.05u,-2.25u)--(.05u,-2.25u);
draw (-.05u,-.75u)--(.05u,-.75u);
draw (-.05u,.75u)--(.05u,.75u);
label.lft(btex $1$ etex, (-.05u,.75u));
label.lft(btex $-1$ etex, (-.05u,-.75u));
label.lft(btex $-3$ etex, (-.05u,-2.25u));

draw (4u,-.05u)--(4u,.05u);
label.lrt(btex $\frac12$ etex, (2u,0));
label.bot(btex $1$ etex, (4u,0));

drawarrow (0,-3u)--(0,1.5u);
drawarrow (0,0)--(4.75u,0);

pickup pencircle scaled 1.25pt;
draw (u,.75u)--(4u,.75u);
draw (0,-.75u)--(2u,.-.75u);
draw (0,-2.25u)--(u,-2.25u);
draw (u,.75u)--(u,-2.25u) dashed evenly scaled 1;
draw (2u,.75u)--(2u,-.75u) dashed evenly scaled 1;

endfig;

beginfig(7);

pickup pencircle scaled 1pt;
draw (0,0)--(4.5u,0);

label(btex $[$ etex, (0,0));
label(btex $]$ etex, (4.5u,0));
draw (.5u,-.1u)--(.5u,.1u);
label.bot(btex $\frac1{2^n}$ etex, (.5u,-.1u));
label.bot(btex $0$ etex, (0u,-.2u));
label.bot(btex $1$ etex, (4.5u,-.2u));

endfig;


beginfig(8)

pickup pencircle scaled 1pt;

drawarrow (0,-u)--(0,4u);
drawarrow (0,0)--(5u,0);
draw (4.125u,-.05u)--(4.125u,.05u);
draw (.5u,-.05u)--(.5u,.05u);
label.lrt(btex $1$ etex, (4.125u,0));
label.bot(btex $\frac1n$ etex, (.5u,0));
draw (.25u,3.5u)..(.5u,2.5u)..(u,2u)..(1.5u,1.75u)..(2u,u);
%draw (2.25u,0)--(2.5u,-.5u)--(2.75u,0)--(2.875u,.75u)--(3u,u)--(3.125u,.75u)--(3.25u,0)--(3.5u,-.5u)--(3.625u,0)--(3.6875u,.75u)--(3.75u,u)--(3.8125u,.75u)--(3.875u,0)--(4u,-.5u)--(4.125u,u);

endfig;


beginfig(9)

pickup pencircle scaled 1pt;
drawarrow (0,-1.5u)--(0,3u);
drawarrow (0,0)--(5u,0);
draw (.5u,-.05u)--(.5u,.05u);
label.bot(btex $\frac18$ etex, (.5u,0));
draw (u,-.05u)--(u,.05u);
label.bot(btex $\frac14$ etex, (u,0));
draw (2u,-.05u)--(2u,.05u);
label.bot(btex $\frac12$ etex, (2u,0));
draw (4u,-.05u)--(4u,.05u);
label.bot(btex $1$ etex, (4u,0));

pickup pencircle scaled 1.25pt;
draw (.5u,2u)--(u,2u);
draw (u,-u)--(2u,-u);
draw (2u,.5u)--(4u,.5u);

label.rt(btex $a_3$ etex, (u,2u));
label.rt(btex $a_2$ etex, (2u,-u));
label.rt(btex $a_1$ etex, (4u,.5u));

endfig;

beginfig(10)
pickup pencircle scaled 1pt;
drawarrow (0,0)--(0,3u);
drawarrow (0,0)--(4u,0);
label.bot(btex $\Omega_1$ etex, (4u,0));
label.lft(btex $\Omega_2$ etex, (0,3u));
label(btex $A_2$ etex, (2u,2u));
label(btex $A_2^n$ etex, (u,u));

endfig;

beginfig(11)

pickup pencircle scaled 1pt;
drawarrow (0,0)--(0,2u);
drawarrow (0,0)--(4u,0);
label.bot(btex $\Omega_1$ etex, (4u,0));
label.lft(btex $\Omega_2$ etex, (0,2u));
draw (.25u,-.05u)--(.25u,.05u);
label.bot(btex $\omega_1$ etex, (.25u,0));
draw (-.05u,.75u)--(.05u,.75u);
label.lft(btex $\omega_2$ etex, (0,.75u));
dotlabel(btex $$ etex, (.25u,.75u));
draw (.5u,.5u)--(.5u,1.5u)--(3.5u,1.5u)--(3.5u,.5u)--cycle;
dotlabel.rt(btex $(\omega_1, \omega_2)$ etex, (2u,u));

label.rt(btex $A_2$ etex, (3.5u,u));
label.bot(btex $A_1$ etex, (2u,.5u));
endfig;

beginfig(12)

pickup pencircle scaled 1pt;
drawarrow (0,-1.5u)--(0,1.75u);
drawarrow (-1.5u,0)--(5u,0);

pickup pencircle scaled 1.25pt;

draw (-u,0)--f(-45)..f(-30)..f(0)..f(30)..f(60)..f(90)..f(120)..f(150)..f(180)..f(210)..f(225)--(4.8u,0);

endfig;

beginfig(13)

pickup pencircle scaled 1pt;
drawarrow (-3u,0)--(3u,0);
drawarrow (0,0)--(0,2u);

draw (u,-.05u)--(u,.05u);
label.bot(btex $a$ etex, (u,0));

pickup pencircle scaled 1.25pt;
draw (0,u)--(3u,u) dashed evenly scaled 1;
draw (0,0)..(.25u,sqrt(.25)*u)..(.5u,sqrt(.5)*u)..(.75u,sqrt(.75)*u)..(u,u)..(2u,sqrt(2)*u)..(3u,sqrt(3)*u)..(4u,2u);
label.lft(btex $1$ etex, (0,u));
label(btex $\Psi$ etex, (5u,5u));
label(btex $\Psi(\cdot -a)$ etex, (6u,6u));
label(btex $f(\cdot +b)$ etex, (7u,7u));

endfig;

beginfig(14)

pickup pencircle scaled 1pt;
drawarrow (-3u,0)--(3u,0);
drawarrow (0,0)--(0,2u);

draw (-u,-.05u)--(-u,.05u);
label.bot(btex $-a$ etex, (-u,0));
draw (2u,-.05u)--(2u,.05u);
label.bot(btex $b$ etex, (2u,0));

endfig;

beginfig(15)

pickup pencircle scaled 1pt;
drawarrow (-3u,0)--(3u,0);
drawarrow (0,0)--(0,2u);

draw (-1.5u,-.05u)--(-1.5u,.05u);
draw (-2.5u,-.05u)--(-2.5u,.05u);
draw (1.5u,-.05u)--(1.5u,.05u);
draw (2.5u,-.05u)--(2.5u,.05u);
label.bot(btex $-a\;\;-a+\varepsilon$ etex, (-2u,0));
label.bot(btex $a-\varepsilon\quad\quad a$ etex, (1.75u,0));
draw (-.05u,u)--(.05u,u);
label.lft(btex $1$ etex, (0,u));
endfig;

beginfig(19)

pickup pencircle scaled 1pt;
drawarrow (0,0)--(0,1.5u);
drawarrow (0,0)--(1.5u,0);

pickup pencircle scaled 1.25pt;
draw (u,0)..(1/sqrt(2)*u,1/sqrt(2)*u)..(0,u);

label.lft(btex $i$ etex, (0,u));
label.bot(btex $1$ etex, (u,0));

endfig;

end;

