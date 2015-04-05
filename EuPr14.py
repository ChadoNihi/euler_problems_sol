def longest_collatz_chain_under(n=1000000):
	maxcount=0
	num=0
	buff=[0]*(n+1)
	buff[1] = 1

	for x in (x for x in range(3, n, 2)):
		numInSeq=(x*3+1)//2
		if not numInSeq%2:
			continue
		else:
			numInSeq=(numInSeq*3+1)//2
			relativcount=5
			while numInSeq!=1 and (numInSeq>x or numInSeq%2==0 or buff[numInSeq]==0):
				if numInSeq%2:
					numInSeq=numInSeq*3+1
				else:
					numInSeq=numInSeq//2

				relativcount+=1

			if (relativcount!=5):
				relativcount+=buff[numInSeq]
				buff[x]=relativcount

			if relativcount>maxcount:
				maxcount=relativcount
				num=x


	return num