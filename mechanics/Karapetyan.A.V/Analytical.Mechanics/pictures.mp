verbatimtex
  \documentclass[a4paper]{article}
  \usepackage{dmvn}
  \begin{document}
\footnotesize
etex
input dmvnmpl.mp;


beginfig(1);
u=1cm;
z0=(2u,1u);
z1=(1u,1u);
z2=(5u,1u);
z3=(4u,3u);
drawarrow (0,1u)--(6.5u,1u);
drawarrow (2u,0)--(2u,4u);
drawarrow z0--z3;
pickup pencircle scaled 2pt;
draw z1;
draw z2;
draw z3;
label.bot(btex $S$ etex, z1);
label.lrt(btex $O$ etex, z0);
label.bot(btex $J$ etex, z2);
label.rt(btex $A$ etex, z3);
label.lft(btex $y$ etex, (2u,3.5u));
label.bot(btex $x$ etex, (6u,1u));
endfig;


beginfig(2);
z4=origin;
path p[];
pair dot[];
p1:=fullcircle scaled 4u shifted z4;
p2:=subp(p1,.60,.90);
z5=relpoint(p2, .2);
p3:=fullcircle scaled .5u shifted z4;
p4:=z4--z5;
draw p4;
z6=(0,-2u);
p5:=z4--z6;
draw p5 dashed evenly;
p6:=p3 cutbefore p4 cutafter p5;
drawarrow reverse p6;
elabel.bot(btex $\varphi$ etex, bop(p6));
draw p2;
endfig;


beginfig(3);
z7=origin;
path q[];
q1:=fullcircle scaled 3u shifted z7;
q2:=subp(q1,.60,.90);
draw q2;
z8=relpoint(q2,.2);
q11:=z7--z8;
draw q11;
q3:=fullcircle scaled 2u shifted z8;
q4:=subp(q3,.60,.90);
draw q4;
z9=relpoint(q4,.6);
q12:=z8--z9;
draw q12;
z0=(0,-1.5u);
q5:=z7--z0;
draw q5 dashed evenly;
z1=z8+(0,-1u);
q6:=z8--z1;
draw q6 dashed evenly;
q7:=fullcircle scaled .5u shifted z7;
q8:=fullcircle scaled 1u shifted z8;
q9:=q7 cutbefore q11 cutafter q5;
q10:=q8 cutbefore q6 cutafter q12;
drawarrow reverse q9;
drawarrow q10;
label.bot(btex $\varphi$ etex, bop(q9));
elabel.lft(btex $\psi$ etex, bop(q10));
endfig;


beginfig(4);
z10=origin;
path r[];
r1:=fullcircle scaled 3u shifted z10;
r2:=subp(r1, .5, 1);
draw r2;
r5:=r1 yscaled .5;
r3:=subp(r5,.5,1);
r4:=subp(r5,0,.5);
draw r3;
draw r4 dashed evenly;
z16=(0,-1.5u);
r13:=z10--z16;
draw r13 dashed evenly;
r6:=r1 xscaled .7;
z15=relpoint(r6, .65);
r9:=z10--z15;
draw r9;
z11=r6 intersectionpoint r3;
r10:=z10--z11;
draw r10 dashed evenly;
z12=relpoint(r1, .5);
r11:=z10--z12;
draw r11 dashed evenly;
r7:=r5 scaled .3;
r8:=r6 scaled .3;
r12:=r7 cutbefore r11 cutafter r10;
r14:=r8 cutbefore r9 cutafter r13;
drawarrow r12;
drawarrow reverse r14;
elabel.llft(btex $\varphi$ etex, eop(r12));
elabel.bot(btex $\psi$ etex, bop(r14));
endfig;

beginfig(5);
z0=origin;
path v[];
path r[];
path c[];
path axes[];
path arcs[];
pair zl[];
c1:=fullcircle scaled 3u shifted z0;
z1=relpoint(c1,.85);
c2:=fullcircle scaled 3u shifted z1;
z2=relpoint(c1, .75);
z3=relpoint(c2, .75);
z4=relpoint(c2, .80);
v1:=z0--z2;
r1:=z0--z1;
v2:=z1--z3;
r2:=z1--z4;
draw v1 dashed evenly;
draw v2 dashed evenly;

axes1:=z0--(2u,0);
axes2:=z0--(0, 1u);
drawarrow axes1;
drawarrow axes2;
c3:=fullcircle scaled 1u shifted z0;
c4:=fullcircle scaled 1u shifted z1;
arcs1:=c3 cutbefore v1 cutafter r1;
arcs2:=c4 cutbefore v2 cutafter r2;
drawarrow arcs1;
drawarrow arcs2;
v3:=(-1u,0)--(-1u, -1u);
label.bot(btex $x$ etex, eop(axes1));
label.lft(btex $y$ etex, eop(axes2));
label.urt(btex $m_1$ etex, z1);
label.urt(btex $m_2$ etex, z4);
label.lft(btex $\varphi_1$ etex, bop(arcs1));
label.lft(btex $\varphi_2$ etex, bop(arcs2));
zl1:=relpoint(v3, .5);
zl2:=relpoint(r1, .5);
zl3:=relpoint(r2, .5);
label.lft(btex $g$ etex, zl1);
label.rt(btex $l_1$ etex, zl2);
label.rt(btex $l_2$ etex, zl3);

pickup pencircle scaled 1pt;
draw r1;
draw r2;
drawarrow v3;
pickup pencircle scaled 2.5pt;
draw z1;
draw z4;

endfig;

beginfig(6);

v=3.5u;
l=.3v;
r=1.732;

def dprf(expr c) = ((yp c) - .5*(xp c), (zp c) - .25*(xp c)) enddef;
def ftos(expr c) = ((xp c),(.5(r*(yp c)+(zp c))),(.5(r*(zp c)-(yp c)))) enddef;
def stof(expr c) = ((xp c),(.5(r*(yp c)-(zp c))),(.5(r*(zp c)+(yp c)))) enddef;
def ston(expr c) = ((.5(r*(xp c)-(zp c))),(yp c),(.5(r*(zp c)+(xp c)))) enddef;
def ntos(expr c) = ((.5(r*(xp c)+(zp c))),(yp c),(.5(r*(zp c)-(xp c)))) enddef;

pair s;
pair old[];
pair fir[];
pair sec[];
pair new[];

color ss;
color sold[];
color sfir[];
color ssec[];
color snew[];

path oldaxes[];
path firaxes[];
path secaxes[];
path newaxes[];
path arcs[];
path misc[];
pair arcdots[];
color sarcdots[];
pair parcdots[];

ss:=(0,0,0);
s:=dpr(ss);

sold1:=(v,0,0);
sold2:=(0,v,0);
sold3:=(0,0,v);

old1:=dprf(sold1);
old2:=dprf(sold2);
old3:=dprf(sold3);

oldaxes1:=s--old1;
oldaxes2:=s--old2;
oldaxes3:=s--old3;

misc1:=fullcircle scaled 2v shifted (0,0);
z0=relpoint(misc1, .083);
z1=relpoint(misc1, .333);
sfir1:=sold1;
sfir2:=(0,xpart z0,ypart z0);
sfir3:=(0,xpart z1,ypart z1);
fir1:=dprf(sfir1);
fir2:=dprf(sfir2);
fir3:=dprf(sfir3);

firaxes1:=s--fir1;
firaxes2:=s--fir2;
firaxes3:=s--fir3;

sfir1:=ftos(sfir1);
sfir2:=ftos(sfir2);
sfir3:=ftos(sfir3);
z2=relpoint(misc1, -.083);
z3=relpoint(misc1, .166);
ssec1:=(xpart z2,0,ypart z2);
ssec2:=sfir2;
ssec3:=(xpart z3,0,ypart z3);
ssec1:=stof(ssec1);
ssec2:=stof(ssec2);
ssec3:=stof(ssec3);
sec1:=dprf(ssec1);
sec2:=dprf(ssec2);
sec3:=dprf(ssec3);

secaxes1:=s--sec1;
secaxes2:=s--sec2;
secaxes3:=s--sec3;

ssec1:=ftos(ssec1);
ssec2:=ftos(ssec2);
ssec3:=ftos(ssec3);
ssec1:=ston(ssec1);
ssec2:=ston(ssec2);
ssec3:=ston(ssec3);
z4=relpoint(misc1, .083);
z5=relpoint(misc1, .333);
snew1:=(xpart z4,ypart z4,0);
snew2:=(xpart z5,ypart z5,0);
snew3:=ssec3;
snew1:=ntos(snew1);
snew2:=ntos(snew2);
snew3:=ntos(snew3);
snew1:=stof(snew1);
snew2:=stof(snew2);
snew3:=stof(snew3);
new1:=dprf(snew1);
new2:=dprf(snew2);
new3:=dprf(snew3);

newaxes1:=s--new1;
newaxes2:=s--new2;
newaxes3:=s--new3;

for i:=1 upto 3: drawarrow oldaxes[i] wppc scaled 1.5pt; endfor;
for i:=1 upto 3: drawarrow firaxes[i] ndash; endfor;
for i:=1 upto 3: drawarrow secaxes[i] ndash; endfor;
for i:=1 upto 3: drawarrow newaxes[i]; endfor;

misc2:=fullcircle scaled 2l shifted (0,0);

for i:=0 upto 5: arcdots[i]:=relpoint(misc2,.0166i); endfor;
arcs1:=arcdots0..arcdots1..arcdots2..arcdots3..arcdots4..arcdots5;
drawarrow arcs1;

for i:=0 upto 5: arcdots[i]:=relpoint(misc2,.25+.0166i); endfor;
arcs2:=arcdots0..arcdots1..arcdots2..arcdots3..arcdots4..arcdots5;
drawarrow arcs2;

for i:=0 upto 5: arcdots[i]:=relpoint(misc2,-.0166i); endfor;
for i:=0 upto 5: sarcdots[i]:=(xpart arcdots[i],0,ypart arcdots[i]); endfor;
for i:=0 upto 5: sarcdots[i]:=stof(sarcdots[i]); endfor;
for i:=0 upto 5: parcdots[i]:=dprf(sarcdots[i]); endfor;
arcs3:=parcdots0..parcdots1..parcdots2..parcdots3..parcdots4..parcdots5;
drawarrow arcs3;

for i:=0 upto 5: arcdots[i]:=relpoint(misc2,.25-.0166i); endfor;
for i:=0 upto 5: sarcdots[i]:=(xpart arcdots[i],0,ypart arcdots[i]); endfor;
for i:=0 upto 5: sarcdots[i]:=stof(sarcdots[i]); endfor;
for i:=0 upto 5: parcdots[i]:=dprf(sarcdots[i]); endfor;
arcs4:=parcdots0..parcdots1..parcdots2..parcdots3..parcdots4..parcdots5;
drawarrow arcs4;

for i:=0 upto 5: arcdots[i]:=relpoint(misc2,.0166i); endfor;
for i:=0 upto 5: sarcdots[i]:=(xpart arcdots[i],ypart arcdots[i],0); endfor;
for i:=0 upto 5: sarcdots[i]:=ntos(sarcdots[i]); endfor;
for i:=0 upto 5: sarcdots[i]:=stof(sarcdots[i]); endfor;
for i:=0 upto 5: parcdots[i]:=dprf(sarcdots[i]); endfor;
arcs5:=parcdots0..parcdots1..parcdots2..parcdots3..parcdots4..parcdots5;
drawarrow arcs5;

for i:=0 upto 5: arcdots[i]:=relpoint(misc2,.25+.0166i); endfor;
for i:=0 upto 5: sarcdots[i]:=(xpart arcdots[i],ypart arcdots[i],0); endfor;
for i:=0 upto 5: sarcdots[i]:=ntos(sarcdots[i]); endfor;
for i:=0 upto 5: sarcdots[i]:=stof(sarcdots[i]); endfor;
for i:=0 upto 5: parcdots[i]:=dprf(sarcdots[i]); endfor;
arcs6:=parcdots0..parcdots1..parcdots2..parcdots3..parcdots4..parcdots5;
drawarrow arcs6;

label.bot(btex $x=x_1$ etex, eop(oldaxes1));
label.bot(btex $y$ etex, eop(oldaxes2));
label.rt(btex $z$ etex, eop(oldaxes3));

label.bot(btex $\xi$ etex, eop(newaxes1));
label.rt(btex $\eta$ etex, eop(newaxes2));
label.llft(btex $z_2=\zeta$ etex, eop(newaxes3));

label.rt(btex $y_1=y_2$ etex, eop(firaxes2));
label.urt(btex $z_1$ etex, eop(firaxes3));
label.rt(btex $x_2$ etex, eop(secaxes1));

label.rt(btex $\al$ etex, relpoint(arcs1,.5));
label.top(btex $\al$ etex, relpoint(arcs2,.5));

label.lft(btex $\be$ etex, relpoint(arcs3,.7));
label.top(btex $\be$ etex, eop(arcs4));

label.bot(btex $\ga$ etex, relpoint(arcs5,.6));
label.top(btex $\ga$ etex, eop(arcs6));

endfig;

beginfig(7);

z0=origin;
path b;
b=fullcircle scaled 2u shifted z0;
path r[];
path q[];
z1=relpoint(b,0.1);
z2=relpoint(b,0.8);
z3=relpoint(b,0.15);
z4=relpoint(b,0.85);
r1:=z0--z1;
r2:=z0--z2;
r3:=z0--z3;
r4:=z0--z4;
z5=relpoint(r3,0.6);
z6=relpoint(r4,0.2);
z7=relpoint(r4,0.7);
q1:=z0..z5..z1;
q2:=z0..z6..z7..z2;

draw b wppc scaled 1pt;
draw z0 wppc scaled 1.5pt;
draw q1;
draw q2;

z8=bop(b);
r5:=z0--z8;
z9=relpoint(r5,.65);
label(btex $\Om$ etex, z9);
label.llft(btex $0$ etex, z0);
label.ulft(btex $B_{\varepsilon}$ etex, z0+(.2u,.3u));

endfig;

beginfig(9);

numeric u; u = 1cm;

numeric R; numeric r;
R = 3u;
r = 2u;

z1 = (0,R);

path p[];
p1:= subp(fullcircle scaled 2R, .5, 1);
p2:= subp(fullcircle scaled 2r, .5, 1);

def rot(expr pa, po, a) =
  ((pa shifted -po) rotated a shifted po) 
enddef;

p3:= rot(p1,z1,30);

z2 = bop(p3);
z3 = eop(p3);

z4 = .5[z2,z3] + r*(unitvector(z3-z2) rotated 90) - cosd(75)*r*unitvector(z3-z2);

p4:= rot(p2 shifted z4,z4,45);

p5:= z2--z3;
p6:= bop(p4)--eop(p4);

draw p3 wppc scaled 1pt;
draw p4 wppc scaled 1pt;
draw p5 wppc scaled 1pt;
draw p6 wppc scaled 1pt;

z5=relpoint(p5,.5);
z6=relpoint(p6,.5);

z7=relpoint(p3,.5);
z8=relpoint(p4,.5);

p7=z5--z7;
p8=z6--z8;

z9=z5+R*(0,-1);
z10=z6+r*(0,-1);

p9=z5--z9;
p10=z6--z10;

k=1-2/3.1415;

z11=z5+k*(z7-z5);
z12=z6+k*(z8-z6);

p11=fullcircle scaled 1.2u shifted z5;
p12=fullcircle scaled 1.2u shifted z6;
p13=p11 cutbefore p9 cutafter p7;
p14=p12 cutbefore p10 cutafter p8;

draw p7;
draw p8;
draw p9;
draw p10;
drawarrow p13;
drawarrow p14;

draw z5 wppc scaled 3pt;
draw z6 wppc scaled 3pt;
draw z11 wppc scaled 3pt;
draw z12 wppc scaled 3pt;

label.lrt(btex $O_1$ etex, z5+(.1u,.1u));
label.rt(btex $O_2$ etex, z6);
label.rt(btex $S_1$ etex, z11);
label.rt(btex $S_2$ etex, z12);
label.lrt(btex $\varphi_1$ etex, bop(p13));
label.bot(btex $\varphi_2$ etex, relpoint(p14, 0.5));
endfig;

beginfig(10)

def dprf(expr c) = ((yp c) - .5*(xp c), (zp c) - .25*(xp c)) enddef;

pair O;
O=origin;

path axes[];
path lines[];
path tracks[];
pair q[];
pair t[];
pair A[];

axes1=O--(0,3u);
axes2=O--(3u,0);
t0=(0,.8u);
t1=(0,2.5u);
q0=(1u,0);
q1=(2.2u,0);
A0=(1u,.8u);
A1=(2.2u, 2.5u);
lines1=t0--A0;
lines2=q0--A0;
lines3=t1--A1;
lines4=q1--A1;

drawarrow axes1 wppc scaled 1pt;
drawarrow axes2 wppc scaled 1pt;
draw t0 wppc scaled 2pt;
draw t1 wppc scaled 2pt;
draw q0 wppc scaled 2pt;
draw q1 wppc scaled 2pt;
draw A0 wppc scaled 2pt;
draw A1 wppc scaled 2pt;
draw lines1;
draw lines2;
draw lines3;
draw lines4;

z1=A0+(-.2u,.6u);
z2=A1+(-.5u,-.7u);

tracks1:=A0..z1..z2..A1;

draw tracks1;

z3=A0+(.3u,.1u);
z4=A1+(-.5u,-.4u);

tracks2=A0..z3..z4..A1;

draw tracks2 wppc scaled 1pt;

label.lft(btex $q(t)$ etex, z1);
label.rt(btex $q_{r}(t)$ etex, z3);

label.bot(btex $q_0$ etex, q0);
label.bot(btex $q_1$ etex, q1);
label.lft(btex $t_0$ etex, t0);
label.lft(btex $t_1$ etex, t1);
label.llft(btex $A_0$ etex, A0);
label.urt(btex $A_1$ etex, A1);
label.lrt(btex $q$ etex, eop(axes2));
label.lft(btex $t$ etex, eop(axes1))

endfig;

beginfig(11)

color O;
color axepoints[];
pair paxepoints[];
path axes[];
path circs[];
path circhalves[];
path sides[];
numeric v;
numeric i;

v=3u;

axepoints1:=(v,0,0);
axepoints2:=(0,v,0);
axepoints3:=(0,0,v);
paxepoints1:=dprf(axepoints1);
paxepoints2:=dprf(axepoints2);
paxepoints3:=dprf(axepoints3);
axes1:=(0,0)--paxepoints1;
axes2:=(0,0)--paxepoints2;
axes3:=(0,0)--paxepoints3;

circs1:=fullcircle scaled .6v yscaled .3 shifted (.4v,.2v) ;
circs2:=circs1 shifted (.3v,.4v);
circs3:=circs1 shifted (.4v,.7v);
z1=relpoint(circs1, .5);
z2=relpoint(circs2, .5);
z3=relpoint(circs3, .5);
sides1:=z1{up}..z2{.1,.2}..z3;
sides2:=sides1 shifted (.6v,0);
circhalves1:=subp(circs1,.5,1);
circhalves2:=subp(circs2,.5,1);
circhalves3:=subp(circs1,0,.5);
circhalves4:=subp(circs2,0,.5);

drawarrow axes1 wppc scaled 1pt;
drawarrow axes2 wppc scaled 1pt;
drawarrow axes3 wppc scaled 1pt;
draw circhalves1;
draw circhalves2;
draw circhalves3 ndash;
draw circhalves4 ndash;
draw circs3;
draw sides1;
draw sides2;

label.lrt(btex $q$ etex, paxepoints1);
label.lrt(btex $p$ etex, paxepoints2);
label.lft(btex $t$ etex, paxepoints3);
draw (0,.2v) wppc scaled 2pt;
label.lft(btex $t_0$ etex, (0,.2v));
label.lrt(btex $C$ etex, bop(circs2));
label.lrt(btex $C_0$ etex, bop(circs1));

endfig;

beginfig(12)

def dprf(expr c) = ((yp c) - .5*(xp c), (zp c) - .25*(xp c)) enddef;

pair O;
O=origin;

path axes[];
path lines[];
path tracks[];
pair q[];
pair t[];
pair A[];

axes1=O--(0,3u);
axes2=O--(3u,0);
t0=(0,.8u);
t1=(0,2.5u);
q0=(.7u,0);
q1=(2.2u,0);
A0=(.7u,.8u);
A1=(2.2u, 2.5u);
lines1=t0--A0;
lines2=q0--A0--(q0+(0,3u));
lines3=t1--A1;
lines4=q1--A1--(q1+(0,3u));

drawarrow axes1 wppc scaled 1pt;
drawarrow axes2 wppc scaled 1pt;
%draw t0 wppc scaled 2pt;
%draw t1 wppc scaled 2pt;
draw q0 wppc scaled 2pt;
draw q1 wppc scaled 2pt;
draw A0 wppc scaled 2pt;
draw A1 wppc scaled 2pt;
%draw lines1;
draw lines2;
%draw lines3;
draw lines4;

z1=A0+(-.2u,.6u);
z2=A1+(-.5u,-.7u);

tracks1:=(A0+(0,.7u))..z2..A1;

draw tracks1;

z3=A0+(.3u,.1u);
z4=A1+(-.5u,-.4u);

tracks2:=A0..z3..z4..A1;

draw tracks2 wppc scaled 1pt;

label.lft(btex $q(t)$ etex, (A0+(.1u,.7u)));
label.rt(btex $q_{r}(t)$ etex, z3);

label.bot(btex $q_0$ etex, q0);
label.bot(btex $q_1$ etex, q1);
%label.lft(btex $t_0$ etex, t0);
%label.lft(btex $t_1$ etex, t1);
label.llft(btex $A_0$ etex, A0);
label.urt(btex $A_1$ etex, A1);
label.lrt(btex $q$ etex, eop(axes2));
label.lft(btex $t$ etex, eop(axes1));

endfig;

beginfig(13);
draw (0,0) wppc scaled 1.5bp;
endfig;

bye;
