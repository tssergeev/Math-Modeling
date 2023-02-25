using DifferentialEquations
using Plots

a=0.45
b=0.86
c=0.49
h=0.73

function F!(du, u, p, t,)
    du[1] = -a*u[1] - b*u[2] + sin(t+1)
    du[2] = -c*u[1] - h*u[2] + cos(t+2)
end

begin
    u0 = [21200, 9800]
    T = [0.0, 1.0]
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
    plot_title="Модель боевых действий без участия партизанских отрядов"
)

plot!(
    plt,
    sol.t,
    X,
    xlabel="Время",
    color=:blue,
    label="Армия страны Х"
)

plot!(
    plt,
    sol.t,
    Y,
    ylabel="Армия",
    color=:red,
    label="Армия страны Y"
)

savefig(plt, "lab31.png")