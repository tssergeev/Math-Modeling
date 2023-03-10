model lab5
Real x, y;
Real a=0.22;
Real b=0.051;
Real c=0.33;
Real d=0.041;
Real t=time; 
initial equation
x=3;
y=8;
equation
der(x)= -a*x + b*x*y;
der(y)= c*y - d*x*y;
end lab5;