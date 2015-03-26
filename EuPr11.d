import std.stdio;
import std.conv;
import std.random;

const size_t N = 20;
const ushort M = 4; //number of multipliers

void main() {
	ushort grid[N][N];
	for(ushort i; i<N; i++) {
		for(ushort j; j<N; j++) grid[i][j]=to!ushort(uniform(0,100));
	}
	write(grid);

	uint maxPr;
	uint pr;
	ushort diff=N-M;
	for(ushort r; r<N; r++) {
		for(ushort c; c<N; c++) {
			if(r<=diff && c>=M-1) {		//diag-left-bottom(1)
				pr=find_product(grid,r,c,1);
				if (pr>maxPr) maxPr=pr;
			}

			if(r<=diff) {				//botton(2)
				pr=find_product(grid,r,c,2);
				if (pr>maxPr) maxPr=pr;
			}

			if(r<=diff && c<=diff) {		//diag-right-bottom(3)
				pr=find_product(grid,r,c,3);
				if (pr>maxPr) maxPr=pr;
			}

			if(c<=diff) {				//right(4)
				pr=find_product(grid,r,c,4);
				if (pr>maxPr) maxPr=pr;
			}
		}
	}
	writefln("The max product of %s adjacent numbers is _%s_", M, maxPr);
}

uint find_product(const ref ushort[N][N] grid, ushort r, ushort c, ushort mode){
	uint pr=1;
	switch (mode)
	{
		case 1:
			for(ushort i;i<M; i++) pr*=grid[r+i][c-i];
			break;
		case 2:
			for(ushort i;i<M; i++) pr*=grid[r+i][c];
			break;
		case 3:
			for(ushort i;i<M; i++) pr*=grid[r+i][c+i];
			break;
		case 4:
			for(ushort i;i<M; i++) pr*=grid[r][c+i];
			break;
		default:
			assert(0);
	}
	return pr;
} 