% Saun-Jay Samuels
% 01/09/2025
% Code to solve for membrane potential with varying extracellular K+

% Constants
RT_zF = 61.5;   % mV (given upfront)

% Given ion concentrations (in mM)
Na_in = 14;      % Intracellular Na+
Na_out = 140;    % Extracellular Na+
K_in = 140;      % Intracellular K+
K_out = 4;       % Extracellular K+ (before change)

% Conductance values
gNa = 0.1;
gK = 0.9;

% Compute equilibrium potentials
E_Na = RT_zF * log10(Na_out / Na_in);
E_K = RT_zF * log10(K_out / K_in);

% Compute initial membrane potential using the correct equation
Vm_initial = (gNa / (gNa + gK)) * E_Na + (gK / (gNa + gK)) * E_K;

% New extracellular K+ concentration
K_out_new = K_out + 25; % Increase by 25 mM
E_K_new = RT_zF * log10(K_out_new / K_in);

% Compute new membrane potential
Vm_new = (gNa / (gNa + gK)) * E_Na + (gK / (gNa + gK)) * E_K_new;

% Threshold range
threshold_min = Vm_initial + 5;
threshold_max = Vm_initial + 15;

% Display results
fprintf('Initial Membrane Potential: %.2f mV\n', Vm_initial);
fprintf('New Membrane Potential after increasing extracellular K+: %.2f mV\n', Vm_new);

% Check if Vm exceeds threshold
if Vm_new > threshold_max
    fprintf('Warning: Vm exceeds threshold, action potential likely!\n');
elseif Vm_new > threshold_min
    fprintf('Vm is within threshold range, action potential possible.\n');
else
    fprintf('Vm is below threshold range, action potential unlikely.\n');
end
