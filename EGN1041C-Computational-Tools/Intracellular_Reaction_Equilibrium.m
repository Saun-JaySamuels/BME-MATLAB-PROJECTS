clc; clear; close all;

% Define symbolic variables
syms x y z

% Define the equations
eq1 = 2*(10 - x) - (10 - 2*z)*x*y == 0;
eq2 = 3*(6 - y) - (10 - 2*z)*x*y == 0;
eq3 = (10 - 2*z)*x*y - 2*z == 0;

% Solve the system numerically
S = vpasolve([eq1, eq2, eq3], [x, y, z]);

% Convert struct to arrays
Sx = double(S.x);
Sy = double(S.y);
Sz = double(S.z);

% Filter out complex solutions
real_idx = (imag(Sx) == 0) & (imag(Sy) == 0) & (imag(Sz) == 0);

% Check if any real solutions exist
if ~any(real_idx)
    disp('No real equilibrium points found.');
else
    disp('Real Equilibrium Points:');
    for i = find(real_idx)'  % Loop through only real solutions
        disp(['Solution ', num2str(i), ':']);
        disp(['x = ', num2str(Sx(i))]);
        disp(['y = ', num2str(Sy(i))]);
        disp(['z = ', num2str(Sz(i))]);
        disp('-------------------------');
    end
end