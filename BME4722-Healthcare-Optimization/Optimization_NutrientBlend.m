% wholefoods_lp.m
% Linear programming for minimum-cost grain blend meeting RDA per 2-oz serving.
% Decision variables x = [xA; xB; xC] are POUNDS of each grain in 1 lb of cereal.
% So xA + xB + xC = 1. RDA per serving (2 oz = 1/8 lb) implies per-lb nutrients >= 8*RDA.

clc; clear;

% Costs ($/lb)
f = [0.33; 0.47; 0.38];  % minimize cost per pound

% Nutrient units per pound for grains A, B, C
Prot = [22 28 21];
Ribo = [16 14 25];
Phos = [ 8  7  9];
Mag  = [ 5  0  6];

% RDA per serving (2 oz). Convert to per-pound (multiply by 8).
RDA_serving = [3; 2; 1; 0.425];
RDA_per_lb  = 8 * RDA_serving;

% Build A*x >= b constraints (will convert to <= for linprog)
A_ge = [Prot; Ribo; Phos; Mag];
b_ge = RDA_per_lb;

% Convert >= to <= by multiplying by -1
A = -A_ge;
b = -b_ge;

% Equality: xA + xB + xC = 1 (1 pound of finished blend)
Aeq = [1 1 1];
beq = 1;

% Bounds: nonnegative
lb = [0;0;0];
ub = [];

% Solve using linprog (which minimizes)
options = optimoptions('linprog','Display','none','Algorithm','dual-simplex');
[x, fval, exitflag] = linprog(f, A, b, Aeq, beq, lb, ub, options);

if exitflag ~= 1
    error('Optimization did not converge. exitflag = %d', exitflag);
end

xA = x(1); xB = x(2); xC = x(3);
cost_per_lb = fval;
cost_per_serving = cost_per_lb / 8;

% Nutrients delivered by this blend
nutrients_per_lb = [Prot; Ribo; Phos; Mag] * x;
nutrients_per_serving = nutrients_per_lb / 8;

% Display
fprintf('Optimal blend (per 1 lb of cereal):\n');
fprintf('  Grain A: %.3f lb (%.1f%%)\n', xA, 100*xA);
fprintf('  Grain B: %.3f lb (%.1f%%)\n', xB, 100*xB);
fprintf('  Grain C: %.3f lb (%.1f%%)\n', xC, 100*xC);
fprintf('\nMinimum cost: $%.4f per lb  |  $%.4f per 2-oz serving\n', cost_per_lb, cost_per_serving);

labels = {'Protein','Riboflavin','Phosphorus','Magnesium'};
fprintf('\nNutrients per serving (2 oz):\n');
for i = 1:numel(labels)
    fprintf('  %-10s: %.3f units  (RDA min = %.3f)\n', labels{i}, nutrients_per_serving(i), RDA_serving(i));
end
