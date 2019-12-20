module EnabledTimer (E, c, r, s, enabled);
	input E,c,s,r;
	output enabled;
	
	reg state, nextState;
	
	//Storage
	always @(posedge E or posedge r or posedge s) begin
		if(r|s)
			state <= 1'b0;
		else
			state <= nextState;
	end 
	
	//Next State
	always @(state or c) begin
		nextState <= ~state;
	end 
	
	assign enabled = state;
endmodule 