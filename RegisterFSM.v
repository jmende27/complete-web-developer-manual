//module is memory for slots taken by both players
//module outputs both players arrays & if current slot is taken
module RegisterFSM(	input clk, adress,
							input [3:0]offset,
							input WE, input Data_in, clr_game,
							output taken,
							output [8:0]b_out,
							output [8:0]r_out);

reg [8:0] memory [1:0];

always @(posedge clk, posedge clr_game)
if (clr_game)
	begin
	memory[0] <= 0;
	memory[1] <= 0;
	end
else
	if (WE)
		memory[adress][offset] <= Data_in;

assign b_out = memory[0];
assign r_out = memory[1];
assign taken = ((memory[0][offset])|(memory[1][offset]));

endmodule
