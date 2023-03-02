using DifferentialEquations
using Plots

function F!(du, u, p, t,)
    du[1] = u[2]
    du[2] = -7*u[1]
end

begin
    u0 = [2, 0]
    T = [0.0, 30.0]
    prob = ODEProblem(F!, u0, T)
end

sol = solve(prob, dtmax=0.05)

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
    plot_title="Решение уравнения гармонического осциллятора"
)

plot!(
    plt,
    sol.t,
    X,
    color=:blue,
    label="Время"
)

plot!(
    plt,
    sol.t,
    Y,
    color=:red,
    label="Скорость"
)

savefig(plt, "lab41.png")