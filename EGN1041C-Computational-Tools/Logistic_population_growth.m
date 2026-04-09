%Saun-Jay Samuels: 01/12/2025
%Script for the numerical solution of a cell population problem
%Utilizing the Euler differential equation solver

clear
clc
close all


K = 5e8; %Carrying capacity
r = 0.56; %Birth rate
P0 = 120 * 3000; %Initial population
time_days = 25; %Total simulation time in days

%(time steps)
dt_values = [1/86400, 1/1440, 1/24]; %Seconds, minutes, and hours

% cell array to store results
Pall_all = cell(1, length(dt_values)); %Population arrays for different dt
time_all = cell(1, length(dt_values)); %Time arrays for different dt

%Loop over dt values
for i = 1:length(dt_values)
    dt = dt_values(i); %Current time step
    iterations = round(time_days / dt); %Number of iterations
    
    % Initialize variables
    Pall = zeros(1, iterations); %Holds population values
    P = P0; %Set initial population
    time = dt*(0:iterations-1); %Time vector
    
    %Euler's method loop
    for k = 1:iterations
        Pall(k) = P; %Store population
        dPdt = r*P*(1 - (P/K)); %Logistic growth model
        P = dt*dPdt + P; %Update population
    end
    
    % Store results
    Pall_all{i} = Pall;
    time_all{i} = time;
end

%Plot results for different dt values
figure('Color', 'w');
hold on;
plot(time_all{1}, Pall_all{1}, 'r-', 'DisplayName', 'dt = 1/86400 (1 second)');
plot(time_all{2}, Pall_all{2}, 'b-', 'DisplayName', 'dt = 1/1440 (1 minute)');
plot(time_all{3}, Pall_all{3}, 'g-', 'DisplayName', 'dt = 1/24 (1 hour)');
hold off;

%Add labels and legend
title('Logistic Population Growth of Cells With Variable Time Steps', 'FontSize', 18);
xlabel('Time (Days)', 'FontSize', 14);
ylabel('Population', 'FontSize', 14);
legend('FontSize', 12, 'Location', 'best');
grid on;

%Time taken for petri dish to reach 80% saturation
P80pct=find((Pall-0.8*K)>0,1);
T=P80pct*dt;
days=floor(T); % Converting time to days,hours,minutes,seconds
h=rem(T,days)*24;
hours=floor(h);
m=rem(h,1)*60;
minutes=floor(m);
s=rem(m,1)*60;
seconds=floor(rem(s,1)*60);
fprintf('80%% saturation will be reached in:\n')
fprintf('%2.0f days %2.0f hrs %2.0f min %2.0fsec\n\n',days,hours,minutes,seconds)

% Determine seed density for 80% saturation at exactly 8 days
target_time = 8; % in days
P_target = 0.8 * K; % 80% saturation

% Solve for P0 using logistic growth equation
P0_solution = K / (1 + ((K / P_target) - 1) * exp(-r * target_time));
seed_density = P0_solution / 120; % Convert to cells/cm^2

% Check if the solution meets the ±0.25% criterion
final_population = K / (1 + ((K / P0_solution) - 1) * exp(-r * target_time));
error_margin = abs((final_population - P_target) / P_target);

if error_margin <= 0.0025
    fprintf('It is possible to achieve 80%% saturation in exactly 8 days.\n');
    fprintf('Required seeding density: %.2f cells/cm^2\n', seed_density);
else
    fprintf('It is not possible to achieve 80%% saturation in exactly 8 days within the ±0.25%% error margin.\n');
end
