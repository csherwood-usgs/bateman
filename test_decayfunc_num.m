global C0

C0 = [1; 1; 1]
lam = [.4; .1; 0]
tspan = [1980:5:2015]
C = decayfunc_num(tspan,lam)