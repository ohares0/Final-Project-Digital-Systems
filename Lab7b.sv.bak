module Lab7b (BUTTON, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX2_DP);
	input[2:0] BUTTON;
	input CLOCK_50;
	output[6:0] HEX0, HEX1, HEX2, HEX3;
	output HEX2_DP;
	
	wire clock, enabled0, enabled1, enabled2, enabled3;
	wire [3:0]t0, t1, t2, t3, dt0, dt1, dt2, dt3, st0, st1, st2, st3;
	wire [6:0]dig0,dig1,dig2,dig3;
	wire [1:0]state;
	wire selectDisplay;
	
	ClockDividerSec c (CLOCK_50, clock);
	
	
	
	assign HEX2_DP = 1'b0;
endmodule 