# Решаем ОДУ

using DifferentialEquations
using Plots

"""Правая часть ОДУ
u --- переменная (скаляр или массив)
p --- параметры (кортеж, tuple)
t --- аргумент (скаляр, время)
"""
function F(u,p,t)
# p и t не используются
# но нужны для библиотеки
    return u / sqrt(6.84)
end


"Начальное значение"
const u_0 = 6.8 / 1.8


"Интервал (кортеж, tuple)"
const T = (0, 2*pi)

# Задача
prob = ODEProblem(F, u_0, T)

# Решение задачи
sol = solve(
    prob, 
    dtmax=0.05
)

plt = plot(
    proj = :polar,
    aspect_ratio=:equal,
    dpi=300,
    legend=true)

plot!(
    plt,
    sol.t,
    sol.u,
    xlabel="θ",
    ylabel="r(t)",
    label="Траектория катера",
    color=:red)

plot!(
    plt,
    [0.0, sol.t[45]],
    [0.0, 15],
    xlabel="x",
    ylabel="t",
    label="Траектория лодки",
    color=:green
)

plot!(
    plt,
    [0.0, 0.0],
    [6.8/1.8, 6.8],
    xlabel="x",
    ylabel="t",
    label="",
    color=:red
)

plot!(
    plt,
    [sol.t[45]],
    [sol.u[45]],
    seriestype=:scatter,
    xlabel="θ",
    ylabel="r(t)",
    label="Точка встречи",
    color=:black,
    title="Погоня")

savefig(plt, "lab2_first.png")