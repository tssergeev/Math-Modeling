model lab4_2
Real x, y;
Real t=time; 
initial equation
x=2;
y=0;
equation
der(x)= y;
der(y)= -9*y-3*x;
end lab4_2;