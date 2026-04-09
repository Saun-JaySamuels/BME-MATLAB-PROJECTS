%Saun-Jay Samuels
%01/09/2025
%Code to solve differential equation of reaction kinetics

syms x(t)
k = 2;  % Rate constant
a0 = 10.5;
b0 = 6.5;

% Define the diffeq
ode = diff(x, t) == k * (a0 - x) * (b0 - x);

% Define the initial conditions
x0 = 0;
cond = x(0) == x0;

% Solve the ODE symbolically
sol = dsolve(ode, cond);

% Display the solution
disp('Solution for x(t):')
disp(sol)

% Convert symbolic solution to a function for plotting
f_x = matlabFunction(sol);

% Plot the solution
fplot(f_x, [0, 5]) % Plot from t = 0 to t = 5 seconds
xlabel('Time (s)')
ylabel('Concentration of X (\mu g/ml)')
title('Solution of Reaction Kinetics ODE')
grid on