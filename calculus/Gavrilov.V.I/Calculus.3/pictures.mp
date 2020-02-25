verbatimtex
\documentclass{article}
\usepackage[utf]{dmvn}
\begin{document}
\footnotesize
etex


input dmvnmpl;

beginfig(10);

numeric u;
u:=1.2cm;

z0 = (0,0);
z1 = (8u,0);
z2 = (0,6u);
z3 = (-.5u,0);
z4 = (0,-.5u);

z5 = (1.5u,5.5u);
z6 = (3.5u,2.5u);
z7 = (7.5u,.5u);


drawarrow z3--z1 snorm;
drawarrow z4--z2 snorm;

path p[];
p1 := z5..z6..z7;


pair w[];

vardef makes(expr i) =
save w;

pair w[];
w1 := p1 intersectionpoint ((i*u,0)--(i*u,6u));
w2 := p1 intersectionpoint (((i+.75)*u,0)--((i+.75)*u,6u));
w3 := (xpart w2, ypart w1);
p2 := p1 cutbefore w1 cutafter w2;
p3 := w1--w3--(reverse p2)--cycle;
p4 := p3 shifted (xpart -w1,0);

fill p3 withcolor .7white;
fill p4 withcolor .7white;


p5 := w1--(xpart w1,ypart w2)--w2;
p6 := p5 shifted (xpart -w1,0);

draw (0, ypart w1)--w1 dthin;
draw (0, ypart w2)--w2 dthin;

draw (xpart w1,0)--w1 dthin;
draw (xpart w2,0)--w2 dthin;

draw p3 snorm;
draw p4 snorm;

draw p5 snorm;
draw p6 snorm;

mpt(w1);
mpt(w2);

enddef;

makes(1.5);
makes(2.25);
makes(4.5);
makes(6.0);
makes(6.75);

draw p1 sbold;

draw (.75u,0)--(.75u,5.5u) dthin;

mpt(z0);

label.bot(btex {\tiny $a$} etex, (xpart z5,0));
label.bot(btex {\tiny $a+1$} etex, (xpart z5+.75u,0));
label.bot(btex {\tiny $a+k-1$} etex, (xpart z5+3u,0));
label.bot(btex {\tiny $a+k$} etex, (xpart z5+3.75u,0));
label.bot(btex $1$ etex, (0.75u,0));

label.lft(btex {\tiny $f(a)$} etex, (0,ypart z5));

z10 = p1 intersectionpoint ((6.0*u,0)--(6.0*u,6u));
z11 = p1 intersectionpoint (((6.0+.75)*u,0)--((6.0+.75)*u,6u));
label.bot(btex {\tiny $a+n-1$} etex, (xpart z10,0));
label.bot(btex {\tiny $a+n$} etex, (xpart z11,0));

label.lft(btex {\tiny $f(a+n)$} etex, (0,ypart z11));


z8 = p1 intersectionpoint ((4.5*u,0)--(4.5*u,6u));
label.lft(btex {\tiny $f(a+k-1)$} etex, (0,ypart z8));
z9 = p1 intersectionpoint ((5.25*u,0)--(5.25*u,6u));
label.lft(btex {\tiny $f(a+k)$} etex, (0,ypart z9));


endfig;


%beginfig(2);

%endfig;

bye;

