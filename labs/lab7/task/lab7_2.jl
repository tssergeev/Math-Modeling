using DifferentialEquations
using Plots

N=995
x0=9

function F!(u, p, t)
    du = (0.000095 + 0.92*u)*(N - u)
end

begin
    u0 = x0
    T = [0.0, 0.5]
    prob = ODEProblem(F!, u0, T)
end

sol = solve(prob, dtmax=0.001)

plt = plot(
    dpi = 300,
    size=(1000,600),
    plot_title="Эффективность рекламы"
)

plot!(
    plt,
    sol.t,
    sol.u,
    xlabel="t",
    ylabel="N",
    color=:red,
    label="N(t)"
)

savefig(plt, "lab7_2.png")