% Determining equilibrium points, jacobian of system, and eigenvalues of
% Jacobian
syms b p s
dbdt=1.25*b*(1-(b/10^10)-(10^(-6))*p);
dsdt=2*s*(1-(s/(10^10))-1.7e4*b/(10^10));
dpdt=-0.9*p+(10^(-6))*b*p;
EqPts=solve(dbdt==0,dsdt==0,dpdt==0);
EP=[EqPts.b(:,1),EqPts.s(:,1),EqPts.p(:,1)];
disp(' b s p')
disp(EP)
Eqns=[dbdt,dsdt,dpdt];
q=[b,p,s];
J=jacobian(Eqns,q);
fprintf('\n The Jacobian of this system is:\n')
disp(J)
for k=1:size(EP,1)
Jeq=subs(J,[b,p,s],EP(k,:));
fprintf('For equilibrium point\n')
disp(EP(k,:));
Jacobian_EqPt=double(Jeq);
Eigenvalues=eig(Jacobian_EqPt);
if all(real(Eigenvalues))<0
fprintf('Stable equilibrium point\n\n')
elseif all(real(Eigenvalues))>0
fprintf('Unstable equilibrium point\n\n')
elseif all(real(Eigenvalues))==0
fprintf('Equilibrium point stability not determined\n\n')
end
end
