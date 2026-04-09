% Equilibrium points and Jacobian for predator prey model
syms speciesx speciesy
dxdt = speciesx*(1 - speciesx/100) - 0.25*speciesy*speciesx;
dydt = speciesy*(0.25*speciesx - 1);
EqPts=solve(dxdt==0,dydt==0);
disp('Equilibrium Points:')
fprintf('\n Prey Predator\n\n')
fprintf(' %3.3f %3.3f \n',EqPts.speciesx(1),EqPts.speciesy(1))
fprintf(' %3.3f %3.3f \n',EqPts.speciesx(2),EqPts.speciesy(2))
fprintf(' %3.3f %3.3f \n',EqPts.speciesx(3),EqPts.speciesy(3))
Eqns=[dxdt,dydt];
z=[speciesx,speciesy];
R=jacobian(Eqns,z);
fprintf('\n Jacobian:\n')
disp(R)
S(1,:)=EqPts.speciesx';
S(2,:)=EqPts.speciesy';
for k=1:size(S,2)
Req=subs(R,[speciesx;speciesy],S(:,k));
EqPt=S(:,k);
fprintf('Equilibrium Point:\n')
disp(S(:,k));
Jacobian_EqPt=double(Req);
EigenValues=eig(Jacobian_EqPt);
if real(EigenValues)<0
fprintf('Stable equilibrium point\n\n')
elseif any(real(EigenValues))>0
fprintf('Unstable equilibrium point\n\n')
elseif real(EigenValues)==0
fprintf('equilibrium point at center\n\n')
end
end
