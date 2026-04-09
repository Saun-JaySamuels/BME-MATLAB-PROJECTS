clear
clc

syms VA VB 

eq1 = 1*VA - 2.25*VB == 46.348;                           % Node A
eq2 = 0.3*VA + 1.083*VB == 95.22;                % Node B


sol = solve([eq1, eq2], [VA, VB]);

VA = vpa(sol.VA)
VB = vpa(sol.VB)
