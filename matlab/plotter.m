% Function Plotter
% Plots the plasma density ne and


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Plots the plasma density as a function of y
D = matlabFunction(ne);
% T = matlabFunction(theta)
subplot(2,2,1);
    hold on;
ezplot(D,[0,r0,0,n0]);
xlabel('Radius(cm)');
ylabel('Plasma Density(cm^-3)');


% Plots the deflection angle as a function of y
subplot(2,2,2);
%ezplot(T,[0,r0])
scatter(thetanum(:,1),thetanum(:,2),5,'filled');
xlabel('y(cm)');
ylabel('Theta(Radians)');

% Plots the calcualted density from the deflection angle as a function of y
subplot(2,2,3);
scatter(y,density,4,'filled');
%T = matlabFunction(theta)
% ezplot(T,[0,r0])
xlabel('Radius(cm)');
ylabel('Plasma Density(cm^-3)');

% Plots the difference between numerical and symbolic density
% as a function of y
subplot(2,2,4);
numdifference = D(y) - density;
scatter(y,numdifference,4,'filled');
xlabel('y(cm)');
ylabel('Difference');







