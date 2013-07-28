using Distributions

module RandomProcesses
	using Distributions

	export ChineseRestaurantProcess, CRP
	export ChineseRestaurantTableProcess, CRT

	include("crp.jl")
	include("crt.jl")
end
