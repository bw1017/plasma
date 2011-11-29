%  Symbnolic -  Generates refraction offset function for a given theoritical plasma density. 
%   This script assumes that the refraction of the incident beam is only
%   in the y direction. 

%   Note: This script requires the Symbolic Math toolbox. 
%
%   Arguments:
%   
%   ne = plasma density profile
%   The plasma density profile should be a function in terms of r. 
%   
%   For gausian density distrubution, the function should be in the form 
%   ne = (n0*exp(-((r-r0)).^2)). (Does not integrate due to symbolic 
%   toolbox limitations)
%
%   For a parabolic density distrubution, the function should be in the
%   form ne = n0*(1-(r/r0).^2);
%
%   n0 = peak density. This is the maximum density of the plasma density
%   distrubution. 

%   nc = critial plasma density. This is the density of a plasma where a
%   beam can not penetrate. It is defined as nc = (eo me w) / e^2, where eo
%   is the, me is the mass of a electron, w is the laser frequency, and e
%   is the electron charge. 

%   r0 = plasma radius

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculates phase offset by integrating the density. 
% The relationship between the angular offset (theta) and the plasma density (ne) is equal
% to: theta = 1/2 integral of ((gradient of ne * dx)/nc). Since we are only
% concerned with refraction in the y direction, the formula is equal to
% theta = 1/2 d/dy int((ne * dx)/nc)
clear all
clc
% Defines symbolic objects for the symbolic math toolbox
syms r n0 nc r0 x y


% Copy the density function here
ne = n0*(1-(r/r0).^2);

% Converts r to cartesian coordinates
r = sqrt(x.^2 +y.^2);
nex = subs(ne,r);

% Integrates the density function

thetaint = int(nex,x);

% Takes the derivative of the integrated density function with respect to y
thetadiff = (1/nc)* diff(thetaint,y);

% Changes x in terms of y and r0
x = sqrt((r0.^2)-y.^2);


% Substitues the new value of x in the final theta expression
theta = subs(thetadiff,'x',x)

n0 = 1; %Set your peak plasma density
r0 = 1; %Set your plasma radius
nc = 50; %Set critical plasma density

theta = subs(theta,'n0',n0);
theta = subs(theta,'r0',r0);
theta = subs(theta,'nc',nc)

ne = subs(ne,'n0',n0);
ne = subs(ne,'r0',r0);


