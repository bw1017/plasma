x = -100:100;
y = exp(-(x.^2)/400);
r1= -100:100
y1= (1/20*sqrt(pi))*exp(-(r1.^2)/400)
plot(r1,y1,x,y)
