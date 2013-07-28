immutable ChineseRestaurantTableProcess <: DiscreteUnivariateDistribution
	n::Int # Number of customers
	alpha::Float64
end

typealias CRT ChineseRestaurantTableProcess

function Distributions.rand(d::ChineseRestaurantTableProcess)
	s = 0
	for t = 1:d.n
		if rand() < d.alpha / (t - 1 + d.alpha)
			s += 1
		end
	end
	return s
end
