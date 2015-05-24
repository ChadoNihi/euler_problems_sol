import std.stdio;
import std.math: floor, log2, sqrt;
import std.conv: to;
import std.algorithm: canFind, remove;

void main() {
	const uint Under = 10000;
	//names from http://en.wikipedia.org/wiki/Amicable_numbers#Euler.27s_rule
	const uint MaxN = to!uint(floor(log2(Under)+log2(Under)));
	uint[] primes = genPrimes(Under/2);
	//writeln(primes);
	uint sum = 0;
	uint p;
	uint q;
	uint r;
	uint twoToN;

	for(uint n=1;n<MaxN;n++){
		for(uint m; m<n; m++){
			p = (2^^(n-m)+1)*2^^m-1;
			if (primes.canFind(p)){
				twoToN = 2^^n;
				q = (2^^(n-m)+1)*twoToN-1;
				if (primes.canFind(q)){
					r = (2^^(n-m)+1)^^2*2^^(m+n)-1;
					if (primes.canFind(r)){
						writeln(twoToN*p*q);
						writeln(twoToN*r);
						sum += twoToN*p*q + twoToN*r;
					}
				}
			}
		}
	}
	write(sum);
}

uint[] genPrimes(uint upto){
	uint[] primesToBe = [2];
	for(uint i = 3; i<upto; i+=2) primesToBe ~= i;

	uint p;
	uint sz = primesToBe.length;
	uint till = to!uint(sqrt(to!float(upto)));
	for(uint i=1;i<till;i++){
		if (primesToBe[i]==0) continue;
		else {
			p = primesToBe[i];
			for (uint j = i+p; j<sz;j+=p) primesToBe[j]=0;
		}
	}
	return remove!(a => a == 0)(primesToBe);
}