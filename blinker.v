//causes current slot LED to blink
module blinker(	input blink,
						input [8:0]one_hot_current,
						input c_player,
						input [8:0]blue, red,
						output [8:0]display_blue, display_red);

wire [8:0] extended_cplayer, extended_blink;
// Blue player is c_player=0, and Red plater is c_player=1

//Extend to 9 bits:
assign extended_cplayer = {{8{c_player}},c_player};
assign extended_blink = {{8{blink}},blink};

assign display_blue = ~(blue | ((one_hot_current & extended_blink) & ~extended_cplayer));
assign display_red = ~(red | ((one_hot_current & extended_blink) & extended_cplayer));

/*one hot current and extended blink gives us the blinking current slot. Anding with extended player
makes the blinking slot happen only on current players led. Oring with the blue/red keeps that player's
other selected slots stay on.
LED's are common anode, so turn them on with 0 instead of 1, so negate entire expression above.*/

endmodule
