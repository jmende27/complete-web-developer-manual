//module divides the CLOCK_50 clock signal
module clock_div(	input clk_in,
						input[31:0]clkscale,
						output reg clk_out);
						
reg[31:0] clkq=0;

always @(posedge clk_in)
	begin
	clkq=clkq+1;
		if (clkq==clkscale)
			begin;
				clk_out=~clk_out;
				clkq=0;
			end
	end
	
endmodule


