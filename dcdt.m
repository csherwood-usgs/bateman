function dfdt = dcdt(t,c)
global lam
dfdt = zeros(4,1);
dfdt(1) = c(1)* -lam(1) - c(1)*lam(4);
dfdt(2) = c(2)* -lam(2) + c(1)*lam(1) - c(2)*lam(4);
dfdt(3) = c(3)* -lam(3) + c(2)*lam(2) - c(3)*lam(4);
dfdt(4) =                 c(3)*lam(3) - c(4)*lam(4);
return
