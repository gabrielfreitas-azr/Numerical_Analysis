# Achar raízes da equação f(x) = log(x) - cos(x)
# pelo método da secante. Supondo como soluções iniciais
# x_0 = 1, x_1 = 2

function f(x)
    return log(x) - cos(x)
end

let x = 0, x_0 = 1, x_1 = 2

    for i in 1:10
    
        x = x_1 - f(x_1)/((f(x_1) - f(x_0))/(x_1 - x_0)) 
    
        println("k = ", i,":")
        println("x =", x)
        println("f(x) = ", f(x))
    
        x_0 = x_1
        x_1 = x      

    end

    println("Solução: x = ", x)
end


