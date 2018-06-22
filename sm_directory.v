module sm_directory(
	clock,
	writeMiss,
	readMiss,
	writeBack,
	invalidateIn,
	fetch,
	invalidateOut,
	dataValueReply,
	sharers,
	currentState
);

	input clock;
	input writeMiss;
	input readMiss;
	input writeBack;
	input invalidateIn;

	output reg fetch;
	output reg invalidateOut;
	output reg dataValueReply;
	output reg[1:0] sharers;
	output reg[1:0] currentState;
	
	initial begin
		fetch = 0;
		invalidateOut = 0;
		dataValueReply = 0;
		currentState = 2'b00; // DI
		sharers = 2'b00;
		// Sharers = {}
	end
	
	always @(posedge clock)
	begin
		fetch = 0;
		invalidateOut = 0;
		dataValueReply = 0;			
		
		case(currentState)
			2'b00: // DI
			begin
				if(readMiss)
				begin
					dataValueReply = 1;
					currentState = 2'b01; // DS
					sharers = 2'b01;
					// Sharers = {P}
				end
				else if(writeMiss)
				begin
					dataValueReply = 1;
					currentState = 2'b10; // DM
					sharers = 2'b01;
					// Sharers = {P}
				end
			end
			2'b01: // DS
			begin
				if(readMiss)
				begin
					dataValueReply = 1;
					currentState = 2'b01; // DS
					sharers = 2'b11;
					// Sharers = Sharers + {P}
				end
				else if(writeMiss)
				begin
					dataValueReply = 1;
					invalidateOut = 1;
					currentState = 2'b10; // DM
					sharers = 2'b01;
					// Sharers = {P}
				end
			end
			2'b10: // DM
			begin
				if(readMiss)
				begin
					fetch = 1;
					dataValueReply = 1;
					currentState = 2'b01; // DS
					sharers = 2'b11;
					// Sharers = Sharers + {P}
				end
				else if(writeMiss)
				begin
					fetch = 1;
					invalidateOut = 1;
					dataValueReply = 1;
					currentState = 2'b10; // DM
					sharers = 2'b01;
					// Sharers = {P}
				end
				else if(writeBack)
				begin
					currentState = 2'b00; // DI
					sharers = 2'b00;
					// Sharers = {}
				end
			end
		endcase
	end

endmodule