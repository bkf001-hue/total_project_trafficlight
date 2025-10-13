module timer #(
    parameter RED_TIME = 10,
    parameter GREEN_TIME = 7,
    parameter YELLOW_TIME = 3
)(
    input wire clk,          // Slow clock (1 Hz)
    input wire rst,          // Asynchronous reset
    input wire [1:0] state,  // Current FSM state
    output reg [3:0] count,  // Remaining time value
    output reg done          // Flag to indicate timer finished
);

    // === State encoding (same as traffic_fsm.v) ===
    localparam RED    = 2'b00;
    localparam GREEN  = 2'b01;
    localparam YELLOW = 2'b10;

    // === Timer behavior ===
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= RED_TIME;
            done  <= 0;
        end else begin
            // When counter reaches zero → done = 1
            if (count == 0) begin
                done <= 1;
                // Reload based on current state
                case (state)
                    RED:    count <= RED_TIME;
                    GREEN:  count <= GREEN_TIME;
                    YELLOW: count <= YELLOW_TIME;
                    default: count <= RED_TIME;
                endcase
            end else begin
                // Normal countdown
                count <= count - 1;
                done  <= 0;
            end
        end
    end
endmodule
