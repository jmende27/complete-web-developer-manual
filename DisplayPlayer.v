//Display the letter "P" for player display
module DisplayPlayer(	input on,
								output reg [6:0]SEG);
										
always @(*)

	case(on)
		1: SEG= 7'b0001100;
		default: SEG= 7'b1111111;
	endcase
	
endmodule

