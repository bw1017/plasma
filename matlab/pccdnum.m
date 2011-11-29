% Calculates the ccd beam offset from the phase offset. 
% The relationship between the ccd beam offset and the phase offset is
% equal to dy = theta * fM, where f is the focal length of the microlens
% array and M is the image magnificaiton factor

% FOR NUMERICAL INTEGRATION SOLVER
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lensletn = divnum; % Sets the number of lenslets
lensletm = 1;% For 3 dimentional dnesity functions change value for z
f = 1; % Focal length of microlens array -used to determine offset
m = 1; % Magnification of image - used to determine offset

% Initialize offset and yindex matrix. The offset matrix is an n by m array
% that has the angular deviation calulated from theta. the yindex matrix is
% an n by m array that records the center y coordinates for each lenslet. 

yindex = thetanum(:,1);
offset = thetanum(:,2) + thetanum(:,1)*(f*m); 

% Calculate the size of each lenslet
% lensletsize = (2*r0)/(lensletn); 

% Generate index for scatter plot
zindex = ones(divnum,1);


    
