module TimerState (e, c, r, s, currentState);
	input e,c,r,s;
	output [1:0]currentState;
	
	reg [1:0]state, nextState;
	
	//Storage
	always @(posedge r or posedge c) begin
		if(r)
			state <= 2'b00;
		else 
			state <= nextState;
	end 
	
	//Next State
	always @(state or c) begin
		nextState[1] <= ~r&s | state[1]&~e&~r ;
		nextState[0] <= e&~r&~s | state[0]&~s&~r;
	end 
	
	assign currentState = {state[1], state[0]};
endmodule 