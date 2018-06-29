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
	
	wire clock;
	wire write;
	wire [1:0] state;
	wire [1:0] owner;
	wire [2:0] address;
	wire [3:0] data_in;
	
	wire [1:0] current_state;
	wire [1:0] current_owner;
	wire [2:0] current_address;
	wire [3:0] current_data;
	
	cache_P(clock, write, state, address, data_in, current_state, current_address, current_data);
	cache_D(clock, write, state, owner, address, data_in, current_state, current_owner, current_address, current_data);

endmodule