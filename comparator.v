//module checks if there is a win or tie in a current game
module comparator(	input [8:0]array,
							output reg tie,
							output reg win);
							
wire a, b, c, d, e, f, g, h;
assign a= ((array[8])&(array[5])&(array[2]));
assign b= ((array[7])&(array[4])&(array[1]));
assign c= ((array[6])&(array[3])&(array[0]));
assign d= ((array[8])&(array[7])&(array[6]));
assign e= ((array[5])&(array[4])&(array[3]));
assign f= ((array[2])&(array[1])&(array[0]));
assign g= ((array[8])&(array[4])&(array[0]));
assign h= ((array[6])&(array[4])&(array[2]));

always @(*)
if (a|b|c|d|e|f|g|h)
	win =1;
else 
	win =0;
	
always @(*)
if (array[8]+array[7]+array[6]+array[5]+array[4]+array[3]+array[2]+array[1]+array[0]==5)
	tie = 1;
else 
	tie = 0;

endmodule


