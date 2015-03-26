def pythagorean_triplet_abc():
	a=b=c=0
	gen_m_n=([m,n,k] for m in range(1,40) for n in range(1,35) for k in range(1,40) if not (m-n)%2==0 and m>n and gcd_binary(m,n)==1)
	for m,n,k in gen_m_n:
		a=k*(m**2-n**2)
		b=k*(2*m*n)
		c=k*(m**2+n**2)
		if a+b+c==1000:
			return a*b*c
	return -1

def gcd(m,n):			#Euclid's algorithm
	if m==n:
		return m
	elif m>n:
		return gcd(m-n,n)
	elif n>m:
		return gcd(m,n-m)

def gcd_binary(m,n,d=1):		#binary gcd method
	if m==n:
		return m*d
	elif m==0:
		return n*d
	elif n==0:
		return m*d
	meven=m%2==0
	neven=n%2==0
	if meven and not neven:
		return gcd_binary(m/2,n,d)
	elif not meven and neven:
		return gcd_binary(m,n/2,d)
	elif meven and neven:
		return gcd_binary(m/2,n/2,d*2)
	elif m>=n:
		return gcd_binary((m-n)/2,n,d)
	elif n>m:
		return gcd_binary((n-m)/2,m,d)