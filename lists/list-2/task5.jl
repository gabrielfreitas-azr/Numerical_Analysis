let A = [15 2 3 4; 2 5 7 5; 3 7 9 6; 4 5 6 7], x = [1; 1; 1; 1],
    tol = 1E-3, λ_k_1 = 0, error_λ = Inf, λ_k = 0

    using LinearAlgebra

    while (error_λ > tol) 
        
        y_k = x/norm(x)

        λ_k = y_k' * A * y_k

        x = A * y_k

        error_λ = abs(λ_k - λ_k_1)

        λ_k_1 = λ_k
    end

    println(λ_k)
    println(eigmax(A))
end
