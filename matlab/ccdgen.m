% CCD data generator
% This script takes the offset values from the pccd.m file and 
% from the pdensity.m script and
% generates an n by m matrix with values cooresponding the beam on a ccd
% sensor after diffraction. 
%
% Arguments
% lensletn = number of lenslets in the x direction
% lensletm = number of lenslets in the y direction
% 
% 
%
%
%
%
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
yshift = zeros(lensletn, lensletm);
lensletn = 5;
lensletm = 1;
f = 1;
m = 1; %Magnification factor is 1



for k = 1:lensletn
    yshift(k) = yindex(k)+offset(k)*f;
end




% Uses refraction angle function(theta) to calculate pixel offset



































