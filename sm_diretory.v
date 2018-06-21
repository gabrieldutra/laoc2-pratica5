module sm_diretory(
	clock,
	writeMiss,
	readMiss,
	writeBack,
	invalidateIn,
	fetch,
	invalidateOut,
	dataValueReply,
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
	output reg[1:0] currentState;
	
	initial begin
		fetch = 0;
		invalidateOut = 0;
		dataValueReply = 0;
		currentState = 2'b00; // DI
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
				end
				else if(writeMiss)
				begin
					dataValueReply = 1;
					currentState = 2'b10; // DM
				end
			end
			2'b01: // DS
			begin
				if(readMiss)
				begin
					dataValueReply = 1;
					currentState = 2'b01; // DS
				end
				else if(writeMiss)
				begin
					dataValueReply = 1;
					invalidateOut = 1;
					currentState = 2'b10; // DM
				end
			end
			2'b10: // DM
			begin
				if(readMiss)
				begin
					fetch = 1;
					dataValueReply = 1;
					currentState = 2'b01; // DS
				end
				else if(writeMiss)
				begin
					fetch = 1;
					invalidateOut = 1;
					dataValueReply = 1;
					currentState = 2'b10; // DM
				end
				else if(writeBack)
				begin
					currentState = 2'b00; // DI
				end
			end
		endcase
	end

endmodule