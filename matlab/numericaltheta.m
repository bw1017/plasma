%   Generates refraction offset data for a given  plasma density. 
%   Output: thetanum - a 2 by 1 matrix that has the y coordinates and
%   refraction in radians

%    This script assumes that the refraction of the incident beam is only
%   in the y direction. 

%   Note: This script requires the Symbolic Math toolbox. 
%
%   Arguments:
%   
%   divnumber = number of chords calculated. This is based on the number of
%   lenslets in a wavefront sensor
%   
%   ne = plasma density profile
%   The plasma density profile should be a function in terms of r. 
%   
%   For gausian density distrubution, the function should be in the form 
%   ne = (n0*exp(-((r-r0)).^2))
%
%   For a parabolic density distrubution, the function should be in the
%   form ne = n0*(1-(r/r0).^2)
%
%   n0Input = peak density. This is the maximum density of the plasma density
%   distrubution. 
%
%   ncInput = critial plasma density. This is the density of a plasma where a
%   beam can not penetrate. It is defined as nc = (eo me w) / e^2, where eo
%   is the, me is the mass of a electron, w is the laser frequency, and e
%   is the electron charge. For the Abel inversion to work, it is assumed
%   that nc >> n0. 

%   r0Input = Defines the plasma radius. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Only make changes to the following:

% Clear all variables and screen
clear all
clc

% Set the number of arguments
divnum = 50; % This is equal to the number of lenslets. 
n0Input = 2; % Peak density
ncInput = 50; % Critial Density
r0Input = 1; % Plasma Radius


% Defines symbolic objects for the symbolic math toolbox
syms r n0 nc r0 x y

% Copy the density function here:
ne = n0*(1-(r/r0).^2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Takes the derivative of the density profile with respect to r
nediff = diff(ne,r);

% Set the peak density and plasma radius
n0 = n0Input;
r0 = r0Input;
nediff = subs(nediff,'n0',n0);
nediff = subs(nediff,'r0',r0);

% Prepares the function for Abel transform integration
% Need to fix this, using approx that r0 = r

neint = nediff * (1/(r0^2 - y^2)^(1/2)); 


% Initialize theta matrix for numerical integration
thetanum = zeros(divnum,2);

% Calculate dr for numerical integration
divlength = r0/divnum;
divoffset = divlength/2;

% The for loop numerically calculates the integral for each value of y

for n = 1:divnum-1
    ydiv = (n.*divlength)-divoffset; % Sets y values for each iteration
    nc = ncInput; %  Stores ncInput as nc
    r = [ydiv:divlength:r0]; % Creates r values for integration limits  
    thetanum(n,1) = ydiv; % Stores y value in thetanum
    ysubs = subs(neint,'y',ydiv); % Substitutes each y value into neint
    ysubs = matlabFunction(ysubs); % Converts ysubs from symbolic to matlab function
    thetanum(n,2) = ((2*ydiv)/(nc)) * trapz(r,ysubs(r)); % Uses trapz for numerial integration
    
end  

thetanum(divnum) = (divnum.*divlength)-divoffset;
% prepare density function ne for plotting by substituting n0 and r0 values
ne = subs(ne,'n0',n0);
ne = subs(ne,'r0',r0);


 