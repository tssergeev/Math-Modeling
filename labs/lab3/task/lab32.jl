using DifferentialEquations
using Plots

a=0.44
b=0.7
c=0.33
h=0.61

function F!(du, u, p, t,)
    du[1] = -a*u[1] - b*u[2] + sin(2*t)
    du[2] = -c*u[1]*u[2] - h*u[2] + cos(t)+1
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
    size=(800,600),
    plot_title="Модель боевых действий с участием партизанских отрядов"
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

savefig(plt, "lab32.png")