using DifferentialEquations
using Plots

a=0.22
b=0.051
c=0.33
d=0.041

function F!(du, u, p, t,)
    du[1] = -a*u[1] + b*u[1]*u[2]
    du[2] = c*u[2] - d*u[1]*u[2]
end

begin
    u0 = [3, 8]
    T = [0.0, 30.0]
    prob = ODEProblem(F!, u0, T)
end

sol = solve(prob, dtmax=0.1)

const X = Float64[]
const Y = Float64[]

for u in sol.u
    x, y = u
    push!(X, x)
    push!(Y, y)
end

plt = plot(
    dpi = 300,
    size=(1000,600),
    plot_title="Модель «хищник-жертва»"
)

plot!(
    plt,
    X,
    Y,
    xlabel="x",
    color=:blue,
    label="Фазовый портрет"
)

savefig(plt, "lab5_portret.png")