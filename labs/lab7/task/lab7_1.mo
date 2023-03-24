model lab7_1
Real x;
Real N=995;
Real t=time; 
initial equation
x=9;
equation
der(x)=(0.95 + 0.0008*x)*(N - x);
end lab7_1;