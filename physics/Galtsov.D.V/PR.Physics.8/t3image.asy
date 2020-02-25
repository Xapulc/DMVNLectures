unitsize(80);
path vec_path (real length, real arch, pair c=(0,0))
{
  return c -- length*(sin(arch), cos(arch));
}
real to_degree(real f){ return f*180/pi;}
real alpha = pi/8;
real beta = pi/5;

draw((-1,0)--(1,0));
draw((0,-1)--(0,1));
label("z", (0.95,0), N);
draw(vec_path(1, beta), Arrow(Relative(0.5)));
draw(reverse(vec_path(-1, alpha)), Arrow(Relative(0.5)));
//draw(arc((0,0), 0.4, beta, pi/2));
draw(arc((0,0), 0.2, 90-to_degree(beta), 90));
draw(arc((0,0), 0.22, 90-to_degree(beta), 90));
real b2=( pi -  beta)/2;
label("$\beta$", 0.3*(cos(b2), sin(b2)));
draw(arc((0,0), 0.2, 270-to_degree(alpha), 270));
real a2 = 3*pi/2- alpha/2;
label("$\alpha$", 0.3*(cos(a2),sin(a2)));
label("$e,m$",-0.7*(sin(alpha), cos(alpha)),W);

