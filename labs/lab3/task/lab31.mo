model lab31
Real x, y;
Real a=0.45;
Real b=0.86;
Real c=0.49;
Real h=0.73;
Real t=time; 
initial equation
x=21200;
y=9800;
equation
der(x)= -a*x - b*y + sin(t+1);
der(y)= -c*x - h*y + cos(t+2);
end lab31;