//module selects which player to check for win or tie
module mux2(	input [8:0]red, blue,
					input sel,
					output reg [8:0]cout);
					
always @(*)
	if (sel)	
		cout= red;
	else 
		cout= blue;
	
endmodule

