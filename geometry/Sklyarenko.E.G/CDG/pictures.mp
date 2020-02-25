input dmvnmpl;

verbatimtex
  \documentclass[a4paper]{article}
  \begin{document}
  \pagestyle{empty}
etex


numeric u;
u := 0.25cm;
% ============================================================================ BAD CURVE
beginfig(10); % Bad curve
u:=0.25cm;

ahangle := 20;

linejoin:=mitered;
drawarrow (-2u,0)--(6u,0);
drawarrow (0,-3.5u)--(0,3.5u);
linejoin:=rounded;

draw (0,0) for i = 0 upto 5: ..(i*i*u/5,i*i*i*i*i*u/1000) endfor;

draw (0,0) for i = 0 downto -5: ..(i*i*u/5,i*i*i*i*i*u/1000) endfor;

pickup pencircle scaled 2pt;

draw (0,0);

endfig;

% ============================================================================= U-LINES
def dsphere(expr x)(expr y) =
   ((x-y*0.5)*u+2.5u, (sqrt(r*r-y*y-x*x)-y*0.5)*u-5.5u)
enddef;

% begin

beginfig(20); %U-lines

u:=.5cm;

pickup pencircle scaled 0.5pt;

ahangle := 20;

% axis
linejoin:=mitered;

drawarrow (0,0)--(10u,0);
drawarrow (0,0)--(0,5u);
drawarrow (0,0)--(-3u,-3u);

linejoin:=rounded;

numeric r,c;

r := 9;
c := 5;

y := c;

a = -1;

b = 1;

d := 1;
e := .5;
f := .5;

% border of the surface
pickup pencircle scaled 0.35pt;

for x = -c+d+e step .5 until c-d-e:
   draw dsphere(x+f,-c+d+f)
   for y = -c+d upto c-d:
      ..dsphere(x+f,y+f)
   endfor;
endfor

for y = -c+d+e step .5 until c-d-e:
   draw dsphere(-c+d+f,y+f)
   for x = -c+d upto c-d:
      ..dsphere(x+f,y+f)
   endfor;
endfor

pickup pencircle scaled 0.6pt;

draw dsphere(-c,c) for x = -c upto c: ..dsphere(x,y) endfor;

% Clip: back
y := -c; draw dsphere(b,-c) for x = b upto c: ..dsphere(x,y) endfor;

x := c;
draw dsphere(c,-c) for y = -c upto c: ..dsphere(x,y) endfor;

% Clip: left
x := -c; draw dsphere(-c,a) for y = a upto c: ..dsphere(x,y) endfor;

% Convex hull of sphere
draw dsphere(-c,a){dir 40}..{dir -9}dsphere(b,-c);

% Vectors

pickup pencircle scaled 0.75pt;

linejoin := mitered;
drawarrow dsphere(3,3)--(dsphere(3,0.5) - (.3u,.125u)); % m2
drawarrow dsphere(3,3)--(dsphere(1, 3) + (-.15u,.2u));  % m1

linejoin:= rounded;

% Draw invisible part

drawoptions(dashed evenly);

draw dsphere(-c,-c) for y = -c upto a: ..dsphere(x,y) endfor;

y := -c; draw dsphere(-c,-c) for x = -c upto b: ..dsphere(x,y) endfor;

pickup pencircle scaled 3pt;

draw dsphere(3,3);

label.lft(btex $z$ etex, (0, 4.8u));
label.rt(btex $y$ etex, (-2.7u, -2.8u));
label.bot(btex $x$ etex, (9.8u, 0u));

label(btex $m_1$ etex, dsphere(3,3)+(-1.2u, 0.1u));
label(btex $m_2$ etex, dsphere(3,3)+(1.1u, 0.75u));

endfig;


% ========================================================================= Vector rotation
beginfig(30);
u:=0.5cm;

ahangle := 20;
linejoin := mitered;

pickup pencircle scaled .75pt;

k0 := 1.2;

drawarrow (0,0)--(0,3u);
drawarrow (0,0)--(k0*1u,k0*2u);

k1 := 1/5;
k2 := 1/4;

pickup pencircle scaled .5pt;

draw (0,k0*k1*3u){dir 0}..(k0*k2*1u, k0*k2*2u);
draw (k0*1u,k0*2u)..(0,k0*2u);
draw (0,2u*k0-.25u)--(.25u, 2u*k0-.25u)--(.25u, 2u*k0);

pickup pencircle scaled .25pt;

k3 := 1*k0;
k4 := .4;
z1 = (0, k0*2u);

draw z1 + (k3*cosd(0 * 360/20)*u, k4 *sind(0 * 360/20)*u)
for i = 0 upto 20:
   ..z1 + (k3*cosd(i * 360/20)*u, k4 *sind(i * 360/20)*u)
endfor ..cycle;


label.top(btex $\alpha$ etex, (.05u + k1*1u,2*k1*2u));
label.lft(btex $\vec\omega$ etex, (0,3.1u));
label.rt(btex $\varepsilon_1$ etex, (1u,2u));

pickup pencircle scaled 1.5pt;

draw (0,0);

endfig;

% ============================================================================= NORMAL SLICE
def proj(expr x)(expr y)(expr z) = ((x-0.5*y)*u, (z-0.5*y)*u) enddef;
def shift = (2.5u,-5.5u) enddef;
def dsphere(expr x)(expr y) = (proj(x, y, sqrt(r*r-x*x-y*y))+shift) enddef;

def dnormal(expr x)(expr y)(expr l) =
drawarrow dsphere(x,y)--(dsphere(x, y) + proj(l*x/r,l*y/r, l*sqrt(r*r-x*x-y*y)/r))
enddef;

def tangentx(expr x)(expr y)(expr l) = (proj(l/sqrt((r*r-y*y)/(r*r-x*x-y*y)), 0, -l*x/sqrt(r*r-y*y))) enddef;
def tangenty(expr x)(expr y)(expr l) = (proj(0, -l/sqrt((r*r-x*x)/(r*r-x*x-y*y)), l*y/sqrt(r*r-x*x))) enddef;
def tangent(expr x)(expr y)(expr l) = (proj(l/sqrt((r*r-y*y)/(r*r-x*x-y*y)), -l/sqrt((r*r-x*x)/(r*r-x*x-y*y)), l*y/sqrt(r*r-x*x)-l*x/sqrt(r*r-y*y))) enddef;
def dtangentx(expr x)(expr y)(expr l) = drawarrow dsphere(x,y)--(dsphere(x, y) + tangentx(x,y,l)) enddef;
def dtangenty(expr x)(expr y)(expr l) = drawarrow dsphere(x,y)--(dsphere(x, y) + tangenty(x,y,l)) enddef;
def dtangent(expr x)(expr y)(expr l) = drawarrow dsphere(x,y)--(dsphere(x, y) + tangent(x,y,l)) enddef;
def uu(expr tt) = 0.5*(r - tt - sqrt(r*(r+2*tt)-3*tt*tt)) enddef;

beginfig(40);

u:=0.4cm;

ahangle := 20;

linejoin:=mitered;
% Coordinate axis
drawarrow (0,0)--(10u,0);
drawarrow (0,0)--(0,5u);
drawarrow (0,0)--(-3u,-3u);
linejoin:=rounded;

pickup pencircle scaled 0.75pt;

numeric r,c,a,b;

r := 9; c := 5;
a = -1; b = 1;

path p[];

% "border" of the surface
y := c; p[1] = dsphere(-c,c) for x = -c upto c: ..dsphere(x,y) endfor;
% Clip: back
y := -c; p[2] = dsphere(b,-c) for x =  b upto c: ..dsphere(x,y) endfor;
x := c;  p[3] = dsphere(c,-c) for y = -c upto c: ..dsphere(x,y) endfor;
% Clip: left
x := -c; p[4] = dsphere(-c,a) for y =  a upto c: ..dsphere(x,y) endfor;

draw p[1]; %% Front segment
draw p[2];
draw p[3];
draw p[4];

% Convex hull
draw dsphere(-c,a){dir 40}..{dir -9}dsphere(b,-c);

% planes: normal plane

pickup pencircle scaled 0.5pt;

draw (proj(-5,5,4)+shift)--
(proj(-5,5,13)+shift)--
(proj(5,-5,13)+shift)--
dsphere(5,-5)--(proj(5,-5,4)+shift)--cycle;

% planes: rotated plane
draw (proj(-2.5,7.5,4)+shift)--
(proj(7.5,-2.5,4)+shift)--
(proj(3,-7,13)+shift)--
(proj(-7,3,13)+shift)--cycle;

draw (proj(-5,5,9)+shift)--(proj(5,-5,9)+shift);

pickup pencircle scaled 0.6pt;

% normal slice
draw dsphere(-5,5) for i=-5 upto 5: ..dsphere(i,-i) endfor;

% rotated slice

dd := 1.5;
draw (dsphere(0,0)+proj(0,0,2)){dir 180}..(dsphere(0,0)+proj(-0.5*dd,-0.5*dd,1*dd));

cc := -2.9;

draw (proj(cc,uu(cc),r - uu(cc) - cc)+shift)
for t = cc step .1 until 5.1:
   ..(proj(t,uu(t),r-uu(t)-t)+shift)
endfor;

% vectors
linejoin:=mitered;
pickup pencircle scaled 0.7pt;

dtangent(0,0,1.7); % epsilon 1 (tx+ty)
dnormal(0,0,3.5); % normal
ccc:=1.35;
drawarrow dsphere(0,0)--(dsphere(0,0)+proj(-1*ccc,-1*ccc,2*ccc)); % eps 2
linejoin:=rounded;

% Draw invisible lines
pickup pencircle scaled 0.75pt;

drawoptions(dashed evenly);

draw dsphere(-c,-c)
for y = -c upto a: ..dsphere(x,y) endfor;

y := -c;
draw dsphere(-c,-c)
for x = -c upto b: ..dsphere(x,y) endfor;

% labels and points
pickup pencircle scaled 3pt;


label.lft(btex $\theta$ etex, dsphere(0,0)+(0.2u, 2.9u));
label.rt(btex $\vec{n}$ etex, dsphere(0,0)+(0, 3.2u));
label.lft(btex $\varepsilon_2$ etex, dsphere(0,0)+proj(-1,-1,2));
label.top(btex $\varepsilon_1$ etex, dsphere(0,0)+proj(2,-1,0.4));
label.lft(btex $z$ etex, (0, 4.8u));
label.rt(btex $y$ etex, (-2.85u, -3u));
label.bot(btex $x$ etex, (9.8u, 0u));

endfig;

% ======================================================================= Curvature radius
beginfig(50);
u:=1.0cm;

ahangle := 25;

% Coordinate axis

path p[];

%% Circle
p[1] := (1u,0)..(0,1u)..(-1u,0)..(0,-1u)..cycle;
draw p[1];

p[2] := (1u,-1u)--(0.5u,0);

z = p[1] intersectionpoint p[2];

draw (0,1u)--(0,-1u);

draw (0,1u)--z;

draw z--(0,-1u);

z1 = .2u*unitvector((0,1u)-z);
z2 = z1 rotated 90;

z3 = z1 + z2;

draw (z+z1)--(z+z3);
draw (z+z2)--(z+z3);

z4 = .5u*unitvector(z-(0,1u));
draw (0, .5u){dir 0}..((0,1u)+z4);

pickup pencircle scaled 2pt;
draw z;
draw (0,1u);
draw (0,-1u);

label.lft(btex $A_0$ etex, (0.075u, 1u-0.25u));

label.lft(btex $R_n$ etex, (0,-0.2u));
label.rt(btex $R_\theta$ etex, z);

label.rt(btex $\theta$ etex, (-0.05u,.25u));

endfig;

% ================================================================= Pseudo-circle
def hyp(expr t)= (sqrt(t*t+1000)) enddef;

beginfig(60);
u:=1.3cm;

ahangle := 20;

d:= 1.7u;

draw (1.5u,1.5u)--(-1.5u, -1.5u);
draw (-1.5u,1.5u)--(1.5u, -1.5u);

c:= 1.4u;

e:= 0.35u;

pickup pencircle scaled 0.75pt;

draw (hyp(-c), -c) for i = -c step 0.25 until c: ..(hyp(i), i) endfor;
draw (-hyp(-c), -c) for i = -c step 0.25 until c: ..(-hyp(i), i) endfor;


linejoin := mitered;

% AXIS
pickup pencircle scaled 0.5pt;

drawarrow (-d,0)--(d,0);
drawarrow (0,-d)--(0,d);

% VECTORS
pickup pencircle scaled 0.75pt;

drawarrow (0,0)--(hyp(0), 0); % e_1
drawarrow (0,0)--(0, hyp(0)); % e_2

drawarrow (0,0)--(hyp(e), e) scaled 0.95; % e_1'
drawarrow (0,0)--(e, hyp(e)) scaled 0.95; % e_2'

label.bot(btex $e_1$ etex, ( hyp(0)-0.1u, 0 ));
label.lft(btex $e_2$ etex, ( 0, hyp(0)-0.1u));

label.top(btex $e_2'$ etex,   (e, hyp(e)) );
label.rt(btex $e_1'$ etex, (hyp(e), e ) );

linejoin:=rounded;

drawoptions(dashed evenly);

draw (-c, hyp(-c)) for i = -c step 0.5 until c: ..(i, hyp(i)) endfor;
draw (-c, -hyp(-c)) for i = -c step 0.5 until c: ..(i, -hyp(i)) endfor;

endfig;

% ================================================================== Extremal Property
beginfig(70);
u:=0.5cm;

ahangle := 20;
linejoin := mitered;

drawarrow (0,0)--(6u, 0);
drawarrow (0,0)--(0, 4u);

draw (1u, 0u)--(1u,1.5u) dashed evenly scaled .5;
draw (3u, 0u)--(3u,1.5u) dashed evenly scaled .5;

pickup pencircle scaled 1pt;

draw (0, .5u)--(6u,.5u);

draw
(0, .5u){dir 0}..
{dir 90}(1u, 1.5u)..
(1u, 2.5u){dir 90}..
{dir 0}(2u, 3.5u){dir 0}..
{dir -90}(3u, 2.5u){dir -90}..
(3u, 1.5u){dir -90}..
{dir 0}(5u, .5u);

pickup pencircle scaled 2pt;

draw (0,0);

draw (1u, 0u);
draw (3u, 0u);

label.bot(btex $u_1$ etex, (6u, 0));
label.rt(btex $u_2$ etex, (0, 4u));
label.top(btex $r$ etex, (2u, .5u));
label.top(btex $\widetilde r$ etex, (2u, 3.5u));

label.bot(btex $b_1$ etex, (1u, 0));
label.bot(btex $b_2$ etex, (3u, 0));

%label.lft(btex $\vec\omega$ etex, (0,3.1u));
%label.rt(btex $\varepsilon_1$ etex, (1u,2u));

endfig;

% ============================================================================= stereo proj of S^2

%% Perspective Projection
%% ======================
def ppr(expr x, y, z) =
begingroup
   save yc, zs;
   numeric yc, zs;

   yc = 10u; %% camera depth
   zs = -3u; %% camera height

   (((-x)/(y-yc))*yc, (-(z+zs)/(y-yc))*yc)
endgroup
enddef;

%% Sthereographical projection
%% ===========================

def sth(expr x,y) =
   u*(2*x/(x*x+y*y+1)),u*(2*y/(x*x+y*y+1)),u*(1-2/(x*x+y*y+1))
enddef;

beginfig(80);
u:=1.5cm;
linejoin := mitered;
ahangle := 20;

pair pl[];

% Plane for projection

pl[1] = ppr(-1.5u,-3u,0);
pl[2] = ppr(1.7u,-3u,0);
pl[3] = ppr(1.7u,3u,0);
pl[4] = ppr(-1.5u,3u,0);

draw pl[2]--pl[3]--pl[4]--pl[1];

path sup, sdown, sfront, sback;

sfront := ppr(1u,0,0)
for i = 0 upto 18:
   ..ppr(1u*cosd(i*10), 1u*sind(i*10),0)
endfor;

sback := ppr(1u,0,0)
for i = 0 upto 18:
   ..ppr(1u*cosd((-i)*10), 1u*sind((-i)*10),0)
endfor;

draw sfront;
draw sback dashed evenly scaled .5;

sup := ppr(1u,0,0)
for i = 0 upto 18:
   ..ppr(1u*cosd(i*10), 0, 1u*sind(i*10))
endfor;

sdown := ppr(1u,0,0)
for i = 0 upto 18:
   ..ppr(1u*cosd((-i)*10), 0, 1u*sind((-i)*10))
endfor;

draw sup;
draw sdown dashed evenly scaled .5;

pair bpoint[];

bpoint[1] := sup intersectionpoint (pl[1]--.5[ pl[1],pl[2] ] );
bpoint[2] := sup intersectionpoint (pl[2]--.5[ pl[1],pl[2] ] );

draw pl[1]--bpoint[1];
draw bpoint[1]--bpoint[2] dashed evenly scaled .5;
draw bpoint[2]--pl[2];

numeric x;
numeric y;

x = 1.5;
y = 1.4;

pair np, sp, pp, cp, ip;
np = ppr(0,0,1u);
pp = ppr(x*u,y*u,0);
sp = ppr(sth(x,y));
cp = ppr(0,0,0);

draw np--sp dashed evenly scaled .5;
draw sp--pp;

draw np--cp--pp;

ip := ppr(0,0,u*(1-2/(x*x+y*y+1)));

draw ip--sp;

label.bot(btex $d$ etex, .5[ip,sp]);
label.top(btex $P$ etex, np);
label.top(btex $A$ etex, sp);
label.bot(btex $A'$ etex, pp);

pickup pencircle scaled 2pt;

draw pp;
draw np;
draw sp;
draw cp;
draw ip;

endfig;


% ============================================================================== SP of L^2

%% Perspective Projection
%% ======================
def ppr(expr x, y, z) =
begingroup
   save yc, zs;
   numeric yc, zs;

   yc = 10u; %% camera depth
   zs = -3u; %% camera height

   (((-x)/(y-yc))*yc, (-(z+zs)/(y-yc))*yc)
endgroup
enddef;


def hp(expr x) = sqrt(x*x+1) enddef;
def hm(expr x) = -sqrt(x*x+1) enddef;

def hyp(expr x,y) = sqrt(x*x+y*y+1) enddef;
def hym(expr x,y) = -sqrt(x*x+y*y+1) enddef;

def ohyp(expr x,y) = sqrt(x*x+y*y-1) enddef;
def ohym(expr x,y) = -sqrt(x*x+y*y-1) enddef;

beginfig(90);
u:=.75cm;
ahangle := 20;

numeric range;
range = 2;

pair pl[];

pl[1] = ppr(-2u,-1.5u,0);
pl[2] = ppr(2u,-1.5u,0);
pl[3] = ppr(2u,1.5u,0);
pl[4] = ppr(-2u,1.5u,0);

draw pl[1]--pl[2]--pl[3]--pl[4]--pl[1];

for j = range step -.2 until 0:
for i = 1 upto 72:
  draw ppr(u*j*cosd((i-1)*5), u*j*sind((i-1)*5), u*hym(j*cosd((i-1)*5), j*sind((i-1)*5)))--
       ppr(u*j*cosd(i*5), u*j*sind(i*5), u*hym(j*cosd(i*5), j*sind(i*5)))
       withcolor (.5-(j*sind(i*5)/(2*range)))*white;
endfor
endfor

pair p, ver;
p = ppr(0,0,1u);
numeric s,t,a,la;
s = 1.5;
t = 1;
a = hym(s,t);
la = 1/(1-a);

ver = ppr(s*u, t*u, u*hym(s,t));

pair dp;

dp = ppr(u*la*s, u*la*t, 0);


label.urt(btex $P$ etex, p);

label.rt(btex $A'$ etex, dp);

label.rt(btex $A$ etex, ver);

pair zcu, zcd;
zcd = ppr(0,0,-2u);
zcu = ppr(0,0,1.5u);

pair cp, zcp, o;

o = ppr(0,0,0);

zcp = (zcu--zcd) intersectionpoint (pl[3]--pl[4]);
cp = (pl[3]--pl[4]) intersectionpoint (p--ver);

draw p--dp;
draw dp--cp dashed evenly;
draw cp--ver;

drawarrow o--zcu;
draw zcp--o dashed evenly;
draw zcp--zcd;

drawarrow ppr(-2.5u,0,0)--ppr(2.5u,0,0);

label.top(btex $x$ etex, ppr(2.5u,0,0));
label.lft(btex $z$ etex, ppr(0,0,1.5u));

pickup pencircle scaled 2pt;

draw o;
draw p;
draw ver;
draw dp;

draw ppr(0,0,-1u);
endfig;

% ======================================================================= Lobachevsky triangle
%% Perspective Projection
%% ======================
def ppr(expr x, y, z) =
begingroup
   save yc, zs;
   numeric yc, zs;

   yc = 10u; %% camera depth
   zs = -3u; %% camera height

   (((-x)/(y-yc))*yc, (-(z+zs)/(y-yc))*yc)
endgroup
enddef;


def hp(expr x) = sqrt(x*x+1) enddef;
def hm(expr x) = -sqrt(x*x+1) enddef;

def hyp(expr x,y) = sqrt(x*x+y*y+1) enddef;
def hym(expr x,y) = -sqrt(x*x+y*y+1) enddef;

def ohyp(expr x,y) = sqrt(x*x+y*y-1) enddef;
def ohym(expr x,y) = -sqrt(x*x+y*y-1) enddef;

beginfig(100);
u:=1cm;
%linejoin := mitered;
ahangle := 20;

numeric range;
range = 2.5;

%for j = 1.1 step .2 until 3:
%for i = 30 upto 78:
%  draw ppr(u*j*cosd((i-1)*5), u*j*sind((i-1)*5), u*ohym(j*cosd((i-1)*5), j*sind((i-1)*5)))--
%ppr(u*j*cosd(i*5), u*j*sind(i*5), u*ohym(j*cosd(i*5), j*sind(i*5))) withcolor (.5-(j*sind(i*5)/(2*range)))*white;
%endfor
%endfor

for j = range step -.2 until 0:
for i = 1 upto 72:
  draw ppr(u*j*cosd((i-1)*5), u*j*sind((i-1)*5), u*hym(j*cosd((i-1)*5), j*sind((i-1)*5)))--
ppr(u*j*cosd(i*5), u*j*sind(i*5), u*hym(j*cosd(i*5), j*sind(i*5))) withcolor (.5-(j*sind(i*5)/(2*range)))*white;
endfor
endfor


def yhp(expr x,a,b) = (x*a*b/(1-b*b)-sqrt((a*a+b*b-1)*x*x+b*b-1)/(1-b*b)) enddef;

pickup pencircle scaled 1pt;

def hyper(expr p, q, r, s) =
   ppr(u*r, u*yhp(r,p,q), u*hym(r,yhp(r,p,q)))
   for j = r step .1 until s:
       --ppr(u*j, u*yhp(j,p,q), u*hym(j,yhp(j,p,q)))
   endfor
enddef;

path tri[];

tri[1] = hyper(1,7, -1, 1.5);
tri[2] = hyper(7,2, -.5, .5);
tri[3] = hyper(1.2,1.5, -.5, 1.5);

pair o;

o = ppr(0,0,0);

draw (tri[1] cutbefore tri[2]) cutafter tri[3];
draw (tri[2] cutafter tri[1]) cutbefore tri[3];
draw (tri[3] cutafter tri[1]) cutbefore tri[2];

pair ver[];

ver[1] = tri[1] intersectionpoint tri[2];
ver[2] = tri[2] intersectionpoint tri[3];
ver[3] = tri[3] intersectionpoint tri[1];

pickup pencircle scaled .5pt;

drawarrow o--ver[1];
drawarrow o--ver[2];
drawarrow o--ver[3];

label.urt(btex $e_1'$ etex, ver[1]);
label.bot(btex $e_2'$ etex, ver[2]);
label.bot(btex $e_3'$ etex, ver[3]);
label.top(btex $O$ etex, o);

pickup pencircle scaled 3pt;

draw ver[1];
draw ver[2];
draw ver[3];
draw o;

endfig;

% ========================================================================== geodesic
%% Perspective Projection
%% ======================
def ppr(expr x, y, z) =
begingroup
   save yc, zs;
   numeric yc, zs;

   yc = 10u; %% camera depth
   zs = -3u; %% camera height

   (((-x)/(y-yc))*yc, (-(z+zs)/(y-yc))*yc)
endgroup
enddef;

def markangle(expr c, p, q)=
begingroup
   save v;
   pair v[];
   v[1] = p-c;
   v[2] = q-c;
   v[1] := v[1]/length(v[1])*.1u;
   v[2] := v[2]/length(v[2])*.1u;
   draw c+v[1]--c+v[1]+v[2]--c+v[2] withpen pencircle scaled .5pt;
endgroup
enddef;

beginfig(110);

u := 1.5cm;

linejoin := mitered;

ahangle := 20;


path fsphere, bsphere, fssect, bssect;

fsphere := ppr(1u,0,0) for i = 0 upto 18: ..ppr(1u*cosd(i*10), 1u*sind(i*10), 0) endfor;

bsphere := ppr(-1u,0,0) for i = 18 upto 36:  ..ppr(1u*cosd(i*10), 1u*sind(i*10), 0) endfor;

numeric b;
numeric e;
b := -6;
e := 10;

fssect := ppr(1u*cosd(b*10)*cosd(45), 1u*cosd(b*10)*sind(45), 1u*sind(b*10))
for i = b upto e:
   ..ppr(1u*cosd(i*10)*cosd(45), 1u*cosd(i*10)*sind(45), 1u*sind(i*10))
endfor;

b := 10;
e := -6+36;

bssect := ppr(1u*cosd(b*10)*cosd(45), 1u*cosd(b*10)*sind(45), 1u*sind(b*10))
for i = b upto e:
   ..ppr(1u*cosd(i*10)*cosd(45), 1u*cosd(i*10)*sind(45), 1u*sind(i*10))
endfor;

def sph(expr x,y) = (sqrt(1-x*x-y*y)) enddef;

numeric i;
i := 5;
pair sp, tv;

sp = ppr(1u*cosd(i*10)*cosd(45), 1u*cosd(i*10)*sind(45), 1u*sind(i*10));

% tangent vector
tv = ppr(1u*cosd(i*10)*cosd(45)+.5u*sind(i*10)*cosd(45),
1u*cosd(i*10)*sind(45)+.5u*sind(i*10)*sind(45),
1u*sind(i*10)-.5u*cosd(i*10));

numeric rad;

draw fsphere;
draw bsphere dashed evenly;
draw fssect withpen pencircle scaled .75pt;
draw bssect dashed evenly withpen pencircle scaled .75pt;

%pickup pencircle scaled 1pt;
% sphere vertical face (with 3d corrections corr projection)
draw fullcircle xscaled 2u yscaled 2.1u shifted (ppr(0,0,0)-(0,.03u));

pair o, n, s;
o = ppr(0,0,0);
n = ppr(0,0,1u);
s = ppr(0,0,-1u);

draw o--sp;
pair v;
v = sp-o;
v := v scaled 1.5;

drawarrow sp--tv;

drawarrow sp--o+v;

markangle(sp, tv, o+v);

label.bot(btex $O$ etex, o);
label.lft(btex $A$ etex, sp);
label.rt(btex ${D^0\varepsilon_1\over ds}$ etex, o+v);

picture lab; lab = thelabel.rt(btex $\varepsilon_1$ etex, tv);
unfill bbox lab; draw lab;

pickup pencircle scaled 2pt;

draw o;
%draw n;
%draw s;
draw sp;

z1 = (2u,1u);
z2 = (0,0);
z3 = (1u,2u);

endfig;

verbatimtex
  \end{document}
etex

bye;
