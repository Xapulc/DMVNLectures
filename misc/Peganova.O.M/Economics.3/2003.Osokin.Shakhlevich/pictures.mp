verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex

beginfig(10);
numeric u;
u := 1cm;

drawarrow (0,0)--(3u,0);
drawarrow (0,0)--(0,3u);

path p[];

p1 := (.5u,2.5u){dir -80}..(2.5u,.5u);

z1 = p1 intersectionpoint ((1.7u, 0)--(1.7u, 3u));
draw (0,ypart z1)--(2.9u,ypart z1) dashed evenly scaled .5;
draw (xpart z1, 0)--(xpart z1, 2.9u);
draw p1;


label.lft(btex $R$ etex, (0, 3u));
label.lft(btex $R_0$ etex, (0, ypart z1));
label.bot(btex $N$ etex, (3u, 0));

endfig;


beginfig(20);
numeric u;
u := 1cm;

drawarrow (0,0)--(3u,0);
drawarrow (0,0)--(0,3u);

path p[];

z2 = (2.5u,2.5u);
p1 := (.5u,.5u){dir 10}..z2;

draw p1;

z3 = (2.1u,2.5u);
p2 := (1u,.5u){dir 30}..z3;
draw p2;

z1 = p1 intersectionpoint p2;

p3 := (0, ypart z1 + .5u)--(2.9u, ypart z1 + .5u);

draw p3;

draw z1--(xpart z1, 0) dashed evenly scaled .5;
draw z1--(0, ypart z1) dashed evenly scaled .5;

%z1 = p1 intersectionpoint ((1.7u, 0)--(1.7u, 3u));
%draw (0,ypart z1)--(2.9u,ypart z1) dashed evenly scaled .5;
%draw (xpart z1, 0)--(xpart z1, 2.9u);
%draw p1;


label.lft(btex $P$ etex, (0, 3u));
label.lft(btex $P_0$ etex, (0, ypart z1 + .5u));
label.urt(btex $ATC$ etex, z2);
label.ulft(btex $MC$ etex, z3);
label.bot(btex $Q$ etex, (3u, 0));
label.bot(btex $Q_0$ etex, (xpart z1, 0));
label.lft(btex $4000$ etex, (0, ypart z1));

endfig;


verbatimtex
  \end{document}
etex

bye
