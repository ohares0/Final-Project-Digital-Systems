module Lab7b (BUTTON, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX2_DP);
	input[2:0] BUTTON;
	input CLOCK_50;
	output[6:0] HEX0, HEX1, HEX2, HEX3;
	output HEX2_DP;
	assign HEX2_DP = 1'b0;
	
	wire clk;
	logic [13:0] time1, time2, time3, time4, avg, currtime;
	logic [3:0] state;
	wire start = ~BUTTON[2];
	wire rst = ~BUTTON[0];

	ClockDividerSec c (CLOCK_50, clk);
	
	always_ff @(posedge clk) begin 
		if (state % 3 == 0) currtime <= 0; 
		else if (state % 3 == 1) currtime <= currtime + 1; 
		
	end
			
	always_ff @(posedge start or posedge rst) begin 
		if (rst) begin 
			time1 <= 0;
			time2 <= 0;
			time3 <= 0;
			time4 <= 0;
			avg <= 0;
			state <= 0;
		end else begin 
			case (state)
				1: time1 <= currtime; 
				4: time2 <= currtime; 
				7: time3 <= currtime; 
				10: time4 <= currtime;                                    
				11: avg <= (time1 + time2 + time3 + time4) / 4; 
			endcase
			if (state < 12) state <= state + 1; 
			else state <= 0;
		end
	end
	
	binary_to_7seg(state == 12 ? avg : currtime, HEX3, HEX2, HEX1, HEX0); 
	
endmodule 