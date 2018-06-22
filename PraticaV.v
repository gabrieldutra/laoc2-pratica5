module PraticaV(SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, LEDR, LEDG);
	input [17:0] SW;
	output [0:6] HEX0;
	output [0:6] HEX1;
	output [0:6] HEX2;
	output [0:6] HEX3;
	output [0:6] HEX4;
	output [0:6] HEX5;
	output [0:6] HEX6;
	output [0:6] HEX7;
	output [17:0] LEDR;
	output [7:4] LEDG;
	
	// Wires - In Cache
	wire clock_cblock;
	wire write_cblock;
	wire miss_cblock;
	wire fetch_cblock;
	wire invalidateIn_cblock;

	// Wires - In Directory
	wire clock_dir;
	wire writeMiss_dir;
	wire readMiss_dir;
	wire writeBack_dir;
	wire invalidateIn_dir;
	
	// Wires - Out Cache Block
	wire writeMiss_cblock;
	wire readMiss_cblock;
	wire writeBack_cblock;
	wire invalidateOut_cblock;
	wire [1:0] currentState_cblock;
	
	// Wires - Out Directory
	wire fetch_dir;
	wire invalidateOut_dir;
	wire dataValueReply_dir;
	wire [1:0] sharers_dir;
	wire [1:0] currentState_dir;
	
	// Wires - displays
	wire [0:6] display_currentState_cblock;
	wire [0:6] display_currentState_dir;
	
	// Assigns - Cache block to the Cyclone II Board	
	assign clock_cblock = SW[17];
	assign write_cblock = SW[16];
	assign miss_cblock = SW[15];
	assign fetch_cblock = SW[14];
	assign invalidateIn_cblock = SW[13];
	
	assign LEDR[17] = writeMiss_cblock;
	assign LEDR[16] = readMiss_cblock;
	assign LEDR[15] = writeBack_cblock;
	assign LEDR[14] = invalidateOut_cblock;
	

	// Assigns - Directory to the Cyclone II Board
	assign clock_dir = SW[4];
	assign writeMiss_dir = SW[3];
	assign readMiss_dir = SW[2];
	assign writeBack_dir = SW[1];
	assign invalidateIn_dir = SW[0];
	
	assign LEDR[4] = fetch_dir;
	assign LEDR[3] = invalidateOut_dir;
	assign LEDR[2] = dataValueReply_dir;
	assign LEDR[1:0] = sharers_dir[1:0];

	assign LEDG[5:4] = sharers_dir[1:0];
	
	// Assigns - displays
	assign display_currentState_cblock = (7'b1001111 & ~{7{currentState_cblock[1]}} & ~{7{currentState_cblock[0]}}) // Invalid - I
											  | (7'b0100100 & ~{7{currentState_cblock[1]}} & {7{currentState_cblock[0]}}) // Shared - S
											  | (7'b0110000 & {7{currentState_cblock[1]}} & ~{7{currentState_cblock[0]}}); // Modified - 0
											  
   assign display_currentState_dir = (7'b1001111 & ~{7{currentState_dir[1]}} & ~{7{currentState_dir[0]}}) // Invalid - I
											  | (7'b0100100 & ~{7{currentState_dir[1]}} & {7{currentState_dir[0]}}) // Shared - S
											  | (7'b0110000 & {7{currentState_dir[1]}} & ~{7{currentState_dir[0]}}); // Modified - 0
	
	
	
	assign HEX0 = display_currentState_dir;
	assign HEX7 = display_currentState_cblock;
	
	// Turn idle displays off
	assign HEX1 = 7'b1110111;
	assign HEX2 = 7'b1110111;
	assign HEX3 = 7'b1110111;
	assign HEX4 = 7'b1110111;
	assign HEX5 = 7'b1110111;
	assign HEX6 = 7'b1110111;

	sm_cblock sm_cblock(clock_cblock, write_cblock, miss_cblock, fetch_cblock, invalidateIn_cblock, writeMiss_cblock, readMiss_cblock, writeBack_cblock, invalidateOut_cblock, currentState_cblock);
	sm_directory sm_directory(clock_dir, writeMiss_dir, readMiss_dir, writeBack_dir, invalidateIn_dir, fetch_dir, invalidateOut_dir, dataValueReply_dir, sharers_dir, currentState_dir); 

endmodule