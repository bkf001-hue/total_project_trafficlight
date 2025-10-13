// ==================================================
// Module: timer
// Function: Countdown timer for each traffic state
// ==================================================
module timer #(
    parameter RED_TIME = 10,
    parameter GREEN_TIME = 7,
    parameter YELLOW_TIME = 3
)(
    input wire clk,
    input wire rst,
    input wire [1:0] state,
    output reg [3:0] count,
    output reg done
);
    localparam RED=2'b00, GREEN=2'b01, YELLOW=2'b10;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= RED_TIME;
            done <= 0;
        end else begin
            if (count == 0) begin
                done <= 1;
                case(state)
                    RED:    count <= RED_TIME;
                    GREEN:  count <= GREEN_TIME;
                    YELLOW: count <= YELLOW_TIME;
                    default:count <= RED_TIME;
                endcase
            end else begin
                count <= count - 1;
                done <= 0;
            end
        end
    end
endmodule
