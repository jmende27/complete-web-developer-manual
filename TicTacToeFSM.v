module TicTacToeFSM(	input clk, m, s, reset, taken, win, tie,
							output reg nxt_player, player_reset, nxt_slot, counter_reset, WE, clear_cgame, clear_score);

reg [2:0]state, nextstate;
//parameter statement used to define constants					
parameter S0= 0;
parameter S1= 1;
parameter S2= 2;
parameter S3= 3;
parameter S4= 4;
parameter S5= 5;
parameter S6= 6;
parameter S7= 7;

//state register
always @(posedge clk, negedge reset)	//reset is pushbutton
	if (!reset)
		state <= S0;
	else
		state <= nextstate;

//next state logic
always @(*)
	case (state)
		S0: nextstate = S1;
		S1: 	if ((!m)&(s)) nextstate = S2;
				else if ((m)&(!s)) nextstate = S4;
				else nextstate = S1;
		S2: nextstate = S3;
		S3: 	if (taken) nextstate = S2;
				else  nextstate = S1;
		S4: nextstate = S5;
		S5: 	if ((win)|(tie)) nextstate = S6;
				else nextstate = S7;
		S6: nextstate = S7;
		S7: nextstate = S3;
		default nextstate = S0;
	endcase

//output logic
always @(*)
	case (state)
	S0: begin clear_score=1; clear_cgame=1; counter_reset=1; player_reset=1; nxt_slot=0; WE=0; nxt_player=0; end
	S1: begin clear_score=0; clear_cgame=0; counter_reset=0; player_reset=0; nxt_slot=0; WE=0; nxt_player=0; end
	S2: begin clear_score=0; clear_cgame=0; counter_reset=0; player_reset=0; nxt_slot=1; WE=0; nxt_player=0; end
	S3: begin clear_score=0; clear_cgame=0; counter_reset=0; player_reset=0; nxt_slot=0; WE=0; nxt_player=0; end
	S4: begin clear_score=0; clear_cgame=0; counter_reset=0; player_reset=0; nxt_slot=0; WE=1; nxt_player=0; end
	S5: begin clear_score=0; clear_cgame=0; counter_reset=0; player_reset=0; nxt_slot=0; WE=0; nxt_player=0; end
	S6: begin clear_score=0; clear_cgame=1; counter_reset=0; player_reset=0; nxt_slot=0; WE=0; nxt_player=0; end
	S7: begin clear_score=0; clear_cgame=0; counter_reset=1; player_reset=0; nxt_slot=0; WE=0; nxt_player=1; end
	endcase

endmodule
