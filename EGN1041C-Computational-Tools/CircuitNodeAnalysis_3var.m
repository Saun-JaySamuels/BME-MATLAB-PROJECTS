clear
clc

syms V1 V2 VO

eq1 = (V1 - 6)/1000 + (V1 - V2)/1000 + (V1 - 0)/33000 == 0;                           % Node 1
eq2 = (V2 - V1)/1000 + (V2 - 0)/33000 + (V2)/1000 == 0;                % Node 2
eq3 = (0 - 6)/33000 + (0 - V1)/33000 + (0 - V2)/33000 + (0 - VO)/33000 == 0       % NODE 3

sol = solve([eq1, eq2, eq3], [V1, V2, VO]);

V1 = vpa(sol.V1)
V2 = vpa(sol.V2)
VO = vpa(sol.VO)
