//module manages current position on tic-tac-toe board
module counter (	input nxt_slot, counter_reset,
						output reg [3:0]current_slot);

always @(posedge nxt_slot, posedge counter_reset)
//counting from 8 (first position in game) down to 0 (last position in game)
 
	if (counter_reset)
		current_slot <= 4'b1000;
	else
		if (current_slot > 0)
			current_slot <= (current_slot - 1);
		else
			current_slot <= 4'b1000;

endmodule
