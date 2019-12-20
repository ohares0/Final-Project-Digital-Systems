module BCDCounter(e,r,s,c,t);
	input e, r, s, c;
	output[3:0]t;
	
	reg[3:0]state, nextState;
	
	//Storage
	always @(posedge c or posedge r or posedge s) begin
		if(r|s)
			state <= 4'b0000;
		else
			state <= nextState;
	end 
	
	//Next State
	always @(state or c) begin
		nextState[0] <= state[0] ^ e;
		nextState[1] <= ((~state[3]&(state[1]^state[0]))& e) | (state[1]&~e);
		nextState[2] <= state[2] ^ (state[1]&state[0]&e);
		nextState[3] <= ((state[2]&state[1]&state[0]|state[3]&~state[0])&e) | (state[3]&~e);
	end 
	
	//Might need an always @, once done double check if the time never changes or time changes strangely
	assign t = {state[3],state[2],state[1],state[0]};
endmodule 