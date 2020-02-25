input dmvnmpl;

verbatimtex
\documentclass[a4paper]{article}
\usepackage[simple]{dmvn}
\begin{document}
etex

% ========================================================
beginfig(1);
% ========================================================
  fill (1.2cm,0.8cm)--(0.8cm,0)--(1.2cm,0)--cycle withcolor .8 white;
  fill (2.7cm,1.6cm)--(2.3cm,0.8cm)--(2.7cm,0.8cm)--cycle withcolor .8 white;
  fill (3.4cm,2.4cm)--(3cm,1.6cm)--(3.4cm,1.6cm)--cycle withcolor .8 white;

  drawarrow (0,0)--(5cm,0);
  drawarrow (0,0)--(0,3cm);

  draw (1.2cm,0.8cm)--(2.7cm,0.8cm);
  draw (2.7cm,1.6cm)--(3.4cm,1.6cm);
  draw (3.4cm,2.4cm)--(5cm,2.4cm);

  label.bot(btex $\lambda_1$ etex, (1.2cm,0));
  label.bot(btex $\lambda_2$ etex, (2.7cm,0));
  label.bot(btex $\lambda_3$ etex, (3.4cm,0));

  draw (1.2cm,0.8cm)--(1.2cm,0cm) dashed evenly;
  draw (2.7cm,1.6cm)--(2.7cm,0cm) dashed evenly;
  draw (3.4cm,2.4cm)--(3.4cm,0cm) dashed evenly;

  draw (1.2cm,0.8cm)--(0.8cm,0);
  draw (2.7cm,1.6cm)--(2.3cm,0.8cm);
  draw (3.4cm,2.4cm)--(3cm,1.6cm);

  label.top(btex $t$ etex, (4.7cm,0));

  label.lft(btex $1$ etex, (0,0.8cm));
  label.lft(btex $2$ etex, (0,1.6cm));
  label.lft(btex $3$ etex, (0,2.4cm));

  draw (-.05cm,0.8cm)--(0.05cm,.8cm);
  draw (-.05cm,1.6cm)--(0.05cm,1.6cm);
  draw (-.05cm,2.4cm)--(0.05cm,2.4cm);

  label.top(btex $S_{a}(t)$ etex, (4.2cm,2.4cm));

  draw (1cm,0.25cm)--(1cm,2cm) dashed evenly;
  draw (2.5cm,1.05cm)--(1cm,2cm) dashed evenly;

  label.top("shadows", (1cm,2cm));
endfig;

% ========================================================
beginfig(2);
% ========================================================

  drawarrow (0,0)--(5cm,0);
  drawarrow (0,0)--(0,3cm);

  label.top("t",(4.7cm,0));
  drawarrow (0,0)--(1.2cm,0);
  drawarrow (1.2cm,0.8cm)--(2.7cm,0.8cm);
  drawarrow (2.7cm,1.6cm)--(3.4cm,1.6cm);
  drawarrow (3.4cm,2.4cm)--(5cm,2.4cm);

  label.bot(btex $|\lambda_1|$ etex, (1.2cm,0));
  label.bot(btex $|\lambda_2|$ etex, (2.7cm,0));
  label.bot(btex $|\lambda_3|$ etex, (3.4cm,0));

  draw (1.2cm,0.8cm)--(1.2cm,0cm) dashed evenly;
  draw (2.7cm,1.6cm)--(2.7cm,0cm) dashed evenly;
  draw (3.4cm,2.4cm)--(3.4cm,0cm) dashed evenly;

  draw (-.05cm,0.8cm)--(0.05cm,.8cm);
  draw (-.05cm,1.6cm)--(0.05cm,1.6cm);
  draw (-.05cm,2.4cm)--(0.05cm,2.4cm);

  label.lft(btex $1$ etex, (0,0.8cm));
  label.lft(btex $2$ etex, (0,1.6cm));
  label.lft(btex $3$ etex, (0,2.4cm));

  label.top(btex $n_{\Lambda}(t)$ etex, (4.2cm,2.4cm));
endfig;

% ========================================================
beginfig(3);
% ========================================================
  path p, q;
  p:=fullcircle scaled 3cm shifted (1.5cm,-1cm);
  q:=fullcircle scaled 2cm shifted (1cm,.5cm);

  fill p withcolor 0.8white;
  fill q withcolor 0.8white;

  draw p;
  draw q;

  drawarrow (0,0)--(3cm,0);
  drawarrow (0,-3cm)--(0,2cm);

  label.lft(btex $0$ etex,(0,0));
endfig;

% ========================================================
beginfig(4);
% ========================================================
  u=0.1cm;
  drawarrow (0,0)--(3cm,0);
  drawarrow (0,-1cm)--(0,2cm);
  label.lrt("0", (0,0));

  for i=1 upto 30:
    draw ((-0.1cm,2cm)-(0,u*i))..((0cm,2cm)-(0,u*(i-1)));
  endfor;

  path p;
  p:=(0.5cm,0.5cm){right}..(1cm,1cm){up}..(2cm,1.5cm){right};

  for i=2 upto 20:
    draw point (length(p)*(1-sqrt(1/i))) of p withpen pencircle scaled 1bp;
  endfor;

  label.top(btex $\lambda$ etex, (1.4cm,1.4cm));
  draw (0.65cm,0.60cm) withpen pencircle scaled 1bp;
  draw (0.4cm,0.4cm) withpen pencircle scaled 1bp;
endfig;

% ========================================================
beginfig(5);
% ========================================================
  path p;
  p:=(0.5cm,-.5cm){down}..(1cm,-1cm){right}..(4cm,.5cm){up}..(2.5cm,1cm){(-1,1)}..(2cm,1.5cm){left}..(1.3cm,0.8cm){down}..cycle;
  fill p withcolor .8white;
  draw p;

  drawarrow (0,0)--(5cm,0);
  drawarrow (0,-1cm)--(0,2cm);
  draw (0.5cm,-1cm)--(0.5cm,2cm) dashed evenly;

  label.lft(btex $v$ etex, (0,1.8cm));
  label.top(btex $u$ etex, (4.7cm,0));
  label.top(btex $K$ etex, (2cm,0.2cm));
  label.llft(btex $u_0$ etex, (0.5cm,0));
endfig;

% ========================================================
beginfig(6);
% ========================================================
  drawarrow (-2.2cm,0)--(2.5cm,0);
  drawarrow (0,-1cm)--(0,2cm);
  draw (-1.5cm,0.5cm){right}..(0,1.5cm){right}..(1.5cm,-.5cm){(1,1)} withpen pencircle scaled 1bp;
  draw (-1.5cm,0.5cm)--(-1.7cm,0) withpen pencircle scaled 1bp;
  draw (1.5cm,-.5cm)--(1.7cm,0) withpen pencircle scaled 1bp;
  draw (-1.5cm,0.5cm)--(-1.5cm,0) dashed evenly;
  draw (1.5cm,-.5cm)--(1.5cm,0) dashed evenly;
  label.top(btex $-\pi$ etex, (-2cm,0));
  draw (-2cm,0)--(-1.7cm,0) withpen pencircle scaled 1bp;
  draw (2cm,0)--(1.7cm,0) withpen pencircle scaled 1bp;
  label.bot(btex $\pi$ etex, (2cm,0));
  draw (-2cm,0.05cm)--(-2cm,-0.05cm);
  draw (2cm,0.05cm)--(2cm,-0.05cm);
  draw (-2cm,-0.05cm){(2,-1)}..{(2,1)}(-1.5cm,-0.05cm);
  draw (1.5cm,0.05cm){(2,1)}..{(2,-1)}(2cm,0.05cm);
  label.bot(btex $\delta$ etex, (-1.75cm,-0.15cm));
  label.top(btex $\delta$ etex, (1.75cm,0.15cm));
  label.top(btex $\widetilde{\phi}(x)$ etex, (.7cm,1cm));
  label.top(btex $x$ etex, (2.3cm,0));
  label.lrt(btex $0$ etex ,(0,0));
endfig;

% ========================================================
beginfig(7)
% ========================================================
  path p;
  p:=(-2cm,0.5cm) {dir90}..(2cm,0.5cm) {dir -90}--cycle;
  fill p withcolor 0.8white;
  drawarrow (-3cm,0)--(3cm,0);
  drawarrow (0,-.5cm)--(0,3cm);

  draw (-2cm,0.5cm) {dir90}..(2cm,0.5cm) {dir -90};
  drawarrow 2.3cm * dir (110) {dir 20}..2.3cm * dir (70) {dir -20};
  drawarrow (-.2cm,0.7cm)--(-1cm,0.7cm);

  draw (-2cm,0.5cm)--(2cm,0.5cm) dashed evenly;
  draw (-2cm,0.5cm)--(-2cm,0) dashed evenly;
  draw (2cm,0.5cm)--(2cm,0cm) dashed evenly;

  label.bot(btex $-R$ etex, (-2cm,0));
  label.bot(btex $R$ etex, (2cm,0));
  label.top(btex $x$ etex, (2.8cm,0));
  label.lft(btex $y$ etex, (0,2.8cm));
  label.top(btex $iy$ etex, (0.3cm,0.5cm));
  label.top(btex $C_R$ etex, (1cm,2.3cm));
endfig;

% ========================================================
beginfig(8);
% ========================================================
  path p,q;
  p:=(1cm,0)--(2cm,0)--(3cm,1cm)--(3cm,2cm)--cycle;
  q:=(5cm,-1cm)--(7cm,-1cm)--(7cm,0)--(6cm,0)--cycle;

  fill p withcolor 0.8white;
  fill q withcolor 0.8white;

  draw (2cm,0)--(3cm,1cm);
  draw (1cm,0)--(3cm,2cm) dashed evenly;
  draw (4cm,-1cm)--(7cm,-1cm) dashed evenly;
  draw (5cm,-1cm)--(5cm,0) dashed evenly;
  draw (5cm,-1cm)--(6cm,0);

  drawarrow (0,0)--(0,2cm);
  drawarrow (0,0)--(3cm,0);

  drawarrow (4cm,0)--(7cm,0);
  drawarrow (4cm,-1.3cm)--(4cm,2cm);

  label.bot(btex $1$ etex,(1cm,0));
  label.bot(btex $2$ etex,(2cm,0));
  label.bot(btex $p$ etex,(2.7cm,0));
  label.lft(btex $\alpha$ etex, (0,1.7cm));
  label.lft(btex $\beta$ etex, (4cm,1.7cm));
  label.top(btex $q$ etex,(6.7cm,0));
  label.top(btex $1$ etex,(5cm,0));
  label.top(btex $2$ etex,(6cm,0));
  label.lft(btex $-1$ etex, (4cm,-1cm));
  label.top(btex $\alpha=p-1$ etex rotated 45, (1.6cm,0.2cm));
  endfig;
bye
