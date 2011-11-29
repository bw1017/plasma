% Wavefront Density Reconstruction
% This script takes CCD data and uses an abel inversion to reconstruct the
% plasma density distrubution. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% Prepares CCD Data from numericaltheta.m

% Initialize density matrix and y index for numerical integration
density = zeros(divnum,1);
y = thetanum(:,1);
divoffset = divlength/2;

% The for loop numerically calculates the integral for each value of r

for n = 1:divnum;
    rdiv = ((n-1).* divlength); % Set r value for each iteration
    thetaint = zeros(divnum,1); % Resets thetaint matrix
        for m = n:divnum;
        thetaint(m,1) =  thetanum(m,2)* (1/(thetanum(m,1)^2 - rdiv.^2)^(1/2)); % Sets theta    
        end
    density(n,1) = trapz(y,thetaint); % Calculates density by integration
end  

density = n0*(1-((2*nc)/3.14)*density); % Adds offset of density
