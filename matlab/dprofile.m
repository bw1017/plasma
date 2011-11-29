[Z,R] = meshgrid(0:.1:10); 
D = (5*exp(-((R-5)/2).^2));
mesh(R,Z,D,'EdgeColor','black')
xlabel('R')
ylabel('Z')
zlabel('Density')

