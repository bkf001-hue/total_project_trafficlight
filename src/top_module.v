// ==================================================
// Module: top_module
// Function: Integrate FSM, Timer, Clock Divider,
//           and Seven Segment display
// ==================================================
module top_module(
    input wire clk,
    input wire rst,
    output wire [2:0] led_out,     // R, Y, G
    output wire [6:0] seg_out      // Seven-segment output
);
    // Internal connections
    wire slow_clk;
    wire [1:0] state;
    wire [3:0] count;
    wire timer_done;

    // 1Hz clock divider
    clock_divider u_clkdiv(
        .clk(clk),
        .rst(rst),
        .slow_clk(slow_clk)
    );

    // FSM
    traffic_fsm u_fsm(
        .clk(slow_clk),
        .rst(rst),
        .timer_done(timer_done),
        .state(state),
        .led_out(led_out)
    );

    // Timer
    timer u_timer(
        .clk(slow_clk),
        .rst(rst),
        .state(state),
        .count(count),
        .done(timer_done)
    );

    // 7-Segment Display
    seven_segment u_seg(
        .counter(count),
        .segments(seg_out)
    );
endmodule
