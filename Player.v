//module changes to next player's turn
module Player(	input turn, player_reset,
					output reg c_player);
					
always @(posedge turn, posedge player_reset)
	if (player_reset)
		c_player <= 0;
	else if (turn)
		c_player <= !c_player;
		
endmodule
							
