RandomProcesses.jl
==================

# NOTICE

**This package is unmaintained. Its reliability is not guaranteed.**

# Introduction

CRP, CRT (just the number of occupied tables in a CRP draw)

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

	d = CRT(100, 0.01)
	x = rand(d)

	d = CRT(100, 1.0)
	x = rand(d)
