model lab7_3
Real x;
Real N=995;
Real t=time; 
initial equation
x=9;
equation
der(x)=(0.95*sin(t) + 0.93*cos(9*t)*x)*(N - x);
end lab7_3;