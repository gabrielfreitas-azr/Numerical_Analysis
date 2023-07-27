function f(x)
    return exp(x) - 4*x
end

let a = 0, b = 1
    for i in 1:54
        println("k = ", i, "[", a,",",  b, "]:")

        # Cálculo do ponto médio

        x = (a + b) / 2

        if (f(x) * f(a) < 0)

            b = x

        elseif (f(x) * f(b) < 0)

            a = x

        end

        println("f(x) = ", f(x))
        println("x = ", x)
    end

    
end