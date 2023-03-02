model lab4
Real x, y;
Real t=time; 
initial equation
x=2;
y=0;
equation
der(x)= y;
der(y)= -7*x;
end lab4;