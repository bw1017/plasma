% Calculates the ccd beam offset from the phase offset. 
% The relationship between the ccd beam offset and the phase offset is
% equal to dy = theta * fM, where f is the focal length of the microlens
% array and M is the image magnificaiton factor

% FOR SYMBOLIC PDENSITY

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lensletn = 50;
lensletm = 1;
f = 1; 


% Initialize offset and yindex matrix. The offset matrix is an n by m array
% that has the angular deviation calulated from theta. the yindex matrix is
% an n by m array that records the center y coordinates for each lenslet. 
offset = zeros(lensletn, lensletm); 
yindex = zeros(lensletn, lensletm);

% Convert symbolic theta to matlab function
T = matlabFunction(theta); 

% Calcules maximum angular deviation of theta
y = [-r0:0.01:r0]; % Generates values up to the radius of the plasma
tprime = T(y);
mtheta = max(tprime);

% Calculate maximum offset of theta
maxoffset = mtheta * f; 

% Calculate the size of each lenslet
lensletsize = (2*r0)/(lensletn); 


% Finds the relative offset for each lenslet (NEED TO DEAL WITH MAG)
for n = 1:lensletn;
    ysize = (lensletsize/2)-r0 + (n-1)*lensletsize;%Set minimum y value
    yindex(n) = ysize; % 
    offset(n) = T(ysize);
end

offset
yindex

    
