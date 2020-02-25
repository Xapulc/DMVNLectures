% Macros for drawing Kripke scales
newinternal shekhtArrEpsilon;
shekhtArrEpsilon := .05;

vardef darr(expr p) =
  drawarrow subp(p, shekhtArrEpsilon,1-shekhtArrEpsilon) snorm;
enddef;
% --------------------------------
vardef circletext(expr te, po) =
  save pi; picture pi;
  save d; pair d[];
%  save pib;
  pi := thelabel(te, po);
  d1 = urcorner pi;
  d2 = llcorner pi;
%  boxit.pib(pi);
  draw fullcircle xscaled (xpart d1-xpart d2+.2u) yscaled (ypart d1-ypart d2+.2u) shifted po dthin;
  draw pi;
enddef;
