module sm_cpu(
	clock,
	write,
	miss,
	fetch,
	invalidateIn,
	writeMiss,
	readMiss,
	writeBack,
	invalidateOut,
	currentState
);
	input clock;
	input write;
	input miss;
	input fetch;
	input invalidateIn;
	output reg writeMiss, readMiss, writeBack, invalidateOut;
	
	output reg[1:0] currentState;
	
	initial begin
		currentState = 2'b00;
		writeMiss = 0;
		readMiss = 0;
		writeBack = 0;
		invalidateOut = 0;
	end
	
	always @(posedge clock)
	begin
		writeMiss = 0;
		readMiss = 0;
		writeBack = 0;
		invalidateOut = 0;
		case(currentState)
			2'b00: // Invalid
			begin
				if(write) // CPU write
				begin
					writeMiss = 1;
					currentState = 2'b10; // Modified
				end
				else // CPU read
				begin
					readMiss = 1;
					currentState = 2'b01; // Shared
				end
			end
			2'b01: // Shared
			begin
				if(invalidateIn) // invalidate
				begin
					currentState = 2'b0; // Invalid
				end
				else if(write) // CPU write
				begin
					if(miss) 
					begin
						writeMiss = 1;
						currentState = 2'b10; // Modified
					end
					else // hit
					begin
						invalidateOut = 1;
						currentState = 2'b10; // Modified
					end
				end
				else // CPU read
				begin
					if(miss)
					begin
						readMiss = 1;
						currentState = 2'b01; // Shared
					end
					else // hit
					begin
						currentState = 2'b01; // Shared
					end
				end
			end
			2'b10: // Modified
			begin
				if(fetch)
				begin
					writeBack = 1;
					if(invalidateIn)
					begin
						currentState = 2'b00; // Invalid
					end
					else
					begin
						currentState = 2'b01; // Shared
					end
				end
				else if(write)
				begin
					currentState = 2'b10; // Modified
					if(miss)
					begin
						writeBack = 1;
						writeMiss = 1;
					end
				end
				else // read
				begin
					if(miss)
					begin
						writeBack = 1;
						readMiss = 1;
						currentState = 2'b01; // Shared
					end
					else // hit
					begin
						currentState = 2'b10; // Modified
					end
				end
			end
		endcase
	end
	
endmodule