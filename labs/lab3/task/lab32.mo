model lab32
Real x, y;
Real a=0.44;
Real b=0.7;
Real c=0.33;
Real h=0.61;
Real t=time; 
initial equation
x=21200;
y=9800;
equation
der(x)= -a*x - b*y + sin(2*t);
der(y)= -c*x*y - h*y + cos(t)+1;
end lab32;