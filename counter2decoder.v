//4 to 9 bit decoder
module counter2decoder(	input [3:0] current_slot,
								output reg [8:0] one_hot_current);
								
always @(*)

	case (current_slot)
		8: one_hot_current= 9'b100000000;
		7: one_hot_current= 9'b010000000;
		6: one_hot_current= 9'b001000000;
		5: one_hot_current= 9'b000100000;
		4: one_hot_current= 9'b000010000;
		3: one_hot_current= 9'b000001000;
		2: one_hot_current= 9'b000000100;
		1: one_hot_current= 9'b000000010;
		0: one_hot_current= 9'b000000001;
		default: one_hot_current= 9'b000000000;
	endcase

endmodule

