module ClockDividerSec(clkin, clkout);
	input clkin;
	output reg clkout;
	
	reg [18:0]count;
	
	always @(posedge clkin) begin
		count <= count + 1'b1;
		if(count >= 19'd500000) begin
			count <= 19'd0;
		end
	end
	
	always @(posedge clkin) begin 
		clkout <= (count >= 19'd250000) ? 1'b1 : 1'b0;
	end
endmodule 