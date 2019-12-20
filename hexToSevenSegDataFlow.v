module hexToSevenSegDataflow(in, out);
	input [3:0]in;
	output [6:0]out;
	
	wire W,X,Y,Z;
	wire A, B, C, D, E, F, G;
	
	assign out = {G, F, E, D, C, B, A};
	assign {W, X, Y, Z} = in;
	
	// A = X'Z' + W'XZ + WX'Y' + WZ' + XY + W'Y
	assign A = ~X&~Z | ~W&X&Z | W&~X&~Y | W&~Z | X&Y | ~W&Y;
	//B = W'Y'Z' + W'YZ + WY'Z + X'Z' + W'X'
	assign B = ~W&~Y&~Z | ~W&Y&Z | W&~Y&Z | ~X&~Z | ~W&~X;
	//C = Y'Z + W'X + WX' + W'Y' + W'Z
	assign C = ~Y&Z | ~W&~Y | ~W&Z | ~W&X | W&~X;
	//D = XY'Z + WY'Z' + W'X'Z' + X'YZ + XYZ'
	assign D = X&~Y&Z | W&~Y&~Z | ~W&~X&~Z | ~X&Y&Z | X&Y&~Z;
	//E = X'Z' + YZ' + WX + WY
	assign E = ~X&~Z | Y&~Z | W&X | W&Y;
	//F = Y'Z' + W'XY' + XZ' + WY + WX'
	assign F = ~Y&~Z | ~W&X&~Y | X&~Z | W&Y | W&~X;
	//G = YZ' + WX' + X'Y + WZ + W'XY'
	assign G = Y&~Z | W&~X | ~X&Y | W&Z | ~W&X&~Y;
endmodule 
