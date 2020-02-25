input dmvnmpl;
input dmvnaux;

verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple,utf]{dmvn}
  \begin{document}
  \footnotesize
etex

beginfig(0);
draw origin;
endfig;

beginfig(1);
numeric u; u = 1cm;

z1 = (0,0);
z2 = (4u,0);
z3 = (4u,2u);
z4 = (0,2u);

draw z1--z2--z3--z4--cycle snorm;

path p[];

pair is;

numeric j; j = 5;
for i = .001 step .001 until .999:
  p1 := i[z1,z4]--i[z2,z3];
  p2 := ((0,0)--(2u,0)) rotated 90i;
  is := p1 intersectionpoint p2;
  z[j] = is;
  if j = 400:
    draw p1 dthin;
    draw p2 dthin;
    elabel.urt(btex $M$ etex, is);
    z1500 = is;
  fi
  j := j + 1;
endfor;

draw z[5] for k = 6 upto j-1: --z[k] endfor;

bmp(1,5);
bmp(1500,1500);

label.ulft(btex $A$ etex, z4);
label.llft(btex $O$ etex, z1);
label.urt(btex $B$ etex, z3);
label.lrt(btex $C$ etex, z2);

endfig;


beginfig(2);
numeric u; u = cm;

r = 2u;

z2 = (0,0);
path p[];
p1 := fullcircle scaled 2r shifted z2;

z1 = (0,r);
z3 = (-r,0);

z4 = .5[z1,z3];

p2 := subp(fullcircle scaled (r*sqrt2) rotated 45 shifted z4, 0,.5);
p3 := subp(p1,.25,.5);

p4 := p2--reverse p3--cycle;

p10 := z1--z2--z3--cycle;

draw p1 snorm;
draw p10 snorm;
draw p2 snorm;

makelines(30,3u);
clip lines to p4;
draw lines;

makelines(30,3u);
clip lines to p10;
draw lines;

bmp(1,3);

label.top(btex $A$ etex, z1);
label.lrt(btex $B$ etex, z2);
label.lft(btex $C$ etex, z3);

elabel(btex $S_1$ etex, (-.9r,.9r));
label(btex $S_2$ etex, (-.6r,.6r));
elabel(btex $S_3$ etex, (-.3r,.3r));

endfig;


beginfig(3);
numeric u; u = 1cm;
numeric r; r = 1.5cm;

path p[];

p1 := fullcircle scaled 2r;
z1 = (-r, 0);
z2 = (r,0);

z3 = .4[z1,z2];

p2 := z3--(x3,-r);

z4 = p1 intersectionpoint p2;

draw z1--z2--z4--cycle snorm;
draw p1 snorm;
draw z3--z4 snorm;

rang(z4,z1,z2);

bmp(1,4);

label.bot(btex $M$ etex, z4);
label.top(btex $K$ etex, z3);
label.lft(btex $A$ etex, z1);
label.rt(btex $B$ etex, z2);

endfig;


beginfig(4);
  numeric u; u = 1cm;
  path p[];

  def parab(expr t) = (4.5u*(t,t*t)) enddef;

  numeric sta; sta = -.5;
  numeric ste; ste = .05;
  p1 := parab(sta) for i = sta+ste step ste until 1: ..parab(i) endfor;
  z1 = bop(p1);
  z2 = eop(p1);


  p1 := p1 rotated -angle(z2-z1);

  numeric depth; depth = 0;

  vardef buildins(expr pa, posi) =
    save d; pair d[];
    save pat; path pat;

    depth := depth + 1;
    if depth < 3:

      d3 = bop(pa);
      d4 = eop(pa);
      d5 = directionpoint (d4-d3) of pa;
      d6 = .5[d3,d4];
      d7 = d3 + whatever*(d6-d5) = d5 + whatever*(d4-d3);
      d8 = d4 + whatever*(d6-d5) = d5 + whatever*(d4-d3);

      draw d3--d4 snorm;
      for i = 3,4,5,6:
        draw d[i] wppc scaled 3pt;
      endfor

      draw d3--d7--d8--d4 snorm;
      draw d3--d5--d4 snorm;

      pat := d3--d4--d5--cycle;
      makelines(angle(d4-d3),6u);
      clip lines to pat;
      draw lines sethin;

      if depth = 1:
        elabel.lft(btex $A$ etex, d3);
        elabel.rt(btex $C$ etex, d4);
        elabel.top(btex $B$ etex, d5);
        elabel.top(btex $O_1$ etex, d6);
      fi

      if depth = 2:
        if posi = 1:
          elabel.top(btex $D$ etex, d5);
          elabel.top(btex $O_2$ etex, d6);
        else:
          elabel.top(btex $E$ etex, d5);
          elabel.top(btex $O_3$ etex, d6);
        fi
      fi

      buildins(pa cutafter d5,1);
      buildins(pa cutbefore d5,2);
    fi
    depth := depth - 1;
  enddef;

  buildins(p1,1);

  draw p1 sbold;

endfig;


beginfig(5);
  numeric u; u = 1cm;
  z0 = (0,0);
  z1 = (3u,0);
  z2 = (-2u,0);
  z3 = (0,2u);
  z4 = (0,-1u);

  def f(expr x) = sqrt(x) enddef;
  def g(expr x) = (x*u, f(x)*u) enddef;

  path p[];
  numeric st; st = .1;
  numeric t[];
  p1 := g(0)
  for i = st step st until 3: ..g(i) endfor;

  draw p1 sbold;
  t1 := .3;
  t2 := .8;

  z6 = relpoint(p1,t1);
  z5 = (x6,0);
  z7 = (whatever, 0) = z6 + whatever*reldir(p1,t1);
  z8 = 2[z7,z6];
  z9 = (-.3)[z7,z6];

  z10 = relpoint(p1,t2);
  z11 = (x10,0);
  z12 = (x10,whatever) = whatever[z6,z8];

  drawarrow z2--z1 snorm;
  drawarrow z4--z3 snorm;
  draw z9--z8 snorm;

  draw z12--z11 dthin;
  draw z6--z5 dthin;

  bmp(0,0);
  bmp(5,7);
  bmp(10,12);

  label.llft(btex $O$ etex, z0);

  label.bot(btex $P$ etex, z5);
  label.bot(btex $Q$ etex, z11);

  label.bot(btex $T$ etex, z7);
  label.top(btex $M$ etex, z6);
  label.top(btex $N$ etex, z12);

endfig;

verbatimtex
  \newdimen\bewidth\bewidth=15mm
  \def\bmn#1#2#3{\hbox{\scriptsize\vtop{\hbox to \bewidth{\hss#1\hss} \hbox to \bewidth{\hss#2\ldots#3\hss}}}}
  \def\bm#1{\hbox{#1}}
etex

beginfig(6);
  numeric u; u = 1cm;
  numeric w; w = 17mm;
  numeric h; h = 6mm;

  vardef fr(expr po) =
    save pa; path pa;
    pa := (.5w,.5h)--(-.5w,.5h)--(-.5w,-.5h)--(.5w,.-.5h)--cycle;
    unfill pa shifted po;
    draw pa shifted po snorm;
  enddef;

  vardef man(expr te, po) =
    fr(po);
    label(te, po);
  enddef;

  numeric msh; msh = 2u;
  numeric sh; sh = 1.9u;
  numeric ssh; ssh = .9u;

  z1 = (0,0);

  z2.1 = (-msh,-1u);
  z2.2 = (0,-1u);
  z2.3 = (msh,-1u);

  z3.1 = (x2.2-sh,-2u);

  z4.1 = (x2.3-sh,-2u);
  z4.2 = (x2.3,-2u);
  z4.3 = (x2.3+sh,-2u);

  z5.1 = (x4.3-ssh,-3u);
  z5.2 = (x4.3+ssh,-3u);

  draw z1--z2.1 snorm;
  draw z1--z2.2 snorm;
  draw z1--z2.3 snorm;

  draw z2.2--z3.1 snorm;

  draw z2.3--z4.1 snorm;
  draw z2.3--z4.2 snorm;
  draw z2.3--z4.3 snorm;

  draw z4.3--z5.1 snorm;
  draw z4.3--z5.2 snorm;

  man(btex \bmn{Николай}{1623}{1708} etex, z1);

  man(btex \bmn{Якоб I}{1654}{1705} etex, z2.1);
  man(btex \bm{Николай} etex, z2.2);
  man(btex \bmn{Иоганн I}{1667}{1748} etex, z2.3);

  man(btex \bmn{Николай I}{1687}{1759} etex, z3.1);

  man(btex \bmn{Николай II}{1695}{1726} etex, z4.1);
  man(btex \bmn{Даниил}{1700}{1787} etex, z4.2);
  man(btex \bmn{Иоганн II}{1710}{1790} etex, z4.3);

  man(btex \bm{Николай III} etex, z5.1);
  man(btex \bm{Якоб II} etex, z5.2);

endfig;

bye;
