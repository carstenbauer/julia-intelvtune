using IntelITT

# Check if we are running under VTune
@assert IntelITT.available()

function profile_test(n)
    for i = 1:n
        A = randn(100,100,20)
        m = maximum(A)
        Am = mapslices(sum, A; dims=2)
        B = A[:,:,5]
        Bsort = mapslices(sort, B; dims=1)
        b = rand(100)
        C = B.*b
    end
end

# Compile code once
profile_test(1)

# Resume profiling
IntelITT.resume()
profile_test(1000)
# Pause profiling
IntelITT.pause()
