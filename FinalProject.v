module FinalProject (	input CLOCK_50,
								input [3:0]KEY,
								output [8:0]LEDG,
								output [17:0]LEDR,
								output [6:0]HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
								output [35:18]GPIO);

wire clk, c_player, win, taken, nxt_slot, counter_reset, WE, clear_cgame, nxt_player, player_reset, clear_score, B_board, R_board, tie, blink;
wire [3:0]current_slot;
wire [7:0]SevSegB, SevSegR;
wire [8:0]red, blue, checker, one_hot_current, display_blue, display_red;

//LED's used to monitor status of wires: win, taken, and slots occupied in both (red & blue) arrays
assign LEDR[17:9]=red;
assign LEDR[8:0]=blue;
assign LEDG[8]=win;

TicTacToeFSM u0(clk, KEY[3], KEY[2], KEY[0], taken, win, tie, nxt_player, player_reset, nxt_slot, counter_reset, WE, clear_cgame, clear_score);
clock_div u1(CLOCK_50, 9000000, clk);
Player u2(nxt_player, player_reset, c_player);
counter u3(nxt_slot, counter_reset, current_slot);
RegisterFSM u4(clk, c_player, current_slot, WE, 1'b1, clear_cgame, taken, blue, red);
mux2 u5(red, blue, c_player, checker);
comparator u6(checker, tie, win);

//Display on seven-segs current player, and current slot number
bcd2seg7 u7(current_slot, HEX0);
assign HEX1 =7'b1111111;
bcd2seg7 u8({1'b0,1'b0,1'b0,c_player},HEX2);
DisplayPlayer u9(1'b1, HEX3);

//Display player blue score (invert c_player since active value for blue player is 0)
and u10(B_board, !c_player, win);
counter2 u11(B_board, clear_score, SevSegB[7:4], SevSegB[3:0]); //add1,clear_score,[3:0]tens, ones
bcd2seg7 u12(SevSegB[3:0], HEX4);
bcd2seg7 u13(SevSegB[7:4], HEX5);

//Display player red score
and u14(R_board, c_player, win);
counter2 u15(R_board, clear_score, SevSegR[7:4], SevSegR[3:0]); //add1,clear_score,[3:0]tens, ones
bcd2seg7 u16(SevSegR[3:0], HEX6);
bcd2seg7 u17(SevSegR[7:4], HEX7);

//create blinker and display on GPIO
clock_div u18(CLOCK_50, 25000000, blink);
counter2decoder u19(current_slot, one_hot_current);
blinker u20(blink, one_hot_current, c_player, blue, red, display_blue, display_red);
assign {GPIO[21],GPIO[19],GPIO[18],GPIO[27],GPIO[25],GPIO[24],GPIO[33],GPIO[31],GPIO[30]} = display_blue;
assign {GPIO[22],GPIO[23],GPIO[20],GPIO[28],GPIO[29],GPIO[26],GPIO[34],GPIO[35],GPIO[32]} = display_red;

endmodule	
