module mux2to1(F, S, A, B);
	parameter n = 8;
	input S;
	input [n-1:0]A, B;
	output [n-1:0]F;
	
	assign F = S ? B:A;
endmodule
	