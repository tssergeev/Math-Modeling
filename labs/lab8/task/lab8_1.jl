using DifferentialEquations
using Plots

p_cr=22
N=25
q=1
tau1=18
tau2=21
p1=15
p2=12

a1=p_cr/(tau1*tau1*p1*p1*N*q)
a2=p_cr/(tau2*tau2*p2*p2*N*q)
b=p_cr/(tau1*tau1*p1*p1*tau2*tau2*p2*p2*N*q)
c1=(p_cr-p1)/(tau1*p1)
c2=(p_cr-p2)/(tau2*p2)

function F!(du, u, p, t)
    du[1]=(c1/c1)*u[1] - (a1/c1)*u[1]*u[1] - (b/c1)*u[1]*u[2]
    du[2]=(c2/c1)*u[2] - (a2/c1)*u[2]*u[2] - (b/c1)*u[1]*u[2]
end

begin
    u0 = [2.7, 2]
    T = [0.0, 30.0]
    prob = ODEProblem(F!, u0, T)
end

sol = solve(prob, dtmax=0.01)

const X = Float64[]
const Y = Float64[]

for u in sol.u
    x, y = u
    push!(X, x)
    push!(Y, y)
end

plt = plot(
    dpi = 300,
    size = (1000,600),
    plot_title="Модель конкуренции двух фирм"
)

plot!(
    plt,
    sol.t,
    X,
    color=:blue,
    label="M1"
)

plot!(
    plt,
    sol.t,
    Y,
    color=:red,
    label="M2"
)

savefig(plt, "lab8_1.png")