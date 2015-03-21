def smlst_multp():
	test_num=2520
	rnge=range(20,2,-1)
	while True:
		for x in rnge:
			if test_num%x: break;
		else:
			return test_num
		test_num+=20