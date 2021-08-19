//Display current slot on the board & active player (0:Blue or 1:Red)
module bcd2seg7(	input [3:0]bcd,
						output reg [6:0]SEG);

always @(*)
	case(bcd)
		0: SEG= 7'b1000000;
		1: SEG= 7'b1111001;
		2: SEG= 7'b0100100;
		3: SEG= 7'b0110000;
		4: SEG= 7'b0011001;
		5: SEG= 7'b0010010;
		6: SEG= 7'b0000010;
		7: SEG= 7'b1111000;
		8: SEG= 7'b0000000;
		9: SEG= 7'b0011000;
		default: SEG= 7'b1111111;
	endcase

endmodule
