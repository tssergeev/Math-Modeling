using DifferentialEquations
using Plots

a=0.01
b=0.02
N=16000
I0=116
R0=16
S0=N-I0-R0

function F!(du, u, p, t,)
    du[1] = -a*u[1]
    du[2] = a*u[1] - b*u[2]
    du[3] = b*u[2]      
end

begin
    u0 = [S0, I0,R0]
    T = [0.0, 200.0]
    prob = ODEProblem(F!, u0, T)
end

sol = solve(prob, dtmax=0.01)

const X = Float64[]
const Y = Float64[]
const Z = Float64[]

for u in sol.u
    x, y, z = u
    push!(X, x)
    push!(Y, y)
    push!(Z, z)
end

plt = plot(
    dpi = 300,
    size=(1000,600),
    plot_title="Задача об эпидемии"
)

plot!(
    plt,
    sol.t,
    X,
    color=:blue,
    label="S(t)"
)

plot!(
    plt,
    sol.t,
    Y,
    color=:red,
    label="I(t)"
)

plot!(
    plt,
    sol.t,
    Z,
    color=:green,
    label="R(t)"
)

savefig(plt, "lab6_2.png")