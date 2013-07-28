immutable ChineseRestaurantProcess
	n::Int # Number of customers
	alpha::Float64
end

typealias CRP ChineseRestaurantProcess

function Distributions.rand(d::ChineseRestaurantProcess)
	s = [1]
	for t in 2:d.n
		psum = 0.0
		r = rand()
		table = 1
		n_tables = length(s)
		while table <= n_tables
			c = s[table]
			p = c / (t - 1 + d.alpha)
			psum += p
			if r < psum
				s[table] += 1
				break
			end
			table += 1
		end
		if table > n_tables
			push!(s, 1)
		end
	end
	# TODO: Always sort result to provide canonical form for partitions?
	return s
end

function Distributions.logpdf(d::ChineseRestaurantProcess, x::Vector)
	s = 0.0
	n_tables = length(x)
	n = 0
	for table in 1:n_tables
		c = x[table]
		n += 1
		p = d.alpha / (n - 1 + d.alpha)
		s += log(p)
		for i in 2:c
			n += 1
			p = (i - 1) / (n - 1 + d.alpha)
			s += log(p)
		end
	end
	return s
end

function Distributions.pdf(d::ChineseRestaurantProcess, x::Vector)
	return exp(logpdf(d, x))
end
