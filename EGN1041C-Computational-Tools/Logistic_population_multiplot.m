% Saun-Jay Samuels: 01/12/2025
% Script for the numerical solution of a cell population problem
% Utilizing the Euler differential equation solver

clear
clc
close all

K = 5e8; % Carrying capacity
r = 0.56; % Birth rate
P0 = 120 * 3000; % Initial population
t = 25; % Total simulation time in days
dt_values = [1/24, 1/1440, 1/86400]; % Time step values in days (1 hour, 1 minute, 1 second)
titles = ["Logistic Growth (dt = 1 hour)", ...
          "Logistic Growth (dt = 1 minute)", ...
          "Logistic Growth (dt = 1 second)"];

for i = 1:length(dt_values)
    dt = dt_values(i); % Current time step
    iterations = round(t / dt); % Number of iterations
    Pall = zeros(1, iterations); % Holds population values
    P = P0; % Initial population

    for k = 1:iterations
        Pall(k) = P; % Store population at this iteration
        dPdt = r * P * (1 - (P / K)); % Logistic growth model
        P = dt * dPdt + P; % Euler method update
    end

    % Time vector for current dt
    t_vector = dt * (0:iterations - 1);

    % Plot the results in a separate figure
    figure('color', 'w');
    plot(t_vector, Pall, 'b-');
    title(titles(i), 'FontSize', 18);
    xlabel('Time (Days)', 'FontSize', 14);
    ylabel('Population', 'FontSize', 14);
    grid on;
end
