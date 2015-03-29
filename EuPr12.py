from math import sqrt
from itertools import repeat

primes=gen_primes()

def triang_num_with_over_n_div(n=500):
	for tr in (x for x in range(5000,1000000000,10) if sqrt(8*x+1)%1==0):
		if find_num_of_divs(tr)>500:
			return tr
	return -1


#helper functions:

def find_num_of_divs(tr):
	NoD, remain= 1, tr
	for i in range(0, len(primes)):
		if (primes[i]*primes[i]>tr): return NoD*2

		exp=1
		while not remain%primes[i]:
			exp+=1
			remain/=primes[i]
		NoD*=exp

		#if no remainder return the divisor counter:
		if remain==1: return NoD
	return NoD




def gen_primes(max=75000):
	count=[True]*int(max/2)
	i=0
	primes=[2]
	candidates=[x for x in range(3,max,2)]
	for x in candidates:
		i+=1
		if count[i-1]:
			primes.append(x)
			j=i
			for y in candidates[i:max]:
				if not y%x:
					count[j]=False
				j+=1
				
	return primes

'''
def print_tr_nums(amnt):
	for n in (x for x in range(1,amnt) if sqrt(8*x+1)%1==0):
		print("{:3d}: ".format(n), end=' ')
		for d in (d for d in range(1,n+1) if n%d==0):
			print("{:>4}".format(d), end=' ')
		print()
'''