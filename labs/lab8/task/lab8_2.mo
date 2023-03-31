model lab8_2
Real M1, M2;
Real p_cr=22;
Real N=25;
Real q=1;
Real tau1=18;
Real tau2=21;
Real p1=15;
Real p2=12;
Real a1=p_cr/(tau1*tau1*p1*p1*N*q);
Real a2=p_cr/(tau2*tau2*p2*p2*N*q);
Real b=p_cr/(tau1*tau1*p1*p1*tau2*tau2*p2*p2*N*q);
Real c1=(p_cr-p1)/(tau1*p1);
Real c2=(p_cr-p2)/(tau2*p2);
Real t=time; 
initial equation
M1=2.7;
M2=2;
equation
der(M1)=(c1/c1)*M1 - (a1/c1)*M1*M1 - (b/c1 + 0.0019)*M1*M2;
der(M2)=(c2/c1)*M2 - (a2/c1)*M2*M2 - (b/c1)*M1*M2;
end lab8_2;