module FastestTime (t, c, r, cont, fastestTime);
	input r, c, cont;
	input [16:0]t;
	output [16:0]fastestTime;
	
	reg [16:0]bestTime;
	
	//Storage
	always @(posedge r or posedge c) begin
		if(r)
			bestTime <= 16'b1001100110011001;
		else if(t != 0 & t < bestTime & cont)
			bestTime <= t;
	end 
	
	assign fastestTime = bestTime;
endmodule 