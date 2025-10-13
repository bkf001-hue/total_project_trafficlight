module traffic_fsm(
    input wire clk,
    input wire rst,
    input wire timer_done,
    output reg [1:0] state
);
    parameter RED=2'b00, GREEN=2'b01, YELLOW=2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) state <= RED;
        else begin
            case (state)
                RED: if (timer_done) state <= GREEN;
                GREEN: if (timer_done) state <= YELLOW;
                YELLOW: if (timer_done) state <= RED;
                default: state <= RED;
            endcase
        end
    end
endmodule
