model lab6_1
Real S, I, R;
Real a=0.01;
Real b=0.02;
Real N=16000;
Real t=time; 
initial equation
I=116;
S=N-I-R;
R=16;
equation
der(S)= 0;
der(I)= -b*I;
der(R)= b*I;
end lab6_1;