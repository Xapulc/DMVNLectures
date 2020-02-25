import graph;
size(200,IgnoreAspect);

// Base-2 logarithmic scale on y-axis:

real f(real x) {
  static real eps = 1e-6;
  return abs(x)>eps ? -x * log (x) : 0;
}

draw(graph(f,0,1));

yaxis("$y$",ymin=0,ymax=0.45,RightTicks(Label(Fill(white))),EndArrow);
xaxis("$x$",xmin=0,xmax=1.1,LeftTicks,EndArrow);
