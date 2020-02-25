input dmvnmpl;
verbatimtex
\documentclass{article}
\usepackage{dmvn}
\begin{document}
\footnotesize
etex

beginfig(1);

path p;
p:=1.8cm * dir (-60)..(-1.8cm,0)..1.8cm * dir (60)--cycle;
fill p withcolor 0.8white;
draw p sbold;
drawarrow (-2cm,0)--(2cm,0);
drawarrow (0,-2.2cm)--(0,2.2cm);
draw 1.8cm * dir (-60)--1.8cm * dir (60) sbold;
draw (0,0)--1.8cm * dir (60);
drawarrow 1.6cm * dir (160) {dir -110}..1.6cm * dir (200) {dir -70};
drawarrow (0.7cm,-0.5cm)--(0.7cm,0.5cm);

label.lft(btex $\Gamma$ etex, (-1.7cm,.5cm));
label.lft(btex $a$ etex, (1.3cm,-0.2cm));
label.bot(btex $\sigma$ etex, (1.9cm,-0));
label.lft(btex $t$ etex, (0,2.1cm));
label.bot(btex $r$ etex, (0.4cm,0.6cm));
endfig;

% ===========================

beginfig(2);

fill (2cm,2cm)--(2cm,.7cm)--(1.5cm,.7cm){dir135}..(1.05cm,2cm){dir 95}--cycle withcolor 0.8 white;
fill (2cm,-2cm)--(2cm,-.7cm)--(1.5cm,-.7cm){dir -135}..(1.05cm,-2cm){dir -95}--cycle withcolor 0.8 white;

draw (1.5cm,.7cm){dir135}..(1.05cm,2cm){dir 95};
draw (1.5cm,-.7cm){dir -135}..(1.05cm,-2cm){dir -95};
drawarrow (-0.5cm,0)--(3cm,0);
drawarrow (0cm,-2cm)--(0cm,2cm);

draw (1cm,-2cm)--(1cm,2cm);
draw (2cm,-2cm)--(2cm,2cm);

draw (0,0.7cm)--(2cm,0.7cm) dashed evenly;

draw (0,-0.7cm)--(2cm,-0.7cm) dashed evenly;

label.bot(btex $1$ etex,(0.8cm,0cm));
label.bot(btex $2$ etex,(2.2cm,0cm));
label.bot(btex $3$ etex,(0.2cm,0.7cm));
label.bot(btex $-3$ etex,(0.2cm,-0.7cm));
label.bot(btex $\sigma$ etex,(3cm,0));
label.lft(btex $t$ etex,(0,2cm));

endfig;

% ===================================
beginfig(3);

fill (2cm,.7cm)--(2cm,3cm)--(1.9cm,3cm){dir-95}..(1.25cm,0.7cm){dir -145}--cycle withcolor 0.8 white;
fill (2cm,-.7cm)--(2cm,-3cm)--(1.9cm,-3cm){dir95}..(1.25cm,-0.7cm){dir 145}--cycle withcolor 0.8 white;
draw (1.9cm,3cm){dir-95}..(1.25cm,0.7cm){dir -145};
draw (1.9cm,-3cm){dir95}..(1.25cm,-0.7cm){dir 145};
draw (1cm,-3cm)--(1cm,3cm) dashed evenly;
drawarrow (-0.5cm,0)--(2.8cm,0);
drawarrow (0cm,-3cm)--(0cm,3cm);
draw (2cm,-3cm)--(2cm,3cm);
draw (0,0.7cm)--(2cm,0.7cm) dashed evenly;
draw (0,-0.7cm)--(2cm,-0.7cm) dashed evenly;

z1 = (2cm,0cm);
z0 = (0cm,0cm);
z2 = (1cm,0cm);

bmp(0,2);

label.llft(btex $1$ etex, (2cm,0cm));
label.llft(btex $0$ etex, (0cm,0cm));
label.llft(btex $\frac12$ etex, (1cm,0cm));
label.bot(btex $\sigma$ etex, (3cm,0));
label.lft(btex $t$ etex, (0,3cm));

endfig;
%=======================

beginfig(4);

fill (0.8cm,1cm)--(1.3cm,1cm)--(1.3cm,-1cm)--(0.8cm,-1cm)--cycle withcolor 0.8white;
draw (1.3cm,1cm)--(1.3cm,-1cm) dashed evenly;
draw (0,1cm)--(0.8cm,1cm) dashed evenly;
draw (0,-1cm)--(0.8cm,-1cm) dashed evenly;
drawarrow (-0.5cm,0)--(2cm,0);
drawarrow (0,-2cm)--(0,2cm);
draw (0.8cm,-1cm)--(0.8cm,1cm) sbold;
draw (0.8cm,-1cm)--(1.3cm,-1cm) sbold;
draw (0.8cm,1cm)--(1.3cm,1cm) sbold;
draw (1.3cm,1cm)--(1.3cm,2cm) sbold;
draw (1.3cm,-2cm)--(1.3cm,-1cm) sbold;

drawarrow (0.8cm,-0.5cm)--(0.8cm,.5cm);
drawarrow (1.3cm,1cm)--(1.3cm,1.5cm);
drawarrow (1.3cm,-2cm)--(1.3cm,-1.5cm);
label.lft(btex $-T$ etex,(0,-1cm));
label.lft(btex $T$ etex,(0,1cm));
label.bot(btex $1$ etex,(1.5cm,0));
label.bot(btex $\sigma$ etex,(2cm,0));
label.lrt(btex $\eta$ etex,(0.8cm,0));

label.lft(btex $t$ etex,(0,2cm));
endfig;

% ==========================
beginfig(5);

fill (0.8cm,1cm)--(1.3cm,1cm)--(1.3cm,2cm)--(2cm,2cm)--(2cm,-2cm)--(1.3cm,-2cm)--(1.3cm,-1cm)--(0.8cm,-1cm)--cycle withcolor 0.8white;
draw (1.3cm,1cm)--(1.3cm,-1cm) dashed evenly;
draw (-0.05,1cm)--(0.05cm,1cm) sbold;
draw (-0.05,-1cm)--(0.05cm,-1cm) sbold;
drawarrow (-0.5cm,0)--(3cm,0);
drawarrow (0,-2cm)--(0,2cm);
draw (0.8cm,-1cm)--(0.8cm,1cm)  sbold;
draw (0.8cm,-1cm)--(1.3cm,-1cm)  sbold;
draw (0.8cm,1cm)--(1.3cm,1cm) sbold;
draw (1.3cm,1cm)--(1.3cm,2cm) sbold;
draw (1.3cm,-2cm)--(1.3cm,-1cm) sbold;
draw (1.3cm,2cm)--(2cm,2cm) sbold;
draw (1.3cm,-2cm)--(2cm,-2cm) sbold;
draw (2cm,2cm)--(2cm,-2cm) sbold;

drawarrow (2cm,-2cm)--(2cm,1cm);
drawarrow (0.8cm,0.5cm)--(0.8cm,-.5cm);
drawarrow (1.3cm,2cm)--(1.3cm,1.5cm);
drawarrow (1.3cm,-1cm)--(1.3cm,-1.5cm);
label.lft(btex $-T$ etex,(0,-1cm));
label.lft(btex $T$ etex,(0,1cm));
label.bot(btex $1$ etex,(1.5cm,0));
label.bot(btex $2$ etex,(2.2cm,0));
label.bot(btex $\sigma$ etex, (3cm,0));

label.lft(btex $t$ etex,(0,2cm));
label.bot(btex $H$ etex,(1.3cm,-2cm));
label.bot(btex $A$ etex,(2cm,-2cm));
label.top(btex $C$ etex,(1.3cm,2cm));
label.top(btex $B$ etex,(2cm,2cm));

label.lft(btex $E$ etex,(0.8cm,1cm));
label.lft(btex $F$ etex,(0.8cm,-1cm));

label.lrt(btex $\eta$ etex,(0.8cm,0));

label.lft(btex $D$ etex,(1.8cm,1cm));
label.lft(btex $G$ etex,(1.8cm,-1cm));
label.rt(btex $\Gamma$ etex, (2cm,.5cm));

endfig;

%========================================
beginfig(6);
path p;
p:=1.8cm * dir (-60)..(1.8cm,0)..1.8cm * dir (60)--cycle;
fill p withcolor 0.8white;
draw p sbold;
drawarrow (-0.3cm,0)--(2.2cm,0);
drawarrow (0,-2cm)--(0,2cm);
draw 1.8cm * dir (-60)--1.8cm * dir (60) sbold;
draw (0,0)--1.8cm * dir (60);
drawarrow 1.6cm * dir (30) {dir -60}..1.6cm * dir (-30) {dir -120};
drawarrow (1cm,-0.5cm)--(1cm,0.5cm);
label.lft(btex $a$ etex, (0.9cm,-0.2cm));
label.bot(btex $\sigma$ etex, (2.1cm,-0));
label.lft(btex $t$ etex, (0,1.9cm));
label.bot(btex $r$ etex, (0.4cm,0.6cm));
endfig;

bye;
