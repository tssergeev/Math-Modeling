model lab7_2
Real x;
Real N=995;
Real t=time; 
initial equation
x=9;
equation
der(x)=(0.000095 + 0.92*x)*(N - x);
end lab7_2;