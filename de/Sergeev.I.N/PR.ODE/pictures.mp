verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex

% =============================
%  DMVN MetaPost Macro Library
% (C) 2004, All rights reserved
%    Last Edition: 02.07.2004
% =============================

def xp = redpart enddef;
def yp = greenpart enddef;
def zp = bluepart enddef;

% Rectangular Projection
newinternal dprhorz, dprvert;
dprhorz := .5; dprvert := .25;
def dpr(expr c) = ((redpart c) - dprhorz*(greenpart c), (bluepart c) - dprvert*(greenpart c)) enddef;

% Perspective Projection
newinternal cameradepth, cameraheight;
cameradepth := 10cm; cameraheight := -3cm;
def ppr(expr c) = (((-(redpart c))/((greenpart c)-cameradepth))*cameradepth,(-((bluepart c)+ cameraheight)/((greenpart c)-cameradepth))*cameradepth) enddef;

% Dot Product for 3D
def dp(expr p,q) =
   ((redpart p)*(redpart q)+(greenpart p)*(greenpart q)+(bluepart p)*(bluepart q))
enddef;

% Cross Product for 3D
def cp(expr p,q) =
   ((yp p)*(zp q)-(yp q)*(zp p),(zp p)*(xp q)-(zp q)*(xp p),(zp p)*(yp q)-(xp q)*(yp p))
enddef;

% "Left" Half of Arc
def plharc(expr a, b) =
begingroup
   save v, w; pair v, w;
   v = .5[a,b];
   w = v + ((v-a) rotated 90);
   (a..w..b)
endgroup
enddef;

% "Right" Half of Arc
def prharc(expr a, b) =
begingroup
   save v, w; pair v, w;
   v = .5[a,b];
   w = v + ((v-a) rotated -90);
   (a..w..b)
endgroup
enddef;

% "Left" Half of Arc
def lharc(expr a, b) = draw plharc(a,b); enddef;

% "Right" Half of Arc
def rharc(expr a, b) = draw prharc(a,b); enddef;

% Left Tangent Point
def ltanend(expr a, c, r) =
begingroup
   save p,q,v;
   path p,q;
   pair v;
   p := plharc(a,c);
   q = fullcircle scaled (2*r) shifted c;
   v = p intersectionpoint q;
   (v)
endgroup
enddef;

% Right Tangent End
def rtanend(expr a, c, r) =
begingroup
   save p,q,v;
   path p,q;
   pair v;
   p = prharc(a,c);
   q = fullcircle scaled (2*r) shifted c;
   v = p intersectionpoint q;
   (v)
endgroup
enddef;

% Path of Tangents
def pltan(expr a, c, r) = (a--ltanend(a,c,r)); enddef;
def prtan(expr a, c, r) = (a--rtanend(a,c,r)); enddef;

% Draw Tangents
def ltan(expr a, c, r) = draw pltan(a,c,r); enddef;
def rtan(expr a, c, r) = draw prtan(a,c,r); enddef;

% Rectangular Angle
newinternal rangsize;
rangsize := .2;

def rang(expr c, p, q)=
begingroup
   save v, w; pair v, w;
   v = p-c; w = q-c;
   v := v/length(v)*rangsize*u; w := w/length(w)*rangsize*u;
   draw c+v--c+v+w--c+w;
endgroup
enddef;

% Marked Side
newinternal sidesize; sidesize := .075;

def side(expr a, b, count)=
begingroup
   save v, w, fs, z; pair v, w, fs, z;
   v = (unitvector(b-a) rotated 90) * sidesize * u;
   w = (unitvector(b-a)) * .05u;
   z = .5[a,b];
   fs = w*(count-1)/2;
   for i = 0 upto count-1: draw z+v-fs+i*w--z-v-fs+i*w; endfor
endgroup
enddef;

% Marked Dollar Side
newinternal dollarsize; dollarsize := .04;

def dollarside(expr a, b)=
begingroup
   save v, w, z; pair v, w, z;
   v = (unitvector(b-a) rotated 90) * dollarsize * u;
   w = (unitvector(b-a)) * 3*dollarsize*u;
   z = .5[a,b];
   draw z-v+w{v}..z+w{v}..{-v}z..{v}z-w..{v}z-w+v;
endgroup
enddef;



% Circular Angle
newinternal cangsize; cangsize := .2;

def cang(expr c, p, q, count)=
begingroup
   save v, w; pair v, w;
   for i = 1 upto count:
      v := unitvector(p-c)*cangsize*u * (1 + i/5);
      w := unitvector(q-c)*cangsize*u * (1 + i/5);
      draw c+v{v rotated -90}..c+w;
   endfor
endgroup
enddef;

% Draw Circle on the Diameter
def dcir(expr a,b) = draw fullcircle scaled length(a-b) shifted .5[a,b]; enddef;

% Circle on the Diameter
def pdcir(expr a,b) = (fullcircle scaled length(a-b) shifted .5[a,b]) enddef;

% Escribed Circle
def ecir(expr a,b,c) =
begingroup
   save v,w,z; pair v,w,z;
   v = (b-a) rotated 90; w = (c-a) rotated 90;
   .5[a,b] + v*whatever = z = .5[a,c] + w*whatever;
   draw fullcircle scaled (2*length(z-a)) shifted z;
endgroup
enddef;

% Path of Escribed Circle
def pecir(expr a,b,c) =
begingroup
   save v,w,z; pair v,w,z;
   v = (b-a) rotated 90; w = (c-a) rotated 90;
   .5[a,b] + v*whatever = z = .5[a,c] + w*whatever;
   (fullcircle scaled (2*length(z-a)) shifted z)
endgroup
enddef;

% Center of Escribed Circle
def ecirpoint(expr a,b,c) =
begingroup
   save v,w,z; pair v,w,z;
   v = (b-a) rotated 90; w = (c-a) rotated 90;
   z = .5[a,b] + v*whatever = .5[a,c] + w*whatever;
   (z)
endgroup
enddef;

% Half of Circle
def hcir(expr r) =
begingroup
   save p; path p;
   p = (r, 0)..(0,r)..(-r,0);
   (p)
endgroup
enddef;

% Inscribed circle
def icir(expr a,b,c) =
begingroup
  save v,w,z,r,l,p,q; pair v,w,z,p,q; numeric r,l,s;
  v = unitvector(b-a) + unitvector(c-a);
  w = unitvector(a-b) + unitvector(c-b);
  p = b-a;
  q = c-a;
  a + v*whatever = z = b + w*whatever;
  l = length(a-b)+length(b-c)+length(c-a);
  r = abs((xpart p) / l * (ypart q) - (ypart p) / l * (xpart q));
  draw fullcircle scaled (2*r) shifted z;
endgroup
enddef;

% Center of Inscribed circle
def icirpoint(expr a,b,c) =
  (bispoint(a,b,c))
enddef;

% Perpendicular
def perend(expr a, b, c) =
begingroup
   save z; pair z;
   z = whatever[b,c] = a + whatever*((c-b) rotated 90);
   (z)
endgroup
enddef;

% Orthocenter
def perpoint(expr a, b, c) =
begingroup
   save v, w, z; pair v, w, z;
   v = perend(a,b,c); w = perend(b,a,c);
   z = whatever[a,v] = whatever[b,w];
   (z)
endgroup
enddef;

% Draw Perpendicular
def per(expr a, b, c) =
begingroup
   save z; pair z;
   z = whatever[b,c] = a + whatever*((c-b) rotated 90);
   draw a--z;
endgroup
enddef;

% Draw All Perpendiculars
def aper(expr a, b, c) =
begingroup
   per(a,b,c);
   per(b,c,a);
   per(c,a,b);
endgroup
enddef;

% Path of Perpendicular
def pper(expr a, b, c) =
begingroup
   save z; pair z;
   z = whatever[b,c] = a + whatever*((c-b) rotated 90);
   (a--z);
endgroup
enddef;

% Draw Perpendicular with Angle
def mper(expr a, b, c) =
begingroup
   save z; pair z;
   z = whatever[b,c] = a + whatever*((c-b) rotated 90);
   draw a--z;
   rang(z, b, a);
endgroup
enddef;

% Draw All Marked Perpendiculars
def amper(expr a, b, c) =
begingroup
   mper(a,b,c);
   mper(b,c,a);
   mper(c,a,b);
endgroup
enddef;

% Draw Bisector
def bis(expr a, b, c) =
begingroup
   save v,w,z; pair v,w,z;
   v = unitvector(b-a); w = unitvector(c-a);
   z = whatever[b,c] = a + whatever*(v+w);
   draw a--z;
endgroup
enddef;

% Path of Bisector
def pbis(expr a, b, c) =
begingroup
   save v,w,z; pair v,w,z;
   v = unitvector(b-a); w = unitvector(c-a);
   z = whatever[b,c] = a + whatever*(v+w);
   (a--z);
endgroup
enddef;

% Draw All Bisectors
def abis(expr a, b, c) =
begingroup
   bis(a,b,c);
   bis(b,c,a);
   bis(c,a,b);
endgroup
enddef;

% Bisector EndPoint
def bisend(expr a, b, c) =
begingroup
   save v,w,z; pair v,w,z;
   v = unitvector(b-a); w = unitvector(c-a);
   z = whatever[b,c] = a + whatever*(v+w);
   (z)
endgroup
enddef;

% Draw Marked Bisector
def mbis(expr a, b, c, count) =
begingroup
   save v,w,z; pair v,w,z;
   v = unitvector(b-a); w = unitvector(c-a);
   z = whatever[b,c] = a + whatever*(v+w);
   draw a--z;
   cang(a,b,z,count);
   cangsize := cangsize +.05;
   cang(a,z,c,count);
   cangsize := cangsize -.05;
endgroup
enddef;

% Draw All Bisectors
def ambis(expr a, b, c) =
begingroup
   mbis(a,b,c,1);
   mbis(b,c,a,2);
   mbis(c,a,b,3);
endgroup
enddef;

% Bisector Point
def bispoint(expr a, b, c) =
begingroup
   save fp, sp, z; pair fp, sp, z;
   fp = bisend(a,b,c);
   sp = bisend(b,a,c);
   z = whatever[a,fp] = whatever[b,sp];
   (z)
endgroup
enddef;

% Intersection point of lines
def ip(expr a,b,c,d) =
   whatever[a,b]=whatever[c,d]
enddef;

% Draw Points Cycle 1..n
def dz(expr n) =
begingroup
   save i; numeric i;
   draw z1
   for i := 2 upto n: --z[i] endfor --cycle;
endgroup
enddef;

% Draw Points Cycle s..e
def dzs(expr s, e) =
begingroup
   save i; numeric i;
   draw z[s]
   for i := s+1 upto e: --z[i] endfor --cycle;
endgroup
enddef;

% Chartable
def chartable =
begingroup
   for i = 1 upto 16:
      for j = 1 upto 16:
         label(("." & char(i*16+j-1) & ".") infont "lati700", (.6*i*u, j*.5u));
      endfor
   endfor
endgroup
enddef;

% Rotation around Z axis to 'a' degrees
def rotz(expr s,e,a) =
begingroup
   save r,g;
   numeric r,g;

   for i = s upto e:
      r := (  redpart c[i]) * cosd(a) + (greenpart c[i]) * sind(a);
      g := (- redpart c[i]) * sind(a) + (greenpart c[i]) * cosd(a);
      c[i] := (r,g, bluepart c[i]);
   endfor
endgroup
enddef;

% Cells
def cells(expr count) =
   for i = 0 upto count:
      draw (0,i*u)--(count*u,i*u);
      draw (i*u,0)--(i*u,count*u);
   endfor;
enddef;

% For filling cells in chessboards
def fillcell(expr x,y,c) =
   fill (x*u,y*u)--((x+1)*u,y*u)--((x+1)*u,(y+1)*u)--(x*u,(y+1)*u)--cycle
   withcolor c;
enddef;

% Marking points
def mp(expr s,e) =
   pickup pencircle scaled 2pt;
   for i = s upto e: draw z[i]; endfor
enddef;

def square(expr a, s) =
draw a--(a + (0,s))--(a + (s,s))--(a + (s,0))--cycle;
enddef;

% ===========================================
% ===========================================
%             P I C T U R E S
% ===========================================
% ===========================================

u = 1cm;

% =========================================================
% Solution of ODE
% =========================================================
beginfig(1);

u := 1cm;

numeric l,m,s,e;

def iks(expr t) = (m*(2.71828**(3*t))) enddef;
def igrek(expr t) = (l*(2.7828**(2*t)) - m*(2.71828**(3*t))) enddef;


def eqngraph(expr vars,vare,varl,varm) = 
begingroup
  l := varl;
  m := varm;
  s := vars;
  e := vare;
  save t;

  draw (iks(s),igrek(s))*u
  for t = s step .05 until e:
     ..(iks(t)*u,igrek(t)*u)
  endfor withpen pencircle scaled .2pt;
endgroup
enddef;

for i = -3 step 1 until 3:
  for j = -3 step 1 until 3:
    eqngraph(-5,1.5, i, j);
  endfor
endfor

clip currentpicture to (fullcircle xscaled 7u yscaled 5u);

linejoin := mitered;
ahangle := 20;

drawarrow (-4u,0)--(4u,0);
drawarrow (0,-3u)--(0,3u);

pickup pencircle scaled 1pt;
drawarrow (0,0)--(0,1u);
drawarrow (0,0)--(1u,-1u);

pickup pencircle scaled 2pt;
draw (0,0);

label(btex $h_1$ etex, (.18u,1.2u));
label.rt(btex $h_2$ etex, (1u,-1u));

label.bot(btex $x$ etex, (4u,0));
label.llft(btex $y$ etex, (0,3u));

endfig;

verbatimtex
  \end{document}
etex

bye;
