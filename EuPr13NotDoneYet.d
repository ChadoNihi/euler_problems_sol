import std.stdio;
import std.file: exists;
import std.conv: parse, to;
import std.string: chomp;

int main(){
	/*
	if(args.length<2){
		writeln("Usage: <program_name> <file_name>\r\nTerminating.");
		return -1;
	} else if(!exists(args[1])){
		writeln("Cannot find file \'%s\'.\r\nTerminating.", args[1]);
		return -1;
	}*/
	
	File fl = File("BigNumsForPr13", "r");
	const ubyte NofRs=50; // Number of rows and columns 
	const ubyte NofCs=100;				  // for a 90-degree rotated* 2D-array *(to traverse the arr row-wise).
	const ubyte NofFrstDgts=NofRs/5;
	ubyte grid[NofRs][NofCs];

	initialize_grid(fl, grid, NofRs, NofCs);
	fl.close();

	ubyte orderSums[NofRs];
	for (ubyte i; i<NofRs; i++){
		ubyte rowSum=0; //i.e. sum of the same-order digits
		for (ubyte j; j<NofCs; j++){
			rowSum+=grid[i][j];
		}
		orderSums[i]=rowSum;
	}

	ubyte sumDgts[NofRs];
	final_dgts(orderSums,sumDgts,NofRs,NofFrstDgts);


}

void initialize_grid(const ref File fl, ubyte* gridElem, ubyte nofRs, ubyte nofCs) {
	foreach (string line; lines(fl))
	{
		ushort i;
		for(ushort j; j<nofRs; j++){
			*(gridElem+nofRs*j+i)=parse!ubyte(line[j]);
		}
		i++;
	}
}

void final_dgts(const ref ubyte orderSums, ref ubyte sumDgts, ubyte sz){
	ubyte overflowFrmPrevOrder;
	for (ubyte i; i<sz; i++){
		ubyte temp=orderSums[i]/10;
		sumDgts[sz-1-i]=orderSums[i]%(temp*10)+overflowFrmPrevOrder;
		overflowFrmPrevOrder=temp;
	}
}