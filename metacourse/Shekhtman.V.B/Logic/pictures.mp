input dmvnmpl;
input shekhtaux;

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage{dmvn}
  \begin{document}
  \footnotesize
etex

% =================================
% ShtrichPath
% =================================
vardef spath(expr p, st) =
  for i = 0 step st until 1: draw relpoint(p,i)--(relpoint(p,i) + (unitvector(reldir(p,i)) scaled .075u rotated 45)); endfor
enddef;

% ===============================================
% nullpicture
% ===============================================
beginfig(0);
  numeric u; u = 1cm;
  label(btex \framebox{[NO PICTURE AVAILABLE YET]} etex, origin);
endfig;

% ===============================================
% IL Corr: Implication check
% ===============================================
beginfig(1);
  numeric u; u = 1cm;
  numeric w; w = 2u;

  z1 = (0,0);
  z2 = (1w,0);
  z3 = z2 + (0.3u,0);

  bmp(1,2);

  darr(z1--z2);

  label.bot(btex $B \ra A$ etex, z1);
  label.bot(btex $B$ etex, z2);
  circletext(btex $A$ etex, z3);

  label.top(btex $u$ etex, z1);
  label.top(btex $v$ etex, z2);
endfig;

% ===============================================
% IL Corr: Axiom 8 check
% ===============================================
beginfig(2);
  numeric u; u = 1cm;
  numeric w; w = 2u;

  z1 = (0,0);
  z2 = (1w,0);
  z3 = (2w,0);
  z4 = z3 + (.6u,0);

  bmp(1,3);

  darr(z1--z2);
  darr(z2--z3);

  label.bot(btex $A \ra B$ etex, z1);
  label.bot(btex $B \ra C$ etex, z2);
  label.bot(btex $A \vee B$ etex, z3);
  circletext(btex $C$ etex, z4);

  label.top(btex $u$ etex, z1);
  label.top(btex $v$ etex, z2);
  label.top(btex $w$ etex, z3);
endfig;

% ===============================================
% IL Corr: Axiom 10 check
% ===============================================
beginfig(3);
  numeric u; u = 1cm;
  numeric w; w = 2u;

  z1 = (0,0);
  z2 = (1w,0);
  z3 = (2w,0);
  z4 = z3 + (.6u,0);
  z5 = z3 + (1.2u,0);

  bmp(1,3);

  darr(z1--z2);
  darr(z2--z3);

  label.bot(btex $A \ra B$ etex, z1);
  label.bot(btex $A \ra \neg B$ etex, z2);
  label.bot(btex $A$ etex, z3);
  circletext(btex $B$ etex, z4);
  circletext(btex $\neg B$ etex, z5);

  label.top(btex $u$ etex, z1);
  label.top(btex $v$ etex, z2);
  label.top(btex $w$ etex, z3);
endfig;


% ===============================================
% TND Unproof
% ===============================================
beginfig(4);
  numeric u; u = 1cm;
  numeric w; w = 2u;
  numeric r; r = .2w;

  z1 = (0,0);
  z2 = (1w,0);

  path p[];

  p1 := fullcircle scaled 2r shifted z1 shifted (-r,0);
  p2 := fullcircle rotated 180 scaled 2r shifted z2 shifted (r,0);

  bmp(1,2);

  darr(z1--z2);
  darr(p1);
  darr(p2);

  elabel.llft(btex $p$ etex, z2);

  label.lft(btex $u$ etex, z1);
  label.rt(btex $v$ etex, z2);
endfig;


bye;
