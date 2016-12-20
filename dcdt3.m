function dfdt = dcdt3(t,c)
global lam
dfdt = zeros(3,1);
dfdt(1) = c(1)* -lam(1);
dfdt(2) = c(2)* -lam(2) + c(1)*lam(1);
dfdt(3) = c(3)* -lam(3) + c(2)*lam(2);
return
