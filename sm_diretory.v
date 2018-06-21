module sm_diretory(
	clock,
	writeMiss,
	readMiss,
	fetch,
	invalidate,
	writeBack,
	dataValueReply,
	sharers,
	currentState
);

	input clock;
	input writeMiss;
	input readMiss;

	output reg fetch;
	output reg invalidate;
	output reg writeBack;
	output reg dataValueReply;
	output reg sharers;
	output reg[1:0] currentState;

endmodule