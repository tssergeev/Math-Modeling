model lab5_2
Real x, y;
Real a=0.22;
Real b=0.051;
Real c=0.33;
Real d=0.041;
Real t=time; 
initial equation
x=c/d;
y=a/b;
equation
der(x)= -a*x + b*x*y;
der(y)= c*y - d*x*y;
end lab5_2;