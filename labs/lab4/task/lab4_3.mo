model lab4_3
Real x, y;
Real t=time; 
initial equation
x=2;
y=0;
equation
der(x)= y;
der(y)= -4*y-x+cos(2*t);
end lab4_3;