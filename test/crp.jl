using RandomProcesses

d = CRP(100, 0.01)
x = rand(d)
pdf(d, x)

d = CRP(100, 1.0)
x = rand(d)
pdf(d, x)
shuffle!(x)
pdf(d, x)

d = CRP(100, 10000.0)
x = rand(d)
pdf(d, x)
