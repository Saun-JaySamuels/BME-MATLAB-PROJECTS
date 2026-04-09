% Coefficients for objective function (maximize profit)
% MATLAB's linprog minimizes, so we take negative
f = [-100; -50];

% Constraints matrix (A * x <= b)
A = [120 40;   % Manufacturing labor
     40 80;    % Inspection labor
     0  1];    % Marketing

b = [600;      % Manufacturing available hours
     400;      % Inspection available hours
     4];       % Marketing max units

% Bounds for decision variables (M >= 0, G >= 0)
lb = [0; 0];  
ub = [];      % No explicit upper bound except constraints

% Solve
[x, fval] = linprog(f, A, b, [], [], lb, ub);

% Results
M = x(1);   % Units of Mammothwalkers
G = x(2);   % Units of Galacticassists
Profit = -fval;  % Convert back to maximization
fprintf('Optimal: M = %.2f, G = %.2f, Profit = $%.2f\n', M, G, Profit);
