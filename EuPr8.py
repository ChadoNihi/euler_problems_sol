from random import randrange
from itertools import repeat
from functools import reduce
from array import array

def grtst_prod(n=1000,adj=13):
	numerals=array('H')
	bound_for_hope_iter=5
	rat=n/adj
	if rat<50:
		bound_for_hope_iter=1
	elif rat<64:
		bound_for_hope_iter=3

	for _ in repeat(None,n): numerals.append(randrange(10))
	if not numerals[0]:
		numerals=numerals[1:]
		numerals.append(randrange(10))

	max_pr = find_max_pr(numerals,n,adj,bound_for_hope_iter)

	if max_pr==0: #if hope case has failed:
		max_pr=find_max_pr(numerals,n,adj)
	return max_pr

def find_max_pr(numerals,n,adj,bound_for_hope_iter=1):
	max_pr = 0
	pr=0
	i=0
	f_red=lambda x, y: x*y
	while i<n-adj:
		while numerals[i]<numerals[i+adj] and i<n-adj-1:
			i+=1
			slice=numerals[i:i+adj]
			if bound_for_hope_iter==1:
				if 0 in slice:
					i+=(len(slice)) - slice[::-1].index(0)
			else:
				smalls=[x for x in slice if x<bound_for_hope_iter]
				if not len(smalls):
					i+=(len(slice)) - slice[::-1].index(smalls[-1])

		pr=reduce(f_red,numerals[i:i+adj])
		if pr>max_pr:
			max_pr=pr
		i+=1
	return max_pr