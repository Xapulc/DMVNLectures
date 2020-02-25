verbatimtex
  \documentclass[a4paper]{article}
  \usepackage[simple]{dmvn}
  \begin{document}
  \pagestyle{empty}
etex

% =============================
%  DMVN MetaPost Macro Library
% (C) 2004, All rights reserved
%    Last Edition: 12.07.2004
% =============================

def xp = redpart enddef;
def yp = greenpart enddef;
def zp = bluepart enddef;

% Rectangular Projection
newinternal dprhorz, dprvert;
dprhorz := .5; dprvert := .25;
def dpr(expr c) = ((xp c) - dprhorz*(yp c), (zp c) - dprvert*(yp c)) enddef;

% Perspective Projection
newinternal cameradepth, cameraheight;
cameradepth := 10cm; cameraheight := -3cm;
def ppr(expr c) = (((-(xp c))/((yp c)-cameradepth))*cameradepth,(-((zp c)+ cameraheight)/((yp c)-cameradepth))*cameradepth) enddef;

% Dot Product for 3D
def vdp(expr p,q) =
   ((xp p)*(xp q)+(yp p)*(yp q)+(zp p)*(zp q))
enddef;

% Length of 3D vector
def vlen(expr p) =
   sqrt(((xp p)*(xp p)+(yp p)*(yp p)+(zp p)*(zp p)))
enddef;

% 3D Angle
def vang(expr p,q) =
   vdp(p/vlen(p),q/vlen(q))
enddef;

% Cross Product for 3D
def vcp(expr p,q) =
   ((yp p)*(zp q)-(yp q)*(zp p),
    (zp p)*(xp q)-(zp q)*(xp p),
    (xp p)*(yp q)-(xp q)*(yp p))
enddef;

% Intersection point of plane and line in 3D
def vip(expr p, v, a,b,c) =
% line: from point "p" with dir "v"
% plane: through points "a", "b", "c"
begingroup
   save r,e,f;
   color r,e,f;
   e = b-a;
   f = c-a;
   r = p + whatever*v = a + whatever*e + whatever*f;
   (r)
endgroup
enddef;

% Normal to plane aff<a,b,c>
def vnorm(expr a,b,c) =
   (vcp(b-a,c-a))
enddef;

% Perpendicular from "p" dropped to plane aff<a,b,c>
def vperend(expr p,a,b,c) =
   (vip(p,vnorm(a,b,c),a,b,c))
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

% Draw Line Cycle z[s]..z[e]
def dp(expr s, e) =
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
      r := (  xp c[i]) * cosd(a) + (yp c[i]) * sind(a);
      g := (- xp c[i]) * sind(a) + (yp c[i]) * cosd(a);
      c[i] := (r,g, zp c[i]);
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

% For typing in cells in chessboards
def printcell(expr x,y,s) =
   label(s, ((x+.5)*u,(y+.5)*u));
enddef;

% Marking points
def mp(expr s,e) =
   pickup pencircle scaled 2pt;
   for i = s upto e: draw z[i]; endfor
enddef;

% Draw square with UL-corner A and side S
def square(expr a, s) =
draw a--(a + (0,s))--(a + (s,s))--(a + (s,0))--cycle;
enddef;

% Perspective projection of points z[s]..z[e]
def ppp(expr s,e) = for i = s upto e: z[i] = ppr(c[i]); endfor enddef;

% Dimetric projection of points z[s]..z[e]
def dpp(expr s,e) = for i = s upto e: z[i] = dpr(c[i]); endfor enddef;

u = 1cm;


% ===========================================
% ===========================================
%             P I C T U R E S
% ===========================================
% ===========================================

% =========================================================
% Sample picture
% =========================================================
beginfig(1);

u := .75cm;

color c[];

c1 = (1,1,0)*u;
c2 = (1,4,0)*u;
c3 = (4,4,0)*u;
c4 = (4,1,0)*u;

c5 = (1,1,3)*u;
c6 = (1,4,3)*u;
c7 = (4,4,3)*u;
c8 = (4,1,3)*u;

c9 = (2,2,1.2)*u;
c10 = (2,2,1.5)*u;
c11 = (2,2.8,1.5)*u;

c12 = (3,2,2.2)*u;
c13 = (3.5,3,2.5)*u;
c14 = (3.2,3.8,2.2)*u;

cameraheight := -2u;

ppp(1,14);

draw z2--z1--z5--z6;

draw z5--z8--z7 dashed evenly scaled .5;

draw z2--z6--z7--z3--cycle;
draw z8--z4--z3 dashed evenly scaled .5;

draw z1--z4 dashed evenly scaled .5;


path p[];

p1 := z9..z10{dir -5}..z11..cycle;
fill p1 withcolor .7white;
draw p1;

p2 := z12{dir 70}..z13..z14..cycle;
fill p2 withcolor .6white;
draw p2;

p3 := (z12..z13..{dir 150}z14..cycle) shifted (-.5u,-1.5u);
fill p3 withcolor .8white;
draw p3;

p4 := (z9..z10{dir 80}..z11..cycle) scaled 2 shifted (.5u,-.5u);
fill p4 withcolor .5white;
draw p4;

p5 := (z9..z10{dir 120}..z11..cycle) scaled 1.7 rotated 80 shifted (.2u,-6u);
fill p5 withcolor .9white;
draw p5;

p6 := ((p3 scaled .7) shifted (-2u,-2u)) rotated 70;
fill p6 withcolor .4white;
draw p6;

label(btex $v_1$ etex, (2.5, .1)*u);
label(btex $v_2$ etex, (3.3, .6)*u);
label(btex $v_n$ etex, (4.8, -2)*u);

for i = 1 upto 204:
    c[i+20] = (1 + (normaldeviate mod 1)*3, 1 + (normaldeviate mod 1)*3, (normaldeviate mod 1)*3)*u;
    z[i+20] = ppr(c[i+20]);
    draw z[i+20] withpen pencircle scaled 1pt;
endfor



endfig;

verbatimtex \end{document} etex

bye;
