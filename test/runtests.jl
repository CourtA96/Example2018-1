using Test
using Example2018

# Polynomials form a ring
# 1. addition is associative
# 2. additive identity
# 3. additive inverse
# 4. addition commutes

@testset "Polynomials form a ring" begin

	z = Polynomial([0])

	for n in 1:100

		deg = rand(0:100)
		p = Polynomial(rand(-1000000:1000000, deg+1))

		@test p + z == p
		@test z + p == p
		@test p + (-p) == z

	end

end

# Scaler Multiplication
# 1. A scaler multiplied by a polynomial gives a polynomial
# 2. A polynomial multiplied by zero gives zero

@testset "Scaler Multiplication" begin

	z = Polynomial([0])
	
	for n in 1:100


		deg = rand(0:100)
		sclr = rand()
		p = Polynomial(rand(-1000000:1000000, deg+1))
		
		@test poly(sclr*p) == true
		@test 0*p == z

	end

end

# Derivative Test
# 1. The derivative of a polynomial must be a polynomial
# 2. If the polynomial has degree n, the derivative must have degree (n-1)

@testset "Derivative Test" begin

	for n in 1:100


		deg = rand(0:100)
		p = Polynomial(rand(-1000000:1000000, deg+1))
		dp = deriv(p)
		
		@test poly(dp) == true
		@test length(dp.coeffs) == deg

	end

end
