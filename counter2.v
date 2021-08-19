//Scoreboards for player 1 and player 2
module counter2(	input add1,
						input clear_score,
						output reg [3:0]tens, ones);
						
always @(posedge add1, posedge clear_score)
	if (clear_score)
		begin
		ones <= 0;
		tens <= 0;
		end
	else 
		if (ones < 9)	
			ones <= ones + 1;
		else 
			begin
			ones <= 0;
			if (tens < 9)
				tens <= tens + 1;
			else
				begin
				ones <= 0;
				tens <= 0;
				end
			end

endmodule

